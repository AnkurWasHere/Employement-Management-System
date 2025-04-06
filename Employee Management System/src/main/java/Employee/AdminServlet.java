package Employee;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AdminServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action"); // Determine the action (add, update, delete)

        // Initialize database connection details
        String jdbcURL = "jdbc:mysql://localhost:3306/employeedb";
        String dbUser = "root";
        String dbPassword = "ankur";

        try {
            // Load MySQL driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish connection
            Connection conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

            if ("add".equalsIgnoreCase(action)) {
                addEmployee(request, conn);
                response.sendRedirect("viewEmployees.jsp?success=Employee Added");
            } else if ("update".equalsIgnoreCase(action)) {
                updateEmployee(request, conn);
                response.sendRedirect("viewEmployees.jsp?success=Employee Updated");
            } else if ("delete".equalsIgnoreCase(action)) {
                deleteEmployee(request, conn);
                response.sendRedirect("viewEmployees.jsp?success=Employee Deleted");
            } else {
                response.sendRedirect("error.jsp?error=Invalid Action");
            }

            // Close connection
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp?error=Database Error");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp?error=Driver Not Found");
        }
    }

    private void addEmployee(HttpServletRequest request, Connection conn) throws SQLException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        String sql = "INSERT INTO users (name, email, password, role) VALUES (?, ?, ?, ?)";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, name);
        stmt.setString(2, email);
        stmt.setString(3, password);
        stmt.setString(4, role);

        stmt.executeUpdate();
        stmt.close();
    }

    private void updateEmployee(HttpServletRequest request, Connection conn) throws SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String role = request.getParameter("role");

        String sql = "UPDATE users SET name = ?, email = ?, role = ? WHERE id = ?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, name);
        stmt.setString(2, email);
        stmt.setString(3, role);
        stmt.setInt(4, id);

        stmt.executeUpdate();
        stmt.close();
    }

    private void deleteEmployee(HttpServletRequest request, Connection conn) throws SQLException {
        int id = Integer.parseInt(request.getParameter("id"));

        String sql = "DELETE FROM users WHERE id = ?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, id);

        stmt.executeUpdate();
        stmt.close();
    }
}