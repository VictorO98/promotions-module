package com.example.Controllers;

import com.example.DAO.CategoriaDAO;
import com.example.Models.Categoria;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LoadCategorias")
public class LoadCategoriasController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        try {
            CategoriaDAO categoriaDAO = new CategoriaDAO();
            List<Categoria> categorias = categoriaDAO.getAllCategorias();

            // Construir JSON manualmente para evitar dependencias adicionales
            StringBuilder json = new StringBuilder();
            json.append("{\"success\": true, \"categorias\": [");

            for (int i = 0; i < categorias.size(); i++) {
                Categoria cat = categorias.get(i);
                if (i > 0) {
                    json.append(",");
                }
                json.append("{")
                        .append("\"codigo\": \"").append(escapeJson(cat.getCatecodi())).append("\",")
                        .append("\"descripcion\": \"").append(escapeJson(cat.getCatedesc())).append("\",")
                        .append("\"evalco\": \"").append(escapeJson(cat.getCateevlco())).append("\"")
                        .append("}");
            }

            json.append("]}");

            PrintWriter out = response.getWriter();
            out.print(json.toString());
            out.flush();

            System.out.println("Categorías cargadas exitosamente: " + categorias.size());

        } catch (Exception e) {
            System.err.println("Error al cargar categorías: " + e.getMessage());
            e.printStackTrace();

            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            PrintWriter out = response.getWriter();
            out.print("{\"success\": false, \"error\": \"Error al cargar categorías: " + escapeJson(e.getMessage())
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