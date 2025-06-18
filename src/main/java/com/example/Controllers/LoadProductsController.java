package com.example.Controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.DatabaseConnection;
import com.example.Models.TipoServicio;

@WebServlet("/LoadProducts")
public class LoadProductsController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("=== INICIANDO CARGA DE PRODUCTOS ===");

        List<TipoServicio> productos = new ArrayList<>();
        DatabaseConnection databaseConnection = new DatabaseConnection();
        String debugInfo = "";
        int recordCount = 0;

        Connection connection = null;
        try {
            databaseConnection.getConnection();
            connection = databaseConnection.connection;

            if (connection != null) {
                System.out.println("Conexión establecida");

                // SELECT simple y directo por posición
                String query = "SELECT * FROM CRM_TIPOSERVPROMO";
                System.out.println("Ejecutando: " + query);

                Statement stmt = connection.createStatement();
                ResultSet rs = stmt.executeQuery(query);

                while (rs.next()) {
                    TipoServicio producto = new TipoServicio();
                    // Leer por posición de columna (1=código, 2=descripción)
                    producto.setTiposervcodi(rs.getInt(1));
                    producto.setParadesc(rs.getString(2));
                    productos.add(producto);
                }

                rs.close();
                stmt.close();
                recordCount = productos.size();

                if (recordCount > 0) {
                    debugInfo = "Se encontraron " + recordCount + " productos en el sistema";
                } else {
                    debugInfo = "No se encontraron productos en la base de datos";
                }

                System.out.println("Total productos encontrados: " + recordCount);

            } else {
                debugInfo = "Error: No se pudo establecer conexión con la base de datos";
                System.out.println("Error: Conexión null");
            }

        } catch (Exception e) {
            debugInfo = "Error en la consulta: " + e.getMessage();
            System.out.println("Error: " + e.getMessage());
            e.printStackTrace();
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                    System.out.println("Conexión cerrada");
                } catch (Exception e) {
                    System.out.println("Error cerrando conexión: " + e.getMessage());
                }
            }
        }

        // Establecer atributos para la vista JSP
        request.setAttribute("productos", productos);
        request.setAttribute("recordCount", recordCount);
        request.setAttribute("debugInfo", debugInfo);
        request.setAttribute("isInitialLoad", true);
        request.setAttribute("showProducts", "true");

        System.out.println("=== FIN CARGA DE PRODUCTOS ===");

        // Forward a la vista JSP
        request.getRequestDispatcher("/views/index.jsp").forward(request, response);
    }
}