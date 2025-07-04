package com.example.Controllers;

import com.example.DAO.LocalidadDAO;
import com.example.Models.Localidad;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LoadLocalidades")
public class LoadLocalidadesController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        String codigoDepartamento = request.getParameter("departamento");

        try {
            LocalidadDAO localidadDAO = new LocalidadDAO();
            List<Localidad> localidades;

            if (codigoDepartamento != null && !codigoDepartamento.trim().isEmpty()) {
                // Cargar localidades filtradas por departamento
                localidades = localidadDAO.getLocalidadesByDepartamento(codigoDepartamento.trim());
            } else {
                // Si no se proporciona departamento, devolver lista vacía
                localidades = new java.util.ArrayList<>();
            }

            // Construir JSON manualmente para evitar dependencias adicionales
            StringBuilder json = new StringBuilder();
            json.append("{\"success\": true, \"localidades\": [");

            for (int i = 0; i < localidades.size(); i++) {
                Localidad loc = localidades.get(i);
                if (i > 0) {
                    json.append(",");
                }
                json.append("{")
                        .append("\"locadepa\": \"").append(escapeJson(loc.getLocadepa())).append("\",")
                        .append("\"locacodi\": \"").append(escapeJson(loc.getLocacodi())).append("\",")
                        .append("\"locanomb\": \"").append(escapeJson(loc.getLocanomb())).append("\"")
                        .append("}");
            }

            json.append("]}");

            PrintWriter out = response.getWriter();
            out.print(json.toString());
            out.flush();

            System.out.println("Localidades cargadas exitosamente para departamento " + codigoDepartamento + ": "
                    + localidades.size());

        } catch (Exception e) {
            System.err.println("Error al cargar localidades: " + e.getMessage());
            e.printStackTrace();

            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            PrintWriter out = response.getWriter();
            out.print("{\"success\": false, \"error\": \"Error al cargar localidades: " + escapeJson(e.getMessage())
                    + "\"}");
            out.flush();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Redirigir todas las peticiones POST al método GET
        doGet(request, response);
    }

    /**
     * Escapa caracteres especiales para JSON
     */
    private String escapeJson(String value) {
        if (value == null) {
            return "";
        }
        return value.replace("\\", "\\\\")
                .replace("\"", "\\\"")
                .replace("\b", "\\b")
                .replace("\f", "\\f")
                .replace("\n", "\\n")
                .replace("\r", "\\r")
                .replace("\t", "\\t");
    }
}