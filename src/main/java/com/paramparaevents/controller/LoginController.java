package com.paramparaevents.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.logging.Logger;

import com.paramparaevents.service.LoginService;
import com.paramparaevents.util.CookieUtil;
import com.paramparaevents.util.SessionUtil;
import com.paramparaevents.model.UserModel;

/**
 * Servlet implementation class LoginController
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/login" })
public class LoginController extends HttpServlet {
	 private static final long serialVersionUID = 1L;
	    private static final Logger logger = Logger.getLogger(LoginController.class.getName());
	    private final LoginService loginService;

	    public LoginController() {
	        this.loginService = new LoginService();
	    }

	    @Override
	    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	    	request.setAttribute("showRegister", false);
	        request.getRequestDispatcher("/WEB-INF/pages/userPortal.jsp").forward(request, response);
	        
	    }

	    @Override
	    protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
	            throws ServletException, IOException {
	    	req.setAttribute("showRegister", false);
	        logger.info("Processing login request");
	        
	        try {
	            String userName = req.getParameter("username");
	            String userPassword = req.getParameter("password");

	            // Validate input
	            if (userName == null || userPassword == null || 
	                userName.trim().isEmpty() || userPassword.trim().isEmpty()) {
	                handleLoginFailure(req, resp, false);
	                return;
	            }

	            // Create user object with plain password for comparison
	            UserModel user = new UserModel(userName, userPassword);
	            
	            // Attempt authentication
	            UserModel authenticatedUser = loginService.loginUser(user);
	            
	            if (authenticatedUser != null) {
	                logger.info("UserModel authenticated successfully: " + userName);
	                
	                // Store user information in session
	                SessionUtil.setAttribute(req, "user", authenticatedUser);
	                SessionUtil.setAttribute(req, "userName", authenticatedUser.getUserName());
	                SessionUtil.setAttribute(req, "userRole", authenticatedUser.getRole());
	                
	                // Set role cookie
	                String userRole = authenticatedUser.getRole();
	                CookieUtil.addCookie(resp, "userRole", userRole, 60 * 5);
	                
	                // Redirect based on role
	                switch(userRole.toLowerCase()) {
	                    case "admin":
	                        logger.info("Redirecting admin to dashboard");
	                        resp.sendRedirect(req.getContextPath() + "/dashboard");
	                        break;
	                    case "customer":
	                        logger.info("Redirecting customer to home");
	                        resp.sendRedirect(req.getContextPath() + "/home");
	                        break;
	                    default:
	                        logger.info("Unknown role, redirecting to home");
	                        resp.sendRedirect(req.getContextPath() + "/home");
	                }
	            } else {
	                logger.warning("Authentication failed for user: " + userName);
	                handleLoginFailure(req, resp, false);
	            }
	        } catch (Exception e) {
	            logger.severe("Error during login process: " + e.getMessage());
	            handleLoginFailure(req, resp, null);
	        }
	    }

	    private void handleLoginFailure(HttpServletRequest req, HttpServletResponse resp, Boolean loginStatus) 
	            throws ServletException, IOException {
	        String errorMessage;
	        if (loginStatus == null) {
	            errorMessage = "Our server is under maintenance. Please try again later!";
	            logger.severe("Server error during login");
	        } else {
	            errorMessage = "User credential mismatch. Please try again!";
	            logger.warning("Invalid credentials provided");
	        }
	        req.setAttribute("error", errorMessage);
	        req.getRequestDispatcher("/WEB-INF/pages/userPortal.jsp").forward(req, resp);
	    }
	}