package com.example.Controllers;

import java.io.IOException;
import java.io.PrintWriter;
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

@WebServlet("/ExportPromocionesActivas")
public class ExportPromocionesActivasController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private PromocionActivaDAO promocionActivaDAO = new PromocionActivaDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String format = request.getParameter("format");

        if ("csv".equalsIgnoreCase(format)) {
            exportToCSV(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Formato no soportado: " + format);
        }
    }

    private void exportToCSV(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("=== INICIANDO EXPORTACIÓN CSV PROMOCIONES ACTIVAS ===");

        String placa = request.getParameter("placa");

        System.out.println("Parámetros de exportación:");
        System.out.println("  placa: " + placa);

        List<PromocionActiva> promociones = new ArrayList<>();
        DatabaseConnection databaseConnection = new DatabaseConnection();

        Connection connection = null;
        try {
            databaseConnection.getConnection();
            connection = databaseConnection.connection;

            if (connection != null) {
                System.out.println("Conexión establecida para exportación");

                // Obtener todas las promociones activas sin paginación
                promociones = promocionActivaDAO.getAllPromocionesActivas(connection, placa);

                System.out.println("Total promociones para exportar: " + promociones.size());

                if (promociones.isEmpty()) {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND,
                            "No hay datos para exportar con los criterios especificados");
                    return;
                }

                // Configurar respuesta para descarga de archivo CSV
                response.setContentType("text/csv; charset=UTF-8");
                response.setCharacterEncoding("UTF-8");

                String filename = "promociones_activas";
                if (placa != null && !placa.trim().isEmpty()) {
                    filename += "_placa_" + placa;
                }
                filename += ".csv";

                response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");

                // Escribir CSV
                try (PrintWriter writer = response.getWriter()) {
                    // Escribir BOM para UTF-8
                    writer.write('\ufeff');

                    // Escribir encabezados
                    writer.println(
                            "Placa,Código Promoción,Promoción,Código Departamento,Departamento,Código Municipio,Municipio");

                    // Escribir datos
                    for (PromocionActiva promocion : promociones) {
                        writer.printf("%s,%s,\"%s\",%s,\"%s\",%s,\"%s\"%n",
                                promocion.getPlaca() != null ? promocion.getPlaca() : "",
                                promocion.getCodPromo() != null ? promocion.getCodPromo() : "",
                                promocion.getPromocion() != null ? promocion.getPromocion().replace("\"", "\"\"") : "",
                                promocion.getCodDepartamento() != null ? promocion.getCodDepartamento() : "",
                                promocion.getDepartamento() != null ? promocion.getDepartamento().replace("\"", "\"\"")
                                        : "",
                                promocion.getCodMunicipio() != null ? promocion.getCodMunicipio() : "",
                                promocion.getMunicipio() != null ? promocion.getMunicipio().replace("\"", "\"\"") : "");
                    }

                    writer.flush();
                    System.out.println("Archivo CSV generado exitosamente: " + filename);
                }

            } else {
                System.out.println("Error: No se pudo establecer conexión para exportación");
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                        "Error de conexión a la base de datos");
            }

        } catch (Exception e) {
            System.out.println("Error en ExportPromocionesActivasController: " + e.getMessage());
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                    "Error interno del servidor: " + e.getMessage());
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                    System.out.println("Conexión cerrada para exportación");
                } catch (Exception e) {
                    System.out.println("Error cerrando conexión de exportación: " + e.getMessage());
                }
            }
        }

        System.out.println("=== FIN EXPORTACIÓN CSV PROMOCIONES ACTIVAS ===");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}