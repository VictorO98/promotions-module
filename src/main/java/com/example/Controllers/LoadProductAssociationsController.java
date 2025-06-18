package com.example.Controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.DatabaseConnection;

@WebServlet("/LoadProductAssociations")
public class LoadProductAssociationsController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String type = request.getParameter("type"); // "conceptos" o "servicios"
        String productCode = request.getParameter("productCode");

        System.out.println("=== CARGANDO ASOCIACIONES ===");
        System.out.println("Tipo: " + type);
        System.out.println("Código Producto: " + productCode);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        List<Map<String, Object>> items = new ArrayList<>();
        DatabaseConnection databaseConnection = new DatabaseConnection();

        Connection connection = null;
        try {
            databaseConnection.getConnection();
            connection = databaseConnection.connection;

            if (connection != null) {
                System.out.println("Conexión establecida");

                if ("conceptos".equals(type)) {
                    items = loadConceptos(connection);
                } else if ("servicios".equals(type)) {
                    items = loadServicios(connection);
                }

                System.out.println("Items encontrados: " + items.size());

            } else {
                System.out.println("Error: Conexión null");
            }

        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
            e.printStackTrace();
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                    System.out.println("Conexión cerrada");
                } catch (Exception e) {
                    System.out.println("Error cerrando conexión: " + e.getMessage());
                }
            }
        }

        // Enviar respuesta JSON
        PrintWriter out = response.getWriter();
        out.print(buildJsonResponse(items));
        out.flush();

        System.out.println("=== FIN CARGA ASOCIACIONES ===");
    }

    private List<Map<String, Object>> loadConceptos(Connection connection) throws Exception {
        List<Map<String, Object>> conceptos = new ArrayList<>();

        String query = "SELECT * FROM CONCEPTO ORDER BY CONCDESC";
        System.out.println("Ejecutando: " + query);

        Statement stmt = connection.createStatement();
        ResultSet rs = stmt.executeQuery(query);

        while (rs.next()) {
            Map<String, Object> concepto = new HashMap<>();
            // Asumir que la primera columna es ID y la segunda es CONCDESC
            concepto.put("id", rs.getInt(1));
            concepto.put("nombre", rs.getString("CONCDESC"));
            concepto.put("descripcion", "Concepto: " + rs.getString("CONCDESC"));
            concepto.put("asociado", false); // Por ahora todos en false
            conceptos.add(concepto);

            System.out.println("Concepto: " + rs.getInt(1) + " - " + rs.getString("CONCDESC"));
        }

        rs.close();
        stmt.close();

        return conceptos;
    }

    private List<Map<String, Object>> loadServicios(Connection connection) throws Exception {
        List<Map<String, Object>> servicios = new ArrayList<>();

        String query = "SELECT * FROM TIPOSEES ORDER BY TISSDESC";
        System.out.println("Ejecutando: " + query);

        Statement stmt = connection.createStatement();
        ResultSet rs = stmt.executeQuery(query);

        while (rs.next()) {
            Map<String, Object> servicio = new HashMap<>();
            // Asumir que la primera columna es ID y existe TISSDESC
            servicio.put("id", rs.getInt(1));
            servicio.put("nombre", rs.getString("TISSDESC"));
            servicio.put("descripcion", "Servicio: " + rs.getString("TISSDESC"));
            servicio.put("asociado", false); // Por ahora todos en false
            servicios.add(servicio);

            System.out.println("Servicio: " + rs.getInt(1) + " - " + rs.getString("TISSDESC"));
        }

        rs.close();
        stmt.close();

        return servicios;
    }

    private String buildJsonResponse(List<Map<String, Object>> items) {
        StringBuilder json = new StringBuilder();
        json.append("[");

        for (int i = 0; i < items.size(); i++) {
            Map<String, Object> item = items.get(i);
            json.append("{");
            json.append("\"id\":").append(item.get("id")).append(",");
            json.append("\"nombre\":\"").append(escapeJson(item.get("nombre").toString())).append("\",");
            json.append("\"descripcion\":\"").append(escapeJson(item.get("descripcion").toString())).append("\",");
            json.append("\"asociado\":").append(item.get("asociado"));
            json.append("}");

            if (i < items.size() - 1) {
                json.append(",");
            }
        }

        json.append("]");
        return json.toString();
    }

    private String escapeJson(String str) {
        if (str == null)
            return "";
        return str.replace("\"", "\\\"").replace("\\", "\\\\").replace("\n", "\\n").replace("\r", "\\r");
    }
}