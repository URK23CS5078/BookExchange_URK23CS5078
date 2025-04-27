package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {
    public static Connection getConnection() throws SQLException {
        try {
            // Replace with your database URL, username, and password
            String url = "jdbc:mysql://localhost:3306/book_exchange";
            String username = "root";
            String password = "root";

            return DriverManager.getConnection(url, username, password);
        } catch (SQLException e) {
            throw new SQLException("Error getting database connection", e);
        }
    }
}
