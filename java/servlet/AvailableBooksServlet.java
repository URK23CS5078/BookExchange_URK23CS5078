package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AvailableBooksServlet")
public class AvailableBooksServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/book_exchange";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Get raw parameters without trim()
        String bookTitle = request.getParameter("bookTitle");
        String userName = request.getParameter("user_name");
        String userEmail = request.getParameter("user_email");
        String userPhone = request.getParameter("user_phone");

        // Basic null checks (replaces trim() validation)
        if (bookTitle == null || bookTitle.isEmpty() ||
            userName == null || userName.isEmpty() ||
            userEmail == null || userEmail.isEmpty()) {
            
            request.setAttribute("error", "Required fields are missing");
            request.getRequestDispatcher("errorPage.jsp").forward(request, response);
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD);
                 PreparedStatement stmt = conn.prepareStatement(
                     "INSERT INTO book_requestt (book_title, user_name, user_email, user_phone) VALUES (?, ?, ?, ?)")) {
                
                // Set parameters exactly as received
                stmt.setString(1, bookTitle);
                stmt.setString(2, userName);
                stmt.setString(3, userEmail);
                stmt.setString(4, userPhone); // Can be null
                
                int rowsAffected = stmt.executeUpdate();
                
                if (rowsAffected > 0) {
                    response.sendRedirect("registerSuccess.jsp");
                } else {
                    throw new ServletException("Failed to insert record");
                }
            }
        } catch (Exception e) {
            request.setAttribute("error", "Error processing request: " + e.getMessage());
            request.getRequestDispatcher("errorPage.jsp").forward(request, response);
        }
    }
}