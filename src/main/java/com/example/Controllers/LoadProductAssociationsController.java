package com.example.Controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("checkExistingPromotions".equals(action)) {
            checkExistingPromotions(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Acción no válida");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("assignPromotion".equals(action)) {
            assignPromotion(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Acción no válida");
        }
    }

    /**
     * Verifica promociones existentes para un suscriptor
     * Equivalente a la lógica del constructor de FrmConfAsignacion
     */
    private void checkExistingPromotions(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        String suscriptorStr = request.getParameter("suscriptor");
        String tipoPromo = request.getParameter("tipoPromo");
        String inPromocionStr = request.getParameter("inPromocion");
        String descripcionPromo = request.getParameter("descripcionPromo");

        if (suscriptorStr == null || tipoPromo == null || inPromocionStr == null) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("{\"error\": \"Parámetros requeridos faltantes\"}");
            return;
        }

        Long suscriptor = Long.parseLong(suscriptorStr);
        Long inPromocion = Long.parseLong(inPromocionStr);

        List<String> promocionesExistentes = new ArrayList<>();
        boolean promocionYaExiste = false;
        StringBuilder promocionRegistrado = new StringBuilder();

        DatabaseConnection databaseConnection = new DatabaseConnection();
        Connection connection = null;

        try {
            databaseConnection.getConnection();
            connection = databaseConnection.connection;

            // Consulta equivalente del código C# original
            String sqlCobrserv;
            if ("I".equals(tipoPromo)) {
                sqlCobrserv = "SELECT * FROM cobrserv WHERE coseacti = 'S' AND cosenuse = ?";
            } else {
                sqlCobrserv = "SELECT * FROM cobrserv WHERE coseacti = 'S' AND peaspeti = ?";
            }

            try (PreparedStatement pstmt = connection.prepareStatement(sqlCobrserv)) {
                pstmt.setLong(1, suscriptor);

                try (ResultSet rs = pstmt.executeQuery()) {
                    while (rs.next()) {
                        String cobrser = rs.getString(3); // Equivalente a reader[2] en C#
                        String promocionId = rs.getString(1); // Equivalente a reader[0] en C#
                        String detallePromo = rs.getString(5); // Equivalente a reader[4] en C#

                        promocionRegistrado.append(promocionId).append(";");

                        // Verificar si la promoción ya está asignada
                        if (inPromocion.toString().equals(detallePromo)) {
                            promocionYaExiste = true;
                        } else {
                            // Obtener información de la promoción existente
                            String sqlPromocion = "SELECT distinct TICOCODI, TICODESC FROM VW_CONSULTA_PROMO WHERE TICOCODI = ?";
                            try (PreparedStatement pstmtPromo = connection.prepareStatement(sqlPromocion)) {
                                pstmtPromo.setString(1, cobrser);

                                try (ResultSet rsPromo = pstmtPromo.executeQuery()) {
                                    if (rsPromo.next()) {
                                        String promocionInfo = "* " + rsPromo.getString(1) + "-" + rsPromo.getString(2);
                                        promocionesExistentes.add(promocionInfo);
                                    }
                                }
                            }
                        }
                    }
                }
            }

            // Construir respuesta JSON manualmente
            StringBuilder jsonResponse = new StringBuilder();
            jsonResponse.append("{");
            jsonResponse.append("\"promocionYaExiste\": ").append(promocionYaExiste).append(",");
            jsonResponse.append("\"suscriptor\": ").append(suscriptor).append(",");
            jsonResponse.append("\"inPromocion\": ").append(inPromocion).append(",");
            jsonResponse.append("\"descripcionPromo\": \"")
                    .append(escapeJson(descripcionPromo != null ? descripcionPromo : "")).append("\",");

            // Remover último punto y coma de promocionRegistrado
            String promocionRegistradoStr = promocionRegistrado.toString();
            if (promocionRegistradoStr.length() > 0) {
                promocionRegistradoStr = promocionRegistradoStr.substring(0, promocionRegistradoStr.length() - 1);
            }
            jsonResponse.append("\"promocionRegistrado\": \"").append(escapeJson(promocionRegistradoStr)).append("\",");

            // Construir mensaje de confirmación equivalente al del código C#
            if (!promocionYaExiste) {
                StringBuilder mensaje = new StringBuilder();

                if (!promocionesExistentes.isEmpty()) {
                    mensaje.append("El usuario ya tiene asignada las siguientes promociones:\\n");
                    for (String promo : promocionesExistentes) {
                        mensaje.append(promo).append("\\n");
                    }
                    mensaje.append("\\n");
                }

                mensaje.append("¿Está seguro de asignar al suscriptor ")
                        .append(suscriptor)
                        .append(" la promoción: ")
                        .append(inPromocion)
                        .append(" - ")
                        .append(descripcionPromo != null ? descripcionPromo : "")
                        .append("?");

                jsonResponse.append("\"mensajeConfirmacion\": \"").append(escapeJson(mensaje.toString())).append("\",");
            } else {
                String mensajeError = "El suscriptor " + suscriptor +
                        " ya se le ha sido asignada la promoción " + inPromocion +
                        " - " + (descripcionPromo != null ? descripcionPromo : "");
                jsonResponse.append("\"mensajeError\": \"").append(escapeJson(mensajeError)).append("\",");
            }

            // Agregar promociones existentes al JSON
            jsonResponse.append("\"promocionesExistentes\": [");
            for (int i = 0; i < promocionesExistentes.size(); i++) {
                if (i > 0)
                    jsonResponse.append(",");
                jsonResponse.append("\"").append(escapeJson(promocionesExistentes.get(i))).append("\"");
            }
            jsonResponse.append("]");

            jsonResponse.append("}");

            response.getWriter().write(jsonResponse.toString());

        } catch (SQLException e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"error\": \"Error de base de datos: " + e.getMessage() + "\"}");
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"error\": \"Error interno: " + e.getMessage() + "\"}");
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    /**
     * Asigna la promoción al suscriptor
     * Equivalente al método asignarPromocion() del código C# original
     */
    private void assignPromotion(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        try {
            String suscriptorStr = request.getParameter("suscriptor");
            String tipoPromo = request.getParameter("tipoPromo");
            String inPromocionStr = request.getParameter("inPromocion");
            String departamentoPromoStr = request.getParameter("departamentoPromo");
            String localidadPromoStr = request.getParameter("localidadPromo");
            String categoriaPromoStr = request.getParameter("categoriaPromo");
            String promocionRegistrado = request.getParameter("promocionRegistrado");

            if (suscriptorStr == null || tipoPromo == null || inPromocionStr == null) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                response.getWriter().write("{\"error\": \"Parámetros requeridos faltantes\"}");
                return;
            }

            Long suscriptor = Long.parseLong(suscriptorStr);
            Long inPromocion = Long.parseLong(inPromocionStr);
            Long departamentoPromo = departamentoPromoStr != null ? Long.parseLong(departamentoPromoStr) : 0L;
            Long localidadPromo = localidadPromoStr != null ? Long.parseLong(localidadPromoStr) : 0L;
            Long categoriaPromo = categoriaPromoStr != null ? Long.parseLong(categoriaPromoStr) : 0L;

            DatabaseConnection databaseConnection = new DatabaseConnection();
            Connection connection = null;

            try {
                databaseConnection.getConnection();
                connection = databaseConnection.connection;

                // Simular la lógica del método asignarPromocion() del código C# original
                // Aquí implementarías la lógica específica de asignación según el tipo

                if ("D".equals(tipoPromo)) {
                    // Asignación por Departamento
                    Long asignacion = suscriptor;
                    Long suscript = -1L;
                    // Llamar al método de asignación (equivalente a promo.asignarPromocion)
                    asignarPromocionEnBD(connection, inPromocion, suscript, departamentoPromo,
                            localidadPromo, categoriaPromo, asignacion, promocionRegistrado);

                } else if ("I".equals(tipoPromo)) {
                    // Asignación Individual
                    Long asignacion = -1L;
                    Long suscript = suscriptor;
                    // Llamar al método de asignación (equivalente a promo.asignarPromocion)
                    asignarPromocionEnBD(connection, inPromocion, suscript, departamentoPromo,
                            localidadPromo, categoriaPromo, asignacion, promocionRegistrado);
                }

                String jsonResponse = "{\"success\": true, \"message\": \"Se ha realizado la asignación de manera exitosa\"}";
                response.getWriter().write(jsonResponse);

            } catch (SQLException e) {
                e.printStackTrace();
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                response.getWriter().write("{\"error\": \"Error de base de datos: " + e.getMessage() + "\"}");
            } finally {
                if (connection != null) {
                    try {
                        connection.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }

        } catch (NumberFormatException e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("{\"error\": \"Formato de número inválido\"}");
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"error\": \"Error interno: " + e.getMessage() + "\"}");
        }
    }

    /**
     * Método auxiliar para realizar la asignación en base de datos
     * Aquí implementarías la lógica específica de tu sistema
     */
    private void asignarPromocionEnBD(Connection connection, Long inPromocion, Long suscript,
            Long departamentoPromo, Long localidadPromo, Long categoriaPromo,
            Long asignacion, String promocionRegistrado) throws SQLException {

        // Esta es una implementación de ejemplo - debes adaptarla a tu esquema de base
        // de datos
        String sql = "INSERT INTO cobrserv (coseacti, cosenuse, peaspeti, " +
                "departamento, localidad, categoria, promocion_registrado) " +
                "VALUES ('S', ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setLong(1, suscript != -1 ? suscript : 0);
            pstmt.setLong(2, asignacion != -1 ? asignacion : 0);
            pstmt.setLong(3, departamentoPromo);
            pstmt.setLong(4, localidadPromo);
            pstmt.setLong(5, categoriaPromo);
            pstmt.setString(6, promocionRegistrado);

            pstmt.executeUpdate();
        }

        System.out.println("Promoción asignada: " + inPromocion + " para suscriptor: " +
                (suscript != -1 ? suscript : asignacion));
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