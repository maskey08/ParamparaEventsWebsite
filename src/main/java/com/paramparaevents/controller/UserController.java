package com.paramparaevents.controller;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import com.paramparaevents.model.UserModel;
import java.util.List;
import java.util.ArrayList;
import java.sql.Connection;

import com.paramparaevents.config.DbConfig;

import java.sql.*;

@WebServlet(asyncSupported = true, urlPatterns = {"/UserController"})
public class UserController extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) action = "list";

        switch (action) {
            case "add":
                req.getRequestDispatcher("/WEB-INF/pages/adduser.jsp").forward(req, res);
                break;

            case "edit":
                int id = Integer.parseInt(req.getParameter("id"));
                UserModel editUser = getUserById(id);
                req.setAttribute("editUser", editUser);
                req.getRequestDispatcher("/WEB-INF/pages/adduser.jsp").forward(req, res);
                break;

            case "delete":
                int deleteId = Integer.parseInt(req.getParameter("id"));
                deleteUser(deleteId);
                req.getRequestDispatcher("/WEB-INF/pages/adduser.jsp").forward(req, res);
                break;

            default:
                List<UserModel> users = getAllUsers();
                req.setAttribute("userList", users);
                req.getRequestDispatcher("/WEB-INF/pages/usermanagement.jsp").forward(req, res);
                break;
        }
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        try {
            // Log the received parameters
            System.out.println("Received POST request with parameters:");
            System.out.println("ID: " + req.getParameter("id"));
            System.out.println("Name: " + req.getParameter("name"));
            System.out.println("Email: " + req.getParameter("email"));
            System.out.println("Phone: " + req.getParameter("phone"));
            System.out.println("Password: " + req.getParameter("password"));
            
            // Parse ID (if it exists)
            String idStr = req.getParameter("id");
            int id = 0;
            if (idStr != null && !idStr.isEmpty() && !idStr.equals("0")) {
                id = Integer.parseInt(idStr);
            }
            
            String name = req.getParameter("name");
            String email = req.getParameter("email");
            String phone = req.getParameter("phone");
            String password = req.getParameter("password");
            
            // Create user model
            UserModel user = new UserModel(id, name, email, phone);
            user.setPassword(password);
            
            // Check if user exists
            if (id == 0 || getUserById(id) == null) {
                System.out.println("Adding new user: " + name);
                addUser(user);
            } else {
                System.out.println("Updating existing user: " + name);
                updateUser(user);
            }
            
            // Redirect to user list
            res.sendRedirect("UserController");
            
        } catch (Exception e) {
            System.out.println("Error in doPost: " + e.getMessage());
            e.printStackTrace();
            req.setAttribute("error", "Error processing form: " + e.getMessage());
            req.getRequestDispatcher("/WEB-INF/pages/adduser.jsp").forward(req, res);
        }
    }

    private List<UserModel> getAllUsers() {
        List<UserModel> list = new ArrayList<>();
        try (Connection conn = DbConfig.getDbConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM customer")) {
            
            System.out.println("Executing getAllUsers query");
            
            while (rs.next()) {
                UserModel user = new UserModel(
                    rs.getInt("Customer_ID"),
                    rs.getString("Username"),
                    rs.getString("Email"),
                    rs.getString("Phone_Number")
                );
                user.setPassword(rs.getString("Password"));
                list.add(user);
                System.out.println("Found user: " + user.getUserName() + " with ID: " + user.getId());
            }
            
            System.out.println("Total users found: " + list.size());
        } catch (Exception e) {
            System.out.println("Error getting all users: " + e.getMessage());
            e.printStackTrace();
        }
        return list;
    }

    private UserModel getUserById(int id) {
        try (Connection conn = DbConfig.getDbConnection();
             PreparedStatement ps = conn.prepareStatement("SELECT * FROM customer WHERE Customer_ID = ?")) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                UserModel user = new UserModel(
                    rs.getInt("Customer_ID"),
                    rs.getString("Username"),
                    rs.getString("Email"),
                    rs.getString("Phone_Number")
                );
                user.setPassword(rs.getString("Password"));
                return user;
            }
        } catch (Exception e) {
            System.out.println("Error getting user by ID: " + e.getMessage());
            e.printStackTrace();
        }
        return null;
    }

    private void addUser(UserModel user) {
        Connection conn = null;
        PreparedStatement ps = null;
        
        try {
            conn = DbConfig.getDbConnection();
            
            // If ID is 0, let MySQL auto-increment handle it
            if (user.getId() == 0) {
                ps = conn.prepareStatement(
                    "INSERT INTO customer (Username, Email, Phone_Number, Password) VALUES (?, ?, ?, ?)",
                    Statement.RETURN_GENERATED_KEYS);
                ps.setString(1, user.getUserName());
                ps.setString(2, user.getEmail());
                ps.setString(3, user.getNumber());
                ps.setString(4, user.getPassword());
            } else {
                ps = conn.prepareStatement(
                    "INSERT INTO customer (Customer_ID, Username, Email, Phone_Number, Password) VALUES (?, ?, ?, ?, ?)");
                ps.setInt(1, user.getId());
                ps.setString(2, user.getUserName());
                ps.setString(3, user.getEmail());
                ps.setString(4, user.getNumber());
                ps.setString(5, user.getPassword());
            }
            
            int rowsAffected = ps.executeUpdate();
            System.out.println("addUser executed. Rows affected: " + rowsAffected);
            
            // If using auto-increment, get the generated ID
            if (user.getId() == 0 && rowsAffected > 0) {
                ResultSet generatedKeys = ps.getGeneratedKeys();
                if (generatedKeys.next()) {
                    user.setId(generatedKeys.getInt(1));
                    System.out.println("Generated ID: " + user.getId());
                }
            }
            
        } catch (Exception e) {
            System.out.println("Error adding user: " + e.getMessage());
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                System.out.println("Error closing resources: " + e.getMessage());
            }
        }
    }

    private void updateUser(UserModel user) {
        Connection conn = null;
        PreparedStatement ps = null;
        
        try {
            conn = DbConfig.getDbConnection();
            ps = conn.prepareStatement(
                "UPDATE customer SET Username=?, Email=?, Phone_Number=?, Password=? WHERE Customer_ID=?");
            ps.setString(1, user.getUserName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getNumber());
            ps.setString(4, user.getPassword());
            ps.setInt(5, user.getId());
            
            int rowsAffected = ps.executeUpdate();
            System.out.println("updateUser executed. Rows affected: " + rowsAffected);
            
        } catch (Exception e) {
            System.out.println("Error updating user: " + e.getMessage());
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                System.out.println("Error closing resources: " + e.getMessage());
            }
        }
    }

    private void deleteUser(int id) {
        Connection conn = null;
        PreparedStatement ps = null;
        
        try {
            conn = DbConfig.getDbConnection();
            ps = conn.prepareStatement("DELETE FROM customer WHERE Customer_ID=?");
            ps.setInt(1, id);
            
            int rowsAffected = ps.executeUpdate();
            System.out.println("deleteUser executed. Rows affected: " + rowsAffected);
            
        } catch (Exception e) {
            System.out.println("Error deleting user: " + e.getMessage());
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                System.out.println("Error closing resources: " + e.getMessage());
            }
        }
    }
}
