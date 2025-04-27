package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/StudentLoginServlet")
public class StudentLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Update with your DB details
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/book_exchange";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish DB Connection
            Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD);

            // SQL query to check credentials
            String sql = "SELECT user_id, username FROM users WHERE email = ? AND password = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);
            stmt.setString(2, password);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                // Login successful
                String UserId = rs.getString("user_id");
                String UserName = rs.getString("username");

                HttpSession session = request.getSession();
                session.setAttribute("UserId", UserId);
                session.setAttribute("UserName", UserName);

                // Forward to dashboard or room booking page
                RequestDispatcher dispatcher = request.getRequestDispatcher("dashboard.jsp");
                dispatcher.forward(request, response);
            } else {
                // Invalid login
                request.setAttribute("loginError", "Invalid email or password");
                RequestDispatcher dispatcher = request.getRequestDispatcher("loginFail.jsp");
                dispatcher.forward(request, response);
            }

            rs.close();
            stmt.close();
            conn.close();

        } catch (Exception e) {
            // Handle DB error
            e.printStackTrace();
            request.setAttribute("loginError", "Database Error: " + e.getMessage());
            RequestDispatcher dispatcher = request.getRequestDispatcher("studentLoginForm.jsp");
            dispatcher.forward(request, response);
        }
    }
}
