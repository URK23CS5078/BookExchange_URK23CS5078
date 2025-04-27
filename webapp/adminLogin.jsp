<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <title>Admin Login</title>

    <style>

        body {

            font-family: 'Segoe UI', sans-serif;

            background: #f2f2f2;

        }

        .login-box {

            background: white;

            padding: 25px;

            margin: 100px auto;

            width: 320px;

            border-radius: 10px;

            box-shadow: 0px 0px 10px #aaa;

        }

        h2 {

            text-align: center;

            margin-bottom: 20px;

        }

        input[type="text"], input[type="password"] {

            width: 100%;

            padding: 12px;

            margin: 8px 0 16px;

            border: 1px solid #ccc;

            border-radius: 6px;

        }

        input[type="submit"] {

            background-color: #007bff;

            color: white;

            border: none;

            padding: 12px;

            width: 100%;

            border-radius: 6px;

            cursor: pointer;

        }

        input[type="submit"]:hover {

            background-color: #0056b3;

        }

        .error {

            color: red;

            text-align: center;

        }

    </style>

</head>

<body>

    <div class="login-box">

        <h2>Admin Login</h2>

        <form method="post">

            <input type="text" name="username" placeholder="Enter Username" required>

            <input type="password" name="password" placeholder="Enter Password" required>

            <input type="submit" value="Login">

        </form>



        <% 

            String username = request.getParameter("username");

            String password = request.getParameter("password");

            

            if (username != null && password != null) {

                if (username.equals("admin") && password.equals("shally")) {

                    response.sendRedirect("AdminDashboard.jsp");

                } else {

        %>

                    <p class="error">Invalid credentials! Please try again.</p>

        <%      

                }

            }

        %>

    </div>

</body>

</html>