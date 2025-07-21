package com.example;

import com.example.Models.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

/**
 * Filtro de seguridad para el módulo de promociones
 * Garantiza que solo usuarios autenticados puedan acceder al sistema
 */
@WebFilter("/*")
public class AuthenticationFilter implements Filter {

    // Rutas que NO requieren autenticación
    private static final List<String> EXCLUDED_PATHS = Arrays.asList(
            "/auth/login",
            "/auth/logout",
            "/auth/check",
            "/assets/",
            "/css/",
            "/js/",
            "/images/",
            "/favicon.ico");

    // Rutas de archivos estáticos
    private static final List<String> STATIC_EXTENSIONS = Arrays.asList(
            ".css", ".js", ".png", ".jpg", ".jpeg", ".gif", ".ico", ".svg", ".woff", ".woff2", ".ttf", ".eot");

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("=== AUTHENTICATION FILTER INITIALIZED ===");
        System.out.println("Filtro de seguridad activo para el módulo de promociones");
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        String requestURI = httpRequest.getRequestURI();
        String contextPath = httpRequest.getContextPath();
        String path = requestURI.substring(contextPath.length());

        System.out.println("=== AUTHENTICATION FILTER ===");
        System.out.println("Request URI: " + requestURI);
        System.out.println("Context Path: " + contextPath);
        System.out.println("Path: " + path);

        // Verificar si es una ruta excluida
        if (isExcludedPath(path)) {
            System.out.println("Ruta excluida de autenticación: " + path);
            chain.doFilter(request, response);
            return;
        }

        // Verificar si es un archivo estático
        if (isStaticResource(path)) {
            System.out.println("Recurso estático: " + path);
            chain.doFilter(request, response);
            return;
        }

        // Verificar autenticación
        HttpSession session = httpRequest.getSession(false);
        User user = null;

        if (session != null) {
            user = (User) session.getAttribute("user");
        }

        if (user != null && user.isActive()) {
            // Usuario autenticado y activo
            System.out.println("Usuario autenticado: " + user.getUsername() + " accediendo a: " + path);

            // Agregar información del usuario a la request
            httpRequest.setAttribute("currentUser", user);
            httpRequest.setAttribute("currentUsername", user.getUsername());
            httpRequest.setAttribute("currentUserRole", user.getRole());

            chain.doFilter(request, response);

        } else {
            // Usuario no autenticado
            System.out.println("Acceso denegado - Usuario no autenticado para: " + path);

            // Guardar la URL solicitada para redirigir después del login
            if (session == null) {
                session = httpRequest.getSession(true);
            }
            session.setAttribute("requestedUrl", requestURI);

            // Redirigir al login
            httpResponse.sendRedirect(contextPath + "/auth/login");
        }
    }

    /**
     * Verifica si la ruta está excluida de autenticación
     */
    private boolean isExcludedPath(String path) {
        return EXCLUDED_PATHS.stream().anyMatch(excluded -> {
            if (excluded.endsWith("/")) {
                return path.startsWith(excluded);
            } else {
                return path.equals(excluded);
            }
        });
    }

    /**
     * Verifica si es un recurso estático
     */
    private boolean isStaticResource(String path) {
        return STATIC_EXTENSIONS.stream().anyMatch(path::endsWith);
    }

    @Override
    public void destroy() {
        System.out.println("=== AUTHENTICATION FILTER DESTROYED ===");
    }
}