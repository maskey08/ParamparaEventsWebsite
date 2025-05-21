package com.paramparaevents.util;

import com.paramparaevents.model.UserModel;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

/**
 * @author Pragun Raj Maskey
 */

/**
 * Utility class for managing HTTP sessions in a web application.
 * Provides methods to set, get, remove session attributes and invalidate sessions.
 */
public class SessionUtil {
	// Constants for session attribute names
    private static final String USER_ATTRIBUTE = "user";
    private static final String AUTHENTICATED_ATTRIBUTE = "authenticated";
    private static final String USERNAME_ATTRIBUTE = "username";
    private static final String USER_ROLE_ATTRIBUTE = "userRole";
    
    /**
     * Sets an attribute in the session.
     *
     * @param request the HttpServletRequest from which the session is obtained
     * @param key     the key under which the attribute is stored
     * @param value   the value of the attribute to store in the session
     */
    public static void setAttribute(HttpServletRequest request, String key, Object value) {
        HttpSession session = request.getSession();
        session.setAttribute(key, value);
        
    }

    /**
     * Retrieves an attribute from the session.
     *
     * @param request the HttpServletRequest from which the session is obtained
     * @param key     the key of the attribute to retrieve
     * @return the attribute value, or null if the attribute does not exist or the session is invalid
     */
    public static Object getAttribute(HttpServletRequest request, String key) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            return session.getAttribute(key);
        }
        return null;
    }

    /**
     * Removes an attribute from the session.
     *
     * @param request the HttpServletRequest from which the session is obtained
     * @param key     the key of the attribute to remove
     */
    public static void removeAttribute(HttpServletRequest request, String key) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.removeAttribute(key);
        }
    }

    /**
     * Invalidates the current session.
     *
     * @param request the HttpServletRequest from which the session is obtained
     */
    public static void invalidateSession(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
    }
    
    /**
     * Sets the logged-in user in the session.
     *
     * @param request the HttpServletRequest
     * @param user the UserModel object representing the logged-in user
     */
    public static void setLoggedInUser(HttpServletRequest request, UserModel user) {
        HttpSession session = request.getSession();
        session.setAttribute(USER_ATTRIBUTE, user);
        session.setAttribute(AUTHENTICATED_ATTRIBUTE, true);
        session.setAttribute(USERNAME_ATTRIBUTE, user.getUserName());
        session.setAttribute(USER_ROLE_ATTRIBUTE, user.getRole());
    }
    
    /**
     * Gets the logged-in user from the session.
     *
     * @param request the HttpServletRequest
     * @return the UserModel object, or null if not logged in
     */
    public static UserModel getLoggedInUser(HttpServletRequest request) {
        return (UserModel) getAttribute(request, USER_ATTRIBUTE);
    }
    
    /**
     * Checks if a user is logged in.
     *
     * @param request the HttpServletRequest
     * @return true if a user is logged in, false otherwise
     */
    public static boolean isLoggedIn(HttpServletRequest request) {
        Boolean authenticated = (Boolean) getAttribute(request, AUTHENTICATED_ATTRIBUTE);
        return authenticated != null && authenticated;
    }
    
    /**
     * Gets the role of the logged-in user.
     *
     * @param request the HttpServletRequest
     * @return the user's role, or null if not logged in
     */
    public static String getUserRole(HttpServletRequest request) {
        return (String) getAttribute(request, USER_ROLE_ATTRIBUTE);
    }
    
    /**
     * Logs out the current user by removing authentication attributes.
     *
     * @param request the HttpServletRequest
     */
    public static void logout(HttpServletRequest request) {
        removeAttribute(request, USER_ATTRIBUTE);
        removeAttribute(request, AUTHENTICATED_ATTRIBUTE);
        removeAttribute(request, USERNAME_ATTRIBUTE);
        removeAttribute(request, USER_ROLE_ATTRIBUTE);
    }
}