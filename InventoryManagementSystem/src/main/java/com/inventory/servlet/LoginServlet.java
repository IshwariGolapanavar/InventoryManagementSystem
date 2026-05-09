package com.inventory.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String username = req.getParameter("username");
        String password = req.getParameter("password");

        // ✅ Simple hardcoded login (you can replace with DB later)
        if ("admin".equals(username) && "1234".equals(password)) {

            HttpSession session = req.getSession();
            session.setAttribute("user", username);

            res.sendRedirect("dashboard.jsp");

        } else {
            res.sendRedirect("LoginError.jsp");
        }
    }
}