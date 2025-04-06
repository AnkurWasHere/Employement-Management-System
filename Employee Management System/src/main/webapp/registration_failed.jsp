<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registration Failed</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: url('images/nir-himi-uR7et8mkwkg-unsplash.jpg') no-repeat center center fixed;
            background-size: cover;
            font-family: 'Segoe UI', sans-serif;
            color: #ffffff;
        }

        .container {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(15px);
            border-radius: 20px;
            padding: 40px 50px;
            text-align: center;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.4);
        }

        h1 {
            color: #ff4c4c;
            font-size: 28px;
            margin-bottom: 15px;
        }

        p {
            font-size: 18px;
            margin-bottom: 25px;
            color: #f0f0f0;
        }

        a {
            text-decoration: none;
            color: #fff;
            background-color: rgba(0, 123, 255, 0.85);
            padding: 12px 25px;
            border-radius: 8px;
            font-weight: bold;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        a:hover {
            background-color: rgba(0, 123, 255, 1);
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Registration Failed</h1>
        <p>We're sorry, but there was an issue completing your registration. Please try again.</p>
        <a href="register.jsp">Return to Registration Page</a>
    </div>
</body>
</html>
