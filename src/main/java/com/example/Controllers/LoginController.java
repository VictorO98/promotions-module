package com.example.Controllers;

import com.example.DAO.UserDAO;
import com.example.Models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Controlador para manejar autenticación de usuarios
 * Maneja login, logout y validación de sesiones
 */
@WebServlet("/auth/*")
public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        userDAO = new UserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getPathInfo();

        if (action == null) {
            action = "/login";
        }

        switch (action) {
            case "/login":
                showLoginPage(request, response);
                break;
            case "/logout":
                handleLogout(request, response);
                break;
            case "/check":
                checkSession(request, response);
                break;
            default:
                response.sendRedirect(request.getContextPath() + "/auth/login");
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getPathInfo();

        if ("/login".equals(action)) {
            handleLogin(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/auth/login");
        }
    }

    /**
     * Muestra la página de login
     */
    private void showLoginPage(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Si ya está logueado, redirigir al home
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("user") != null) {
            response.sendRedirect(request.getContextPath() + "/views/index.jsp");
            return;
        }

        // Mostrar página de login
        request.getRequestDispatcher("/views/login.jsp").forward(request, response);
    }

    /**
     * Procesa el intento de login
     */
    private void handleLogin(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String rememberMe = request.getParameter("rememberMe");

        System.out.println("=== INTENTO DE LOGIN ===");
        System.out.println("Usuario: " + username);
        System.out.println("Remember Me: " + rememberMe);

        // Validaciones básicas
        if (username == null || username.trim().isEmpty() ||
                password == null || password.trim().isEmpty()) {

            request.setAttribute("errorMessage", "Por favor ingrese usuario y contraseña");
            request.setAttribute("username", username);
            request.getRequestDispatcher("/views/login.jsp").forward(request, response);
            return;
        }

        try {
            // Intentar autenticación
            User user = userDAO.authenticateUser(username.trim(), password);

            if (user != null && user.isActive()) {
                // Login exitoso
                HttpSession session = request.getSession(true);
                session.setAttribute("user", user);
                session.setAttribute("username", user.getUsername());
                session.setAttribute("fullName", user.getFullName());
                session.setAttribute("role", user.getRole());

                // Configurar tiempo de sesión
                if ("on".equals(rememberMe)) {
                    session.setMaxInactiveInterval(7 * 24 * 60 * 60); // 7 días
                } else {
                    session.setMaxInactiveInterval(8 * 60 * 60); // 8 horas
                }

                System.out.println("LOGIN EXITOSO para usuario: " + user.getUsername());

                // Redirigir a la página que intentaba acceder o al home
                String redirectUrl = (String) session.getAttribute("requestedUrl");
                if (redirectUrl != null) {
                    session.removeAttribute("requestedUrl");
                    response.sendRedirect(redirectUrl);
                } else {
                    response.sendRedirect(request.getContextPath() + "/views/index.jsp");
                }

            } else {
                // Login fallido
                System.out.println("LOGIN FALLIDO para usuario: " + username);
                request.setAttribute("errorMessage", "Usuario o contraseña incorrectos");
                request.setAttribute("username", username);
                request.getRequestDispatcher("/views/login.jsp").forward(request, response);
            }

        } catch (Exception e) {
            System.err.println("Error durante login: " + e.getMessage());
            e.printStackTrace();

            request.setAttribute("errorMessage", "Error del sistema. Intente nuevamente.");
            request.setAttribute("username", username);
            request.getRequestDispatcher("/views/login.jsp").forward(request, response);
        }
    }

    /**
     * Maneja el logout del usuario
     */
    private void handleLogout(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session != null) {
            String username = (String) session.getAttribute("username");
            System.out.println("LOGOUT para usuario: " + username);
            session.invalidate();
        }

        // Redirigir al login con mensaje
        response.sendRedirect(request.getContextPath() + "/auth/login?message=logout");
    }

    /**
     * Verifica el estado de la sesión (AJAX)
     */
    private void checkSession(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession(false);
        boolean isLoggedIn = (session != null && session.getAttribute("user") != null);

        if (isLoggedIn) {
            User user = (User) session.getAttribute("user");
            response.getWriter().write("{\"loggedIn\": true, \"username\": \"" + user.getUsername() + "\"}");
        } else {
            response.getWriter().write("{\"loggedIn\": false}");
        }
    }
}