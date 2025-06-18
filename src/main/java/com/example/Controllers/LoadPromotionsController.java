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

    private static final int DEFAULT_PAGE_SIZE = 10;
    private static final int MAX_PAGE_SIZE = 30;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Promotion> promotions = new ArrayList<>();
        DatabaseConnection databaseConnection = new DatabaseConnection();
        String debugInfo = "";
        int recordCount = 0;

        // Obtener parámetros de búsqueda y paginación
        String nombrePromocion = request.getParameter("nombrePromocion");
        String vigenciaInicio = request.getParameter("vigenciaInicio");
        String vigenciaFin = request.getParameter("vigenciaFin");
        int pageSize = getPageSize(request);
        int currentPage = getCurrentPage(request);

        // Verificar si es la primera carga (sin filtros de búsqueda aplicados)
        boolean isInitialLoad = (nombrePromocion == null || nombrePromocion.trim().isEmpty()) &&
                (vigenciaInicio == null || vigenciaInicio.trim().isEmpty()) &&
                (vigenciaFin == null || vigenciaFin.trim().isEmpty());

        try {
            System.out.println("=== INICIANDO CONSULTA A VW_CONSULTA_PROMO ===");

            databaseConnection.getConnection();
            Statement stmt = databaseConnection.connection.createStatement();

            // Construir consulta base
            StringBuilder queryBuilder = new StringBuilder("SELECT * FROM VW_CONSULTA_PROMO WHERE 1=1");
            boolean hasFilters = false;

            if (nombrePromocion != null && !nombrePromocion.trim().isEmpty()) {
                // Escapar caracteres especiales para prevenir SQL injection
                String nombreEscapado = nombrePromocion.trim().replace("'", "''");
                queryBuilder.append(" AND UPPER(TICODESC) LIKE UPPER('%").append(nombreEscapado).append("%')");
                System.out.println("Filtro por nombre: " + nombrePromocion);
                hasFilters = true;
            }

            if (vigenciaInicio != null && !vigenciaInicio.trim().isEmpty()) {
                queryBuilder.append(" AND (COCOFEIN >= TO_DATE('").append(vigenciaInicio)
                        .append("', 'YYYY-MM-DD') OR COCOFEFI >= TO_DATE('").append(vigenciaInicio)
                        .append("', 'YYYY-MM-DD'))");
                System.out.println("Filtro fecha inicio: " + vigenciaInicio);
                hasFilters = true;
            }

            if (vigenciaFin != null && !vigenciaFin.trim().isEmpty()) {
                queryBuilder.append(" AND (COCOFEIN <= TO_DATE('").append(vigenciaFin)
                        .append("', 'YYYY-MM-DD') OR COCOFEFI <= TO_DATE('").append(vigenciaFin)
                        .append("', 'YYYY-MM-DD'))");
                System.out.println("Filtro fecha fin: " + vigenciaFin);
                hasFilters = true;
            }

            // Si no hay filtros específicos, cargar los primeros registros por defecto
            if (!hasFilters) {
                System.out.println("Sin filtros específicos - cargando primeros registros");
            } else {
                System.out.println("Filtros aplicados - ejecutando búsqueda específica");
            }

            // Construir consulta simple con ROWNUM para limitar registros
            String simpleQuery;
            if (!hasFilters) {
                // Sin filtros: cargar primeros registros
                simpleQuery = "SELECT * FROM VW_CONSULTA_PROMO WHERE ROWNUM <= " + pageSize;
            } else {
                // Con filtros: aplicar filtros y limitar
                simpleQuery = queryBuilder.toString() + " AND ROWNUM <= " + pageSize;
            }

            System.out.println("Ejecutando query: " + simpleQuery);

            ResultSet rs = stmt.executeQuery(simpleQuery);

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
                    promotion.setTicododi(rs.getInt("TICOCODI"));
                    System.out.println("TICOCODI: " + rs.getInt("TICOCODI"));
                } catch (Exception e) {
                    System.out.println("Error leyendo TICOCODI: " + e.getMessage());
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
                    promotion.setTicodex(rs.getString("TICOCOEX"));
                    System.out.println("TICOCOEX: " + rs.getString("TICOCOEX"));
                } catch (Exception e) {
                    System.out.println("Error leyendo TICOCOEX: " + e.getMessage());
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
                    promotion.setLocandmb(rs.getString("LOCANOMB"));
                    System.out.println("LOCANOMB: " + rs.getString("LOCANOMB"));
                } catch (Exception e) {
                    System.out.println("Error leyendo LOCANOMB: " + e.getMessage());
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
                    promotion.setCocodlco(rs.getString("COCOCLCO"));
                    System.out.println("COCOCLCO: " + rs.getString("COCOCLCO"));
                } catch (Exception e) {
                    System.out.println("Error leyendo COCOCLCO: " + e.getMessage());
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
            System.out.println("Registros obtenidos: " + recordCount);
            System.out.println("Tamaño de página solicitado: " + pageSize);

            // Crear información de debug para la vista
            if (recordCount > 0) {
                if (isInitialLoad) {
                    debugInfo = String.format("Mostrando los primeros %d registros disponibles", recordCount);
                } else {
                    debugInfo = String.format("Consulta ejecutada exitosamente. Se encontraron %d registros",
                            recordCount);
                }
            } else {
                debugInfo = "No se encontraron promociones que coincidan con los criterios especificados";
            }

            request.setAttribute("promotions", promotions);
            request.setAttribute("debugInfo", debugInfo);
            request.setAttribute("recordCount", recordCount);
            request.setAttribute("currentPage", 1);
            request.setAttribute("pageSize", pageSize);
            request.setAttribute("totalPages", 1);
            request.setAttribute("showPromotions", "true");
            request.setAttribute("isInitialLoad", isInitialLoad);
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

    private int getPageSize(HttpServletRequest request) {
        String pageSizeParam = request.getParameter("pageSize");
        if (pageSizeParam != null && !pageSizeParam.trim().isEmpty()) {
            try {
                int size = Integer.parseInt(pageSizeParam);
                return Math.min(Math.max(size, DEFAULT_PAGE_SIZE), MAX_PAGE_SIZE);
            } catch (NumberFormatException e) {
                return DEFAULT_PAGE_SIZE;
            }
        }
        return DEFAULT_PAGE_SIZE;
    }

    private int getCurrentPage(HttpServletRequest request) {
        String pageParam = request.getParameter("page");
        if (pageParam != null && !pageParam.trim().isEmpty()) {
            try {
                return Math.max(Integer.parseInt(pageParam), 1);
            } catch (NumberFormatException e) {
                return 1;
            }
        }
        return 1;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Redirigir todas las peticiones POST al método GET
        doGet(request, response);
    }
}
