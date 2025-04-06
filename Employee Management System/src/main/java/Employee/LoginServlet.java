package Employee;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public LoginServlet() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (email == null || email.isEmpty() || password == null || password.isEmpty()) {
            response.sendRedirect("login.jsp?error=Missing Email or Password");
            return;
        }

        try {
            // Load MySQL driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Connect to the database
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/employeedb", "root", "ankur");
            System.out.println("Database connection established");

            // Prepare the SQL query
            String sql = "SELECT * FROM users WHERE email=? AND password=?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);
            stmt.setString(2, password);

            System.out.println("Querying for email: " + email + ", password: " + password);

            // Execute the query
            ResultSet rs = stmt.executeQuery();

            // If user exists, set session attributes and redirect
            if (rs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("email", rs.getString("email")); // Store email in session for later use
                session.setAttribute("user", rs.getString("name"));  // Store user's name
                session.setAttribute("role", rs.getString("role")); // Store user's role

                System.out.println("User logged in: " + rs.getString("name") + ", Role: " + rs.getString("role"));

                // Redirect based on role
                if ("admin".equalsIgnoreCase(rs.getString("role"))) { // Case-insensitive comparison
                    response.sendRedirect("welcome_admin.jsp");
                } else {
                    response.sendRedirect("welcome_employee.jsp");
                }
            } else {
                System.out.println("Invalid credentials for email: " + email);
                response.sendRedirect("login.jsp?error=Invalid Credentials");
            }

            // Close resources
            rs.close();
            stmt.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?error=Database Error");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?error=Driver Not Found");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }
}