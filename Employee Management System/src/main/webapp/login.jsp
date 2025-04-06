<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<header class="navbar">
        <div class="logo">A2372022008</div>
        <nav>
            <a href="index.jsp">Home</a>
            <a href="about.jsp">About</a>
            <a href="contact.jsp" class="active">Contact</a>
        </nav>
    </header>

    <div class="login-page">
        <div class="login-box">
            <h2>Login</h2>
            <form action="login" method="post">
                <input type="email" name="email" placeholder="username@gmail.com" required />
                <input type="password" name="password" placeholder="Password" required />
                            
                <button type="submit" class="login-btn">Sign in</button>
            </form>
 

            <div class="signup-link">
                Don’t have an account? <a href="register.jsp">Register Now.</a>
            </div>
        </div>
    </div>

</body>
</html>
