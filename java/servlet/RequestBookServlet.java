package servlet;
import java.io.*;
import java.net.URLEncoder;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RequestBookServlet")
public class RequestBookServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static final String DB_URL = "jdbc:mysql://localhost:3306/book_exchange";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String bookTitle = request.getParameter("bookTitle");
        String userName = request.getParameter("user_name");
        String userEmail = request.getParameter("user_email");
        String userPhone = request.getParameter("user_phone");
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            
            String query = "INSERT INTO book_requests (book_title, user_name, user_email, user_phone) VALUES (?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, bookTitle);
            stmt.setString(2, userName);
            stmt.setString(3, userEmail);
            stmt.setString(4, userPhone);
            
            int result = stmt.executeUpdate();
            
            stmt.close();
            conn.close();
            
            if (result > 0) {
                request.getSession().setAttribute("successMessage", "Your request has been submitted successfully!");
            } else {
                request.getSession().setAttribute("errorMessage", "Failed to submit your request. Please try again.");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("errorMessage", "Database error occurred. Please try again later.");
        }
        
        response.sendRedirect("requestBook.jsp?bookTitle=" + URLEncoder.encode(bookTitle, "UTF-8"));
    }
}