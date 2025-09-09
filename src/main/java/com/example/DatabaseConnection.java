package com.example;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.CallableStatement;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.Locale;
import java.util.Properties;

public class DatabaseConnection {
    public Connection connection;

    public DatabaseConnection() {
    }

    private Properties loadEnv() throws IOException {
        Properties props = new Properties();
        try (InputStream input = getClass().getClassLoader().getResourceAsStream("db.properties")) {
            if (input == null) {
                throw new FileNotFoundException("Archivo db.properties no encontrado en src/main/resources");
            }
            props.load(input);
        }
        return props;
    }

    public void getConnection() throws ClassNotFoundException, SQLException, IOException {
        Class.forName("oracle.jdbc.driver.OracleDriver");

        try {
            Locale.setDefault(new Locale("es", "ES"));
            System.setProperty("user.language", "es");
            System.setProperty("user.region", "ES");
            Properties env = loadEnv();

            String url = env.getProperty("DB_URL");

            // Si el problema persiste, intenta añadir parámetros de charset a la URL
            // Descomenta la línea siguiente si necesitas forzar charset en la URL:
            // url = url +
            // "?oracle.jdbc.defaultNChar=true&oracle.jdbc.convertNcharLiterals=true";

            System.out.println("Conectando a: " + url);

            Properties props = new Properties();
            props.setProperty("user", env.getProperty("DB_USERNAME"));
            props.setProperty("password", env.getProperty("DB_PASSWORD"));

            // Configuración de charset más compatible para evitar ORA-12704
            // Opción 1: AL32UTF8 (recomendado para la mayoría de casos)
            props.setProperty("NLS_LANG", "AMERICAN_AMERICA.AL32UTF8");

            // Otras opciones si AL32UTF8 no funciona:
            // props.setProperty("NLS_LANG", "AMERICAN_AMERICA.UTF8");
            // props.setProperty("NLS_LANG", "SPANISH_SPAIN.AL32UTF8");
            // props.setProperty("NLS_LANG", "AMERICAN_AMERICA.WE8ISO8859P1");

            // Configuraciones adicionales para compatibilidad de charset
            props.setProperty("oracle.jdbc.defaultNChar", "true");
            props.setProperty("oracle.jdbc.convertNcharLiterals", "true");

            connection = DriverManager.getConnection(url, props);
            System.out.println("Connection established");
        } catch (Exception e) {
            System.err.println("Error to connect database: " + e.getMessage());
            throw e;
        }
    }

    /**
     * Método de diagnóstico para verificar la configuración de charset del servidor
     * Oracle
     * Útil para depurar errores ORA-12704
     */
    public void verificarCharsetServidor() {
        try {
            System.out.println("=== DIAGNÓSTICO DE CHARSET ===");

            // Verificar charset de la base de datos
            java.sql.Statement stmt = connection.createStatement();
            java.sql.ResultSet rs = stmt.executeQuery(
                    "SELECT * FROM nls_database_parameters WHERE parameter IN ('NLS_CHARACTERSET', 'NLS_NCHAR_CHARACTERSET')");

            System.out.println("Configuración de charset del servidor Oracle:");
            while (rs.next()) {
                String parameter = rs.getString("PARAMETER");
                String value = rs.getString("VALUE");
                System.out.println("  " + parameter + ": " + value);
            }

            // Verificar configuración de la sesión
            rs = stmt.executeQuery("SELECT * FROM nls_session_parameters WHERE parameter = 'NLS_CHARACTERSET'");
            while (rs.next()) {
                System.out.println("  Charset de la sesión: " + rs.getString("VALUE"));
            }

            rs.close();
            stmt.close();

            System.out.println("=== FIN DIAGNÓSTICO CHARSET ===");

        } catch (Exception e) {
            System.err.println("Error al verificar charset del servidor: " + e.getMessage());
        }
    }

    public void executeProcedure(String procedureSql, Object... params) throws SQLException {
        CallableStatement stmt = null;

        try {
            stmt = connection.prepareCall(procedureSql);

            for (int i = 0; i < params.length; i++) {
                stmt.setObject(i + 1, params[i]);
            }

            stmt.execute();
            System.err.println(
                    "Successfully executed procedure: " + procedureSql + " with params: " + Arrays.toString(params));
        } catch (Exception e) {
            System.err.println("Error to execute procedure " + procedureSql + ": " + e.getMessage());
        } finally {
            if (stmt != null) {
                stmt.close();
            }
        }
    }

}
