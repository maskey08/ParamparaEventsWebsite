package com.paramparaevents.filter;

import java.io.IOException;
import java.util.Set;
import java.util.regex.Pattern;

import com.paramparaevents.model.UserModel;
import com.paramparaevents.util.SessionUtil;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebFilter("/*")
public class AuthenticationFilter implements Filter {
    // Define access patterns using collections
    private static final Set<String> PUBLIC_PATHS = Set.of(
       "/logout",  "/login", "/registration", "/home", "/", "/aboutus", "/contactus", "/gallery", "/services"
    );
    
    private static final Set<String> ADMIN_PATHS = Set.of(
    	"/logout", "/dashboard", "/AddUser", "/EventManagement", "/UserController"
    );
    
    private static final Set<String> CUSTOMER_PATHS = Set.of(
        "/profile", "/booking", "/logout", "/cart"
    );
    
    private static final Pattern STATIC_RESOURCES = 
        Pattern.compile(".*\\.(css|js|png|jpg|jpeg|gif|svg|woff|woff2|ttf)$");
    
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) 
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        
        String path = getRequestPath(req);
        
        // Allow static resources
        if (STATIC_RESOURCES.matcher(path).matches()) {
            chain.doFilter(request, response);
            return;
        }
        
        // Get user authentication status from session
        UserModel user = SessionUtil.getLoggedInUser(req);
        System.out.println(user);
        boolean isAuthenticated = user != null;
        String role = isAuthenticated ? user.getRole() : null;
        System.out.println(role);
        
        // Handle authorization
        if (isPublicPath(path)) {
            // Public paths accessible to all
            chain.doFilter(request, response);
        } else if (!isAuthenticated) {
            // Not authenticated - redirect to login
            res.sendRedirect(req.getContextPath() + "/login");
        } else if ("admin".equals(role) && isAdminPath(path)) {
            // Admin accessing admin path
            chain.doFilter(request, response);
        } else if ("Customer".equals(role) && isCustomerPath(path)) {
            // Customer accessing customer path
            chain.doFilter(request, response);
        } else {
            // Unauthorized access - redirect based on role
            res.sendRedirect(req.getContextPath() + 
                ("admin".equals(role) ? "/dashboard" : "/home"));
        }
     // In AuthenticationFilter.doFilter()
        System.out.println("Filter processing URI: " + req.getRequestURI());
        System.out.println("User role from session: " + SessionUtil.getUserRole(req));
    }
    
    private String getRequestPath(HttpServletRequest request) {
        String contextPath = request.getContextPath();
        String uri = request.getRequestURI();
        return uri.substring(contextPath.length());
    }
    
    private boolean isPublicPath(String path) {
        return PUBLIC_PATHS.stream().anyMatch(path::equals);
    }
    
    private boolean isAdminPath(String path) {
        return ADMIN_PATHS.stream().anyMatch(path::startsWith);
    }
    
    private boolean isCustomerPath(String path) {
        return CUSTOMER_PATHS.stream().anyMatch(path::startsWith);
    }
}