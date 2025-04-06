<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register - Employee Management System</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            height: 100vh;
            font-family: 'Segoe UI', sans-serif;
            background: url('images/nir-himi-uR7et8mkwkg-unsplash.jpg') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .register-box {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(15px);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.4);
            width: 350px;
            text-align: center;
            color: #fff;
        }

        .register-box h2 {
            margin-bottom: 25px;
            font-size: 28px;
        }

        .register-box input,
        .register-box select,
        .register-box button {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: none;
            border-radius: 10px;
            font-size: 16px;
        }

        .register-box input,
        .register-box select {
            background: rgba(255, 255, 255, 0.2);
            color: #fff;
        }

        .register-box input::placeholder {
            color: #ddd;
        }

        .register-box select {
            color: #fff;
        }

        .register-box button {
            background-color: rgba(0, 123, 255, 0.9);
            color: white;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .register-box button:hover {
            background-color: rgba(0, 123, 255, 1);
        }

        .switch-link {
            margin-top: 15px;
            color: #ddd;
        }

        .switch-link a {
            color: #00bfff;
            text-decoration: none;
        }

        .switch-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="register-box">
        <h2>Create Your Account</h2>
        <form action="register" method="post">
            <input type="text" name="name" placeholder="Full Name" required />
            <input type="email" name="email" placeholder="Email" required />
            <input type="password" name="password" placeholder="Password" required />
            
            <select name="role" required>
                <option value="" disabled selected>Select Role</option>
                <option value="employee">Employee</option>
                <option value="admin">Admin</option>
            </select>

            <button type="submit" class="register-btn">Register</button>
        </form>
        <p class="switch-link">Already have an account? <a href="login.jsp">Login here</a></p>
    </div>
</body>
</html>
