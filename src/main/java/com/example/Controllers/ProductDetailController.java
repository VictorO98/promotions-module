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

@WebServlet("/ProductDetail")
public class ProductDetailController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("=== PRODUCT DETAIL CONTROLLER ===");

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

            // Obtener conceptos asociados al producto específico
            String sqlAsociados = "SELECT COD_CONCEPTO, CONCEPTO " +
                    "FROM VW_PRODUCTO_CONCEPTO " +
                    "WHERE COD_PRODUCTO = ? " +
                    "ORDER BY CONCEPTO";

            // Obtener todos los conceptos disponibles
            String sqlTodos = "SELECT CONCCODI AS COD_CONCEPTO, CONCDESC AS CONCEPTO FROM concepto ORDER BY CONCDESC";

            // Ejecutar primera consulta: conceptos asociados
            System.out.println("SQL Asociados: " + sqlAsociados);
            PreparedStatement psAsociados = conn.prepareStatement(sqlAsociados);
            psAsociados.setString(1, codProducto);
            ResultSet rsAsociados = psAsociados.executeQuery();

            List<ConceptoDetail> conceptosAsociados = new ArrayList<>();
            while (rsAsociados.next()) {
                ConceptoDetail concepto = new ConceptoDetail();
                concepto.codConcepto = rsAsociados.getString("COD_CONCEPTO");
                concepto.concepto = rsAsociados.getString("CONCEPTO");
                concepto.asociado = true; // Todos los de esta consulta están asociados
                conceptosAsociados.add(concepto);
            }
            rsAsociados.close();
            psAsociados.close();

            // Ejecutar segunda consulta: todos los conceptos
            System.out.println("SQL Todos: " + sqlTodos);
            PreparedStatement psTodos = conn.prepareStatement(sqlTodos);
            ResultSet rsTodos = psTodos.executeQuery();

            List<ConceptoDetail> todosConceptos = new ArrayList<>();
            while (rsTodos.next()) {
                ConceptoDetail concepto = new ConceptoDetail();
                concepto.codConcepto = rsTodos.getString("COD_CONCEPTO");
                concepto.concepto = rsTodos.getString("CONCEPTO");
                concepto.asociado = false; // Por defecto no asociados, filtraremos después
                todosConceptos.add(concepto);
            }
            rsTodos.close();
            psTodos.close();

            // Filtrar conceptos disponibles (quitar los que ya están asociados)
            List<ConceptoDetail> conceptosDisponibles = new ArrayList<>();
            for (ConceptoDetail todoConcepto : todosConceptos) {
                boolean yaAsociado = false;
                for (ConceptoDetail asociado : conceptosAsociados) {
                    if (todoConcepto.codConcepto.equals(asociado.codConcepto)) {
                        yaAsociado = true;
                        break;
                    }
                }
                if (!yaAsociado) {
                    conceptosDisponibles.add(todoConcepto);
                }
            }

            // Combinar listas para enviar al frontend
            List<ConceptoDetail> conceptos = new ArrayList<>();
            conceptos.addAll(conceptosAsociados);
            conceptos.addAll(conceptosDisponibles);
            conn.close();

            System.out.println("Conceptos encontrados: " + conceptos.size());

            // Construir JSON manualmente
            StringBuilder jsonResponse = new StringBuilder();
            jsonResponse.append("{\"success\": true, \"codProducto\": \"").append(codProducto)
                    .append("\", \"conceptos\": [");

            for (int i = 0; i < conceptos.size(); i++) {
                ConceptoDetail concepto = conceptos.get(i);
                if (i > 0)
                    jsonResponse.append(",");
                jsonResponse.append("{")
                        .append("\"codConcepto\": \"").append(concepto.codConcepto).append("\",")
                        .append("\"concepto\": \"").append(concepto.concepto).append("\",")
                        .append("\"asociado\": ").append(concepto.asociado)
                        .append("}");
            }

            jsonResponse.append("]}");

            out.print(jsonResponse.toString());
            out.flush();

            System.out.println("=== PRODUCT DETAIL TERMINADO ===");

        } catch (Exception e) {
            System.err.println("Error en ProductDetail: " + e.getMessage());
            e.printStackTrace();
            out.print("{\"success\": false, \"message\": \"Error: " + e.getMessage() + "\"}");
            out.flush();
        } finally {
            out.close();
        }
    }

    // Clases internas para JSON
    public static class ConceptoDetail {
        public String codConcepto;
        public String concepto;
        public boolean asociado;
    }

}