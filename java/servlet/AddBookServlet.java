package servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import dao.DBUtil;
import java.io.IOException;
import java.sql.*;

public class AddBookServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Get form parameters
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String category = request.getParameter("category_id");

        // Basic validation
        if (title == null || title.trim().isEmpty() || 
            author == null || author.trim().isEmpty()) {
            request.setAttribute("error", "Title and Author are required");
            request.getRequestDispatcher("AddBook.jsp").forward(request, response);
            return;
        }

        // Database operation
        try (Connection conn = DBUtil.getConnection()) {
            String sql = "INSERT INTO books (title, author, category_id) VALUES (?, ?, ?)";
            
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, title.trim());
                stmt.setString(2, author.trim());
                stmt.setString(3, category != null ? category.trim() : null);
                
                int rowsAffected = stmt.executeUpdate();
                
                if (rowsAffected > 0) {
                    // Set success message instead of redirecting
                    request.setAttribute("success", "Book added successfully!");
                } else {
                    request.setAttribute("error", "Failed to insert book");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Database error: " + e.getMessage());
        }
        
        // Always return to the same page
        request.getRequestDispatcher("AddBook.jsp").forward(request, response);
    }
}