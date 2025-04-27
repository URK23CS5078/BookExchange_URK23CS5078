<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Book Exchange Portal | Share Your Books, Expand Your World</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #4e73df;
            --secondary-color: #f8f9fc;
            --accent-color: #2e59d9;
            --text-dark: #5a5c69;
            --text-light: #858796;
        }
        
        body {
            font-family: 'Nunito', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
            color: var(--text-dark);
            overflow-x: hidden;
        }
        
        .navbar {
            box-shadow: 0 0.15rem 1.75rem 0 rgba(58, 59, 69, 0.15);
            padding: 0.5rem 1rem;
            background: linear-gradient(135deg, var(--primary-color) 0%, var(--accent-color) 100%);
        }
        
        .navbar-brand {
            font-weight: 800;
            font-size: 1.5rem;
            letter-spacing: 0.5px;
        }
        
        .nav-link {
            font-weight: 600;
            padding: 0.5rem 1rem !important;
            border-radius: 0.35rem;
            margin: 0 0.25rem;
            transition: all 0.3s;
        }
        
        .nav-link:hover {
            background-color: rgba(255, 255, 255, 0.2);
        }
        
        .hero-section {
            background: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)), url('https://source.unsplash.com/1600x900/?books,library,reading');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            height: 90vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            color: white;
            text-align: center;
            position: relative;
            overflow: hidden;
        }
        
        .hero-section::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 100px;
            background: linear-gradient(to bottom, transparent, var(--secondary-color));
            z-index: 1;
        }
        
        .hero-content {
            max-width: 800px;
            z-index: 2;
            animation: fadeInUp 1s ease;
        }
        
        .display-4 {
            font-weight: 800;
            margin-bottom: 1.5rem;
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.3);
        }
        
        .lead {
            font-size: 1.5rem;
            margin-bottom: 2.5rem;
            text-shadow: 0 1px 3px rgba(0, 0, 0, 0.3);
        }
        
        .btn-hero {
            padding: 0.75rem 2rem;
            font-weight: 700;
            border-radius: 0.5rem;
            transition: all 0.3s;
            margin: 0 0.5rem;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        }
        
        .btn-hero:hover {
            transform: translateY(-3px);
            box-shadow: 0 7px 20px rgba(0, 0, 0, 0.3);
        }
        
        .btn-hero-primary {
            background-color: white;
            color: var(--primary-color);
        }
        
        .btn-hero-primary:hover {
            background-color: #f8f9fa;
            color: var(--accent-color);
        }
        
        .btn-hero-secondary {
            border: 2px solid white;
            color: white;
            background-color: transparent;
        }
        
        .btn-hero-secondary:hover {
            background-color: rgba(255, 255, 255, 0.1);
            color: white;
        }
        
        .feature-section {
            padding: 5rem 0;
            background-color: var(--secondary-color);
            position: relative;
        }
        
        .section-title {
            font-weight: 800;
            color: var(--primary-color);
            margin-bottom: 3rem;
            position: relative;
            display: inline-block;
        }
        
        .section-title::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 3px;
            background: var(--primary-color);
        }
        
        .feature-card {
            transition: all 0.4s ease;
            margin-bottom: 20px;
            border: none;
            border-radius: 0.5rem;
            overflow: hidden;
            box-shadow: 0 0.15rem 1.75rem 0 rgba(58, 59, 69, 0.1);
            background-color: white;
            height: 100%;
        }
        
        .feature-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 0.5rem 2rem 0 rgba(58, 59, 69, 0.2);
        }
        
        .feature-icon {
            font-size: 3rem;
            margin-bottom: 1.5rem;
            color: var(--primary-color);
            background: linear-gradient(135deg, rgba(78, 115, 223, 0.1) 0%, rgba(78, 115, 223, 0.05) 100%);
            width: 80px;
            height: 80px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
            margin: 0 auto 1.5rem;
        }
        
        .feature-card h4 {
            font-weight: 700;
            color: var(--primary-color);
            margin-bottom: 1rem;
        }
        
        .feature-card p {
            color: var(--text-light);
        }
        
        .testimonial-section {
            padding: 5rem 0;
            background-color: white;
        }
        
        .testimonial-card {
            border-left: 4px solid var(--primary-color);
            box-shadow: 0 0.15rem 1.75rem 0 rgba(58, 59, 69, 0.1);
            padding: 2rem;
            margin: 1rem;
            background-color: var(--secondary-color);
        }
        
        .testimonial-text {
            font-style: italic;
            color: var(--text-dark);
            margin-bottom: 1.5rem;
        }
        
        .testimonial-author {
            font-weight: 700;
            color: var(--primary-color);
        }
        
        .stats-section {
            padding: 4rem 0;
            background: linear-gradient(135deg, var(--primary-color) 0%, var(--accent-color) 100%);
            color: white;
        }
        
        .stat-item {
            text-align: center;
            padding: 1.5rem;
        }
        
        .stat-number {
            font-size: 3rem;
            font-weight: 800;
            margin-bottom: 0.5rem;
        }
        
        .stat-label {
            font-size: 1.2rem;
            opacity: 0.9;
        }
        
        .footer {
            background-color: #1a1a2e;
            color: white;
            padding: 3rem 0;
        }
        
        .footer-links h5 {
            font-weight: 700;
            margin-bottom: 1.5rem;
            color: white;
        }
        
        .footer-links ul {
            list-style: none;
            padding: 0;
        }
        
        .footer-links li {
            margin-bottom: 0.75rem;
        }
        
        .footer-links a {
            color: rgba(255, 255, 255, 0.7);
            text-decoration: none;
            transition: all 0.3s;
        }
        
        .footer-links a:hover {
            color: white;
            padding-left: 5px;
        }
        
        .social-icons a {
            display: inline-block;
            width: 40px;
            height: 40px;
            background-color: rgba(255, 255, 255, 0.1);
            border-radius: 50%;
            text-align: center;
            line-height: 40px;
            margin-right: 10px;
            color: white;
            transition: all 0.3s;
        }
        
        .social-icons a:hover {
            background-color: var(--primary-color);
            transform: translateY(-3px);
        }
        
        .copyright {
            border-top: 1px solid rgba(255, 255, 255, 0.1);
            padding-top: 1.5rem;
            margin-top: 2rem;
        }
        
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        /* Responsive adjustments */
        @media (max-width: 768px) {
            .hero-section {
                height: 80vh;
                background-attachment: scroll;
            }
            
            .display-4 {
                font-size: 2.5rem;
            }
            
            .lead {
                font-size: 1.2rem;
            }
            
            .btn-hero {
                display: block;
                width: 80%;
                margin: 0.5rem auto;
            }
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-dark sticky-top">
        <div class="container">
            <a class="navbar-brand" href="index.jsp">
                <i class="fas fa-book-open me-2"></i>BookExchange
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="studentLogin.jsp"><i class="fas fa-user-graduate me-1"></i> User Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="adminLogin.jsp"><i class="fas fa-user-shield me-1"></i> Admin Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="register.jsp"><i class="fas fa-user-plus me-1"></i> Register</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <div class="hero-section">
        <div class="hero-content container">
            <h1 class="display-4">Discover Exchange Books</h1>
            <p class="lead">Join thousands of readers sharing books, saving money, and building a sustainable reading community.</p>
            <div class="mt-4">
                <a href="studentLogin.jsp" class="btn btn-hero btn-hero-primary"><i class="fas fa-sign-in-alt me-2"></i>User Login</a>
                <a href="register.jsp" class="btn btn-hero btn-hero-secondary"><i class="fas fa-user-plus me-2"></i>Join Now</a>
            </div>
        </div>
    </div>

    <!-- Features Section -->
    <section class="feature-section">
        <div class="container">
            <h2 class="text-center section-title">How It Works</h2>
            <div class="row">
                <div class="col-lg-4 col-md-6">
                    <div class="card feature-card p-4 text-center">
                        <div class="feature-icon">
                            <i class="fas fa-search"></i>
                        </div>
                        <div class="card-body">
                            <h4>Browse Books</h4>
                            <p>Explore our extensive collection of books across all genres. Find exactly what you're looking for with our powerful search tools.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="card feature-card p-4 text-center">
                        <div class="feature-icon">
                            <i class="fas fa-exchange-alt"></i>
                        </div>
                        <div class="card-body">
                            <h4>Request Exchange</h4>
                            <p>Connect with other readers to exchange books. Our system makes it easy to arrange swaps with nearby users.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="card feature-card p-4 text-center">
                        <div class="feature-icon">
                            <i class="fas fa-users"></i>
                        </div>
                        <div class="card-body">
                            <h4>Join Community</h4>
                            <p>Become part of a vibrant reading community. Share reviews, join discussions, and meet fellow book lovers.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Stats Section -->
    <section class="stats-section">
        <div class="container">
            <div class="row text-center">
                <div class="col-md-3 col-6 stat-item">
                    <div class="stat-number">10,000+</div>
                    <div class="stat-label">Books Available</div>
                </div>
                <div class="col-md-3 col-6 stat-item">
                    <div class="stat-number">5,000+</div>
                    <div class="stat-label">Active Users</div>
                </div>
                <div class="col-md-3 col-6 stat-item">
                    <div class="stat-number">15,000+</div>
                    <div class="stat-label">Exchanges Made</div>
                </div>
                <div class="col-md-3 col-6 stat-item">
                    <div class="stat-number">100+</div>
                    <div class="stat-label">Genres Covered</div>
                </div>
            </div>
        </div>
    </section>

    <!-- Testimonials Section -->
    <section class="testimonial-section">
        <div class="container">
            <h2 class="text-center section-title">What Our Users Say</h2>
            <div class="row">
                <div class="col-md-4">
                    <div class="testimonial-card">
                        <p class="testimonial-text">"I've saved hundreds of dollars by exchanging books instead of buying new ones. The community is amazing!"</p>
                        <div class="testimonial-author">- Sarah J., Avid Reader</div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="testimonial-card">
                        <p class="testimonial-text">"As a student, this portal has been a lifesaver. I get all my textbooks here at no cost!"</p>
                        <div class="testimonial-author">- Michael T., College Student</div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="testimonial-card">
                        <p class="testimonial-text">"The easiest way to declutter my bookshelf while finding new books to read. Win-win!"</p>
                        <div class="testimonial-author">- Priya K., Book Collector</div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Call to Action -->
    <section class="py-5 bg-light">
        <div class="container text-center py-4">
            <h2 class="mb-4">Ready to Start Your Book Exchange Journey?</h2>
            <a href="register.jsp" class="btn btn-primary btn-lg px-5 py-3"><i class="fas fa-user-plus me-2"></i>Join Now - It's Free!</a>
        </div>
    </section>

    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 mb-4">
                    <h5><i class="fas fa-book-open me-2"></i>BookExchange</h5>
                    <p class="mt-3">Connecting readers worldwide through the power of book sharing. Our mission is to make reading accessible to everyone.</p>
                    <div class="social-icons mt-4">
                        <a href="#"><i class="fab fa-facebook-f"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                        <a href="#"><i class="fab fa-instagram"></i></a>
                        <a href="#"><i class="fab fa-linkedin-in"></i></a>
                    </div>
                </div>
                <div class="col-lg-2 col-md-6 mb-4">
                    <h5>Quick Links</h5>
                    <ul>
                        <li><a href="index.jsp">Home</a></li>
                        <li><a href="studentLogin.jsp">User Login</a></li>
                        <li><a href="adminLogin.jsp">Admin Login</a></li>
                        <li><a href="register.jsp">Register</a></li>
                    </ul>
                </div>
                <div class="col-lg-2 col-md-6 mb-4">
                    <h5>Resources</h5>
                    <ul>
                        <li><a href="#">FAQ</a></li>
                        <li><a href="#">How It Works</a></li>
                        <li><a href="#">Book Guidelines</a></li>
                        <li><a href="#">Community Rules</a></li>
                    </ul>
                </div>
                <div class="col-lg-4 mb-4">
                    <h5>Contact Us</h5>
                    <ul>
                        <li><i class="fas fa-map-marker-alt me-2"></i> 123 Book Street, Knowledge City</li>
                        <li><i class="fas fa-phone me-2"></i> +1 (555) 123-4567</li>
                        <li><i class="fas fa-envelope me-2"></i> info@bookexchange.com</li>
                    </ul>
                </div>
            </div>
            <div class="copyright text-center">
                &copy; 2025 Book Exchange Portal. All rights reserved.
            </div>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>