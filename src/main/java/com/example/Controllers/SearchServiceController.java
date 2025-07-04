package com.example.Controllers;

import com.example.DatabaseConnection;
import com.example.Models.ServicioPreasignacion;
import com.example.Models.Promotion;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

@WebServlet("/SearchService")
public class SearchServiceController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("=== INICIANDO PROCESAMIENTO SearchService ===");

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        String numeroServicio = request.getParameter("numeroServicio");
        PrintWriter out = response.getWriter();

        System.out.println("Número de servicio recibido: '" + numeroServicio + "'");

        try {
            if (numeroServicio == null || numeroServicio.trim().isEmpty()) {
                System.out.println("ERROR: Número de servicio vacío o nulo");
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                out.print("{\"success\": false, \"message\": \"El número de servicio es requerido\"}");
                return;
            }

            System.out.println("=== PASO 1: Buscando servicio por placa ===");
            ServicioPreasignacion servicio = buscarServicioPorPlaca(numeroServicio.trim());

            if (servicio != null) {
                System.out.println("=== PASO 2: Servicio encontrado, buscando promociones ===");

                // Buscar promociones disponibles
                List<Promotion> promociones = buscarPromocionesDisponibles(
                        servicio.getCodDepartamento(),
                        servicio.getCodMunicipio(),
                        servicio.getCodCategoria(),
                        servicio.getCodSubcategoria());

                System.out.println("=== PASO 3: Construyendo respuesta JSON ===");
                response.setStatus(HttpServletResponse.SC_OK);

                // Construir JSON con servicio y promociones
                StringBuilder jsonResponse = new StringBuilder();
                jsonResponse.append("{\"success\": true, \"data\": {");
                jsonResponse.append("\"placa\": \"").append(escapeJson(servicio.getPlaca())).append("\", ");
                jsonResponse.append("\"suscripcion\": \"").append(escapeJson(servicio.getSuscripcion())).append("\", ");
                jsonResponse.append("\"departamento\": \"").append(escapeJson(servicio.getDepartamento()))
                        .append("\", ");
                jsonResponse.append("\"municipio\": \"").append(escapeJson(servicio.getMunicipio())).append("\", ");
                jsonResponse.append("\"categoria\": \"").append(escapeJson(servicio.getCategoria())).append("\", ");
                jsonResponse.append("\"subcategoria\": \"").append(escapeJson(servicio.getSubcategoria()))
                        .append("\", ");
                jsonResponse.append("\"plan\": \"").append(escapeJson(servicio.getPlan())).append("\"");
                jsonResponse.append("}, \"promociones\": [");

                // Agregar promociones
                for (int i = 0; i < promociones.size(); i++) {
                    if (i > 0)
                        jsonResponse.append(", ");
                    Promotion promo = promociones.get(i);
                    jsonResponse.append("{");
                    jsonResponse.append("\"ticocodi\": ").append(promo.getTicododi() != null ? promo.getTicododi() : 0)
                            .append(", ");
                    jsonResponse.append("\"ticodesc\": \"").append(escapeJson(promo.getTicodesc())).append("\", ");
                    jsonResponse.append("\"depadesc\": \"").append(escapeJson(promo.getDepadesc())).append("\", ");
                    jsonResponse.append("\"locanomb\": \"").append(escapeJson(promo.getLocandmb())).append("\", ");
                    jsonResponse.append("\"catedesc\": \"").append(escapeJson(promo.getCatedesc())).append("\", ");
                    jsonResponse.append("\"sucadesc\": \"").append(escapeJson(promo.getSucadesc())).append("\", ");
                    jsonResponse.append("\"plsudesc\": \"").append(escapeJson(promo.getPlsudesc())).append("\", ");
                    jsonResponse.append("\"paradesc\": \"").append(escapeJson(promo.getParadesc())).append("\", ");
                    jsonResponse.append("\"cocoporc\": ").append(promo.getCocoporc() != null ? promo.getCocoporc() : 0)
                            .append(", ");
                    jsonResponse.append("\"cocotiap\": ").append(promo.getCocotiap() != null ? promo.getCocotiap() : 0)
                            .append(", ");
                    jsonResponse.append("\"ticoperiodicidad\": \"").append(escapeJson(promo.getTicoperiodicidad()))
                            .append("\", ");
                    jsonResponse.append("\"ticofech\": \"")
                            .append(promo.getTicofech() != null ? promo.getTicofech().toString() : "").append("\", ");
                    jsonResponse.append("\"ticouser\": \"").append(escapeJson(promo.getTicouser())).append("\"");
                    jsonResponse.append("}");
                }

                jsonResponse.append("]}");
                System.out.println("=== RESPUESTA JSON CONSTRUIDA ===");
                System.out.println("Longitud del JSON: " + jsonResponse.length() + " caracteres");
                out.print(jsonResponse.toString());
                System.out.println("=== RESPUESTA ENVIADA EXITOSAMENTE ===");
            } else {
                System.out.println("=== SERVICIO NO ENCONTRADO ===");
                response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                out.print(
                        "{\"success\": false, \"message\": \"No se encontró información para el número de servicio: " +
                                escapeJson(numeroServicio) + "\"}");
            }

        } catch (Exception e) {
            System.err.println("=== ERROR GLOBAL EN SearchService ===");
            System.err.println("Error: " + e.getMessage());
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.print("{\"success\": false, \"message\": \"Error interno del servidor: " +
                    escapeJson(e.getMessage()) + "\"}");
        } finally {
            System.out.println("=== FINALIZANDO PROCESAMIENTO SearchService ===");
            out.flush();
            out.close();
        }
    }

    private ServicioPreasignacion buscarServicioPorPlaca(String placa) throws Exception {
        String sql = "SELECT PLACA, SUSCRIPCION, DEPARTAMENTE, MUNICIPIO, CATEGORIA, SUBCATEGORIA, PLAN, " +
                "COD_DEPARTAMENTO, COD_MUNICIPIO, COD_CATEGORIA, COD_SUBCATEGORIA " +
                "FROM vw_preasignacion_placa WHERE PLACA = ?";

        System.out.println("=== INICIANDO BÚSQUEDA EN vw_preasignacion_placa ===");
        System.out.println("SQL: " + sql);
        System.out.println("PLACA buscada: " + placa);

        DatabaseConnection dbConn = new DatabaseConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            dbConn.getConnection();
            pstmt = dbConn.connection.prepareStatement(sql);
            pstmt.setString(1, placa);
            rs = pstmt.executeQuery();

            // Obtener información de las columnas disponibles
            ResultSetMetaData metaData = rs.getMetaData();
            int columnCount = metaData.getColumnCount();

            System.out.println("=== COLUMNAS DISPONIBLES EN vw_preasignacion_placa ===");
            for (int i = 1; i <= columnCount; i++) {
                System.out.println("Columna " + i + ": " + metaData.getColumnName(i) +
                        " (" + metaData.getColumnTypeName(i) + ")");
            }

            if (rs.next()) {
                System.out.println("=== REGISTRO ENCONTRADO ===");
                ServicioPreasignacion servicio = new ServicioPreasignacion();

                try {
                    String placaValue = rs.getString("PLACA");
                    servicio.setPlaca(placaValue);
                    System.out.println("PLACA: " + placaValue);
                } catch (Exception e) {
                    System.err.println("ERROR leyendo PLACA: " + e.getMessage());
                }

                try {
                    String suscripcionValue = rs.getString("SUSCRIPCION");
                    servicio.setSuscripcion(suscripcionValue);
                    System.out.println("SUSCRIPCION: " + suscripcionValue);
                } catch (Exception e) {
                    System.err.println("ERROR leyendo SUSCRIPCION: " + e.getMessage());
                }

                try {
                    String departamentoValue = rs.getString("DEPARTAMENTE");
                    servicio.setDepartamento(departamentoValue);
                    System.out.println("DEPARTAMENTE: " + departamentoValue);
                } catch (Exception e) {
                    System.err.println("ERROR leyendo DEPARTAMENTE: " + e.getMessage());
                }

                try {
                    String municipioValue = rs.getString("MUNICIPIO");
                    servicio.setMunicipio(municipioValue);
                    System.out.println("MUNICIPIO: " + municipioValue);
                } catch (Exception e) {
                    System.err.println("ERROR leyendo MUNICIPIO: " + e.getMessage());
                }

                try {
                    String categoriaValue = rs.getString("CATEGORIA");
                    servicio.setCategoria(categoriaValue);
                    System.out.println("CATEGORIA: " + categoriaValue);
                } catch (Exception e) {
                    System.err.println("ERROR leyendo CATEGORIA: " + e.getMessage());
                }

                try {
                    String subcategoriaValue = rs.getString("SUBCATEGORIA");
                    servicio.setSubcategoria(subcategoriaValue);
                    System.out.println("SUBCATEGORIA: " + subcategoriaValue);
                } catch (Exception e) {
                    System.err.println("ERROR leyendo SUBCATEGORIA: " + e.getMessage());
                }

                try {
                    String planValue = rs.getString("PLAN");
                    servicio.setPlan(planValue);
                    System.out.println("PLAN: " + planValue);
                } catch (Exception e) {
                    System.err.println("ERROR leyendo PLAN: " + e.getMessage());
                }

                // Campos adicionales para consultas
                try {
                    String codDepartamentoValue = rs.getString("COD_DEPARTAMENTO");
                    servicio.setCodDepartamento(codDepartamentoValue);
                    System.out.println("COD_DEPARTAMENTO: " + codDepartamentoValue);
                } catch (Exception e) {
                    System.err.println("ERROR leyendo COD_DEPARTAMENTO: " + e.getMessage());
                }

                try {
                    String codMunicipioValue = rs.getString("COD_MUNICPIO");
                    servicio.setCodMunicipio(codMunicipioValue);
                    System.out.println("COD_MUNICIPIO: " + codMunicipioValue);
                } catch (Exception e) {
                    System.err.println("ERROR leyendo COD_MUNICPIO: " + e.getMessage());
                }

                try {
                    String codCategoriaValue = rs.getString("COD_CATEGORIA");
                    servicio.setCodCategoria(codCategoriaValue);
                    System.out.println("COD_CATEGORIA: " + codCategoriaValue);
                } catch (Exception e) {
                    System.err.println("ERROR leyendo COD_CATEGORIA: " + e.getMessage());
                }

                try {
                    String codSubcategoriaValue = rs.getString("COD_SUBCATEGORIA");
                    servicio.setCodSubcategoria(codSubcategoriaValue);
                    System.out.println("COD_SUBCATEGORIA: " + codSubcategoriaValue);
                } catch (Exception e) {
                    System.err.println("ERROR leyendo COD_SUBCATEGORIA: " + e.getMessage());
                }

                System.out.println("=== SERVICIO CREADO EXITOSAMENTE ===");
                return servicio;
            } else {
                System.out.println("=== NO SE ENCONTRÓ REGISTRO PARA PLACA: " + placa + " ===");
            }
        } catch (Exception e) {
            System.err.println("=== ERROR EN CONSULTA vw_preasignacion_placa ===");
            System.err.println("Error: " + e.getMessage());
            e.printStackTrace();
            throw e;
        } finally {
            if (rs != null)
                rs.close();
            if (pstmt != null)
                pstmt.close();
            if (dbConn.connection != null)
                dbConn.connection.close();
        }
        return null;
    }

    private List<Promotion> buscarPromocionesDisponibles(String codDepartamento, String codMunicipio,
            String codCategoria, String codSubcategoria) throws Exception {
        List<Promotion> promociones = new ArrayList<>();

        String sql = "SELECT * FROM VW_CONSULTA_PROMO WHERE " +
                "TICODPTO = ? AND LOCACODI = ? AND CATECODI = ? AND SUCACATE = ?";

        System.out.println("=== INICIANDO BÚSQUEDA EN VW_CONSULTA_PROMO ===");
        System.out.println("SQL: " + sql);
        System.out.println("Parámetros:");
        System.out.println("  TICODPTO (codDepartamento): " + codDepartamento);
        System.out.println("  LOCACODI (codMunicipio): " + codMunicipio);
        System.out.println("  CATECODI (codCategoria): " + codCategoria);
        System.out.println("  SUCACATE (codSubcategoria): " + codSubcategoria);

        DatabaseConnection dbConn = new DatabaseConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            dbConn.getConnection();
            pstmt = dbConn.connection.prepareStatement(sql);
            pstmt.setString(1, codDepartamento);
            pstmt.setString(2, codMunicipio);
            pstmt.setString(3, codCategoria);
            pstmt.setString(4, codSubcategoria);
            rs = pstmt.executeQuery();

            // Obtener información de las columnas disponibles
            ResultSetMetaData metaData = rs.getMetaData();
            int columnCount = metaData.getColumnCount();

            System.out.println("=== COLUMNAS DISPONIBLES EN VW_CONSULTA_PROMO ===");
            for (int i = 1; i <= columnCount; i++) {
                System.out.println("Columna " + i + ": " + metaData.getColumnName(i) +
                        " (" + metaData.getColumnTypeName(i) + ")");
            }

            int recordCount = 0;
            while (rs.next()) {
                recordCount++;
                System.out.println("=== PROCESANDO PROMOCIÓN " + recordCount + " ===");

                Promotion promotion = new Promotion();

                // Mapear los campos principales con logs
                try {
                    int ticocodiValue = rs.getInt("TICOCODI");
                    promotion.setTicododi(ticocodiValue);
                    System.out.println("TICOCODI: " + ticocodiValue);
                } catch (Exception e) {
                    System.err.println("ERROR leyendo TICOCODI: " + e.getMessage());
                }

                try {
                    String ticodescValue = rs.getString("TICODESC");
                    promotion.setTicodesc(ticodescValue);
                    System.out.println("TICODESC: " + ticodescValue);
                } catch (Exception e) {
                    System.err.println("ERROR leyendo TICODESC: " + e.getMessage());
                }

                try {
                    String depadescValue = rs.getString("DEPADESC");
                    promotion.setDepadesc(depadescValue);
                    System.out.println("DEPADESC: " + depadescValue);
                } catch (Exception e) {
                    System.err.println("ERROR leyendo DEPADESC: " + e.getMessage());
                }

                try {
                    String locanombValue = rs.getString("LOCANOMB");
                    promotion.setLocandmb(locanombValue);
                    System.out.println("LOCANOMB: " + locanombValue);
                } catch (Exception e) {
                    System.err.println("ERROR leyendo LOCANOMB: " + e.getMessage());
                }

                try {
                    String catedescValue = rs.getString("CATEDESC");
                    promotion.setCatedesc(catedescValue);
                    System.out.println("CATEDESC: " + catedescValue);
                } catch (Exception e) {
                    System.err.println("ERROR leyendo CATEDESC: " + e.getMessage());
                }

                try {
                    String sucadescValue = rs.getString("SUCADESC");
                    promotion.setSucadesc(sucadescValue);
                    System.out.println("SUCADESC: " + sucadescValue);
                } catch (Exception e) {
                    System.err.println("ERROR leyendo SUCADESC: " + e.getMessage());
                }

                try {
                    String plsudescValue = rs.getString("PLSUDESC");
                    promotion.setPlsudesc(plsudescValue);
                    System.out.println("PLSUDESC: " + plsudescValue);
                } catch (Exception e) {
                    System.err.println("ERROR leyendo PLSUDESC: " + e.getMessage());
                }

                try {
                    String paradescValue = rs.getString("PARADESC");
                    promotion.setParadesc(paradescValue);
                    System.out.println("PARADESC: " + paradescValue);
                } catch (Exception e) {
                    System.err.println("ERROR leyendo PARADESC: " + e.getMessage());
                }

                try {
                    int copocorcValue = rs.getInt("COCOPORC");
                    promotion.setCocoporc(copocorcValue);
                    System.out.println("COCOPORC: " + copocorcValue);
                } catch (Exception e) {
                    System.err.println("ERROR leyendo COCOPORC: " + e.getMessage());
                }

                try {
                    int cocotiapValue = rs.getInt("COCOTIAP");
                    promotion.setCocotiap(cocotiapValue);
                    System.out.println("COCOTIAP: " + cocotiapValue);
                } catch (Exception e) {
                    System.err.println("ERROR leyendo COCOTIAP: " + e.getMessage());
                }

                try {
                    String ticoperiodicidadValue = rs.getString("TICOPERIODICIDAD");
                    promotion.setTicoperiodicidad(ticoperiodicidadValue);
                    System.out.println("TICOPERIODICIDAD: " + ticoperiodicidadValue);
                } catch (Exception e) {
                    System.err.println("ERROR leyendo TICOPERIODICIDAD: " + e.getMessage());
                }

                try {
                    java.sql.Date ticofechValue = rs.getDate("TICOFECH");
                    promotion.setTicofech(ticofechValue);
                    System.out.println("TICOFECH: " + ticofechValue);
                } catch (Exception e) {
                    System.err.println("ERROR leyendo TICOFECH: " + e.getMessage());
                }

                try {
                    String ticouserValue = rs.getString("TICOUSER");
                    promotion.setTicouser(ticouserValue);
                    System.out.println("TICOUSER: " + ticouserValue);
                } catch (Exception e) {
                    System.err.println("ERROR leyendo TICOUSER: " + e.getMessage());
                }

                promociones.add(promotion);
                System.out.println("=== PROMOCIÓN " + recordCount + " AGREGADA EXITOSAMENTE ===");
            }

            System.out.println("=== TOTAL PROMOCIONES ENCONTRADAS: " + recordCount + " ===");

        } catch (Exception e) {
            System.err.println("=== ERROR EN CONSULTA VW_CONSULTA_PROMO ===");
            System.err.println("Error: " + e.getMessage());
            e.printStackTrace();
            throw e;
        } finally {
            if (rs != null)
                rs.close();
            if (pstmt != null)
                pstmt.close();
            if (dbConn.connection != null)
                dbConn.connection.close();
        }

        return promociones;
    }

    private String escapeJson(String value) {
        if (value == null)
            return "";
        return value.replace("\"", "\\\"").replace("\n", "\\n").replace("\r", "\\r");
    }
}