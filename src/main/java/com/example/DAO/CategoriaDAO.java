package com.example.DAO;

import com.example.DatabaseConnection;
import com.example.Models.Categoria;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoriaDAO {

    /**
     * Obtiene todas las categorías de la tabla CATEGORI
     * 
     * @return Lista de categorías
     * @throws Exception
     */
    public List<Categoria> getAllCategorias() throws Exception {
        List<Categoria> categorias = new ArrayList<>();
        DatabaseConnection databaseConnection = new DatabaseConnection();
        Connection connection = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            databaseConnection.getConnection();
            connection = databaseConnection.connection;

            // Consulta simplificada para debug - solo campos básicos
            String sql = "SELECT CATECODI, CATEDESC " +
                    "FROM CATEGORI " +
                    "ORDER BY CATEDESC";

            stmt = connection.prepareStatement(sql);
            rs = stmt.executeQuery();

            while (rs.next()) {
                Categoria categoria = new Categoria();
                categoria.setCatecodi(rs.getString("CATECODI"));
                categoria.setCatedesc(rs.getString("CATEDESC"));
                // Temporalmente no usamos CATEEVLCO para debug
                categoria.setCateevlco("");
                categorias.add(categoria);
            }

            System.out.println("Categorías encontradas: " + categorias.size());

        } catch (Exception e) {
            System.err.println("Error al cargar categorías: " + e.getMessage());
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

        return categorias;
    }

    /**
     * Busca una categoría por su código
     * 
     * @param codigo Código de la categoría
     * @return Categoría encontrada o null si no existe
     * @throws Exception
     */
    public Categoria getCategoriaByCodigo(String codigo) throws Exception {
        Categoria categoria = null;
        DatabaseConnection databaseConnection = new DatabaseConnection();
        Connection connection = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            databaseConnection.getConnection();
            connection = databaseConnection.connection;

            String sql = "SELECT CATECODI, CATEDESC, CATEEVLCO " +
                    "FROM CATEGORI " +
                    "WHERE CATECODI = ?";

            stmt = connection.prepareStatement(sql);
            stmt.setString(1, codigo);
            rs = stmt.executeQuery();

            if (rs.next()) {
                categoria = new Categoria();
                categoria.setCatecodi(rs.getString("CATECODI"));
                categoria.setCatedesc(rs.getString("CATEDESC"));
                categoria.setCateevlco(rs.getString("CATEEVLCO"));
            }

        } catch (Exception e) {
            System.err.println("Error al buscar categoría por código: " + e.getMessage());
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

        return categoria;
    }

    /**
     * Obtiene categorías filtradas por descripción (búsqueda parcial)
     * 
     * @param descripcionParcial Parte de la descripción a buscar
     * @return Lista de categorías que coinciden
     * @throws Exception
     */
    public List<Categoria> getCategoriasByDescripcion(String descripcionParcial) throws Exception {
        List<Categoria> categorias = new ArrayList<>();
        DatabaseConnection databaseConnection = new DatabaseConnection();
        Connection connection = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            databaseConnection.getConnection();
            connection = databaseConnection.connection;

            String sql = "SELECT CATECODI, CATEDESC, CATEEVLCO " +
                    "FROM CATEGORI " +
                    "WHERE UPPER(CATEDESC) LIKE UPPER(?) " +
                    "ORDER BY CATEDESC";

            stmt = connection.prepareStatement(sql);
            stmt.setString(1, "%" + descripcionParcial + "%");
            rs = stmt.executeQuery();

            while (rs.next()) {
                Categoria categoria = new Categoria();
                categoria.setCatecodi(rs.getString("CATECODI"));
                categoria.setCatedesc(rs.getString("CATEDESC"));
                categoria.setCateevlco(rs.getString("CATEEVLCO"));
                categorias.add(categoria);
            }

            System.out.println(
                    "Categorías encontradas con descripción '" + descripcionParcial + "': " + categorias.size());

        } catch (Exception e) {
            System.err.println("Error al buscar categorías por descripción: " + e.getMessage());
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

        return categorias;
    }
}