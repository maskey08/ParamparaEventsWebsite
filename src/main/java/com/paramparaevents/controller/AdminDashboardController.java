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
import java.util.ArrayList;
import java.util.List;

import com.paramparaevents.config.DbConfig;
import com.paramparaevents.model.UserModel;

/**
 * Servlet implementation class admin
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/dashboard" })
public class AdminDashboardController extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    /**
     * Handles HTTP GET requests by retrieving user information and forwarding
     * the request to the dashboard JSP page.
     * 
     * @param request  The HttpServletRequest object containing the request data.
     * @param response The HttpServletResponse object used to return the response.
     * @throws ServletException If an error occurs during request processing.
     * @throws IOException      If an input or output error occurs.
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Get recent users for dashboard display
        try {
            Connection conn = DbConfig.getDbConnection();
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM customer ORDER BY Customer_ID DESC LIMIT 6");
            ResultSet rs = ps.executeQuery();
            
            List<UserModel> recentUsers = new ArrayList<>();
            while (rs.next()) {
                UserModel user = new UserModel(
                    rs.getInt("Customer_ID"),
                    rs.getString("Username"),
                    rs.getString("Email"),
                    rs.getString("Phone_Number")
                );
                user.setPassword(rs.getString("Password"));
                recentUsers.add(user);
            }
            
            request.setAttribute("recentUsers", recentUsers);
            
            // Count total users
            PreparedStatement countPs = conn.prepareStatement("SELECT COUNT(*) as total FROM customer");
            ResultSet countRs = countPs.executeQuery();
            int totalUsers = 0;
            if (countRs.next()) {
                totalUsers = countRs.getInt("total");
            }
            
            request.setAttribute("totalUsers", totalUsers);
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Database error: " + e.getMessage());
        }
        
        request.getRequestDispatcher("/WEB-INF/pages/adminDashboard.jsp").forward(request, response);
    }
}
