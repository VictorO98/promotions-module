package com.example.Controllers;

import com.example.DAO.DepartamentoDAO;
import com.example.Models.Departamento;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LoadDepartamentos")
public class LoadDepartamentosController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        try {
            DepartamentoDAO departamentoDAO = new DepartamentoDAO();
            List<Departamento> departamentos = departamentoDAO.getAllDepartamentos();

            // Construir JSON manualmente para evitar dependencias adicionales
            StringBuilder json = new StringBuilder();
            json.append("{\"success\": true, \"departamentos\": [");

            for (int i = 0; i < departamentos.size(); i++) {
                Departamento dept = departamentos.get(i);
                if (i > 0) {
                    json.append(",");
                }
                json.append("{")
                        .append("\"codigo\": \"").append(escapeJson(dept.getDepacodi())).append("\",")
                        .append("\"descripcion\": \"").append(escapeJson(dept.getDepadesc())).append("\",")
                        .append("\"gerencia\": \"").append(escapeJson(dept.getDepagere())).append("\"")
                        .append("}");
            }

            json.append("]}");

            PrintWriter out = response.getWriter();
            out.print(json.toString());
            out.flush();

            System.out.println("Departamentos cargados exitosamente: " + departamentos.size());

        } catch (Exception e) {
            System.err.println("Error al cargar departamentos: " + e.getMessage());
            e.printStackTrace();

            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            PrintWriter out = response.getWriter();
            out.print("{\"success\": false, \"error\": \"Error al cargar departamentos: " + escapeJson(e.getMessage())
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