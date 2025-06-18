package com.example.Controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/InitialProducts")
public class InitialProductsController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("=== INICIANDO CARGA INICIAL DE PRODUCTOS ===");

        // Redirigir al controller principal para carga inicial
        String redirectUrl = request.getContextPath() + "/LoadProducts";

        System.out.println("Redirigiendo a: " + redirectUrl);
        response.sendRedirect(redirectUrl);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}