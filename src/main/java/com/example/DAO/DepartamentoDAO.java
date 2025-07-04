package com.example.DAO;

import com.example.DatabaseConnection;
import com.example.Models.Departamento;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DepartamentoDAO {

    /**
     * Obtiene todos los departamentos de la tabla departam
     * 
     * @return Lista de departamentos
     * @throws Exception
     */
    public List<Departamento> getAllDepartamentos() throws Exception {
        List<Departamento> departamentos = new ArrayList<>();
        DatabaseConnection databaseConnection = new DatabaseConnection();
        Connection connection = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            databaseConnection.getConnection();
            connection = databaseConnection.connection;

            String sql = "SELECT DEPACODI, DEPADESC, DEPAGERE FROM departam ORDER BY DEPADESC";
            stmt = connection.prepareStatement(sql);
            rs = stmt.executeQuery();

            while (rs.next()) {
                Departamento departamento = new Departamento();
                departamento.setDepacodi(rs.getString("DEPACODI"));
                departamento.setDepadesc(rs.getString("DEPADESC"));
                departamento.setDepagere(rs.getString("DEPAGERE"));
                departamentos.add(departamento);
            }

            System.out.println("Departamentos encontrados: " + departamentos.size());

        } catch (Exception e) {
            System.err.println("Error al cargar departamentos: " + e.getMessage());
            throw e;
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    System.err.println("Error cerrando ResultSet: " + e.getMessage());
                }
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException e) {
                    System.err.println("Error cerrando PreparedStatement: " + e.getMessage());
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    System.err.println("Error cerrando Connection: " + e.getMessage());
                }
            }
        }

        return departamentos;
    }

    /**
     * Busca un departamento por su código
     * 
     * @param codigo Código del departamento
     * @return Departamento encontrado o null si no existe
     * @throws Exception
     */
    public Departamento getDepartamentoByCodigo(String codigo) throws Exception {
        Departamento departamento = null;
        DatabaseConnection databaseConnection = new DatabaseConnection();
        Connection connection = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            databaseConnection.getConnection();
            connection = databaseConnection.connection;

            String sql = "SELECT DEPACODI, DEPADESC, DEPAGERE FROM departam WHERE DEPACODI = ?";
            stmt = connection.prepareStatement(sql);
            stmt.setString(1, codigo);
            rs = stmt.executeQuery();

            if (rs.next()) {
                departamento = new Departamento();
                departamento.setDepacodi(rs.getString("DEPACODI"));
                departamento.setDepadesc(rs.getString("DEPADESC"));
                departamento.setDepagere(rs.getString("DEPAGERE"));
            }

        } catch (Exception e) {
            System.err.println("Error al buscar departamento por código: " + e.getMessage());
            throw e;
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    System.err.println("Error cerrando ResultSet: " + e.getMessage());
                }
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException e) {
                    System.err.println("Error cerrando PreparedStatement: " + e.getMessage());
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    System.err.println("Error cerrando Connection: " + e.getMessage());
                }
            }
        }

        return departamento;
    }
}