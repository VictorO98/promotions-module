package com.example.Controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.DatabaseConnection;

@WebServlet("/ProductServices")
public class ProductServicesController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("=== PRODUCT SERVICES CONTROLLER ===");

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        try {
            String codProducto = request.getParameter("codProducto");
            System.out.println("Código de producto recibido: " + codProducto);

            if (codProducto == null || codProducto.trim().isEmpty()) {
                out.print("{\"success\": false, \"message\": \"Código de producto requerido\"}");
                out.flush();
                return;
            }

            DatabaseConnection dbConnection = new DatabaseConnection();
            dbConnection.getConnection();
            Connection conn = dbConnection.connection;

            if (conn == null) {
                out.print("{\"success\": false, \"message\": \"Error de conexión\"}");
                out.flush();
                return;
            }

            // Obtener servicios asociados al producto específico
            String sqlAsociados = "SELECT COD_SERVICIO, SERVICIO " +
                    "FROM VW_PRODUCTO_SERVICIO " +
                    "WHERE TIPO_SERVICIO = ? " +
                    "ORDER BY SERVICIO";

            // Obtener todos los servicios disponibles
            String sqlTodos = "SELECT TISSCODI AS COD_SERVICIO, TISSDESC AS SERVICIO FROM TIPOSEES ORDER BY TISSDESC";

            // Ejecutar primera consulta: servicios asociados
            System.out.println("SQL Asociados: " + sqlAsociados);
            PreparedStatement psAsociados = conn.prepareStatement(sqlAsociados);
            psAsociados.setString(1, codProducto);
            ResultSet rsAsociados = psAsociados.executeQuery();

            List<ServicioDetail> serviciosAsociados = new ArrayList<>();
            while (rsAsociados.next()) {
                ServicioDetail servicio = new ServicioDetail();
                servicio.codServicio = rsAsociados.getString("COD_SERVICIO");
                servicio.servicio = rsAsociados.getString("SERVICIO");

                // Regla especial: Si el servicio es "-----------" mostrarlo como "Todos los
                // servicios"
                if ("-----------".equals(servicio.servicio)) {
                    servicio.servicio = "Todos los servicios";
                }

                servicio.asociado = true; // Todos los de esta consulta están asociados
                serviciosAsociados.add(servicio);
            }
            rsAsociados.close();
            psAsociados.close();

            // Ejecutar segunda consulta: todos los servicios
            System.out.println("SQL Todos: " + sqlTodos);
            PreparedStatement psTodos = conn.prepareStatement(sqlTodos);
            ResultSet rsTodos = psTodos.executeQuery();

            List<ServicioDetail> todosServicios = new ArrayList<>();
            while (rsTodos.next()) {
                ServicioDetail servicio = new ServicioDetail();
                servicio.codServicio = rsTodos.getString("COD_SERVICIO");
                servicio.servicio = rsTodos.getString("SERVICIO");

                // Regla especial: Si el servicio es "-----------" mostrarlo como "Todos los
                // servicios"
                if ("-----------".equals(servicio.servicio)) {
                    servicio.servicio = "Todos los servicios";
                }

                servicio.asociado = false; // Por defecto no asociados, filtraremos después
                todosServicios.add(servicio);
            }
            rsTodos.close();
            psTodos.close();

            // Filtrar servicios disponibles (quitar los que ya están asociados)
            List<ServicioDetail> serviciosDisponibles = new ArrayList<>();
            for (ServicioDetail todoServicio : todosServicios) {
                boolean yaAsociado = false;
                for (ServicioDetail asociado : serviciosAsociados) {
                    if (todoServicio.codServicio.equals(asociado.codServicio)) {
                        yaAsociado = true;
                        break;
                    }
                }
                if (!yaAsociado) {
                    serviciosDisponibles.add(todoServicio);
                }
            }

            // Combinar listas para enviar al frontend
            List<ServicioDetail> servicios = new ArrayList<>();
            servicios.addAll(serviciosAsociados);
            servicios.addAll(serviciosDisponibles);
            conn.close();

            System.out.println("Servicios encontrados: " + servicios.size());

            // Construir JSON manualmente
            StringBuilder jsonResponse = new StringBuilder();
            jsonResponse.append("{\"success\": true, \"codProducto\": \"").append(codProducto)
                    .append("\", \"servicios\": [");

            for (int i = 0; i < servicios.size(); i++) {
                ServicioDetail servicio = servicios.get(i);
                if (i > 0)
                    jsonResponse.append(",");
                jsonResponse.append("{")
                        .append("\"codServicio\": \"").append(servicio.codServicio).append("\",")
                        .append("\"servicio\": \"").append(servicio.servicio).append("\",")
                        .append("\"asociado\": ").append(servicio.asociado)
                        .append("}");
            }

            jsonResponse.append("]}");

            out.print(jsonResponse.toString());
            out.flush();

            System.out.println("=== PRODUCT SERVICES TERMINADO ===");

        } catch (Exception e) {
            System.err.println("Error en ProductServices: " + e.getMessage());
            e.printStackTrace();
            out.print("{\"success\": false, \"message\": \"Error: " + e.getMessage() + "\"}");
            out.flush();
        } finally {
            out.close();
        }
    }

    // Clases internas para JSON
    public static class ServicioDetail {
        public String codServicio;
        public String servicio;
        public boolean asociado;
    }
}