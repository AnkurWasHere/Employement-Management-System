<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    // Invalidate the current session
    HttpSession session2 = request.getSession(false); 
    if (session2 != null) {
        session2.invalidate(); // End the session
    }

    response.sendRedirect("login.jsp");
%>