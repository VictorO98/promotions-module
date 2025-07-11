package com.example.DAO;

import com.example.DatabaseConnection;
import com.example.Models.PlanSuscripcion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PlanSuscripcionDAO {

    /**
     * Obtiene todos los planes de suscripción
     * 
     * @return Lista de planes de suscripción
     * @throws Exception
     */
    public List<PlanSuscripcion> getAllPlanes() throws Exception {
        List<PlanSuscripcion> planes = new ArrayList<>();
        DatabaseConnection databaseConnection = new DatabaseConnection();
        Connection connection = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            databaseConnection.getConnection();
            connection = databaseConnection.connection;

            String sql = "SELECT PLSUCODI, PLSUDESC " +
                    "FROM PLANSUSC " +
                    "ORDER BY PLSUDESC";

            stmt = connection.prepareStatement(sql);
            rs = stmt.executeQuery();

            while (rs.next()) {
                PlanSuscripcion plan = new PlanSuscripcion();
                plan.setPlsucodi(rs.getString("PLSUCODI"));
                plan.setPlsudesc(rs.getString("PLSUDESC"));
                planes.add(plan);
            }

            System.out.println("Planes de suscripción encontrados: " + planes.size());

        } catch (Exception e) {
            System.err.println("Error al cargar planes de suscripción: " + e.getMessage());
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

        return planes;
    }

    /**
     * Busca planes de suscripción por descripción (filtro de búsqueda)
     * 
     * @param busqueda Texto a buscar en la descripción del plan
     * @return Lista de planes que coinciden con la búsqueda
     * @throws Exception
     */
    public List<PlanSuscripcion> buscarPlanesByDescripcion(String busqueda) throws Exception {
        List<PlanSuscripcion> planes = new ArrayList<>();
        DatabaseConnection databaseConnection = new DatabaseConnection();
        Connection connection = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            databaseConnection.getConnection();
            connection = databaseConnection.connection;

            String sql = "SELECT PLSUCODI, PLSUDESC " +
                    "FROM PLANSUSC " +
                    "WHERE UPPER(PLSUDESC) LIKE UPPER(?) " +
                    "ORDER BY PLSUDESC";

            stmt = connection.prepareStatement(sql);
            stmt.setString(1, "%" + busqueda + "%");
            rs = stmt.executeQuery();

            while (rs.next()) {
                PlanSuscripcion plan = new PlanSuscripcion();
                plan.setPlsucodi(rs.getString("PLSUCODI"));
                plan.setPlsudesc(rs.getString("PLSUDESC"));
                planes.add(plan);
            }

            System.out.println("Planes encontrados con búsqueda '" + busqueda + "': " + planes.size());

        } catch (Exception e) {
            System.err.println("Error al buscar planes de suscripción: " + e.getMessage());
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

        return planes;
    }

    /**
     * Busca un plan de suscripción por su código
     * 
     * @param codigo Código del plan
     * @return Plan encontrado o null si no existe
     * @throws Exception
     */
    public PlanSuscripcion getPlanByCodigo(String codigo) throws Exception {
        PlanSuscripcion plan = null;
        DatabaseConnection databaseConnection = new DatabaseConnection();
        Connection connection = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            databaseConnection.getConnection();
            connection = databaseConnection.connection;

            String sql = "SELECT PLSUCODI, PLSUDESC " +
                    "FROM PLANSUSC " +
                    "WHERE PLSUCODI = ?";

            stmt = connection.prepareStatement(sql);
            stmt.setString(1, codigo);
            rs = stmt.executeQuery();

            if (rs.next()) {
                plan = new PlanSuscripcion();
                plan.setPlsucodi(rs.getString("PLSUCODI"));
                plan.setPlsudesc(rs.getString("PLSUDESC"));
            }

        } catch (Exception e) {
            System.err.println("Error al buscar plan por código: " + e.getMessage());
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

        return plan;
    }
}