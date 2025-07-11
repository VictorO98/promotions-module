package com.example.Controllers;

import com.example.DAO.PlanSuscripcionDAO;
import com.example.Models.PlanSuscripcion;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LoadPlanes")
public class LoadPlanesController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        try {
            String busqueda = request.getParameter("busqueda");

            PlanSuscripcionDAO planDAO = new PlanSuscripcionDAO();
            List<PlanSuscripcion> planes;

            // Si se proporciona término de búsqueda, filtrar
            // Si no, obtener todos los planes
            if (busqueda != null && !busqueda.trim().isEmpty()) {
                planes = planDAO.buscarPlanesByDescripcion(busqueda.trim());
            } else {
                planes = planDAO.getAllPlanes();
            }

            // Construir JSON manualmente para evitar dependencias adicionales
            StringBuilder json = new StringBuilder();
            json.append("{\"success\": true, \"planes\": [");

            for (int i = 0; i < planes.size(); i++) {
                PlanSuscripcion plan = planes.get(i);
                if (i > 0) {
                    json.append(",");
                }
                json.append("{")
                        .append("\"codigo\": \"").append(escapeJson(plan.getPlsucodi())).append("\",")
                        .append("\"descripcion\": \"").append(escapeJson(plan.getPlsudesc())).append("\"")
                        .append("}");
            }

            json.append("]}");

            PrintWriter out = response.getWriter();
            out.print(json.toString());
            out.flush();

            System.out.println("Planes cargados exitosamente: " + planes.size() +
                    (busqueda != null && !busqueda.trim().isEmpty() ? " con búsqueda: '" + busqueda + "'" : ""));

        } catch (Exception e) {
            System.err.println("Error al cargar planes: " + e.getMessage());
            e.printStackTrace();

            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            PrintWriter out = response.getWriter();
            out.print("{\"success\": false, \"error\": \"Error al cargar planes: " +
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