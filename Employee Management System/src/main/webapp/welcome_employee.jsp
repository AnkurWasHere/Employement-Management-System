<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Welcome Employee</title>
    <link rel="stylesheet" href="style.css">
</head>
<body class="welcome-page">

	<header class="navbar">
        <div class="logo">A2372022008</div>
        <nav>
            <a href="index.jsp">Home</a>
            <a href="about.jsp">About</a>
            <a href="contact.jsp" class="active">Contact</a>
        </nav>
    </header>

    <div class="welcome-box">
        <h1>Welcome, Employee!</h1>
        <p>We're glad to have you onboard.</p>

        <%
            HttpSession session3 = request.getSession(false); // Retrieve the current session
            if (session3 != null && session3.getAttribute("email") != null) {
                String email = (String) session3.getAttribute("email");
        %>
                <a class="view-btn" href="EmployeeServlet?email=<%= email %>">View Details</a>
        <%
            } else {
        %>
                <p class="error-msg">User session not found. Please log in again.</p>
                <a class="view-btn" href="login.jsp">Go to Login</a>
        <%
            }
        %>
    </div>

</body>
</html>
