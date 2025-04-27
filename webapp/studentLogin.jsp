<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Exchange - Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #4361ee;
            --primary-light: #4895ef;
            --primary-dark: #3a0ca3;
            --secondary-color: #3f37c9;
            --light-color: #f8f9fa;
            --dark-color: #212529;
            --accent-color: #4cc9f0;
            --success-color: #4ade80;
        }
        
        body {
            background: linear-gradient(135deg, #f5f7fa 0%, #e4e8f0 100%);
            font-family: 'Poppins', sans-serif;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0;
            padding: 20px;
            overflow: hidden;
        }

        .login-container {
            background: white;
            padding: 2.5rem;
            border-radius: 16px;
            width: 100%;
            max-width: 480px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
            border: none;
            position: relative;
            overflow: hidden;
            z-index: 1;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .login-container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 8px;
            background: linear-gradient(90deg, var(--primary-color), var(--primary-dark));
            z-index: 2;
        }

        .login-container:hover {
            transform: translateY(-5px);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
        }

        .login-header {
            text-align: center;
            margin-bottom: 2.5rem;
            position: relative;
        }

        .login-header h1 {
            font-weight: 600;
            color: var(--primary-color);
            margin-bottom: 0.5rem;
            font-size: 2rem;
            line-height: 1.2;
            position: relative;
            display: inline-block;
        }

        .login-header h1::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 60px;
            height: 3px;
            background: var(--accent-color);
            border-radius: 3px;
        }

        .login-header h1 span {
            display: block;
            font-weight: 700;
            color: var(--dark-color);
            font-size: 2.5rem;
            background: linear-gradient(to right, var(--primary-dark), var(--secondary-color));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            margin-top: 5px;
        }

        .form-label {
            font-weight: 500;
            color: #495057;
            margin-bottom: 0.5rem;
            display: block;
            text-transform: uppercase;
            font-size: 0.8rem;
            letter-spacing: 0.5px;
        }

        .input-group {
            position: relative;
            margin-bottom: 1.5rem;
        }

        .input-group i {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--primary-color);
            z-index: 3;
        }

        .form-control {
            padding: 0.75rem 1rem 0.75rem 2.5rem;
            border-radius: 8px;
            border: 2px solid #e9ecef;
            transition: all 0.3s ease;
            font-size: 1rem;
            height: 50px;
        }

        .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(67, 97, 238, 0.1);
        }

        .btn-login {
            width: 100%;
            padding: 0.75rem;
            border-radius: 8px;
            background: linear-gradient(to right, var(--primary-color), var(--primary-dark));
            border: none;
            color: white;
            font-weight: 600;
            font-size: 1rem;
            letter-spacing: 0.5px;
            transition: all 0.3s ease;
            margin-top: 1.5rem;
            text-transform: uppercase;
            height: 50px;
            position: relative;
            overflow: hidden;
        }

        .btn-login::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(to right, var(--primary-dark), var(--secondary-color));
            transition: all 0.4s ease;
            z-index: -1;
        }

        .btn-login:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(67, 97, 238, 0.3);
        }

        .btn-login:hover::before {
            left: 0;
        }

        .forgot-password {
            text-align: center;
            margin-top: 1.5rem;
        }

        .forgot-password a {
            color: #6c757d;
            text-decoration: none;
            font-size: 0.9rem;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
        }

        .forgot-password a:hover {
            color: var(--primary-color);
            text-decoration: none;
        }

        .forgot-password a i {
            margin-right: 5px;
        }

        .floating-books {
            position: absolute;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            overflow: hidden;
            z-index: -1;
            opacity: 0.1;
        }

        .floating-books i {
            position: absolute;
            color: var(--primary-color);
            font-size: 24px;
            animation: float 15s infinite linear;
        }

        @keyframes float {
            0% {
                transform: translateY(0) rotate(0deg);
                opacity: 1;
            }
            100% {
                transform: translateY(-1000px) rotate(720deg);
                opacity: 0;
            }
        }

        .create-account {
            text-align: center;
            margin-top: 1.5rem;
            font-size: 0.9rem;
            color: #6c757d;
        }

        .create-account a {
            color: var(--primary-color);
            font-weight: 500;
            text-decoration: none;
            transition: all 0.3s ease;
        }

        .create-account a:hover {
            text-decoration: underline;
        }

        @media (max-width: 576px) {
            .login-container {
                padding: 2rem 1.5rem;
            }
            
            .login-header h1 {
                font-size: 1.75rem;
            }
            
            .login-header h1 span {
                font-size: 2rem;
            }
        }

        /* Generate floating books */
        .floating-books i:nth-child(1) {
            left: 10%;
            top: 10%;
            animation-delay: 0s;
            font-size: 18px;
        }
        .floating-books i:nth-child(2) {
            left: 25%;
            top: 20%;
            animation-delay: 2s;
            animation-duration: 18s;
        }
        .floating-books i:nth-child(3) {
            left: 70%;
            top: 15%;
            animation-delay: 4s;
            font-size: 22px;
        }
        .floating-books i:nth-child(4) {
            left: 80%;
            top: 60%;
            animation-delay: 6s;
            animation-duration: 20s;
        }
        .floating-books i:nth-child(5) {
            left: 15%;
            top: 70%;
            animation-delay: 8s;
        }
        .floating-books i:nth-child(6) {
            left: 50%;
            top: 80%;
            animation-delay: 10s;
            font-size: 20px;
        }
    </style>
</head>
<body>
    <div class="login-container animate__animated animate__fadeInUp">
        <div class="floating-books">
            <i class="fas fa-book"></i>
            <i class="fas fa-book-open"></i>
            <i class="fas fa-bookmark"></i>
            <i class="fas fa-book-reader"></i>
            <i class="fas fa-book-medical"></i>
            <i class="fas fa-book-dead"></i>
        </div>
        <div class="login-header">
            <h1>Book Exchange<br><span>Portal</span></h1>
        </div>
        <form action="StudentLoginServlet" method="post">
            <div class="input-group">
                <i class="fas fa-envelope"></i>
                <input type="text" name="email" class="form-control" id="username" required placeholder="Enter your email">
            </div>          
            <div class="input-group">
                <i class="fas fa-lock"></i>
                <input type="password" name="password" class="form-control" id="password" required placeholder="Enter your password">
            </div>
            <button type="submit" class="btn btn-login">
                <span>Login</span>
            </button>
        </form>
        <div class="forgot-password">
            <a href="#"><i class="fas fa-key"></i> Forgot password?</a>
        </div>
        <div class="create-account">
            Don't have an account? <a href="#">Sign up</a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Add animation to form elements
        document.addEventListener('DOMContentLoaded', function() {
            const inputs = document.querySelectorAll('.form-control');
            inputs.forEach((input, index) => {
                input.style.opacity = '0';
                input.style.transform = 'translateY(20px)';
                input.style.animation = `fadeInUp 0.5s ease forwards ${index * 0.1 + 0.3}s`;
            });
        });
    </script>
</body>
</html>