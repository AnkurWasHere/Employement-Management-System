package Employee;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class EmployeeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the logged-in user's email from the session
        HttpSession session = request.getSession(false); // Retrieve existing session if one exists
        if (session == null || session.getAttribute("email") == null) {
            // Redirect if session is expired or email is not found
            response.sendRedirect("login.jsp?error=Session Expired");
            return;
        }

        String email = (String) session.getAttribute("email");

        // Database connection details
        String jdbcURL = "jdbc:mysql://localhost:3306/employeedb";
        String dbUser = "root";
        String dbPassword = "ankur";

        try {
            // Load MySQL driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish connection
            Connection conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

            // Prepare the SQL query to fetch employee details
            String sql = "SELECT * FROM users WHERE email = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);

            // Execute the query
            ResultSet rs = stmt.executeQuery();

            // Check if employee details are found
            if (rs.next()) {
                // Set employee details as request attributes
                request.setAttribute("id", rs.getInt("id"));
                request.setAttribute("name", rs.getString("name"));
                request.setAttribute("email", rs.getString("email"));
                request.setAttribute("role", rs.getString("role"));

                // Forward to employeeDetails.jsp
                request.getRequestDispatcher("employeeDetails.jsp").forward(request, response);
            } else {
                // Redirect to error page if employee details are not found
                response.sendRedirect("error.jsp?error=Employee Not Found");
            }

            // Close resources
            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            // Redirect to error page if a database error occurs
            response.sendRedirect("error.jsp?error=Database Error");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Redirect POST requests to GET method
        doGet(request, response);
    }
}