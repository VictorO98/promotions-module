package com.example.Controllers;

import com.example.DatabaseConnection;
import com.example.Models.ServicioPreasignacion;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/SearchService")
public class SearchServiceController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        String numeroServicio = request.getParameter("numeroServicio");
        PrintWriter out = response.getWriter();

        try {
            if (numeroServicio == null || numeroServicio.trim().isEmpty()) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                out.print("{\"success\": false, \"message\": \"El número de servicio es requerido\"}");
                return;
            }

            ServicioPreasignacion servicio = buscarServicioPorPlaca(numeroServicio.trim());

            if (servicio != null) {
                response.setStatus(HttpServletResponse.SC_OK);
                String jsonResponse = String.format(
                        "{\"success\": true, \"data\": {" +
                                "\"placa\": \"%s\", " +
                                "\"suscripcion\": \"%s\", " +
                                "\"departamento\": \"%s\", " +
                                "\"municipio\": \"%s\", " +
                                "\"categoria\": \"%s\", " +
                                "\"subcategoria\": \"%s\", " +
                                "\"plan\": \"%s\"" +
                                "}}",
                        escapeJson(servicio.getPlaca()),
                        escapeJson(servicio.getSuscripcion()),
                        escapeJson(servicio.getDepartamento()),
                        escapeJson(servicio.getMunicipio()),
                        escapeJson(servicio.getCategoria()),
                        escapeJson(servicio.getSubcategoria()),
                        escapeJson(servicio.getPlan()));
                out.print(jsonResponse);
            } else {
                response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                out.print(
                        "{\"success\": false, \"message\": \"No se encontró información para el número de servicio: " +
                                escapeJson(numeroServicio) + "\"}");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.print("{\"success\": false, \"message\": \"Error interno del servidor: " +
                    escapeJson(e.getMessage()) + "\"}");
        } finally {
            out.flush();
            out.close();
        }
    }

    private ServicioPreasignacion buscarServicioPorPlaca(String placa) throws Exception {
        String sql = "SELECT PLACA, SUSCRIPCION, DEPARTAMENTE, MUNICIPIO, CATEGORIA, SUBCATEGORIA, PLAN " +
                "FROM vw_preasignacion_placa WHERE PLACA = ?";

        DatabaseConnection dbConn = new DatabaseConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            dbConn.getConnection();
            pstmt = dbConn.connection.prepareStatement(sql);
            pstmt.setString(1, placa);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                ServicioPreasignacion servicio = new ServicioPreasignacion();
                servicio.setPlaca(rs.getString("PLACA"));
                servicio.setSuscripcion(rs.getString("SUSCRIPCION"));
                servicio.setDepartamento(rs.getString("DEPARTAMENTE"));
                servicio.setMunicipio(rs.getString("MUNICIPIO"));
                servicio.setCategoria(rs.getString("CATEGORIA"));
                servicio.setSubcategoria(rs.getString("SUBCATEGORIA"));
                servicio.setPlan(rs.getString("PLAN"));
                return servicio;
            }
        } finally {
            if (rs != null)
                rs.close();
            if (pstmt != null)
                pstmt.close();
            if (dbConn.connection != null)
                dbConn.connection.close();
        }
        return null;
    }

    private String escapeJson(String value) {
        if (value == null)
            return "";
        return value.replace("\"", "\\\"").replace("\n", "\\n").replace("\r", "\\r");
    }
}