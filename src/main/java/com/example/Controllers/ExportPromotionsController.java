package com.example.Controllers;

import com.example.DatabaseConnection;
import com.example.Models.Promotion;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ExportPromotions")
public class ExportPromotionsController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String format = request.getParameter("format");

        System.out.println("=== EXPORTACIÓN SOLICITADA ===");
        System.out.println("Formato solicitado: " + format);
        System.out.println("Parámetros recibidos:");
        request.getParameterMap().forEach((key, values) -> {
            System.out.println("  " + key + " = " + java.util.Arrays.toString(values));
        });

        // Agregar test simple primero
        if ("test".equals(format)) {
            exportTestCSV(response);
            return;
        }

        if ("csv".equals(format)) {
            exportToCSV(request, response);
        } else if ("excel".equals(format)) {
            exportToExcel(request, response);
        } else {
            System.out.println("Formato no soportado: " + format);
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Formato no soportado");
        }
    }

    private void exportToCSV(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("=== INICIANDO EXPORTACIÓN CSV ===");

        // Obtener los mismos parámetros de búsqueda que se usaron en la consulta
        String nombrePromocion = request.getParameter("nombrePromocion");
        String vigenciaInicio = request.getParameter("vigenciaInicio");
        String vigenciaFin = request.getParameter("vigenciaFin");
        String pageSize = request.getParameter("pageSize");

        System.out.println("Parámetros de exportación:");
        System.out.println("  nombrePromocion: " + nombrePromocion);
        System.out.println("  vigenciaInicio: " + vigenciaInicio);
        System.out.println("  vigenciaFin: " + vigenciaFin);
        System.out.println("  pageSize: " + pageSize);

        List<Promotion> promotions = new ArrayList<>();
        DatabaseConnection databaseConnection = new DatabaseConnection();

        try {
            System.out.println("Conectando a la base de datos...");
            databaseConnection.getConnection();
            Statement stmt = databaseConnection.connection.createStatement();

            // Construir la misma consulta que se usa en LoadPromotionsController
            StringBuilder queryBuilder = new StringBuilder("SELECT * FROM VW_CONSULTA_PROMO WHERE 1=1");
            boolean hasFilters = false;

            if (nombrePromocion != null && !nombrePromocion.trim().isEmpty()) {
                String nombreEscapado = nombrePromocion.trim().replace("'", "''");
                queryBuilder.append(" AND UPPER(TICODESC) LIKE UPPER('%").append(nombreEscapado).append("%')");
                hasFilters = true;
                System.out.println("Agregado filtro nombrePromocion");
            }

            if (vigenciaInicio != null && !vigenciaInicio.trim().isEmpty()) {
                queryBuilder.append(" AND (COCOFEIN >= TO_DATE('").append(vigenciaInicio)
                        .append("', 'YYYY-MM-DD') OR COCOFEFI >= TO_DATE('").append(vigenciaInicio)
                        .append("', 'YYYY-MM-DD'))");
                hasFilters = true;
                System.out.println("Agregado filtro vigenciaInicio");
            }

            if (vigenciaFin != null && !vigenciaFin.trim().isEmpty()) {
                queryBuilder.append(" AND (COCOFEIN <= TO_DATE('").append(vigenciaFin)
                        .append("', 'YYYY-MM-DD') OR COCOFEFI <= TO_DATE('").append(vigenciaFin)
                        .append("', 'YYYY-MM-DD'))");
                hasFilters = true;
                System.out.println("Agregado filtro vigenciaFin");
            }

            String query;
            if (!hasFilters) {
                // Sin filtros: exportar todos los registros limitados
                int maxRecords = pageSize != null ? Integer.parseInt(pageSize) : 1000; // Límite máximo para exportación
                query = "SELECT * FROM VW_CONSULTA_PROMO WHERE ROWNUM <= " + maxRecords;
                System.out.println("Exportación sin filtros, máximo " + maxRecords + " registros");
            } else {
                // Con filtros: exportar todos los que coincidan (sin límite ROWNUM para
                // exportación completa)
                query = queryBuilder.toString();
                System.out.println("Exportación con filtros aplicados");
            }

            System.out.println("Query ejecutada: " + query);
            ResultSet rs = stmt.executeQuery(query);

            int recordCount = 0;
            while (rs.next()) {
                recordCount++;
                Promotion promotion = new Promotion();

                // Llenar todos los campos necesarios para la exportación
                try {
                    promotion.setTicododi(rs.getInt("TICOCODI"));
                } catch (Exception e) {
                    promotion.setTicododi(0);
                }
                try {
                    promotion.setTicodesc(rs.getString("TICODESC"));
                } catch (Exception e) {
                    promotion.setTicodesc("");
                }
                try {
                    promotion.setDepadesc(rs.getString("DEPADESC"));
                } catch (Exception e) {
                    promotion.setDepadesc("");
                }
                try {
                    promotion.setLocandmb(rs.getString("LOCANOMB"));
                } catch (Exception e) {
                    promotion.setLocandmb("");
                }
                try {
                    promotion.setCatedesc(rs.getString("CATEDESC"));
                } catch (Exception e) {
                    promotion.setCatedesc("");
                }
                try {
                    promotion.setSucacate(rs.getInt("SUCACATE"));
                } catch (Exception e) {
                    promotion.setSucacate(0);
                }
                try {
                    promotion.setPlsudesc(rs.getString("PLSUDESC"));
                } catch (Exception e) {
                    promotion.setPlsudesc("");
                }
                try {
                    promotion.setConcdesc(rs.getString("CONCDESC"));
                } catch (Exception e) {
                    promotion.setConcdesc("");
                }
                try {
                    promotion.setCocoporc(rs.getDouble("COCOPORC"));
                } catch (Exception e) {
                    promotion.setCocoporc(0.0);
                }
                try {
                    promotion.setCocotiap(rs.getInt("COCOTIAP"));
                } catch (Exception e) {
                    promotion.setCocotiap(0);
                }
                try {
                    promotion.setTicoperiodicidad(rs.getString("TICOPERIODICIDAD"));
                } catch (Exception e) {
                    promotion.setTicoperiodicidad("");
                }
                try {
                    promotion.setTicofech(rs.getDate("TICOFECH"));
                } catch (Exception e) {
                    promotion.setTicofech(null);
                }
                try {
                    promotion.setTicouser(rs.getString("TICOUSER"));
                } catch (Exception e) {
                    promotion.setTicouser("");
                }

                promotions.add(promotion);
            }

            System.out.println("Registros obtenidos para exportación: " + recordCount);

            rs.close();
            stmt.close();
            databaseConnection.connection.close();

            if (promotions.isEmpty()) {
                System.out.println("No hay datos para exportar");
                response.sendError(HttpServletResponse.SC_NO_CONTENT, "No hay datos para exportar");
                return;
            }

            // Configurar respuesta para descarga CSV
            System.out.println("Configurando respuesta CSV...");
            response.setContentType("text/csv; charset=UTF-8");
            response.setHeader("Content-Disposition", "attachment; filename=\"promociones_" +
                    java.time.LocalDate.now().toString() + ".csv\"");

            PrintWriter writer = response.getWriter();

            // Escribir encabezados CSV
            writer.println(
                    "\"Código Promoción\",\"Nombre Promoción\",\"Departamento\",\"Localidad\",\"Mercado\",\"Estrato\",\"Tipo Plan\",\"Tipo Producto\",\"% Descuento\",\"Duración (días)\",\"Periodicidad\",\"Fecha Creación\",\"Usuario\"");

            // Escribir datos
            for (Promotion promotion : promotions) {
                writer.printf(
                        "\"%s\",\"%s\",\"%s\",\"%s\",\"%s\",\"%s\",\"%s\",\"%s\",\"%s\",\"%s\",\"%s\",\"%s\",\"%s\"%n",
                        escapeCSV(String.valueOf(promotion.getTicododi())),
                        escapeCSV(promotion.getTicodesc()),
                        escapeCSV(promotion.getDepadesc()),
                        escapeCSV(promotion.getLocandmb()),
                        escapeCSV(promotion.getCatedesc()),
                        escapeCSV(String.valueOf(promotion.getSucacate())),
                        escapeCSV(promotion.getPlsudesc()),
                        escapeCSV(promotion.getConcdesc()),
                        escapeCSV(String.valueOf(promotion.getCocoporc())),
                        escapeCSV(String.valueOf(promotion.getCocotiap())),
                        escapeCSV(promotion.getTicoperiodicidad()),
                        escapeCSV(promotion.getTicofech() != null ? promotion.getTicofech().toString() : ""),
                        escapeCSV(promotion.getTicouser()));
            }

            writer.flush();
            writer.close();
            System.out.println("Exportación CSV completada exitosamente");

        } catch (Exception e) {
            System.err.println("Error en exportación CSV: " + e.getMessage());
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                    "Error al exportar datos: " + e.getMessage());
        }
    }

    private void exportToExcel(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Por ahora, redirigir a CSV ya que Excel requiere librerías adicionales
        // En una implementación completa, aquí se usaría Apache POI
        response.sendError(HttpServletResponse.SC_NOT_IMPLEMENTED,
                "Exportación a Excel no implementada aún. Use CSV por el momento.");
    }

    private String escapeCSV(String value) {
        if (value == null) {
            return "";
        }
        // Escapar comillas dobles duplicándolas
        return value.replace("\"", "\"\"");
    }

    // Método de prueba simple
    private void exportTestCSV(HttpServletResponse response) throws IOException {
        System.out.println("=== EXPORTACIÓN DE PRUEBA ===");

        response.setContentType("text/csv; charset=UTF-8");
        response.setHeader("Content-Disposition", "attachment; filename=\"test.csv\"");

        PrintWriter writer = response.getWriter();
        writer.println("Código,Nombre,Prueba");
        writer.println("1,\"Test Promoción\",\"Funcionando\"");
        writer.flush();
        writer.close();

        System.out.println("Archivo de prueba generado");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}