package com.example.Controllers;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.DAO.PromocionActivaDAO;
import com.example.DatabaseConnection;
import com.example.Models.PromocionActiva;

@WebServlet("/LoadPromocionesActivas")
public class LoadPromocionesActivasController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private PromocionActivaDAO promocionActivaDAO = new PromocionActivaDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("=== INICIANDO CARGA DE PROMOCIONES ACTIVAS ===");

        List<PromocionActiva> promociones = new ArrayList<>();
        DatabaseConnection databaseConnection = new DatabaseConnection();
        String debugInfo = "";
        int recordCount = 0;

        // Obtener parámetros de búsqueda y paginación
        String placa = request.getParameter("placa");
        int pageSize = getPageSize(request);
        int currentPage = getCurrentPage(request);

        System.out.println("Parámetros recibidos:");
        System.out.println("  placa: " + placa);
        System.out.println("  pageSize: " + pageSize);
        System.out.println("  currentPage: " + currentPage);

        // Verificar si es la primera carga (sin filtros de búsqueda aplicados)
        boolean isInitialLoad = (placa == null || placa.trim().isEmpty());

        // Para primera carga, mostrar todos los registros
        if (isInitialLoad) {
            placa = null; // Asegurar que no hay filtro
        }

        Connection connection = null;
        try {
            databaseConnection.getConnection();
            connection = databaseConnection.connection;

            if (connection != null) {
                System.out.println("Conexión establecida exitosamente");

                // Contar total de registros
                recordCount = promocionActivaDAO.countPromocionesActivas(connection, placa);
                System.out.println("Total de registros encontrados: " + recordCount);

                if (recordCount > 0) {
                    // Calcular paginación
                    int totalPages = (int) Math.ceil((double) recordCount / pageSize);
                    int offset = (currentPage - 1) * pageSize;

                    System.out.println("Configuración de paginación:");
                    System.out.println("  totalPages: " + totalPages);
                    System.out.println("  offset: " + offset);
                    System.out.println("  limit: " + pageSize);

                    // Obtener datos paginados
                    promociones = promocionActivaDAO.searchPromocionesActivas(connection, placa, offset, pageSize);

                    // Establecer atributos para paginación
                    request.setAttribute("currentPage", currentPage);
                    request.setAttribute("totalPages", totalPages);
                    request.setAttribute("pageSize", pageSize);

                    if (isInitialLoad) {
                        debugInfo = "Mostrando página " + currentPage + " de " + totalPages +
                                " (" + recordCount + " promociones activas en total)";
                    } else {
                        debugInfo = "Búsqueda completada: " + recordCount + " registros encontrados para la placa: "
                                + placa +
                                ". Página " + currentPage + " de " + totalPages;
                    }
                } else {
                    if (isInitialLoad) {
                        debugInfo = "No se encontraron promociones activas en el sistema";
                    } else {
                        debugInfo = "No se encontraron promociones activas para la placa: " + placa;
                    }
                }
            } else {
                debugInfo = "Error: No se pudo establecer conexión con la base de datos";
                System.out.println("Error: Conexión null");
            }

        } catch (Exception e) {
            debugInfo = "Error en la consulta: " + e.getMessage();
            System.out.println("Error en LoadPromocionesActivasController: " + e.getMessage());
            e.printStackTrace();
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                    System.out.println("Conexión cerrada");
                } catch (Exception e) {
                    System.out.println("Error cerrando conexión: " + e.getMessage());
                }
            }
        }

        // Establecer atributos para la vista
        request.setAttribute("promocionesActivas", promociones);
        request.setAttribute("recordCount", recordCount);
        request.setAttribute("debugInfo", debugInfo);
        request.setAttribute("isInitialLoad", isInitialLoad);
        request.setAttribute("showPromocionesActivas", "true");

        System.out.println("=== FIN CARGA PROMOCIONES ACTIVAS ===");
        System.out.println("Promociones encontradas: " + promociones.size());
        System.out.println("Información de debug: " + debugInfo);

        // Forward a la vista
        request.getRequestDispatcher("/views/index.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    private int getPageSize(HttpServletRequest request) {
        String pageSizeParam = request.getParameter("pageSize");
        if (pageSizeParam != null && !pageSizeParam.isEmpty()) {
            try {
                int size = Integer.parseInt(pageSizeParam);
                return (size > 0 && size <= 100) ? size : 10; // Límite máximo de 100
            } catch (NumberFormatException e) {
                System.out.println("Error parsing pageSize: " + pageSizeParam);
            }
        }
        return 10; // Valor por defecto
    }

    private int getCurrentPage(HttpServletRequest request) {
        String pageParam = request.getParameter("page");
        if (pageParam != null && !pageParam.isEmpty()) {
            try {
                int page = Integer.parseInt(pageParam);
                return Math.max(page, 1); // Mínimo página 1
            } catch (NumberFormatException e) {
                System.out.println("Error parsing page: " + pageParam);
            }
        }
        return 1; // Valor por defecto
    }
}