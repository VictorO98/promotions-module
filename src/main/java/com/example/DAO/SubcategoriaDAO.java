package com.example.DAO;

import com.example.DatabaseConnection;
import com.example.Models.Subcategoria;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SubcategoriaDAO {

    /**
     * Obtiene todas las subcategorías filtradas por categoría
     * 
     * @param categoriaId ID de la categoría para filtrar
     * @return Lista de subcategorías de la categoría especificada
     * @throws Exception
     */
    public List<Subcategoria> getSubcategoriasByCategoria(String categoriaId) throws Exception {
        List<Subcategoria> subcategorias = new ArrayList<>();
        DatabaseConnection databaseConnection = new DatabaseConnection();
        Connection connection = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            databaseConnection.getConnection();
            connection = databaseConnection.connection;

            String sql = "SELECT SUCACODI, SUCADESC, SUCACATE " +
                    "FROM SUBCATEG " +
                    "WHERE SUCACATE = ? " +
                    "ORDER BY SUCADESC";

            stmt = connection.prepareStatement(sql);
            stmt.setString(1, categoriaId);
            rs = stmt.executeQuery();

            while (rs.next()) {
                Subcategoria subcategoria = new Subcategoria();
                subcategoria.setSucacodi(rs.getString("SUCACODI"));
                subcategoria.setSucadesc(rs.getString("SUCADESC"));
                subcategoria.setSucacate(rs.getString("SUCACATE"));
                subcategorias.add(subcategoria);
            }

            System.out.println("Subcategorías encontradas para categoría " + categoriaId + ": " + subcategorias.size());

        } catch (Exception e) {
            System.err.println("Error al cargar subcategorías: " + e.getMessage());
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

        return subcategorias;
    }

    /**
     * Obtiene todas las subcategorías de la tabla SUBCATEG
     * 
     * @return Lista de todas las subcategorías
     * @throws Exception
     */
    public List<Subcategoria> getAllSubcategorias() throws Exception {
        List<Subcategoria> subcategorias = new ArrayList<>();
        DatabaseConnection databaseConnection = new DatabaseConnection();
        Connection connection = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            databaseConnection.getConnection();
            connection = databaseConnection.connection;

            String sql = "SELECT SUCACODI, SUCADESC, SUCACATE " +
                    "FROM SUBCATEG " +
                    "ORDER BY SUCADESC";

            stmt = connection.prepareStatement(sql);
            rs = stmt.executeQuery();

            while (rs.next()) {
                Subcategoria subcategoria = new Subcategoria();
                subcategoria.setSucacodi(rs.getString("SUCACODI"));
                subcategoria.setSucadesc(rs.getString("SUCADESC"));
                subcategoria.setSucacate(rs.getString("SUCACATE"));
                subcategorias.add(subcategoria);
            }

            System.out.println("Total subcategorías encontradas: " + subcategorias.size());

        } catch (Exception e) {
            System.err.println("Error al cargar todas las subcategorías: " + e.getMessage());
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

        return subcategorias;
    }

    /**
     * Busca una subcategoría por su código
     * 
     * @param codigo Código de la subcategoría
     * @return Subcategoría encontrada o null si no existe
     * @throws Exception
     */
    public Subcategoria getSubcategoriaByCodigo(String codigo) throws Exception {
        Subcategoria subcategoria = null;
        DatabaseConnection databaseConnection = new DatabaseConnection();
        Connection connection = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            databaseConnection.getConnection();
            connection = databaseConnection.connection;

            String sql = "SELECT SUCACODI, SUCADESC, SUCACATE " +
                    "FROM SUBCATEG " +
                    "WHERE SUCACODI = ?";

            stmt = connection.prepareStatement(sql);
            stmt.setString(1, codigo);
            rs = stmt.executeQuery();

            if (rs.next()) {
                subcategoria = new Subcategoria();
                subcategoria.setSucacodi(rs.getString("SUCACODI"));
                subcategoria.setSucadesc(rs.getString("SUCADESC"));
                subcategoria.setSucacate(rs.getString("SUCACATE"));
            }

        } catch (Exception e) {
            System.err.println("Error al buscar subcategoría por código: " + e.getMessage());
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

        return subcategoria;
    }
}