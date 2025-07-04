package com.example.Controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.DatabaseConnection;

@WebServlet("/CreateProduct")
public class CreateProductController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("=== CONTROLADOR INICIADO ===");

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        try {
            String descripcion = request.getParameter("descripcion");
            System.out.println("Descripción recibida: [" + descripcion + "]");

            if (descripcion == null || descripcion.trim().isEmpty()) {
                System.out.println("ERROR: Descripción vacía");
                out.print("{\"success\": false, \"message\": \"Descripción vacía\"}");
                out.flush();
                return;
            }

            descripcion = descripcion.trim();

            // Convertir a ASCII puro para Oracle 8i
            try {
                byte[] asciiBytes = descripcion.getBytes("US-ASCII");
                descripcion = new String(asciiBytes, "US-ASCII");
            } catch (Exception e) {
                // Si no se puede convertir a ASCII, limpiar caracteres problemáticos
                descripcion = descripcion.replaceAll("[^a-zA-Z0-9 ]", "");
            }

            System.out.println("Descripción limpia: [" + descripcion + "]");
            System.out.println("Longitud descripción: " + descripcion.length());

            if (descripcion.length() > 30) {
                System.out.println("ERROR: Descripción muy larga");
                out.print("{\"success\": false, \"message\": \"Descripción muy larga\"}");
                out.flush();
                return;
            }

            // Validar caracteres problemáticos para Oracle 8i
            if (descripcion.matches(".*[áéíóúñüÁÉÍÓÚÑÜ].*")) {
                System.out.println("ERROR: Descripción contiene caracteres especiales");
                out.print("{\"success\": false, \"message\": \"Evite usar acentos o caracteres especiales\"}");
                out.flush();
                return;
            }

            System.out.println("Obteniendo conexión...");
            DatabaseConnection dbConnection = new DatabaseConnection();
            dbConnection.getConnection();
            Connection conn = dbConnection.connection;

            if (conn == null) {
                System.out.println("ERROR: Conexión nula");
                out.print("{\"success\": false, \"message\": \"No hay conexión\"}");
                out.flush();
                return;
            }

            System.out.println("Conexión obtenida exitosamente");

            // Primero obtener el siguiente ID para la secuencia
            String getMaxIdSql = "SELECT NVL(MAX(TIPOSERCODI), 0) + 1 FROM CRM_TIPOSERVPROMO";
            System.out.println("Obteniendo siguiente ID...");
            PreparedStatement maxPs = conn.prepareStatement(getMaxIdSql);
            ResultSet rs = maxPs.executeQuery();
            rs.next();
            int nextId = rs.getInt(1);
            rs.close();
            maxPs.close();
            System.out.println("Siguiente ID será: " + nextId);

            String sql = "INSERT INTO CRM_TIPOSERVPROMO (TIPOSERCODI, PARADESC) VALUES (?, ?)";
            System.out.println("SQL: " + sql);

            System.out.println("Creando PreparedStatement...");
            PreparedStatement ps = conn.prepareStatement(sql);

            System.out.println("Setting parameters...");
            ps.setInt(1, nextId);
            ps.setString(2, descripcion);

            System.out.println("Ejecutando UPDATE...");
            int rows = ps.executeUpdate();

            // Si falla con parámetros, intentar sin parámetros (solo para debug)
            if (rows == 0) {
                System.out.println("Intentando INSERT sin parámetros...");
                ps.close();
                String sqlDirect = "INSERT INTO CRM_TIPOSERVPROMO (TIPOSERCODI, PARADESC) VALUES (" + nextId + ", '"
                        + descripcion + "')";
                ps = conn.prepareStatement(sqlDirect);
                rows = ps.executeUpdate();
                System.out.println("INSERT directo ejecutado. Filas: " + rows);
            }

            System.out.println("Filas afectadas: " + rows);

            ps.close();
            conn.close();

            System.out.println("Enviando respuesta exitosa...");
            out.print("{\"success\": true, \"message\": \"Producto creado\"}");
            out.flush();

            System.out.println("=== CONTROLADOR TERMINADO EXITOSAMENTE ===");

        } catch (Exception e) {
            System.err.println("ERROR GENERAL: " + e.getMessage());
            e.printStackTrace();
            out.print("{\"success\": false, \"message\": \"Error: " + e.getMessage() + "\"}");
            out.flush();
        } finally {
            out.close();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.print("{\"success\": false, \"message\": \"Método no permitido\"}");
        out.close();
    }
}