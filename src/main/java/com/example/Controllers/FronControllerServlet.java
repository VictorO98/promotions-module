package com.example.Controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/controller/")
public class FronControllerServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("loadPromotions".equals(action)) {
            request.getRequestDispatcher("/LoadPromotions").forward(request, response);
        } else {
            request.getRequestDispatcher("/views/index.jsp").forward(request, response);
        }
    }
}
