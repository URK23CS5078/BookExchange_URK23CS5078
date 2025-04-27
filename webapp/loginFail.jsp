<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login Failed</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #ffe6e6;
            text-align: center;
            padding-top: 100px;
        }
        .error-box {
            background-color: #fff;
            border: 1px solid #ff4d4d;
            padding: 20px;
            display: inline-block;
            border-radius: 8px;
        }
        .error-box h2 {
            color: #ff0000;
        }
        .btn {
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #ff4d4d;
            color: white;
            border: none;
            border-radius: 5px;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="error-box">
        <h2>Login Failed</h2>
        <p><%= request.getAttribute("loginError") %></p>
        <a href="studentLogin.jsp" class="btn">Try Again</a>
    </div>
</body>
</html>
