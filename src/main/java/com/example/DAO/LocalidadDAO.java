package com.example.DAO;

import com.example.DatabaseConnection;
import com.example.Models.Localidad;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class LocalidadDAO {

    /**
     * Obtiene todas las localidades de un departamento específico
     * 
     * @param codigoDepartamento Código del departamento (LOCADEPA)
     * @return Lista de localidades del departamento
     * @throws Exception
     */
    public List<Localidad> getLocalidadesByDepartamento(String codigoDepartamento) throws Exception {
        List<Localidad> localidades = new ArrayList<>();
        DatabaseConnection databaseConnection = new DatabaseConnection();
        Connection connection = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            databaseConnection.getConnection();
            connection = databaseConnection.connection;

            // Consulta simplificada con solo las columnas básicas
            String sql = "SELECT LOCADEPA, LOCACODI, LOCANOMB " +
                    "FROM localida " +
                    "WHERE LOCADEPA = ? " +
                    "ORDER BY LOCANOMB";

            stmt = connection.prepareStatement(sql);
            stmt.setString(1, codigoDepartamento);
            rs = stmt.executeQuery();

            while (rs.next()) {
                Localidad localidad = new Localidad();
                localidad.setLocadepa(rs.getString("LOCADEPA"));
                localidad.setLocacodi(rs.getString("LOCACODI"));
                localidad.setLocanomb(rs.getString("LOCANOMB"));
                localidades.add(localidad);
            }

            System.out.println(
                    "Localidades encontradas para departamento " + codigoDepartamento + ": " + localidades.size());

        } catch (Exception e) {
            System.err.println(
                    "Error al cargar localidades del departamento " + codigoDepartamento + ": " + e.getMessage());
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

        return localidades;
    }

    /**
     * Obtiene todas las localidades sin filtro
     * 
     * @return Lista de todas las localidades
     * @throws Exception
     */
    public List<Localidad> getAllLocalidades() throws Exception {
        List<Localidad> localidades = new ArrayList<>();
        DatabaseConnection databaseConnection = new DatabaseConnection();
        Connection connection = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            databaseConnection.getConnection();
            connection = databaseConnection.connection;

            // Consulta simplificada con solo las columnas básicas
            String sql = "SELECT LOCADEPA, LOCACODI, LOCANOMB " +
                    "FROM localida " +
                    "ORDER BY LOCADEPA, LOCANOMB";

            stmt = connection.prepareStatement(sql);
            rs = stmt.executeQuery();

            while (rs.next()) {
                Localidad localidad = new Localidad();
                localidad.setLocadepa(rs.getString("LOCADEPA"));
                localidad.setLocacodi(rs.getString("LOCACODI"));
                localidad.setLocanomb(rs.getString("LOCANOMB"));
                localidades.add(localidad);
            }

            System.out.println("Total localidades encontradas: " + localidades.size());

        } catch (Exception e) {
            System.err.println("Error al cargar todas las localidades: " + e.getMessage());
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

        return localidades;
    }

    /**
     * Busca una localidad específica por código de departamento y código de
     * localidad
     * 
     * @param codigoDepartamento Código del departamento
     * @param codigoLocalidad    Código de la localidad
     * @return Localidad encontrada o null si no existe
     * @throws Exception
     */
    public Localidad getLocalidadByCodigos(String codigoDepartamento, String codigoLocalidad) throws Exception {
        Localidad localidad = null;
        DatabaseConnection databaseConnection = new DatabaseConnection();
        Connection connection = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            databaseConnection.getConnection();
            connection = databaseConnection.connection;

            // Consulta simplificada con solo las columnas básicas
            String sql = "SELECT LOCADEPA, LOCACODI, LOCANOMB " +
                    "FROM localida " +
                    "WHERE LOCADEPA = ? AND LOCACODI = ?";

            stmt = connection.prepareStatement(sql);
            stmt.setString(1, codigoDepartamento);
            stmt.setString(2, codigoLocalidad);
            rs = stmt.executeQuery();

            if (rs.next()) {
                localidad = new Localidad();
                localidad.setLocadepa(rs.getString("LOCADEPA"));
                localidad.setLocacodi(rs.getString("LOCACODI"));
                localidad.setLocanomb(rs.getString("LOCANOMB"));
            }

        } catch (Exception e) {
            System.err.println("Error al buscar localidad: " + e.getMessage());
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

        return localidad;
    }
}