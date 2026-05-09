package com.inventory.dao;

import java.sql.*;
import java.util.*;
import com.inventory.model.Product;

public class ProductDAO {

    private Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/inventorydb",
            "root",
            "Isha@#1234"
        );
    }

    // GET ALL PRODUCTS
    public List<Product> getAllProducts() throws Exception {
        List<Product> list = new ArrayList<>();
        Connection con = getConnection();

        PreparedStatement ps = con.prepareStatement("SELECT * FROM products");
        ResultSet rs = ps.executeQuery();

        while(rs.next()){
            Product p = new Product();
            p.setId(rs.getInt(1));
            p.setName(rs.getString(2));
            p.setCategory(rs.getString(3));
            p.setPrice(rs.getDouble(4));
            p.setStock(rs.getInt(5));
            list.add(p);
        }
        return list;
    }

    // ADD PRODUCT
    public void addProduct(Product p) throws Exception {
        Connection con = getConnection();
        PreparedStatement ps = con.prepareStatement(
            "INSERT INTO products(name, category, price, stock) VALUES (?,?,?,?)"
        );
        ps.setString(1, p.getName());
        ps.setString(2, p.getCategory());
        ps.setDouble(3, p.getPrice());
        ps.setInt(4, p.getStock());
        ps.executeUpdate();
    }

    // DELETE PRODUCT
    public void deleteProduct(int id) throws Exception {
        Connection con = getConnection();
        PreparedStatement ps = con.prepareStatement("DELETE FROM products WHERE id=?");
        ps.setInt(1, id);
        ps.executeUpdate();
    }

    // UPDATE PRODUCT
    public void updateProduct(Product p) throws Exception {
        Connection con = getConnection();
        PreparedStatement ps = con.prepareStatement(
            "UPDATE products SET name=?, category=?, price=?, stock=? WHERE id=?"
        );
        ps.setString(1, p.getName());
        ps.setString(2, p.getCategory());
        ps.setDouble(3, p.getPrice());
        ps.setInt(4, p.getStock());
        ps.setInt(5, p.getId());
        ps.executeUpdate();
    }

    // SELL PRODUCT (reduce stock)
    public void sellProduct(int id, int qty) throws Exception {
        Connection con = getConnection();
        PreparedStatement ps = con.prepareStatement(
            "UPDATE products SET stock = stock - ? WHERE id=? AND stock >= ?"
        );
        ps.setInt(1, qty);
        ps.setInt(2, id);
        ps.setInt(3, qty);
        ps.executeUpdate();
    }
}