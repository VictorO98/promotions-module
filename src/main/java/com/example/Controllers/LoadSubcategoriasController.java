package com.example.Controllers;

import com.example.DAO.SubcategoriaDAO;
import com.example.Models.Subcategoria;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LoadSubcategorias")
public class LoadSubcategoriasController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        try {
            String categoriaId = request.getParameter("categoriaId");

            SubcategoriaDAO subcategoriaDAO = new SubcategoriaDAO();
            List<Subcategoria> subcategorias;

            // Si se proporciona categoriaId, filtrar por categoría
            // Si no, obtener todas las subcategorías
            if (categoriaId != null && !categoriaId.trim().isEmpty()) {
                subcategorias = subcategoriaDAO.getSubcategoriasByCategoria(categoriaId);
            } else {
                subcategorias = subcategoriaDAO.getAllSubcategorias();
            }

            // Construir JSON manualmente para evitar dependencias adicionales
            StringBuilder json = new StringBuilder();
            json.append("{\"success\": true, \"subcategorias\": [");

            for (int i = 0; i < subcategorias.size(); i++) {
                Subcategoria subcat = subcategorias.get(i);
                if (i > 0) {
                    json.append(",");
                }
                json.append("{")
                        .append("\"codigo\": \"").append(escapeJson(subcat.getSucacodi())).append("\",")
                        .append("\"descripcion\": \"").append(escapeJson(subcat.getSucadesc())).append("\",")
                        .append("\"categoria\": \"").append(escapeJson(subcat.getSucacate())).append("\"")
                        .append("}");
            }

            json.append("]}");

            PrintWriter out = response.getWriter();
            out.print(json.toString());
            out.flush();

            System.out.println("Subcategorías cargadas exitosamente: " + subcategorias.size() +
                    (categoriaId != null ? " para categoría: " + categoriaId : ""));

        } catch (Exception e) {
            System.err.println("Error al cargar subcategorías: " + e.getMessage());
            e.printStackTrace();

            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            PrintWriter out = response.getWriter();
            out.print("{\"success\": false, \"error\": \"Error al cargar subcategorías: " +
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