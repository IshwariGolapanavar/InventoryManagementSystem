package com.inventory.servlet;

import java.io.IOException;

import com.inventory.dao.ProductDAO;
import com.inventory.model.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AddProductServlet")
public class AddProductServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // Handles form submission (POST request)
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        res.setContentType("text/html");

        try {
            // ✅ Create Product object
            Product p = new Product();

            // ✅ Get values from form
            String name = req.getParameter("name");
            String category = req.getParameter("category");
            String priceStr = req.getParameter("price");
            String stockStr = req.getParameter("stock");

            // ✅ Validation (important for real projects)
            if (name == null || category == null ||
                priceStr == null || stockStr == null ||
                name.isEmpty() || category.isEmpty()) {

                res.getWriter().println(" All fields are required!");
                return;
            }

            // ✅ Set values into object
            p.setName(name);
            p.setCategory(category);
            p.setPrice(Double.parseDouble(priceStr));
            p.setStock(Integer.parseInt(stockStr));

            // ✅ Save to database using DAO
            ProductDAO dao = new ProductDAO();
            dao.addProduct(p);

            // ✅ Redirect to dashboard after success
            res.sendRedirect("dashboard.jsp");

        } catch (NumberFormatException e) {
            res.getWriter().println(" Invalid number format for price/stock");
            e.printStackTrace();

        } catch (Exception e) {
            res.getWriter().println(" Error while adding product");
            e.printStackTrace();
        }
    }
}