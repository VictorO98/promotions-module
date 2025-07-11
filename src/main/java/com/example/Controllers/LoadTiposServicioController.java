package com.example.Controllers;

import com.example.DAO.TipoServicioPromoDAO;
import com.example.Models.TipoServicioPromo;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LoadTiposServicio")
public class LoadTiposServicioController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        try {
            TipoServicioPromoDAO tipoServicioDAO = new TipoServicioPromoDAO();
            List<TipoServicioPromo> tiposServicio = tipoServicioDAO.getAllTiposServicio();

            // Construir JSON manualmente para evitar dependencias adicionales
            StringBuilder json = new StringBuilder();
            json.append("{\"success\": true, \"tiposServicio\": [");

            for (int i = 0; i < tiposServicio.size(); i++) {
                TipoServicioPromo tipo = tiposServicio.get(i);
                if (i > 0) {
                    json.append(",");
                }
                json.append("{")
                        .append("\"codigo\": \"").append(escapeJson(tipo.getTiposervcodi())).append("\",")
                        .append("\"descripcion\": \"").append(escapeJson(tipo.getParadesc())).append("\"")
                        .append("}");
            }

            json.append("]}");

            PrintWriter out = response.getWriter();
            out.print(json.toString());
            out.flush();

            System.out.println("Tipos de servicio cargados exitosamente: " + tiposServicio.size());

        } catch (Exception e) {
            System.err.println("Error al cargar tipos de servicio: " + e.getMessage());
            e.printStackTrace();

            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            PrintWriter out = response.getWriter();
            out.print("{\"success\": false, \"error\": \"Error al cargar tipos de servicio: " +
                    escapeJson(e.getMessage()) + "\"}");
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