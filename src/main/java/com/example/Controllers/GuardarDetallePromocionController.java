package com.example.Controllers;

import com.example.DatabaseConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
import java.sql.SQLException;
import java.sql.Types;

@WebServlet("/GuardarDetallePromocion")
public class GuardarDetallePromocionController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        try {
            // Obtener parámetros del request
            String cocotico = request.getParameter("cocotico"); // ID de la promoción
            String cococlco = request.getParameter("cococlco"); // Código del cliente/promoción
            String cocofein = request.getParameter("cocofein"); // Fecha inicio
            String cocfefi = request.getParameter("cocfefi"); // Fecha fin
            String cocotiap = request.getParameter("cocotiap"); // Tiempo aplicación
            String porcentaje = request.getParameter("porcentaje"); // Porcentaje descuento
            String valor = request.getParameter("valor"); // Valor descuento
            String activo = request.getParameter("activo"); // Activo (S/N)
            String indexado = request.getParameter("indexado"); // Indexado
            String planes = request.getParameter("planes"); // Planes
            String velocidades = request.getParameter("velocidades"); // Velocidades

            // Log de parámetros recibidos para debugging
            System.out.println("=== PARÁMETROS RECIBIDOS PARA DETALLE PROMOCIÓN ===");
            System.out.println("cocotico: " + cocotico);
            System.out.println("cococlco: " + cococlco);
            System.out.println("cocofein: " + cocofein);
            System.out.println("cocfefi: " + cocfefi);
            System.out.println("cocotiap: " + cocotiap);
            System.out.println("porcentaje: " + porcentaje);
            System.out.println("valor: " + valor);
            System.out.println("activo: " + activo);
            System.out.println("indexado: " + indexado);
            System.out.println("planes: " + planes);
            System.out.println("velocidades: " + velocidades);

            // Validaciones básicas
            if (cocofein == null || cocofein.trim().isEmpty()) {
                sendErrorResponse(response, "La fecha de inicio es obligatoria");
                return;
            }

            if (cocfefi == null || cocfefi.trim().isEmpty()) {
                sendErrorResponse(response, "La fecha de finalización es obligatoria");
                return;
            }

            if (cocotiap == null || cocotiap.trim().isEmpty()) {
                sendErrorResponse(response, "El tiempo de aplicación es obligatorio");
                return;
            }

            // Conectar a la base de datos
            DatabaseConnection dbConnection = new DatabaseConnection();
            dbConnection.getConnection();

            // Preparar la llamada al procedimiento almacenado
            String sql = "{ call PKG_PROMOCIONES.pr_crearDetallePromocion(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) }";
            CallableStatement statement = dbConnection.connection.prepareCall(sql);

            // Convertir y establecer parámetros
            // 1. pn_i_cocotico - CONFCOBR.COCOTICO%type (NUMBER)
            if (cocotico != null && !cocotico.trim().isEmpty()) {
                statement.setInt(1, Integer.parseInt(cocotico));
            } else {
                statement.setNull(1, Types.INTEGER);
            }

            // 2. pv_i_cococlco - CONFCOBR.COCOCLCO%type (VARCHAR2)
            statement.setString(2, "D");

            // 3. pv_i_cocofein - VARCHAR2 (fecha inicio)
            statement.setString(3, cocofein);

            // 4. pv_i_cocfefi - VARCHAR2 (fecha fin)
            statement.setString(4, cocfefi);

            // 5. pn_i_cocotiap - CONFCOBR.COCOTIAP%type (NUMBER)
            if (cocotiap != null && !cocotiap.trim().isEmpty()) {
                statement.setInt(5, Integer.parseInt(cocotiap));
            } else {
                statement.setNull(5, Types.INTEGER);
            }

            // 6. pn_i_porcentaje - CONFCOBR.COCOPORC%type (NUMBER)
            if (porcentaje != null && !porcentaje.trim().isEmpty()) {
                statement.setDouble(6, Double.parseDouble(porcentaje));
            } else {
                statement.setNull(6, Types.DECIMAL);
            }

            // 7. pn_i_valor - CONFCOBR.COCOVAL%type (NUMBER)
            if (valor != null && !valor.trim().isEmpty()) {
                statement.setDouble(7, Double.parseDouble(valor));
            } else {
                statement.setNull(7, Types.DECIMAL);
            }

            // 8. pv_i_activo - CONFCOBR.COCOACTI%type (VARCHAR2)
            statement.setString(8, (activo != null && activo.equals("true")) ? "S" : "N");

            // 9. pv_i_indexado - CONFCOBR.COCOINDX%TYPE (VARCHAR2)
            statement.setString(9, indexado);

            // 10. pv_i_planes - VARCHAR2
            statement.setString(10, planes);

            // 11. pv_i_velocidades - VARCHAR2
            statement.setString(11, velocidades);

            // Log de parámetros enviados al procedimiento
            System.out.println("=== PARÁMETROS ENVIADOS AL PROCEDIMIENTO ===");
            System.out.println("1. cocotico: " + cocotico);
            System.out.println("2. cococlco: " + cococlco);
            System.out.println("3. cocofein: " + cocofein);
            System.out.println("4. cocfefi: " + cocfefi);
            System.out.println("5. cocotiap: " + cocotiap);
            System.out.println("6. porcentaje: " + porcentaje);
            System.out.println("7. valor: " + valor);
            System.out.println("8. activo: " + ((activo != null && activo.equals("true")) ? "S" : "N"));
            System.out.println("9. indexado: " + indexado);
            System.out.println("10. planes: " + planes);
            System.out.println("11. velocidades: " + velocidades);

            // Ejecutar el procedimiento almacenado
            statement.execute();

            // Si llegamos aquí, la operación fue exitosa
            sendSuccessResponse(response, "Detalle de promoción guardado exitosamente");

            System.out.println("✅ Detalle de promoción guardado exitosamente");

            // Cerrar recursos
            statement.close();
            dbConnection.connection.close();

        } catch (NumberFormatException e) {
            System.err.println("❌ Error de formato numérico: " + e.getMessage());
            e.printStackTrace();

            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            sendErrorResponse(response, "Error en el formato de los datos numéricos: " + e.getMessage());

        } catch (SQLException e) {
            System.err.println("❌ Error de SQL al guardar detalle de promoción: " + e.getMessage());
            e.printStackTrace();

            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            sendErrorResponse(response, "Error de base de datos: " + e.getMessage());

        } catch (Exception e) {
            System.err.println("❌ Error inesperado al guardar detalle de promoción: " + e.getMessage());
            e.printStackTrace();

            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            sendErrorResponse(response, "Error inesperado: " + e.getMessage());
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Solo aceptamos POST para esta operación
        response.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
        sendErrorResponse(response, "Método no permitido. Use POST para crear detalles de promoción.");
    }

    /**
     * Envía una respuesta de éxito en formato JSON
     */
    private void sendSuccessResponse(HttpServletResponse response, String message) throws IOException {
        PrintWriter out = response.getWriter();
        out.print("{\"success\": true, \"message\": \"" + escapeJson(message) + "\"}");
        out.flush();
    }

    /**
     * Envía una respuesta de error en formato JSON
     */
    private void sendErrorResponse(HttpServletResponse response, String errorMessage) throws IOException {
        PrintWriter out = response.getWriter();
        out.print("{\"success\": false, \"error\": \"" + escapeJson(errorMessage) + "\"}");
        out.flush();
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