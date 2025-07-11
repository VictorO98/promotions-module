package com.example.DAO;

import com.example.DatabaseConnection;
import com.example.Models.TipoServicioPromo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TipoServicioPromoDAO {

    /**
     * Obtiene todos los tipos de servicio promoción
     * 
     * @return Lista de tipos de servicio promoción
     * @throws Exception
     */
    public List<TipoServicioPromo> getAllTiposServicio() throws Exception {
        List<TipoServicioPromo> tiposServicio = new ArrayList<>();
        DatabaseConnection databaseConnection = new DatabaseConnection();
        Connection connection = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            databaseConnection.getConnection();
            connection = databaseConnection.connection;

            String sql = "SELECT * FROM CRM_TIPOSERVPROMO ORDER BY PARADESC";

            stmt = connection.prepareStatement(sql);
            rs = stmt.executeQuery();

            while (rs.next()) {
                TipoServicioPromo tipo = new TipoServicioPromo();

                // Intentar obtener los campos más comunes
                try {
                    tipo.setTiposervcodi(rs.getString("TIPOSERVCODI"));
                } catch (SQLException e) {
                    // Si no existe TIPOSERVCODI, intentar con otros nombres posibles
                    try {
                        tipo.setTiposervcodi(rs.getString("CODIGO"));
                    } catch (SQLException e2) {
                        try {
                            tipo.setTiposervcodi(rs.getString("ID"));
                        } catch (SQLException e3) {
                            tipo.setTiposervcodi(rs.getString(1)); // Primer campo como fallback
                        }
                    }
                }

                try {
                    tipo.setParadesc(rs.getString("PARADESC"));
                } catch (SQLException e) {
                    // Si no existe PARADESC, intentar con otros nombres posibles
                    try {
                        tipo.setParadesc(rs.getString("DESCRIPCION"));
                    } catch (SQLException e2) {
                        try {
                            tipo.setParadesc(rs.getString("DESC"));
                        } catch (SQLException e3) {
                            try {
                                tipo.setParadesc(rs.getString("NOMBRE"));
                            } catch (SQLException e4) {
                                tipo.setParadesc(rs.getString(2)); // Segundo campo como fallback
                            }
                        }
                    }
                }

                tiposServicio.add(tipo);
            }

            System.out.println("Tipos de servicio promoción encontrados: " + tiposServicio.size());

        } catch (Exception e) {
            System.err.println("Error al cargar tipos de servicio promoción: " + e.getMessage());
            e.printStackTrace();
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

        return tiposServicio;
    }

    /**
     * Busca un tipo de servicio por su código
     * 
     * @param codigo Código del tipo de servicio
     * @return Tipo de servicio encontrado o null si no existe
     * @throws Exception
     */
    public TipoServicioPromo getTipoServicioByCodigo(String codigo) throws Exception {
        TipoServicioPromo tipo = null;
        DatabaseConnection databaseConnection = new DatabaseConnection();
        Connection connection = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            databaseConnection.getConnection();
            connection = databaseConnection.connection;

            String sql = "SELECT * FROM CRM_TIPOSERVPROMO WHERE TIPOSERVCODI = ?";

            stmt = connection.prepareStatement(sql);
            stmt.setString(1, codigo);
            rs = stmt.executeQuery();

            if (rs.next()) {
                tipo = new TipoServicioPromo();
                tipo.setTiposervcodi(rs.getString("TIPOSERVCODI"));
                tipo.setParadesc(rs.getString("PARADESC"));
            }

        } catch (Exception e) {
            System.err.println("Error al buscar tipo de servicio por código: " + e.getMessage());
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

        return tipo;
    }
}