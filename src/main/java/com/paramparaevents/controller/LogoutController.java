package com.paramparaevents.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.logging.Logger;

import com.paramparaevents.util.CookieUtil;
import com.paramparaevents.util.SessionUtil;

/**
 * Controller for handling user logout
 */
@WebServlet(asyncSupported=true, urlPatterns ={"/logout"})
public class LogoutController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(LogoutController.class.getName());

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        logger.info("Processing logout");

        // Invalidate session
        SessionUtil.invalidateSession(req);
        logger.info("Session invalidated using SessionUtil");

        // Delete userRole cookie
        CookieUtil.deleteCookie(resp, "userRole");
        logger.info("userRole cookie deleted");

        // Redirect to home page
        resp.sendRedirect(req.getContextPath() + "/home");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        logger.info("Logout doPost()");
        doGet(req, resp);
    }
}