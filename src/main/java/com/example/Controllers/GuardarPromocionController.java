package com.example.Controllers;

import com.example.DatabaseConnection;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/GuardarPromocion")
public class GuardarPromocionController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        // Debugging: Mostrar todos los parámetros recibidos
        System.out.println("=== PARAMETROS RECIBIDOS EN CONTROLADOR ===");
        java.util.Enumeration<String> paramNames = request.getParameterNames();
        while (paramNames.hasMoreElements()) {
            String paramName = paramNames.nextElement();
            String paramValue = request.getParameter(paramName);
            System.out.println("Parámetro: " + paramName + " = '" + paramValue + "'");
        }

        // Extraer parámetros del request
        String descripcion = request.getParameter("descripcion");
        String codigoExterno = request.getParameter("codigoExterno");
        String departamento = request.getParameter("departamento");
        String localidad = request.getParameter("localidad");
        String tipoplan = request.getParameter("tipoplan");
        String periodicidad = request.getParameter("periodicidad");
        String categoria = request.getParameter("categoria");
        String subcategoria = request.getParameter("subcategoria");

        // Debug específico de descripción
        System.out.println("=== DEBUG DESCRIPCION ===");
        System.out.println("descripcion value: '" + descripcion + "'");
        System.out.println("descripcion is null: " + (descripcion == null));
        if (descripcion != null) {
            System.out.println("descripcion length: " + descripcion.length());
            System.out.println("descripcion after trim: '" + descripcion.trim() + "'");
            System.out.println("descripcion trim isEmpty: " + descripcion.trim().isEmpty());
        }

        // Validaciones básicas
        if (descripcion == null || descripcion.trim().isEmpty()) {
            System.out.println("❌ VALIDACION FALLO: La descripción es obligatoria");
            sendErrorResponse(response, "La descripción es obligatoria");
            return;
        } else {
            System.out.println("✅ VALIDACION OK: Descripción válida");
        }

        if (codigoExterno == null || codigoExterno.trim().isEmpty()) {
            sendErrorResponse(response, "El código externo es obligatorio");
            return;
        }

        if (departamento == null || departamento.trim().isEmpty()) {
            sendErrorResponse(response, "El departamento es obligatorio");
            return;
        }

        if (periodicidad == null || periodicidad.trim().isEmpty()) {
            sendErrorResponse(response, "La periodicidad es obligatoria");
            return;
        }

        try {
            DatabaseConnection dbConnection = new DatabaseConnection();
            dbConnection.getConnection();

            // VALIDACIÓN: Verificar si el código externo ya existe en la tabla tipocobro
            if (validarCodigoExternoExistente(dbConnection, codigoExterno.trim())) {
                dbConnection.connection.close();
                sendErrorResponse(response, "Ya existe una promoción con el código externo: " + codigoExterno.trim());
                return;
            }

            // Construir la llamada al procedimiento
            String procedureCall = "{ call PKG_PROMOCIONES.pr_crearPromocion(?, ?, ?, ?, ?, ?, ?, ?, ?) }";

            // Parámetros del procedimiento según la especificación
            Object[] params = {
                    descripcion.trim(), // pv_i_descripcion
                    codigoExterno.trim(), // pv_i_codigoexterno
                    departamento.trim(), // pn_i_departamento
                    localidad != null ? localidad.trim() : "", // pn_i_localidad
                    tipoplan != null ? tipoplan.trim() : "", // pn_i_tipoplan
                    "A", // pv_i_activo (siempre activo)
                    periodicidad.trim(), // pv_i_periodicidad
                    categoria.trim(), // pv_i_categoria
                    subcategoria.trim() // pv_i_subcategoria
            };

            // DEBUG COMPLETO: Imprimir todos los parámetros que se envían al procedimiento
            System.out.println("=== PARAMETROS ENVIADOS AL PROCEDIMIENTO ===");
            System.out.println("Procedimiento: " + procedureCall);
            System.out.println("Parámetro 1 (pv_i_descripcion): '" + params[0] + "' ["
                    + (params[0] != null ? params[0].getClass().getSimpleName() : "null") + "]");
            System.out.println("Parámetro 2 (pv_i_codigoexterno): '" + params[1] + "' ["
                    + (params[1] != null ? params[1].getClass().getSimpleName() : "null") + "]");
            System.out.println("Parámetro 3 (pn_i_departamento): '" + params[2] + "' ["
                    + (params[2] != null ? params[2].getClass().getSimpleName() : "null") + "]");
            System.out.println("Parámetro 4 (pn_i_localidad): '" + params[3] + "' ["
                    + (params[3] != null ? params[3].getClass().getSimpleName() : "null") + "]");
            System.out.println("Parámetro 5 (pn_i_tipoplan): '" + params[4] + "' ["
                    + (params[4] != null ? params[4].getClass().getSimpleName() : "null") + "]");
            System.out.println("Parámetro 6 (pv_i_activo): '" + params[5] + "' ["
                    + (params[5] != null ? params[5].getClass().getSimpleName() : "null") + "]");
            System.out.println("Parámetro 7 (pv_i_periodicidad): '" + params[6] + "' ["
                    + (params[6] != null ? params[6].getClass().getSimpleName() : "null") + "]");
            System.out.println("Parámetro 8 (pv_i_categoria): '" + params[7] + "' ["
                    + (params[7] != null ? params[7].getClass().getSimpleName() : "null") + "]");
            System.out.println("Parámetro 9 (pv_i_subcategoria): '" + params[8] + "' ["
                    + (params[8] != null ? params[8].getClass().getSimpleName() : "null") + "]");
            System.out.println("=== DATOS DETALLADOS ===");
            System.out.println("descripcion original: '" + descripcion + "'");
            System.out.println("codigoExterno original: '" + codigoExterno + "'");
            System.out.println("departamento original: '" + departamento + "'");
            System.out.println("localidad original: '" + localidad + "'");
            System.out.println("tipoplan original: '" + tipoplan + "'");
            System.out.println("periodicidad original: '" + periodicidad + "'");
            System.out.println("categoria original: '" + categoria + "'");
            System.out.println("subcategoria original: '" + subcategoria + "'");
            System.out.println("categoria construido: '" + categoria + "'");
            System.out.println("subcategoria construido: '" + subcategoria + "'");

            // Ejecutar el procedimiento
            dbConnection.executeProcedure(procedureCall, params);

            // OBTENER TICOCODI después de crear la promoción exitosamente
            String ticocodi = obtenerTicocodiPorCodigoExterno(dbConnection, codigoExterno.trim());

            // Cerrar conexión
            if (dbConnection.connection != null) {
                dbConnection.connection.close();
            }

            // Respuesta exitosa incluyendo el TICOCODI
            PrintWriter out = response.getWriter();
            if (ticocodi != null) {
                out.print("{\"success\": true, \"message\": \"Promoción creada exitosamente\", \"ticocodi\": \""
                        + ticocodi + "\"}");
            } else {
                out.print("{\"success\": true, \"message\": \"Promoción creada exitosamente\", \"ticocodi\": null}");
            }
            out.flush();

            System.out.println("Promoción creada exitosamente: " + descripcion + " - TICOCODI: " + ticocodi);

        } catch (Exception e) {
            System.err.println("Error al crear la promoción: " + e.getMessage());
            e.printStackTrace();

            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            sendErrorResponse(response, "Error al crear la promoción: " + e.getMessage());
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Solo aceptamos POST para esta operación
        response.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
        sendErrorResponse(response, "Método no permitido. Use POST para crear promociones.");
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

    /**
     * Valida si el código externo ya existe en la tabla tipocobro
     * 
     * @param dbConnection  Conexión a la base de datos
     * @param codigoExterno Código externo a validar
     * @return true si el código ya existe, false si no existe
     */
    private boolean validarCodigoExternoExistente(DatabaseConnection dbConnection, String codigoExterno) {
        System.out.println("=== VALIDANDO CÓDIGO EXTERNO ===");
        System.out.println("Código a validar: '" + codigoExterno + "'");

        try {
            String query = "SELECT COUNT(*) as total FROM tipocobro WHERE UPPER(TRIM(ticocoex)) = UPPER(TRIM(?))";

            java.sql.PreparedStatement statement = dbConnection.connection.prepareStatement(query);
            statement.setString(1, codigoExterno);

            System.out.println("Query ejecutada: " + query);
            System.out.println("Parámetro: '" + codigoExterno + "'");

            java.sql.ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                int count = resultSet.getInt("total");
                System.out.println("Resultado de la consulta: " + count + " registros encontrados");

                resultSet.close();
                statement.close();

                return count > 0;
            }

            resultSet.close();
            statement.close();

            System.out.println("No se encontraron registros en la consulta");
            return false;

        } catch (Exception e) {
            System.err.println("Error al validar código externo: " + e.getMessage());
            e.printStackTrace();
            // En caso de error en la validación, permitir continuar para no bloquear el
            // proceso
            return false;
        }
    }

    /**
     * Obtiene el TICOCODI de la tabla tipocobro basado en el código externo
     * 
     * @param dbConnection  Conexión a la base de datos
     * @param codigoExterno Código externo para buscar
     * @return TICOCODI encontrado o null si no se encuentra
     */
    private String obtenerTicocodiPorCodigoExterno(DatabaseConnection dbConnection, String codigoExterno) {
        System.out.println("=== OBTENIENDO TICOCODI ===");
        System.out.println("Código externo para buscar: '" + codigoExterno + "'");

        try {
            String query = "SELECT TICOCODI FROM tipocobro WHERE UPPER(TRIM(ticocoex)) = UPPER(TRIM(?))";

            java.sql.PreparedStatement statement = dbConnection.connection.prepareStatement(query);
            statement.setString(1, codigoExterno);

            System.out.println("Query ejecutada: " + query);
            System.out.println("Parámetro: '" + codigoExterno + "'");

            java.sql.ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                String ticocodi = resultSet.getString("TICOCODI");
                System.out.println("TICOCODI encontrado: " + ticocodi);

                resultSet.close();
                statement.close();

                return ticocodi;
            }

            resultSet.close();
            statement.close();

            System.out.println("No se encontró TICOCODI para el código externo: " + codigoExterno);
            return null;

        } catch (Exception e) {
            System.err.println("Error al obtener TICOCODI: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }
}