package com.example.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.example.Models.PromocionActiva;

public class PromocionActivaDAO {

    public List<PromocionActiva> searchPromocionesActivas(Connection connection, String placa,
            int offset, int limit) throws SQLException {
        List<PromocionActiva> promociones = new ArrayList<>();

        StringBuilder sql = new StringBuilder(
                "SELECT * FROM (" +
                        "  SELECT t.*, ROW_NUMBER() OVER (ORDER BY PLACA) as rn " +
                        "  FROM VW_PROMOCION_ACTIVA t");

        List<Object> parameters = new ArrayList<>();

        // Aplicar filtro por placa si se proporciona
        if (placa != null && !placa.trim().isEmpty()) {
            sql.append(" WHERE PLACA = ?");
            parameters.add(Long.parseLong(placa.trim()));
        }

        sql.append(") WHERE rn > ? AND rn <= ?");
        parameters.add(offset);
        parameters.add(offset + limit);

        System.out.println("SQL Query: " + sql.toString());
        System.out.println("Parameters: " + parameters);

        try (PreparedStatement pstmt = connection.prepareStatement(sql.toString())) {

            // Establecer parámetros
            for (int i = 0; i < parameters.size(); i++) {
                pstmt.setObject(i + 1, parameters.get(i));
            }

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    PromocionActiva promocion = new PromocionActiva();

                    // Mapear campos de la vista
                    try {
                        promocion.setPlaca(rs.getLong("PLACA"));
                    } catch (Exception e) {
                        System.out.println("Error leyendo PLACA: " + e.getMessage());
                        promocion.setPlaca(0L);
                    }

                    try {
                        promocion.setCodPromo(rs.getInt("COD_PROMO"));
                    } catch (Exception e) {
                        System.out.println("Error leyendo COD_PROMO: " + e.getMessage());
                        promocion.setCodPromo(0);
                    }

                    try {
                        promocion.setPromocion(rs.getString("PROMOCION"));
                    } catch (Exception e) {
                        System.out.println("Error leyendo PROMOCION: " + e.getMessage());
                        promocion.setPromocion("");
                    }

                    try {
                        promocion.setCodDepartamento(rs.getInt("COD_DEPARTAMENTO"));
                    } catch (Exception e) {
                        System.out.println("Error leyendo COD_DEPARTAMENTO: " + e.getMessage());
                        promocion.setCodDepartamento(0);
                    }

                    try {
                        promocion.setDepartamento(rs.getString("DEPARTAMENTO"));
                    } catch (Exception e) {
                        System.out.println("Error leyendo DEPARTAMENTO: " + e.getMessage());
                        promocion.setDepartamento("");
                    }

                    try {
                        promocion.setCodMunicipio(rs.getInt("COD_MUNICIPIO"));
                    } catch (Exception e) {
                        System.out.println("Error leyendo COD_MUNICIPIO: " + e.getMessage());
                        promocion.setCodMunicipio(0);
                    }

                    try {
                        promocion.setMunicipio(rs.getString("MUNICIPIO"));
                    } catch (Exception e) {
                        System.out.println("Error leyendo MUNICIPIO: " + e.getMessage());
                        promocion.setMunicipio("");
                    }

                    promociones.add(promocion);
                    System.out.println("Promoción agregada: " + promocion);
                }
            }
        }

        System.out.println("Total promociones encontradas: " + promociones.size());
        return promociones;
    }

    public int countPromocionesActivas(Connection connection, String placa) throws SQLException {
        StringBuilder sql = new StringBuilder("SELECT COUNT(*) FROM VW_PROMOCION_ACTIVA");

        List<Object> parameters = new ArrayList<>();

        // Aplicar filtro por placa si se proporciona
        if (placa != null && !placa.trim().isEmpty()) {
            sql.append(" WHERE PLACA = ?");
            parameters.add(Long.parseLong(placa.trim()));
        }

        System.out.println("Count SQL: " + sql.toString());
        System.out.println("Count Parameters: " + parameters);

        try (PreparedStatement pstmt = connection.prepareStatement(sql.toString())) {

            // Establecer parámetros
            for (int i = 0; i < parameters.size(); i++) {
                pstmt.setObject(i + 1, parameters.get(i));
            }

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    int count = rs.getInt(1);
                    System.out.println("Total registros encontrados: " + count);
                    return count;
                }
            }
        }

        return 0;
    }

    // Método adicional para exportación (sin paginación)
    public List<PromocionActiva> getAllPromocionesActivas(Connection connection, String placa) throws SQLException {
        List<PromocionActiva> promociones = new ArrayList<>();

        StringBuilder sql = new StringBuilder("SELECT * FROM VW_PROMOCION_ACTIVA");

        List<Object> parameters = new ArrayList<>();

        // Aplicar filtro por placa si se proporciona
        if (placa != null && !placa.trim().isEmpty()) {
            sql.append(" WHERE PLACA = ?");
            parameters.add(Long.parseLong(placa.trim()));
        }

        sql.append(" ORDER BY PLACA");

        System.out.println("Export SQL: " + sql.toString());

        try (PreparedStatement pstmt = connection.prepareStatement(sql.toString())) {

            // Establecer parámetros
            for (int i = 0; i < parameters.size(); i++) {
                pstmt.setObject(i + 1, parameters.get(i));
            }

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    PromocionActiva promocion = new PromocionActiva();

                    promocion.setPlaca(rs.getLong("PLACA"));
                    promocion.setCodPromo(rs.getInt("COD_PROMO"));
                    promocion.setPromocion(rs.getString("PROMOCION"));
                    promocion.setCodDepartamento(rs.getInt("COD_DEPARTAMENTO"));
                    promocion.setDepartamento(rs.getString("DEPARTAMENTO"));
                    promocion.setCodMunicipio(rs.getInt("COD_MUNICIPIO"));
                    promocion.setMunicipio(rs.getString("MUNICIPIO"));

                    promociones.add(promocion);
                }
            }
        }

        return promociones;
    }
}