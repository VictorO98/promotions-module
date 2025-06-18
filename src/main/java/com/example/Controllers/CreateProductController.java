package com.example.Controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
import java.sql.Connection;
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
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        try {
            // Obtener parámetros del request
            String descripcion = request.getParameter("descripcion");
            String conceptos = request.getParameter("conceptos");
            String servicios = request.getParameter("servicios");

            // Debug: Imprimir parámetros recibidos
            System.out.println("=== CREAR PRODUCTO DEBUG ===");
            System.out.println("Descripcion recibida: [" + descripcion + "]");
            System.out.println("Conceptos recibidos: [" + conceptos + "]");
            System.out.println("Servicios recibidos: [" + servicios + "]");
            System.out.println("Content-Type: " + request.getContentType());

            // Validar parámetros obligatorios
            if (descripcion == null || descripcion.trim().isEmpty()) {
                out.print("{\"success\": false, \"message\": \"La descripción del producto es obligatoria\"}");
                return;
            }

            // Limpiar parámetros
            descripcion = descripcion.trim();
            conceptos = (conceptos != null) ? conceptos.trim() : "";
            servicios = (servicios != null) ? servicios.trim() : "";

            // Obtener conexión a la base de datos
            DatabaseConnection dbConnection = new DatabaseConnection();
            dbConnection.getConnection();
            Connection connection = dbConnection.connection;

            if (connection == null) {
                out.print("{\"success\": false, \"message\": \"Error de conexión a la base de datos\"}");
                return;
            }

            // Llamar al procedimiento almacenado pr_crearProductoPromocion
            CallableStatement stmt = connection.prepareCall("{call pr_crearProductoPromocion(?, ?, ?)}");

            // Establecer parámetros
            stmt.setString(1, descripcion); // PV_i_descripcion
            stmt.setString(2, conceptos); // PV_i_concepto
            stmt.setString(3, servicios); // PV_i_servicios

            // Ejecutar el procedimiento
            boolean hasResultSet = stmt.execute();

            // Cerrar recursos
            stmt.close();
            connection.close();

            // Respuesta exitosa
            out.print("{\"success\": true, \"message\": \"Producto creado exitosamente\"}");

        } catch (SQLException e) {
            System.err.println("Error SQL al crear producto: " + e.getMessage());
            e.printStackTrace();
            out.print("{\"success\": false, \"message\": \"Error en la base de datos: " + e.getMessage() + "\"}");
        } catch (Exception e) {
            System.err.println("Error general al crear producto: " + e.getMessage());
            e.printStackTrace();
            out.print("{\"success\": false, \"message\": \"Error interno del servidor\"}");
        } finally {
            out.close();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print("{\"success\": false, \"message\": \"Método no permitido. Use POST.\"}");
        out.close();
    }
}