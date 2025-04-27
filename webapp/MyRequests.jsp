<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>My Requests</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .badge-pending { background-color: #ffc107; }
        .badge-approved { background-color: #28a745; }
        .badge-rejected { background-color: #dc3545; }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h2>My Exchange Requests</h2>
        <%@ include file="alerts.jsp" %>
        <table class="table table-striped">
            <thead class="thead-dark">
                <tr>
                    <th>Request ID</th>
                    <th>Book Title</th>
                    <th>Author</th>
                    <th>Status</th>
                    <th>Request Date</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${requests}" var="request">
                    <tr>
                        <td>${request.requestId}</td>
                        <td>${request.bookTitle}</td>
                        <td>${request.bookAuthor}</td>
                        <td>
                            <span class="badge badge-${request.status.toLowerCase()}">
                                ${request.status}
                            </span>
                        </td>
                        <td>${request.requestDate}</td>
                        <td>
                            <c:if test="${request.status == 'PENDING'}">
                                <form action="CancelRequestServlet" method="post" style="display:inline;">
                                    <input type="hidden" name="requestId" value="${request.requestId}">
                                    <button type="submit" class="btn btn-sm btn-danger">Cancel</button>
                                </form>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>