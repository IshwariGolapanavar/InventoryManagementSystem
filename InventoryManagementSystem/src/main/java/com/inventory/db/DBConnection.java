package com.inventory.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    private static Connection con;

    public static Connection getConnection() {

        try {

            // Load MySQL Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Database Connection
            con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/inventory_db",
                    "root",
                    "Isha@#1234"
            );

            System.out.println("MySQL Connected Successfully");

        } catch (Exception e) {

            e.printStackTrace();
        }

        return con;
    }
}