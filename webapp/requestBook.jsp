<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    // Declare variables to handle form data
    String bookTitle = request.getParameter("bookTitle");
    String userName = request.getParameter("user_name");
    String userEmail = request.getParameter("user_email");
    String userPhone = request.getParameter("user_phone");

    // Handle form submission if data exists
    if (bookTitle != null && userName != null && userEmail != null && userPhone != null) {
        // SQL logic to insert data into database (You would need a database connection)
        try {
            // Example Database connection (replace with your actual database connection code)
            String url = "jdbc:mysql://localhost:3306/book_exchange";
            String dbUser = "root";
            String dbPassword = "root";
            
            // Establish connection
            Connection conn = DriverManager.getConnection(url, dbUser, dbPassword);
            
            // SQL Insert query
            String query = "INSERT INTO book_requests (book_title, user_name, user_email, user_phone) VALUES (?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, bookTitle);
            stmt.setString(2, userName);
            stmt.setString(3, userEmail);
            stmt.setString(4, userPhone);
            
            // Execute the query
            int result = stmt.executeUpdate();
            if (result > 0) {
                out.println("<p>Your request has been successfully submitted.</p>");
            } else {
                out.println("<p>There was an issue submitting your request.</p>");
            }
            
            // Close resources
            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<p>Error processing the request. Please try again later.</p>");
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Request Book: <%= bookTitle %></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .card {
            max-width: 600px;
            margin: 0 auto;
        }
        .btn-submit {
            background-color: #0d6efd;
            color: white;
        }
        .book-title {
            color: #198754;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="container py-5">
        <div class="card shadow">
            <div class="card-header bg-primary text-white">
                <h2 class="mb-0 text-center">Book Request Form</h2>
            </div>
            <div class="card-body">
                <h4 class="mb-4">You are requesting: <span class="book-title"><%= bookTitle %></span></h4>
                
                <form action="<%= request.getRequestURI() %>" method="post" onsubmit="return validateForm()">
                    <input type="hidden" name="bookTitle" value="<%= bookTitle %>">
                    
                    <div class="mb-3">
                        <label for="user_name" class="form-label">Full Name</label>
                        <input type="text" class="form-control" id="user_name" name="user_name" required 
                               placeholder="Enter your full name">
                    </div>
                    
                    <div class="mb-3">
                        <label for="user_email" class="form-label">Email Address</label>
                        <input type="email" class="form-control" id="user_email" name="user_email" required 
                               placeholder="Enter your email">
                    </div>
                    
                    <div class="mb-3">
                        <label for="user_phone" class="form-label">Phone Number</label>
                        <input type="tel" class="form-control" id="user_phone" name="user_phone" required 
                               placeholder="Enter your phone number">
                    </div>
                    
                    <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                        <a href="AvailableBooks.jsp" class="btn btn-secondary me-md-2">Cancel</a>
                        <button type="submit" class="btn btn-submit">Submit Request</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script>
        function validateForm() {
            const phone = document.getElementById('user_phone').value;
            if (!/^\d{10,15}$/.test(phone)) {
                alert('Please enter a valid phone number (10-15 digits)');
                return false;
            }
            return true;
        }
    </script>
</body>
</html>
