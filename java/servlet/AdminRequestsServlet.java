package servlet;
import java.io.*;
import java.sql.*;
import java.util.*;
import javax.servlet.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AdminRequestsServlet")
public class AdminRequestsServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static final String DB_URL = "jdbc:mysql://localhost:3306/book_exchange";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root";

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<Map<String, String>> requests = new ArrayList<>();
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            
            String query = "SELECT r.id, r.book_title, r.user_name, r.user_email, " +
                         "r.user_phone, r.request_date, r.status, " +
                         "b.book_id, b.author, b.owner_id " +
                         "FROM book_requests r " +
                         "LEFT JOIN books b ON r.book_title = b.title " +
                         "ORDER BY r.request_date DESC";
            
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            
            while (rs.next()) {
                Map<String, String> requestData = new HashMap<>();
                requestData.put("requestId", rs.getString("id"));
                requestData.put("bookTitle", rs.getString("book_title"));
                requestData.put("bookAuthor", rs.getString("author"));
                requestData.put("userName", rs.getString("user_name"));
                requestData.put("userEmail", rs.getString("user_email"));
                requestData.put("userPhone", rs.getString("user_phone"));
                requestData.put("status", rs.getString("status"));
                requestData.put("requestDate", rs.getString("request_date"));
                requestData.put("bookId", rs.getString("book_id"));
                requestData.put("ownerId", rs.getString("owner_id"));
                requests.add(requestData);
            }
            
            rs.close();
            stmt.close();
            conn.close();
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error loading requests from database");
        }
        
        request.setAttribute("requests", requests);
        request.getRequestDispatcher("adminRequests.jsp").forward(request, response);
    }
}