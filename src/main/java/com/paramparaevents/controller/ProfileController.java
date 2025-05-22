package com.paramparaevents.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.paramparaevents.config.DbConfig;
import com.paramparaevents.model.UserModel;
import com.paramparaevents.util.PasswordUtil;

/**
 * Servlet implementation class ProfileController
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/profile"})
public class ProfileController extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    /**
	 * Handles GET requests to the login page.
	 *
	 * @param request  HttpServletRequest object
	 * @param response HttpServletResponse object
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException      if an I/O error occurs
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
        UserModel editUser = getUserById(id);
        request.setAttribute("editUser", editUser);
 
		request.getRequestDispatcher("/WEB-INF/pages/profile.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
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
            String password = PasswordUtil.encrypt(req.getParameter("password"), name);
            
            // Create user model
            UserModel user = new UserModel(id, name, email, phone);
            user.setPassword(password);
            
            
                System.out.println("Updating existing user: " + name);
                updateUser(user);
            
            
            // Redirect to user list
            res.sendRedirect("UserController");
            
        } catch (Exception e) {
            System.out.println("Error in doPost: " + e.getMessage());
            e.printStackTrace();
            req.setAttribute("error", "Error processing form: " + e.getMessage());
            req.getRequestDispatcher("/WEB-INF/pages/adduser.jsp").forward(req, res);
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
	             // Decrypt the password here before setting it
	                String encryptedPassword = rs.getString("Password");
	                String decryptedPassword = PasswordUtil.decrypt(encryptedPassword, rs.getString("Username"));
	                user.setPassword(decryptedPassword);
	                return user;
	            }
	        } catch (Exception e) {
	            System.out.println("Error getting user by ID: " + e.getMessage());
	            e.printStackTrace();
	        }
	        return null;
	    }
}
