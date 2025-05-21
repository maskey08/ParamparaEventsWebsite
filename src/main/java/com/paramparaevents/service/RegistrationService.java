package com.paramparaevents.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
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

		String customerQuery = "SELECT Customer_ID FROM customer WHERE name = ?";
		String insertQuery = "INSERT INTO customer (Username, Email, Phone_Number, Password) "
				+ "VALUES (?, ?, ?, ?)";

		try (PreparedStatement customerStmt = dbConn.prepareStatement(customerQuery);
				PreparedStatement insertStmt = dbConn.prepareStatement(insertQuery)) {

		

			// Insert user details
	
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
}
