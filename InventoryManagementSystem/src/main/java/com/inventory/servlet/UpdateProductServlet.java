//package com.inventory.servlet;
//
//import java.io.IOException;
//
//import com.inventory.dao.ProductDAO;
//import com.inventory.model.Product;
//
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//
//@WebServlet("/UpdateProductServlet")
//public class UpdateProductServlet extends HttpServlet {
//
//    private static final long serialVersionUID = 1L;
//
//    // Handles POST request for updating product
//    @Override
//    protected void doPost(HttpServletRequest req, HttpServletResponse res)
//            throws ServletException, IOException {
//
//        res.setContentType("text/html");
//
//        try {
//            // ✅ Get parameters from form
//            String idStr = req.getParameter("id");
//            String name = req.getParameter("name");
//            String category = req.getParameter("category");
//            String priceStr = req.getParameter("price");
//            String stockStr = req.getParameter("stock");
//
//            // ✅ Validation
//            if (idStr == null || name == null || category == null ||
//                priceStr == null || stockStr == null ||
//                name.isEmpty() || category.isEmpty()) {
//
//                res.getWriter().println(" All fields are required!");
//                return;
//            }
//
//            // ✅ Create Product object
//            Product p = new Product();
//            p.setId(Integer.parseInt(idStr));
//            p.setName(name);
//            p.setCategory(category);
//            p.setPrice(Double.parseDouble(priceStr));
//            p.setStock(Integer.parseInt(stockStr));
//
//            // ✅ Update using DAO
//            ProductDAO dao = new ProductDAO();
//            dao.updateProduct(p);
//
//            // ✅ Redirect to dashboard
//            res.sendRedirect("dashboard.jsp");
//
//        } catch (NumberFormatException e) {
//            res.getWriter().println(" Invalid number format!");
//            e.printStackTrace();
//
//        } catch (Exception e) {
//            res.getWriter().println(" Error while updating product!");
//            e.printStackTrace();
//        }
//    }
//}
package com.inventory.servlet;

import java.io.IOException;

import com.inventory.dao.ProductDAO;
import com.inventory.model.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/UpdateProductServlet")
public class UpdateProductServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        try {
            String idStr = req.getParameter("id");
            String name = req.getParameter("name");
            String category = req.getParameter("category");
            String priceStr = req.getParameter("price");
            String stockStr = req.getParameter("stock");

            // ❌ validation
            if (idStr == null || name == null || category == null ||
                priceStr == null || stockStr == null ||
                name.trim().isEmpty() || category.trim().isEmpty()
                || priceStr.trim().isEmpty() || stockStr.trim().isEmpty()) {

                res.sendRedirect("updateError.jsp");
                return;
            }

            Product p = new Product();
            p.setId(Integer.parseInt(idStr));
            p.setName(name);
            p.setCategory(category);
            p.setPrice(Double.parseDouble(priceStr));
            p.setStock(Integer.parseInt(stockStr));

            ProductDAO dao = new ProductDAO();
            dao.updateProduct(p);

            res.sendRedirect("dashboard.jsp");

        } catch (Exception e) {
            res.sendRedirect("updateError.jsp");
        }
    }
}