<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String name = request.getParameter("name");
    String reason = request.getParameter("reason");
    String book = request.getParameter("bookTitle");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Request Confirmed</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5 text-center">
    <h2>📚 Request Submitted!</h2>
    <p><strong><%= name %></strong>, your request for <strong>"<%= book %>"</strong> has been received.</p>
    <p>Reason: <em><%= reason %></em></p>
    <a href="AvailableBooks.jsp" class="btn btn-primary mt-3">Back to Available Books</a>
</div>

</body>
</html>
