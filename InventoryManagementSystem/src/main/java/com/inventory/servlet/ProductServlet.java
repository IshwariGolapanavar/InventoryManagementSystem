package com.inventory.servlet;

import java.io.IOException;
import java.util.List;

import com.inventory.dao.ProductDAO;
import com.inventory.model.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ProductServlet")
public class ProductServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        try {
            ProductDAO dao = new ProductDAO();

            // ✅ Fetch all products
            List<Product> list = dao.getAllProducts();

            // ✅ Send data to JSP
            req.setAttribute("productList", list);

            // Forward to dashboard
            req.getRequestDispatcher("dashboard.jsp").forward(req, res);

        } catch (Exception e) {
            e.printStackTrace();
            res.getWriter().println(" Error loading products");
        }
    }
}