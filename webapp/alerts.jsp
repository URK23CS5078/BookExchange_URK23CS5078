<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% if (request.getSession().getAttribute("successMessage") != null) { %>
    <div class="alert alert-success alert-dismissible fade show">
        <%= request.getSession().getAttribute("successMessage") %>
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        <% request.getSession().removeAttribute("successMessage"); %>
    </div>
<% } %>
<% if (request.getSession().getAttribute("errorMessage") != null) { %>
    <div class="alert alert-danger alert-dismissible fade show">
        <%= request.getSession().getAttribute("errorMessage") %>
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        <% request.getSession().removeAttribute("errorMessage"); %>
    </div>
<% } %>