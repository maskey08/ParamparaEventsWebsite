package com.paramparaevents.util;

import java.sql.Connection;
import java.sql.SQLException;

import com.paramparaevents.config.DbConfig;

/**
 * Utility class for database connection management.
 * This class uses the DbConfig class to establish database connections.
 */
public class DatabaseUtil {
    
    /**
     * Get a connection to the database using the DbConfig class
     * 
     * @return A database connection
     * @throws SQLException If a database error occurs
     * @throws ClassNotFoundException If the database driver is not found
     */
    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        return DbConfig.getDbConnection();
    }
    
    /**
     * Close database resources safely
     * 
     * @param conn The connection to close
     */
    public static void closeConnection(Connection conn) {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                System.err.println("Error closing connection: " + e.getMessage());
            }
        }
    }
    
    /**
     * Test the database connection
     * 
     * @return boolean indicating if the connection was successful
     */
    public static boolean testConnection() {
        Connection conn = null;
        try {
            conn = getConnection();
            return conn != null && !conn.isClosed();
        } catch (Exception e) {
            System.err.println("Database connection test failed: " + e.getMessage());
            return false;
        } finally {
            closeConnection(conn);
        }
    }
}