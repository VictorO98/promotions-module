package com.example.Controllers;

import com.example.DatabaseConnection;
import com.example.Models.Promotion;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LoadPromotions")
public class LoadPromotionsController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Promotion> promotions = new ArrayList<>();
        DatabaseConnection databaseConnection = new DatabaseConnection();
        String debugInfo = "";
        int recordCount = 0;

        // Obtener parámetros de búsqueda
        String nombrePromocion = request.getParameter("nombrePromocion");
        String vigenciaInicio = request.getParameter("vigenciaInicio");
        String vigenciaFin = request.getParameter("vigenciaFin");

        try {
            System.out.println("=== INICIANDO CONSULTA A VW_CONSULTA_PROMO ===");

            databaseConnection.getConnection();
            Statement stmt = databaseConnection.connection.createStatement();

            // Construir consulta con filtros
            StringBuilder queryBuilder = new StringBuilder("SELECT * FROM VW_CONSULTA_PROMO WHERE 1=1");

            if (nombrePromocion != null && !nombrePromocion.trim().isEmpty()) {
                queryBuilder.append(" AND UPPER(TICODESC) LIKE UPPER('%").append(nombrePromocion.trim()).append("%')");
                System.out.println("Filtro por nombre: " + nombrePromocion);
            }

            if (vigenciaInicio != null && !vigenciaInicio.trim().isEmpty()) {
                queryBuilder.append(" AND (COCOFEIN >= TO_DATE('").append(vigenciaInicio)
                        .append("', 'YYYY-MM-DD') OR COCOFEFI >= TO_DATE('").append(vigenciaInicio)
                        .append("', 'YYYY-MM-DD'))");
                System.out.println("Filtro fecha inicio: " + vigenciaInicio);
            }

            if (vigenciaFin != null && !vigenciaFin.trim().isEmpty()) {
                queryBuilder.append(" AND (COCOFEIN <= TO_DATE('").append(vigenciaFin)
                        .append("', 'YYYY-MM-DD') OR COCOFEFI <= TO_DATE('").append(vigenciaFin)
                        .append("', 'YYYY-MM-DD'))");
                System.out.println("Filtro fecha fin: " + vigenciaFin);
            }

            String query = queryBuilder.toString();
            System.out.println("Ejecutando query: " + query);

            ResultSet rs = stmt.executeQuery(query);

            // Obtener metadatos de las columnas
            ResultSetMetaData metaData = rs.getMetaData();
            int columnCount = metaData.getColumnCount();

            System.out.println("=== INFORMACIÓN DE COLUMNAS ===");
            for (int i = 1; i <= columnCount; i++) {
                System.out.println("Columna " + i + ": " + metaData.getColumnName(i) +
                        " (" + metaData.getColumnTypeName(i) + ")");
            }

            System.out.println("=== DATOS OBTENIDOS ===");

            while (rs.next()) {
                recordCount++;
                System.out.println("--- Registro " + recordCount + " ---");

                Promotion promotion = new Promotion();

                try {
                    promotion.setTicododi(rs.getInt("TICODODI"));
                    System.out.println("TICODODI: " + rs.getInt("TICODODI"));
                } catch (Exception e) {
                    System.out.println("Error leyendo TICODODI: " + e.getMessage());
                }

                try {
                    promotion.setCococodi(rs.getInt("COCOCODI"));
                    System.out.println("COCOCODI: " + rs.getInt("COCOCODI"));
                } catch (Exception e) {
                    System.out.println("Error leyendo COCOCODI: " + e.getMessage());
                }

                try {
                    promotion.setSucacodi(rs.getInt("SUCACODI"));
                    System.out.println("SUCACODI: " + rs.getInt("SUCACODI"));
                } catch (Exception e) {
                    System.out.println("Error leyendo SUCACODI: " + e.getMessage());
                }

                try {
                    promotion.setConccodi(rs.getInt("CONCCODI"));
                    System.out.println("CONCCODI: " + rs.getInt("CONCCODI"));
                } catch (Exception e) {
                    System.out.println("Error leyendo CONCCODI: " + e.getMessage());
                }

                try {
                    promotion.setTiposercodi(rs.getInt("TIPOSERCODI"));
                    System.out.println("TIPOSERCODI: " + rs.getInt("TIPOSERCODI"));
                } catch (Exception e) {
                    System.out.println("Error leyendo TIPOSERCODI: " + e.getMessage());
                }

                try {
                    promotion.setPasecodi(rs.getInt("PASECODI"));
                    System.out.println("PASECODI: " + rs.getInt("PASECODI"));
                } catch (Exception e) {
                    System.out.println("Error leyendo PASECODI: " + e.getMessage());
                }

                try {
                    promotion.setTicodex(rs.getString("TICODEX"));
                    System.out.println("TICODEX: " + rs.getString("TICODEX"));
                } catch (Exception e) {
                    System.out.println("Error leyendo TICODEX: " + e.getMessage());
                }

                try {
                    promotion.setTicodesc(rs.getString("TICODESC"));
                    System.out.println("TICODESC: " + rs.getString("TICODESC"));
                } catch (Exception e) {
                    System.out.println("Error leyendo TICODESC: " + e.getMessage());
                }

                try {
                    promotion.setTicodpto(rs.getInt("TICODPTO"));
                    System.out.println("TICODPTO: " + rs.getInt("TICODPTO"));
                } catch (Exception e) {
                    System.out.println("Error leyendo TICODPTO: " + e.getMessage());
                }

                try {
                    promotion.setDepadesc(rs.getString("DEPADESC"));
                    System.out.println("DEPADESC: " + rs.getString("DEPADESC"));
                } catch (Exception e) {
                    System.out.println("Error leyendo DEPADESC: " + e.getMessage());
                }

                try {
                    promotion.setLocacodi(rs.getInt("LOCACODI"));
                    System.out.println("LOCACODI: " + rs.getInt("LOCACODI"));
                } catch (Exception e) {
                    System.out.println("Error leyendo LOCACODI: " + e.getMessage());
                }

                try {
                    promotion.setLocandmb(rs.getString("LOCANDMB"));
                    System.out.println("LOCANDMB: " + rs.getString("LOCANDMB"));
                } catch (Exception e) {
                    System.out.println("Error leyendo LOCANDMB: " + e.getMessage());
                }

                try {
                    promotion.setCatecodi(rs.getInt("CATECODI"));
                    System.out.println("CATECODI: " + rs.getInt("CATECODI"));
                } catch (Exception e) {
                    System.out.println("Error leyendo CATECODI: " + e.getMessage());
                }

                try {
                    promotion.setCatedesc(rs.getString("CATEDESC"));
                    System.out.println("CATEDESC: " + rs.getString("CATEDESC"));
                } catch (Exception e) {
                    System.out.println("Error leyendo CATEDESC: " + e.getMessage());
                }

                try {
                    promotion.setSucacate(rs.getInt("SUCACATE"));
                    System.out.println("SUCACATE: " + rs.getInt("SUCACATE"));
                } catch (Exception e) {
                    System.out.println("Error leyendo SUCACATE: " + e.getMessage());
                }

                try {
                    promotion.setSucadesc(rs.getString("SUCADESC"));
                    System.out.println("SUCADESC: " + rs.getString("SUCADESC"));
                } catch (Exception e) {
                    System.out.println("Error leyendo SUCADESC: " + e.getMessage());
                }

                try {
                    promotion.setPlsucodi(rs.getInt("PLSUCODI"));
                    System.out.println("PLSUCODI: " + rs.getInt("PLSUCODI"));
                } catch (Exception e) {
                    System.out.println("Error leyendo PLSUCODI: " + e.getMessage());
                }

                try {
                    promotion.setPlsudesc(rs.getString("PLSUDESC"));
                    System.out.println("PLSUDESC: " + rs.getString("PLSUDESC"));
                } catch (Exception e) {
                    System.out.println("Error leyendo PLSUDESC: " + e.getMessage());
                }

                try {
                    promotion.setTicofech(rs.getDate("TICOFECH"));
                    System.out.println("TICOFECH: " + rs.getDate("TICOFECH"));
                } catch (Exception e) {
                    System.out.println("Error leyendo TICOFECH: " + e.getMessage());
                }

                try {
                    promotion.setTicouser(rs.getString("TICOUSER"));
                    System.out.println("TICOUSER: " + rs.getString("TICOUSER"));
                } catch (Exception e) {
                    System.out.println("Error leyendo TICOUSER: " + e.getMessage());
                }

                try {
                    promotion.setTicoactive(rs.getString("TICOACTIVE"));
                    System.out.println("TICOACTIVE: " + rs.getString("TICOACTIVE"));
                } catch (Exception e) {
                    System.out.println("Error leyendo TICOACTIVE: " + e.getMessage());
                }

                try {
                    promotion.setCocoporc(rs.getInt("COCOPORC"));
                    System.out.println("COCOPORC: " + rs.getInt("COCOPORC"));
                } catch (Exception e) {
                    System.out.println("Error leyendo COCOPORC: " + e.getMessage());
                }

                try {
                    promotion.setCocoval(rs.getInt("COCOVAL"));
                    System.out.println("COCOVAL: " + rs.getInt("COCOVAL"));
                } catch (Exception e) {
                    System.out.println("Error leyendo COCOVAL: " + e.getMessage());
                }

                try {
                    promotion.setTicoperiodicidad(rs.getString("TICOPERIODICIDAD"));
                    System.out.println("TICOPERIODICIDAD: " + rs.getString("TICOPERIODICIDAD"));
                } catch (Exception e) {
                    System.out.println("Error leyendo TICOPERIODICIDAD: " + e.getMessage());
                }

                try {
                    promotion.setCocotiap(rs.getInt("COCOTIAP"));
                    System.out.println("COCOTIAP: " + rs.getInt("COCOTIAP"));
                } catch (Exception e) {
                    System.out.println("Error leyendo COCOTIAP: " + e.getMessage());
                }

                try {
                    promotion.setCocofein(rs.getDate("COCOFEIN"));
                    System.out.println("COCOFEIN: " + rs.getDate("COCOFEIN"));
                } catch (Exception e) {
                    System.out.println("Error leyendo COCOFEIN: " + e.getMessage());
                }

                try {
                    promotion.setCocofefi(rs.getDate("COCOFEFI"));
                    System.out.println("COCOFEFI: " + rs.getDate("COCOFEFI"));
                } catch (Exception e) {
                    System.out.println("Error leyendo COCOFEFI: " + e.getMessage());
                }

                try {
                    promotion.setCocodlco(rs.getString("COCODLCO"));
                    System.out.println("COCODLCO: " + rs.getString("COCODLCO"));
                } catch (Exception e) {
                    System.out.println("Error leyendo COCODLCO: " + e.getMessage());
                }

                try {
                    promotion.setCocoacti(rs.getString("COCOACTI"));
                    System.out.println("COCOACTI: " + rs.getString("COCOACTI"));
                } catch (Exception e) {
                    System.out.println("Error leyendo COCOACTI: " + e.getMessage());
                }

                try {
                    promotion.setConcdesc(rs.getString("CONCDESC"));
                    System.out.println("CONCDESC: " + rs.getString("CONCDESC"));
                } catch (Exception e) {
                    System.out.println("Error leyendo CONCDESC: " + e.getMessage());
                }

                try {
                    promotion.setParadesc(rs.getString("PARADESC"));
                    System.out.println("PARADESC: " + rs.getString("PARADESC"));
                } catch (Exception e) {
                    System.out.println("Error leyendo PARADESC: " + e.getMessage());
                }

                try {
                    promotion.setTisscodi(rs.getInt("TISSCODI"));
                    System.out.println("TISSCODI: " + rs.getInt("TISSCODI"));
                } catch (Exception e) {
                    System.out.println("Error leyendo TISSCODI: " + e.getMessage());
                }

                try {
                    promotion.setPasedesc(rs.getString("PASEDESC"));
                    System.out.println("PASEDESC: " + rs.getString("PASEDESC"));
                } catch (Exception e) {
                    System.out.println("Error leyendo PASEDESC: " + e.getMessage());
                }

                promotions.add(promotion);
                System.out.println("Registro agregado exitosamente");
            }

            rs.close();
            stmt.close();
            databaseConnection.connection.close();

            System.out.println("=== RESUMEN ===");
            System.out.println("Total de registros encontrados: " + recordCount);
            System.out.println("Total de promociones en la lista: " + promotions.size());
            System.out.println("Filtros aplicados: Nombre=" + nombrePromocion + ", FechaInicio=" + vigenciaInicio
                    + ", FechaFin=" + vigenciaFin);

            // Crear información de debug para la vista
            debugInfo = "Consulta ejecutada exitosamente. Registros encontrados: " + recordCount;

            if (recordCount == 0 && nombrePromocion != null && !nombrePromocion.trim().isEmpty()) {
                debugInfo += ". No se encontraron promociones con los criterios especificados.";
            }

            request.setAttribute("promotions", promotions);
            request.setAttribute("debugInfo", debugInfo);
            request.setAttribute("recordCount", recordCount);
            request.setAttribute("showPromotions", "true");
            request.getRequestDispatcher("/views/index.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            debugInfo = "ERROR al consultar la vista: " + e.getMessage();
            System.err.println("=== ERROR EN LA CONSULTA ===");
            System.err.println("Error: " + e.getMessage());
            System.err.println("Stack trace completo:");
            e.printStackTrace();

            request.setAttribute("promotions", promotions);
            request.setAttribute("debugInfo", debugInfo);
            request.setAttribute("recordCount", 0);
            request.setAttribute("errorMessage", e.getMessage());
            request.setAttribute("showPromotions", "true");
            request.getRequestDispatcher("/views/index.jsp").forward(request, response);
        }
    }
}
