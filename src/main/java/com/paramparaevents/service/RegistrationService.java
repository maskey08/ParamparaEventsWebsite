package com.paramparaevents.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.paramparaevents.config.DbConfig;
import com.paramparaevents.model.UserModel;

public class RegistrationService {
	private Connection dbConn;

	/**
	 * Constructor initializes the database connection.
	 */
	public RegistrationService() {
		try {
			this.dbConn = DbConfig.getDbConnection();
		} catch (SQLException | ClassNotFoundException ex) {
			System.out.println("Database connection error: " + ex.getMessage());
			ex.printStackTrace();
		}
	}
	
	
	/**
	 * Registers a new student in the database.
	 *
	 * @param studentModel the student details to be registered
	 * @return Boolean indicating the success of the operation
	 */
	public Boolean addUser(UserModel userModel) {
	    if (dbConn == null) {
	        System.err.println("Database connection is not available.");
	        return null;
	    }

	    String insertQuery = "INSERT INTO customer (Username, Email, Phone_Number, Password) VALUES (?, ?, ?, ?)";

	    try (
	        PreparedStatement insertStmt = dbConn.prepareStatement(insertQuery)
	    ) {
	       

	        // Insert new user
	        insertStmt.setString(1, userModel.getUserName());
	        insertStmt.setString(2, userModel.getEmail());
	        insertStmt.setString(3, userModel.getNumber());
	        insertStmt.setString(4, userModel.getPassword());

	        return insertStmt.executeUpdate() > 0;

	    } catch (SQLException e) {
	        System.err.println("Error during user registration: " + e.getMessage());
	        e.printStackTrace();
	        return null;
	    }
	}


	public boolean usernameExists(String parameter) {
		 if (dbConn == null) {
		        System.err.println("Database connection is not available.");
		        return false;
		    }

	    String checkUsernameQuery = "SELECT 1 FROM customer WHERE Username = ?";
	    try {
			PreparedStatement checkStmt = dbConn.prepareStatement(checkUsernameQuery);
			 // Check for existing username
	        checkStmt.setString(1, parameter);
	        ResultSet rs = checkStmt.executeQuery();
	        if (rs.next()) {
	            System.out.println("Username already exists: " + parameter);
	            return true;
	        } else {
	        	return false;
	        }
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
}
