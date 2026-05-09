package com.inventory.servlet;

import java.io.IOException;

import com.inventory.dao.ProductDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/SellProductServlet")
public class SellProductServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // Handles selling product (stock reduction)
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        res.setContentType("text/html");

        try {
            // ✅ Get parameters
            String idStr = req.getParameter("id");
            String qtyStr = req.getParameter("qty");

            // ✅ Validation
            if (idStr == null || qtyStr == null || idStr.isEmpty() || qtyStr.isEmpty()) {
                res.getWriter().println(" Invalid input!");
                return;
            }

            int id = Integer.parseInt(idStr);
            int qty = Integer.parseInt(qtyStr);

            if (qty <= 0) {
                res.getWriter().println(" Quantity must be greater than 0!");
                return;
            }

            // ✅ Call DAO method to reduce stock
            ProductDAO dao = new ProductDAO();
            dao.sellProduct(id, qty);

            // ✅ Redirect to dashboard
            res.sendRedirect("dashboard.jsp");

        } catch (NumberFormatException e) {
            res.getWriter().println(" Invalid number format!");
            e.printStackTrace();

        } catch (Exception e) {
            res.getWriter().println(" Error while selling product!");
            e.printStackTrace();
        }
    }
}