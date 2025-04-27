<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Available Books</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .book-card {
            height: 100%;
            transition: transform 0.3s;
        }

        .book-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
        }

        .book-img {
            height: 300px;
            object-fit: cover;
        }
    </style>
</head>
<body>

    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container">
            <a class="navbar-brand" href="#">Book Exchange Portal</a>
            <div class="navbar-nav ms-auto">
                <a class="nav-link text-white" href="dashboard.jsp">Dashboard</a>

            </div>
        </div>
    </nav>

    <div class="container mt-5">
        <h2 class="mb-4 text-center">Available Books</h2>
        <div class="row row-cols-1 row-cols-md-4 g-4">

            <%-- Example Book Cards --%>
            <%
                String[] titles = {
                    "Harry Potter", "The Alchemist", "Atomic Habits", "To Kill a Mockingbird",
                    "Pride and Prejudice", "1984", "The Book Thief", "The Great Gatsby",
                    "Rich Dad Poor Dad", "The Hobbit", "Jane Eyre", "Wuthering Heights",
                    "Crime and Punishment", "The Catcher in the Rye", "The Kite Runner",
                    "The Subtle Art of Not Giving a F*ck", "Dune", "Sapiens", "Becoming",
                    "Educated", "The Power of Habit", "Thinking, Fast and Slow", "The Secret",
                    "Deep Work", "The Road", "The Giver", "Little Women", "Brave New World",
                    "Anne of Green Gables", "Life of Pi"
                };

                String[] imageLinks = {
                    "https://covers.openlibrary.org/b/id/7984916-L.jpg",
                    "https://covers.openlibrary.org/b/id/8231851-L.jpg",
                    "https://covers.openlibrary.org/b/id/10420421-L.jpg",
                    "https://covers.openlibrary.org/b/id/8225631-L.jpg",
                    "https://covers.openlibrary.org/b/id/8231991-L.jpg",
                    "https://covers.openlibrary.org/b/id/1535413-L.jpg",
                    "https://covers.openlibrary.org/b/id/7222246-L.jpg",
                    "https://covers.openlibrary.org/b/id/8228781-L.jpg",
                    "https://covers.openlibrary.org/b/id/8754837-L.jpg",
                    "https://covers.openlibrary.org/b/id/6979861-L.jpg",
                    "https://covers.openlibrary.org/b/id/10532076-L.jpg",
                    "https://covers.openlibrary.org/b/id/10316754-L.jpg",
                    "https://covers.openlibrary.org/b/id/11146062-L.jpg",
                    "https://covers.openlibrary.org/b/id/8225260-L.jpg",
                    "https://covers.openlibrary.org/b/id/10249891-L.jpg",
                    "https://covers.openlibrary.org/b/id/8377896-L.jpg",
                    "https://covers.openlibrary.org/b/id/10498315-L.jpg",
                    "https://covers.openlibrary.org/b/id/10537537-L.jpg",
                    "https://covers.openlibrary.org/b/id/10237768-L.jpg",
                    "https://covers.openlibrary.org/b/id/9873165-L.jpg",
                    "https://covers.openlibrary.org/b/id/10449457-L.jpg",
                    "https://covers.openlibrary.org/b/id/10463928-L.jpg",
                    "https://covers.openlibrary.org/b/id/8317690-L.jpg",
                    "https://covers.openlibrary.org/b/id/10182327-L.jpg",
                    "https://covers.openlibrary.org/b/id/8376563-L.jpg",
                    "https://covers.openlibrary.org/b/id/10409862-L.jpg",
                    "https://covers.openlibrary.org/b/id/10534567-L.jpg",
                    "https://covers.openlibrary.org/b/id/8765565-L.jpg",
                    "https://covers.openlibrary.org/b/id/7325425-L.jpg",
                    "https://covers.openlibrary.org/b/id/10100485-L.jpg"
                };

                for (int i = 0; i < titles.length; i++) {
            %>
            <div class="col">
                <div class="card book-card h-100">
                    <img src="<%= imageLinks[i] %>" class="card-img-top book-img" alt="Book Image">
                    <div class="card-body text-center">
                        <h5 class="card-title"><%= titles[i] %></h5>
                        <a href="requestBook.jsp?title=<%= titles[i] %>" class="btn btn-outline-primary">Request Book</a>
                    </div>
                </div>
            </div>
            <% } %>

        </div>
    </div>

</body>
</html>