<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Book Exchange Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #4361ee;
            --primary-light: #4895ef;
            --primary-dark: #3a0ca3;
            --secondary-color: #3f37c9;
            --accent-color: #4cc9f0;
            --light-color: #f8f9fa;
            --dark-color: #212529;
            --success-color: #4ade80;
        }
        
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f5f7fa;
            color: var(--dark-color);
        }
        
        .navbar {
            background: linear-gradient(135deg, var(--primary-color) 0%, var(--primary-dark) 100%);
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            padding: 0.8rem 0;
        }
        
        .navbar-brand {
            font-weight: 700;
            font-size: 1.5rem;
            letter-spacing: 0.5px;
        }
        
        .nav-link {
            font-weight: 500;
            transition: all 0.3s ease;
        }
        
        .nav-link:hover {
            opacity: 0.8;
        }
        
        .welcome-text {
            font-weight: 500;
            margin-right: 1rem;
        }
        
        .dashboard-container {
            padding: 3rem 0;
        }
        
        .dashboard-header {
            text-align: center;
            margin-bottom: 3rem;
        }
        
        .dashboard-header h2 {
            font-weight: 700;
            color: var(--primary-dark);
            margin-bottom: 1rem;
            position: relative;
            display: inline-block;
        }
        
        .dashboard-header h2::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 4px;
            background: var(--accent-color);
            border-radius: 2px;
        }
        
        .dashboard-header p {
            color: #6c757d;
            font-size: 1.1rem;
            max-width: 700px;
            margin: 0 auto;
        }
        
        .dashboard-card {
            transition: all 0.3s ease;
            cursor: pointer;
            height: 100%;
            border: none;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            position: relative;
            background: white;
            margin-bottom: 1.5rem;
        }
        
        .dashboard-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 5px;
            background: linear-gradient(90deg, var(--primary-color), var(--primary-dark));
        }
        
        .dashboard-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
        }
        
        .card-body {
            padding: 2rem;
            text-align: center;
        }
        
        .card-icon {
            font-size: 2.5rem;
            margin-bottom: 1.5rem;
            color: var(--primary-color);
            background: linear-gradient(to right, var(--primary-color), var(--primary-dark));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
        
        .card-title {
            font-weight: 600;
            margin-bottom: 1rem;
            color: var(--dark-color);
        }
        
        .card-text {
            color: #6c757d;
            margin-bottom: 1.5rem;
            font-size: 0.95rem;
        }
        
        .btn-card {
            background: linear-gradient(to right, var(--primary-color), var(--primary-dark));
            border: none;
            border-radius: 8px;
            padding: 0.5rem 1.5rem;
            font-weight: 500;
            letter-spacing: 0.5px;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }
        
        .btn-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(67, 97, 238, 0.3);
        }
        
        .btn-card::before {
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
        
        .btn-card:hover::before {
            left: 0;
        }
        
        @media (max-width: 768px) {
            .dashboard-header {
                margin-bottom: 2rem;
            }
            
            .dashboard-header h2 {
                font-size: 1.8rem;
            }
            
            .card-body {
                padding: 1.5rem;
            }
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container">
            <a class="navbar-brand" href="#">
                <i class="fas fa-book-open me-2"></i>Book Exchange Portal
            </a>
            <div class="navbar-nav ms-auto align-items-center">
                <span class="welcome-text text-white">
                    <i class="fas fa-user-circle me-2"></i>Welcome, ${name}
                </span>
                <a class="nav-link btn btn-outline-light btn-sm" href="index.jsp">
                    <i class="fas fa-sign-out-alt me-1"></i>Logout
                </a>
            </div>
        </div>
    </nav>

    <!-- Dashboard Content -->
    <div class="dashboard-container">
        <div class="container">
            <div class="dashboard-header">
                <h2>Book Exchange Dashboard</h2>
                <p>Manage your book exchanges, browse available books, and connect with other readers</p>
            </div>
            
            <div class="row justify-content-center">

                <!-- Available Books -->
                <div class="col-lg-3 col-md-6">
                    <div class="card dashboard-card">
                        <div class="card-body">
                            <div class="card-icon">
                                <i class="fas fa-book"></i>
                            </div>
                            <h5 class="card-title">Available Books</h5>
                            <p class="card-text">Browse our collection of available books for exchange</p>
                            <a href="AvailableBooks.jsp" class="btn btn-card">
                                <i class="fas fa-search me-2"></i>Browse
                            </a>
                        </div>
                    </div>
                </div>

                <!-- Book Exchange -->
                <div class="col-lg-3 col-md-6">
                    <div class="card dashboard-card">
                        <div class="card-body">
                            <div class="card-icon">
                                <i class="fas fa-exchange-alt"></i>
                            </div>
                            <h5 class="card-title">Book Exchange</h5>
                            <p class="card-text">Connect with peers for book exchanges</p>
                            <a href="ExchangeBook.jsp" class="btn btn-card">
                                <i class="fas fa-handshake me-2"></i>Exchange Now
                            </a>
                        </div>
                    </div>
                </div>

                <!-- Add Book -->
                <div class="col-lg-3 col-md-6">
                    <div class="card dashboard-card">
                        <div class="card-body">
                            <div class="card-icon">
                                <i class="fas fa-plus-circle"></i>
                            </div>
                            <h5 class="card-title">Add Books</h5>
                            <p class="card-text">Contribute your books to the exchange community</p>
                            <a href="AddBook.jsp" class="btn btn-card">
                                <i class="fas fa-upload me-2"></i>Add Book
                            </a>
                        </div>
                    </div>
                </div>

                <!-- My Requests -->
                <div class="col-lg-3 col-md-6">
                    <div class="card dashboard-card">
                        <div class="card-body">
                            <div class="card-icon">
                                <i class="fas fa-list-alt"></i>
                            </div>
                            <h5 class="card-title">My Requests</h5>
                            <p class="card-text">Track your current exchange requests and status</p>
                            <a href="MyRequests.jsp" class="btn btn-card">
                                <i class="fas fa-tasks me-2"></i>View Requests
                            </a>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>