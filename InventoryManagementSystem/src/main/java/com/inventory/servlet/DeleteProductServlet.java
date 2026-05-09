package com.inventory.servlet;

import java.io.IOException;

import com.inventory.dao.ProductDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DeleteProductServlet")
public class DeleteProductServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // Handles GET request for delete operation
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        res.setContentType("text/html");

        try {
            // ✅ Get product id from request
            String idStr = req.getParameter("id");

            if (idStr == null || idStr.isEmpty()) {
                res.getWriter().println(" Invalid Product ID");
                return;
            }

            int id = Integer.parseInt(idStr);

            // ✅ Call DAO to delete product
            ProductDAO dao = new ProductDAO();
            dao.deleteProduct(id);

            // ✅ Redirect back to dashboard after delete
            res.sendRedirect("dashboard.jsp");

        } catch (NumberFormatException e) {
            res.getWriter().println(" Invalid ID format");
            e.printStackTrace();

        } catch (Exception e) {
            res.getWriter().println(" Error while deleting product");
            e.printStackTrace();
        }
    }
}