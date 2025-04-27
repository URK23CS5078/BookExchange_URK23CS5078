<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registered Successfully</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .success-icon {
            font-size: 5rem;
            color: #198754;
        }
        .card {
            max-width: 600px;
            margin: 0 auto;
        }
    </style>
</head>
<body>
    <div class="container py-5">
        <div class="card text-center shadow">
            <div class="card-body p-5">
                <div class="success-icon mb-4">
                    <i class="bi bi-check-circle-fill"></i>
                </div>
                <h2 class="card-title mb-3">Registered Submitted!</h2>
                <p class="card-text mb-4">Your register has been received successfully. We'll contact you soon.</p>
                <a href="studentLogin.jsp" class="btn btn-primary">Back to login</a>
            </div>
        </div>
    </div>
    
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
</body>
</html>