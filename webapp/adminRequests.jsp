<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard - Book Requests</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .badge-pending { background-color: #ffc107; color: #000; }
        .badge-approved { background-color: #28a745; color: #fff; }
        .badge-rejected { background-color: #dc3545; color: #fff; }
        .action-btns { white-space: nowrap; }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h2 class="mb-4 text-center">All Book Requests</h2>
        
        <%-- Success/Error Messages --%>
        <% if (request.getSession().getAttribute("successMessage") != null) { %>
            <div class="alert alert-success alert-dismissible fade show">
                <%= request.getSession().getAttribute("successMessage") %>
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                <% request.getSession().removeAttribute("successMessage"); %>
            </div>
        <% } %>
        <% if (request.getSession().getAttribute("errorMessage") != null) { %>
            <div class="alert alert-danger alert-dismissible fade show">
                <%= request.getSession().getAttribute("errorMessage") %>
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                <% request.getSession().removeAttribute("errorMessage"); %>
            </div>
        <% } %>
        
        <table class="table table-bordered table-striped">
            <thead class="table-primary">
                <tr>
                    <th>Request ID</th>
                    <th>Book Title</th>
                    <th>Requester Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Request Date</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    Connection conn = null;
                    Statement stmt = null;
                    ResultSet rs = null;
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conn = DriverManager.getConnection(
                            "jdbc:mysql://localhost:3306/book_exchange", "root", "root"
                        );
                        stmt = conn.createStatement();
                        
                        // Query to get all book requests
                        rs = stmt.executeQuery(
                            "SELECT r.id, r.book_title, r.user_name, r.user_email, " +
                            "r.user_phone, r.request_date, r.status " +
                            "FROM book_requests r " +
                            "ORDER BY r.request_date DESC"
                        );
                        
                        while (rs.next()) {
                            String status = rs.getString("status");
                %>
                <tr>
                    <td><%= rs.getInt("id") %></td>
                    <td><%= rs.getString("book_title") %></td>
                    <td><%= rs.getString("user_name") %></td>
                    <td><%= rs.getString("user_email") %></td>
                    <td><%= rs.getString("user_phone") %></td>
                    <td><%= rs.getTimestamp("request_date") %></td>
                    <td>
                        <span class="badge badge-<%= status.toLowerCase() %>">
                            <%= status %>
                        </span>
                    </td>
                    <td class="action-btns">
                        <% if ("PENDING".equals(status)) { %>
                            <form action="ProcessRequestServlet" method="post" style="display:inline;">
                                <input type="hidden" name="requestId" value="<%= rs.getInt("id") %>">
                                <input type="hidden" name="action" value="approve">
                                <button type="submit" class="btn btn-sm btn-success">Approve</button>
                            </form>
                            <button type="button" class="btn btn-sm btn-danger" data-bs-toggle="modal" 
                                data-bs-target="#rejectModal<%= rs.getInt("id") %>">Reject</button>
                            
                            <!-- Reject Modal -->
                            <div class="modal fade" id="rejectModal<%= rs.getInt("id") %>" tabindex="-1">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title">Reject Request</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                        </div>
                                        <form action="ProcessRequestServlet" method="post">
                                            <div class="modal-body">
                                                <input type="hidden" name="requestId" value="<%= rs.getInt("id") %>">
                                                <input type="hidden" name="action" value="reject">
                                                <div class="mb-3">
                                                    <label for="reason" class="form-label">Reason for rejection:</label>
                                                    <textarea class="form-control" id="reason" name="reason" rows="3" required></textarea>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                                <button type="submit" class="btn btn-danger">Confirm Reject</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        <% } %>
                    </td>
                </tr>
                <%
                        }
                    } catch (Exception e) {
                %>
                <tr>
                    <td colspan="8" style="color:red;">Error loading requests: <%= e.getMessage() %></td>
                </tr>
                <%
                    } finally {
                        if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
                        if (stmt != null) try { stmt.close(); } catch (SQLException ignore) {}
                        if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
                    }
                %>
            </tbody>
        </table>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>