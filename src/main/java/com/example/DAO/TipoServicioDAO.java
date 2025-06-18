package com.example.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.example.DatabaseConnection;
import com.example.Models.TipoServicio;

public class TipoServicioDAO {

    /**
     * Obtiene todos los tipos de servicio de la tabla CRM_TIPOSERVPROMO
     */
    public List<TipoServicio> obtenerTodosLosTiposServicio(Connection connection) throws SQLException {
        List<TipoServicio> tiposServicio = new ArrayList<>();

        String sql = "SELECT TIPOSERVCODI, PARADESC FROM CRM_TIPOSERVPROMO ORDER BY TIPOSERVCODI";

        try (Statement stmt = connection.createStatement();
                ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                TipoServicio tipoServicio = new TipoServicio();
                tipoServicio.setTiposervcodi(rs.getInt("TIPOSERVCODI"));
                tipoServicio.setParadesc(rs.getString("PARADESC"));
                tiposServicio.add(tipoServicio);
            }
        }

        return tiposServicio;
    }

    /**
     * Obtiene un tipo de servicio por su ID
     */
    public TipoServicio obtenerTipoServicioPorCodigo(Connection connection, int codigo) throws SQLException {
        String sql = "SELECT TIPOSERVCODI, PARADESC FROM CRM_TIPOSERVPROMO WHERE TIPOSERVCODI = ?";

        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, codigo);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    TipoServicio tipoServicio = new TipoServicio();
                    tipoServicio.setTiposervcodi(rs.getInt("TIPOSERVCODI"));
                    tipoServicio.setParadesc(rs.getString("PARADESC"));
                    return tipoServicio;
                }
            }
        }

        return null;
    }

    /**
     * Actualiza un tipo de servicio existente
     */
    public boolean actualizarTipoServicio(Connection connection, TipoServicio tipoServicio) throws SQLException {
        String sql = "UPDATE CRM_TIPOSERVPROMO SET PARADESC = ? WHERE TIPOSERVCODI = ?";

        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, tipoServicio.getParadesc());
            pstmt.setInt(2, tipoServicio.getTiposervcodi());

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        }
    }

    /**
     * Inserta un nuevo tipo de servicio
     */
    public boolean insertarTipoServicio(Connection connection, TipoServicio tipoServicio) throws SQLException {
        String sql = "INSERT INTO CRM_TIPOSERVPROMO (TIPOSERVCODI, PARADESC) VALUES (?, ?)";

        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, tipoServicio.getTiposervcodi());
            pstmt.setString(2, tipoServicio.getParadesc());

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        }
    }

    /**
     * Elimina un tipo de servicio por su ID
     */
    public boolean eliminarTipoServicio(Connection connection, int codigo) throws SQLException {
        String sql = "DELETE FROM CRM_TIPOSERVPROMO WHERE TIPOSERVCODI = ?";

        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, codigo);

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        }
    }

    /**
     * Verifica si existe un tipo de servicio con el ID especificado
     */
    public boolean existeTipoServicio(Connection connection, int codigo) throws SQLException {
        String sql = "SELECT COUNT(*) FROM CRM_TIPOSERVPROMO WHERE TIPOSERVCODI = ?";

        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, codigo);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        }

        return false;
    }
}