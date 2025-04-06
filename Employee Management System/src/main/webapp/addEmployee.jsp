<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Employee</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background: url('images/nir-himi-uR7et8mkwkg-unsplash.jpg') no-repeat center center fixed;
            background-size: cover;
            font-family: 'Segoe UI', sans-serif;
            color: #fff;
        }

        .glass-form {
            max-width: 500px;
            margin: 80px auto;
            padding: 40px;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(15px);
            border-radius: 20px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.5);
        }

        h1 {
            text-align: center;
            margin-bottom: 30px;
            font-size: 28px;
            color: #ffffff;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        label {
            font-weight: 500;
            color: #ffffff;
        }

        input, select {
            padding: 10px;
            border: none;
            border-radius: 8px;
            background: rgba(255, 255, 255, 0.15);
            color: #fff;
            font-size: 16px;
            outline: none;
        }

        input::placeholder {
            color: #e0e0e0;
        }

        button {
            padding: 12px;
            border: none;
            border-radius: 8px;
            background: rgba(255, 255, 255, 0.2);
            color: #fff;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        button:hover {
            background: rgba(255, 255, 255, 0.35);
        }
    </style>
</head>
<body>
    <div class="glass-form">
        <h1>Add Employee</h1>
        <form action="AdminServlet" method="post">
            <input type="hidden" name="action" value="add">
            
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" placeholder="Enter full name" required>
            
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" placeholder="Enter email address" required>
            
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" placeholder="Enter password" required>
            
            <label for="role">Role:</label>
            <select id="role" name="role" required>
                <option value="employee">Employee</option>
                <option value="admin">Admin</option>
            </select>
            
            <button type="submit">Add Employee</button>
        </form>
    </div>
</body>
</html>
