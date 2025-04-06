<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employee List</title>
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

    <div class="glass-container">
        <h1>Employee List</h1>
        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Role</th>
            </tr>
            <%
                Connection conn = null;
                Statement stmt = null;
                ResultSet rs = null;
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/employeedb", "root", "ankur");
                    stmt = conn.createStatement();
                    rs = stmt.executeQuery("SELECT * FROM users");

                    while (rs.next()) {
            %>
                <tr>
                    <td><%= rs.getInt("id") %></td>
                    <td><%= rs.getString("name") %></td>
                    <td><%= rs.getString("email") %></td>
                    <td><%= rs.getString("role") %></td>
                </tr>
            <%
                    }
                } catch (SQLException e) {
                    out.println("<tr><td colspan='4' class='error'>Database Error: " + e.getMessage() + "</td></tr>");
                } catch (ClassNotFoundException e) {
                    out.println("<tr><td colspan='4' class='error'>Driver Error: " + e.getMessage() + "</td></tr>");
                } finally {
                    if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
                    if (stmt != null) try { stmt.close(); } catch (SQLException ignore) {}
                    if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
                }
            %>
        </table>
    </div>
</body>
</html>
