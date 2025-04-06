<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employee Management System - Dashboard</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body class="dashboard-page">

    <header class="navbar">
        <div class="logo">A2372022008</div>
    </header>

    <div class="dashboard-container">
        <div class="glass-box">
            <h1>Dashboard</h1>
            <h2>Welcome, <%= session.getAttribute("user") != null ? session.getAttribute("user") : "Guest" %>!</h2>
            <p>Select an action to manage employee records:</p>

            <div class="dashboard-links">
                <a href="viewEmployees.jsp" class="glass-btn">View Employees</a>
                <a href="addEmployee.jsp" class="glass-btn">Add Employee</a>
                <a href="updateEmployee.jsp" class="glass-btn">Update Employee</a>
                <a href="deleteEmployee.jsp" class="glass-btn">Delete Employee</a>
                <a href="logout.jsp" class="glass-btn logout">Logout</a>
            </div>
        </div>
    </div>

</body>
</html>
