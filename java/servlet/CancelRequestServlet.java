package servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import dao.DBUtil;
import java.io.IOException;
import java.sql.*;

@WebServlet("/CancelRequestServlet")
public class CancelRequestServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("user_id");
        
        if (userId == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int requestId = Integer.parseInt(request.getParameter("requestId"));

        try (Connection conn = DBUtil.getConnection()) {
            // Start transaction
            conn.setAutoCommit(false);
            
            try {
                // 1. Get book_id from the request
                int bookId = 0;
                String getBookSql = "SELECT book_id FROM exchange_requests WHERE request_id = ? AND requester_id = ?";
                try (PreparedStatement stmt = conn.prepareStatement(getBookSql)) {
                    stmt.setInt(1, requestId);
                    stmt.setInt(2, userId);
                    ResultSet rs = stmt.executeQuery();
                    if (rs.next()) {
                        bookId = rs.getInt("book_id");
                    } else {
                        throw new ServletException("Request not found or not owned by user");
                    }
                }
                
                // 2. Delete the request
                String deleteSql = "DELETE FROM exchange_requests WHERE request_id = ?";
                try (PreparedStatement stmt = conn.prepareStatement(deleteSql)) {
                    stmt.setInt(1, requestId);
                    stmt.executeUpdate();
                }
                
                // 3. Update book status back to available
                String updateSql = "UPDATE books SET status = 'available' WHERE book_id = ?";
                try (PreparedStatement stmt = conn.prepareStatement(updateSql)) {
                    stmt.setInt(1, bookId);
                    stmt.executeUpdate();
                }
                
                conn.commit();
                response.sendRedirect("MyRequests.jsp?success=Request cancelled successfully");
            } catch (Exception e) {
                conn.rollback();
                throw e;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Database error: " + e.getMessage());
            request.getRequestDispatcher("errorPage.jsp").forward(request, response);
        }
    }
}