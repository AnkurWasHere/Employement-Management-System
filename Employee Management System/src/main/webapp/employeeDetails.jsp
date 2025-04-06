<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employee Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f4;
        }
        .container {
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            max-width: 500px;
            margin: auto;
            text-align: center;
        }
        h1 {
            color: #333;
        }
        p {
            color: #555;
            font-size: 16px;
        }
        .label {
            font-weight: bold;
            color: #222;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Employee Personal Details</h1>
        <p><span class="label">Name:</span> <%= request.getAttribute("name") != null ? request.getAttribute("name") : "N/A" %></p>
        <p><span class="label">Email:</span> <%= request.getAttribute("email") != null ? request.getAttribute("email") : "N/A" %></p>
        <p><span class="label">Role:</span> <%= request.getAttribute("role") != null ? request.getAttribute("role") : "N/A" %></p>
        <p><span class="label">Employee ID:</span> <%= request.getAttribute("id") != null ? request.getAttribute("id") : "N/A" %></p>
    </div>
</body>
</html>