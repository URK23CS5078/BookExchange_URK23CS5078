<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Request Book Exchange</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2>Request Book Exchange</h2>
        <%@ include file="alerts.jsp" %>
        <form action="ExchangeBookServlet" method="post">
            <div class="mb-3">
                <label for="bookId" class="form-label">Book ID</label>
                <input type="number" class="form-control" id="bookId" name="bookId" required>
            </div>
            <button type="submit" class="btn btn-primary">Submit Request</button>
        </form>
    </div>
</body>
</html>