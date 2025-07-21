package com.example.DAO;

import com.example.DatabaseConnection;
import com.example.Models.User;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Date;
import java.util.Properties;
import java.io.IOException;
import java.io.FileNotFoundException;
import java.io.InputStream;

/**
 * DAO para manejo de usuarios y autenticación
 * Autentica contra la base de datos Oracle usando el usuario 'promo'
 */
public class UserDAO {

    /**
     * Autentica un usuario contra la base de datos Oracle
     * 
     * @param username Usuario
     * @param password Contraseña
     * @return User si la autenticación es exitosa, null si falla
     * @throws Exception
     */
    public User authenticateUser(String username, String password) throws Exception {
        DatabaseConnection databaseConnection = new DatabaseConnection();
        Connection connection = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            // Intentar autenticación directa contra Oracle
            if (validateOracleConnection(username, password)) {

                // ✅ Autenticación Oracle exitosa - Crear usuario directamente sin dependencias
                System.out.println("✅ Autenticación Oracle exitosa - Creando sesión de usuario");

                User user = new User();
                user.setUsername(username.toLowerCase());
                user.setFullName(username.toUpperCase() + " (Oracle User)");
                user.setEmail(username.toLowerCase() + "@oracle.local");
                user.setActive(true);
                user.setRole("USER");
                user.setLastLogin(new Date());

                System.out.println("Usuario autenticado exitosamente: " + username);
                System.out.println("Perfil de usuario creado desde Oracle Database");
                return user;

            } else {
                System.out.println("❌ Falló la autenticación Oracle para usuario: " + username);
                return null;
            }

        } catch (Exception e) {
            System.err.println("❌ Error en autenticación de usuario: " + e.getMessage());
            e.printStackTrace();
            return null; // Cambié throw por return null para evitar excepción
        }
    }

    /**
     * Valida que el usuario puede conectarse a Oracle con sus credenciales
     * Intenta conexión directa con las credenciales proporcionadas y valida en
     * DBA_USERS
     */
    private boolean validateOracleConnection(String username, String password) {
        Connection userConnection = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            System.out.println("=== VALIDANDO USUARIO CON CONEXIÓN DIRECTA ===");
            System.out.println("Usuario: " + username.toUpperCase());
            System.out.println("Intentando conexión directa a Oracle...");

            // Intentar conectar DIRECTAMENTE con las credenciales del usuario
            userConnection = createDirectConnection(username, password);

            if (userConnection == null) {
                System.out.println("❌ No se pudo conectar con las credenciales proporcionadas");
                return false;
            }

            System.out.println("✅ Conexión exitosa con credenciales del usuario");

            // Ahora validar que el usuario existe usando vistas disponibles
            // Usamos USER_USERS con las columnas reales que existen en la tabla
            String validationQuery = "SELECT USERNAME, ACCOUNT_STATUS, CREATED FROM USER_USERS WHERE USERNAME = ?";

            stmt = userConnection.prepareStatement(validationQuery);
            stmt.setString(1, username.toUpperCase()); // Oracle guarda usernames en mayúsculas

            System.out.println("Validando usuario en USER_USERS...");
            System.out.println("Query: " + validationQuery);

            rs = stmt.executeQuery();

            boolean userExists = rs.next();

            if (userExists) {
                String accountStatus = rs.getString("ACCOUNT_STATUS");
                System.out.println("✅ Usuario encontrado en Oracle DB:");
                System.out.println("   - Username: " + rs.getString("USERNAME"));
                System.out.println("   - Account Status: " + accountStatus);
                System.out.println("   - Created: " + rs.getDate("CREATED"));

                // Verificar que el account status sea OPEN
                if ("OPEN".equals(accountStatus)) {
                    System.out.println("   - ✅ Estado: Usuario activo y válido");
                    return true;
                } else {
                    System.out.println("   - ❌ Estado: Usuario no activo - " + accountStatus);
                    return false;
                }

            } else {
                // Si no se encuentra en USER_USERS, intentar con una consulta alternativa
                System.out.println("Usuario no encontrado en USER_USERS, intentando validación alternativa...");
                return validateUserAlternative(userConnection, username);
            }

        } catch (SQLException e) {
            System.err.println("❌ Error de SQL validando usuario en Oracle: " + e.getMessage());
            System.err.println("Código de error: " + e.getErrorCode());

            // Errores comunes de Oracle
            if (e.getErrorCode() == 1017) {
                System.err.println("Error 1017: Usuario o contraseña inválidos");
            } else if (e.getErrorCode() == 28000) {
                System.err.println("Error 28000: Cuenta bloqueada");
            } else if (e.getErrorCode() == 28001) {
                System.err.println("Error 28001: Contraseña expirada");
            }

            return false;

        } catch (Exception e) {
            System.err.println("❌ Error general validando usuario en Oracle: " + e.getMessage());
            e.printStackTrace();
            return false;

        } finally {
            // Cerrar recursos
            if (rs != null)
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            if (stmt != null)
                try {
                    stmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            if (userConnection != null)
                try {
                    userConnection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
        }
    }

    /**
     * Crea una conexión directa a Oracle usando las credenciales proporcionadas
     */
    private Connection createDirectConnection(String username, String password)
            throws SQLException, ClassNotFoundException, IOException {
        try {
            // Cargar driver Oracle
            Class.forName("oracle.jdbc.driver.OracleDriver");

            // ✅ CONFIGURAR LOCALE IGUAL QUE EN DatabaseConnection
            java.util.Locale.setDefault(new java.util.Locale("es", "ES"));
            System.setProperty("user.language", "es");
            System.setProperty("user.region", "ES");

            // Obtener URL de conexión del archivo de propiedades
            Properties env = loadConnectionProperties();
            String url = env.getProperty("DB_URL");

            // Configurar propiedades de conexión con las credenciales del usuario
            Properties connectionProps = new Properties();
            connectionProps.setProperty("user", username.toUpperCase()); // Oracle usernames en mayúsculas
            connectionProps.setProperty("password", password);
            // Test 2: UTF8 encoding más compatible
            connectionProps.setProperty("NLS_LANG", "AMERICAN_AMERICA.US7ASCII");

            System.out.println("URL de conexión: " + url);
            System.out.println("Usuario para conexión: " + username.toUpperCase());

            // Intentar la conexión
            Connection connection = DriverManager.getConnection(url, connectionProps);

            System.out.println("✅ Conexión exitosa establecida para usuario: " + username);
            return connection;

        } catch (SQLException e) {
            System.err.println("❌ Error de conexión SQL: " + e.getMessage());
            throw e;
        } catch (Exception e) {
            System.err.println("❌ Error general en conexión: " + e.getMessage());
            throw e;
        }
    }

    /**
     * Validación alternativa cuando USER_USERS no funciona
     */
    private boolean validateUserAlternative(Connection userConnection, String username) {
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            // Si llegamos aquí, la conexión ya fue exitosa, así que el usuario existe
            // Intentamos consultas alternativas en orden de disponibilidad

            String[] alternativeQueries = {
                    "SELECT USER as USERNAME, 'OPEN' as ACCOUNT_STATUS, SYSDATE as CREATED FROM DUAL",
                    "SELECT USERNAME, ACCOUNT_STATUS, CREATED FROM ALL_USERS WHERE USERNAME = ?",
                    "SELECT USERNAME FROM V$SESSION WHERE USERNAME = ? AND ROWNUM = 1"
            };

            for (String query : alternativeQueries) {
                try {
                    System.out.println("Intentando consulta alternativa: " + query);
                    stmt = userConnection.prepareStatement(query);

                    if (query.contains("?")) {
                        stmt.setString(1, username.toUpperCase());
                    }

                    rs = stmt.executeQuery();

                    if (rs.next()) {
                        System.out.println("✅ Usuario validado con consulta alternativa:");
                        System.out.println("   - Username: " + rs.getString(1));
                        System.out.println("   - Método: " + query);
                        System.out.println("   - Estado: Activo (conexión directa exitosa)");
                        return true;
                    }

                } catch (SQLException e) {
                    System.out.println("Consulta alternativa falló: " + e.getMessage());
                    continue; // Intentar siguiente consulta
                } finally {
                    if (rs != null)
                        try {
                            rs.close();
                        } catch (SQLException e) {
                        }
                    if (stmt != null)
                        try {
                            stmt.close();
                        } catch (SQLException e) {
                        }
                }
            }

            // Si todas las consultas alternativas fallan, pero la conexión fue exitosa
            // consideramos que el usuario es válido
            System.out.println("✅ Usuario validado por conexión directa exitosa");
            System.out.println("   - La conexión a Oracle fue exitosa con las credenciales proporcionadas");
            System.out.println("   - Esto confirma que el usuario existe y está activo");
            return true;

        } catch (Exception e) {
            System.err.println("Error en validación alternativa: " + e.getMessage());
            return false;
        }
    }

    /**
     * Carga las propiedades de conexión (solo para obtener URL)
     */
    private Properties loadConnectionProperties() throws IOException {
        Properties props = new Properties();
        try (InputStream input = getClass().getClassLoader().getResourceAsStream("db.properties")) {
            if (input == null) {
                throw new FileNotFoundException("Archivo db.properties no encontrado en src/main/resources");
            }
            props.load(input);
        }
        return props;
    }

    /**
     * Crea un usuario por defecto en la tabla del sistema
     */
    private User createDefaultUser(Connection connection, String username) throws Exception {
        String insertSql = "INSERT INTO SYSTEM_USERS (username, full_name, email, active, role, created_date) " +
                "VALUES (?, ?, ?, 'Y', 'USER', SYSDATE)";

        try (PreparedStatement stmt = connection.prepareStatement(insertSql)) {
            stmt.setString(1, username);
            stmt.setString(2, username.toUpperCase() + " (Auto-created)");
            stmt.setString(3, username + "@company.com");

            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected > 0) {
                User user = new User();
                user.setUsername(username);
                user.setFullName(username.toUpperCase() + " (Auto-created)");
                user.setEmail(username + "@company.com");
                user.setActive(true);
                user.setRole("USER");

                System.out.println("Usuario creado automáticamente: " + username);
                return user;
            } else {
                throw new Exception("No se pudo crear el usuario en el sistema");
            }
        }
    }

    /**
     * Actualiza la fecha de último login del usuario
     */
    private void updateLastLogin(Connection connection, String username) throws Exception {
        String updateSql = "UPDATE SYSTEM_USERS SET last_login = SYSDATE WHERE UPPER(username) = UPPER(?)";

        try (PreparedStatement stmt = connection.prepareStatement(updateSql)) {
            stmt.setString(1, username);
            stmt.executeUpdate();
        }
    }

    /**
     * Verifica si un usuario está activo en el sistema
     */
    public boolean isUserActive(String username) throws Exception {
        DatabaseConnection databaseConnection = new DatabaseConnection();
        Connection connection = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            databaseConnection.getConnection();
            connection = databaseConnection.connection;

            String sql = "SELECT active FROM SYSTEM_USERS WHERE UPPER(username) = UPPER(?)";
            stmt = connection.prepareStatement(sql);
            stmt.setString(1, username);
            rs = stmt.executeQuery();

            if (rs.next()) {
                return "Y".equals(rs.getString("active"));
            }

            return false; // Usuario no encontrado

        } finally {
            if (rs != null)
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            if (stmt != null)
                try {
                    stmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            if (connection != null)
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
        }
    }

    /**
     * Obtiene información completa del usuario
     */
    public User getUserInfo(String username) throws Exception {
        DatabaseConnection databaseConnection = new DatabaseConnection();
        Connection connection = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            databaseConnection.getConnection();
            connection = databaseConnection.connection;

            String sql = "SELECT username, full_name, email, active, role, last_login " +
                    "FROM SYSTEM_USERS WHERE UPPER(username) = UPPER(?)";

            stmt = connection.prepareStatement(sql);
            stmt.setString(1, username);
            rs = stmt.executeQuery();

            if (rs.next()) {
                User user = new User();
                user.setUsername(rs.getString("username"));
                user.setFullName(rs.getString("full_name"));
                user.setEmail(rs.getString("email"));
                user.setActive("Y".equals(rs.getString("active")));
                user.setRole(rs.getString("role"));
                user.setLastLogin(rs.getTimestamp("last_login"));
                return user;
            }

            return null;

        } finally {
            if (rs != null)
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            if (stmt != null)
                try {
                    stmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            if (connection != null)
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
        }
    }
}