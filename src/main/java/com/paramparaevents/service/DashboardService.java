//package com.paramparaevents.service;
//
//import java.sql.Connection;
//import java.sql.Date;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.time.LocalDate;
//import java.util.ArrayList;
//import java.util.List;
//
//import com.paramparaevents.config.DbConfig;
//import com.paramparaevents.model.UserModel;
//
///**
// * Service class for interacting with the database to retrieve dashboard-related
// * data. This class handles database connections and performs queries to fetch
// * User information.
// */
//public class DashboardService {
//
//	private Connection dbConn;
//	private boolean isConnectionError = false;
//
//	/**
//	 * Constructor that initializes the database connection. Sets the connection
//	 * error flag if the connection fails.
//	 */
//	public DashboardService() {
//		try {
//			dbConn = DbConfig.getDbConnection();
//		} catch (SQLException | ClassNotFoundException ex) {
//			// Log and handle exceptions related to database connection
//			ex.printStackTrace();
//			isConnectionError = true;
//		}
//	}
//
//	/**
//	 * Retrieves all users information from the database.
//	 * 
//	 * @return A list of UserModel objects containing User data. Returns null
//	 *         if there is a connection error or if an exception occurs during query
//	 *         execution.
//	 */
//	public List<UserModel> getAllUsersInfo() {
//		if (isConnectionError) {
//			System.out.println("Connection Error!");
//			return null;
//		}
//
//		// SQL query to fetch User details
//		String query = "SELECT customer_id, username, last_name, program_id, email, number FROM customer";
//		try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
//			ResultSet result = stmt.executeQuery();
//			List<UserModel> UserList = new ArrayList<>();
//
//			while (result.next()) {
//				
//				
//
//					
//			}
//			return UserList;
//		} catch (SQLException e) {
//			// Log and handle exceptions related to User query execution
//			e.printStackTrace();
//			return null;
//		}
//	}
//
//	public UserModel getSpecificUserInfo(int UserId) {
//		if (isConnectionError) {
//			System.out.println("Connection Error!");
//			return null;
//		}
//
//		// SQL query to join User and program tables
//		String query = "SELECT s.User_id, s.first_name, s.last_name, s.username, s.dob, s.gender, "
//				+ "s.email, s.number, s.program_id, s.image_path, "
//				+ "p.name AS program_name, p.type AS program_type, p.category AS program_category " + "FROM User s "
//				+ "JOIN program p ON s.program_id = p.program_id " + "WHERE s.User_id = ?";
//
//		try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
//			stmt.setInt(1, UserId);
//			ResultSet result = stmt.executeQuery();
//			UserModel User = null;
//
//			if (result.next()) {
//				// Extract data from the result set
//				int id = result.getInt("User_id");
//				String firstName = result.getString("first_name");
//				String lastName = result.getString("last_name");
//				String userName = result.getString("username");
//				LocalDate dob = result.getDate("dob").toLocalDate(); // Assuming dob is of type DATE in SQL
//				String gender = result.getString("gender");
//				String email = result.getString("email");
//				String number = result.getString("number");
//				String imageUrl = result.getString("image_path");
//
//				
//
//				// Create UserModel instance
//				User = new UserModel(id, firstName, lastName, userName, dob, gender, email, number, ,
//						imageUrl);
//
//				// Add the User to the list
//			}
//			return User;
//		} catch (SQLException e) {
//			// Log and handle exceptions
//			e.printStackTrace();
//			return null;
//		}
//	}
//
//	public List<UserModel> getRecentUsers() {
//		if (isConnectionError) {
//			System.out.println("Connection Error!");
//			return null;
//		}
//
//		// SQL query to fetch User details
//		String query = "SELECT User_id, first_name, last_name, email, number "
//				+ "FROM User ORDER BY User_id DESC LIMIT 3";
//		try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
//			ResultSet result = stmt.executeQuery();
//			List<UserModel> UserList = new ArrayList<>();
//
//			while (result.next()) {
//
//				// Create and add UserModel to the list
//			
//
//			}
//			return UserList;
//		} catch (SQLException e) {
//			// Log and handle exceptions related to User query execution
//			e.printStackTrace();
//			return null;
//		}
//	}
//
//	public boolean updateUser(UserModel User) {
//		if (isConnectionError)
//			return false;
//
//		String updateQuery = "UPDATE User SET first_name = ?, last_name = ?, " + "username = ?, dob = ?, gender = ?,"
//				+ "email = ?, number = ?, program_id = ?, image_path = ? WHERE User_id = ?";
//		try (PreparedStatement stmt = dbConn.prepareStatement(updateQuery)) {
//			stmt.setString(1, User.getFirstName());
//			stmt.setString(2, User.getLastName());
//			stmt.setString(3, User.getUserName());
//			stmt.setDate(4, Date.valueOf(User.getDob()));
//			stmt.setString(5, User.getGender());
//			stmt.setString(6, User.getEmail());
//			stmt.setString(7, User.getNumber());
//			stmt.setInt(8, getProgramId(User.getProgram().getName()));
//			stmt.setString(9, User.getLastName());
//
//			stmt.setInt(10, User.getId());
//
//			int rowsUpdated = stmt.executeUpdate();
//			return rowsUpdated > 0;
//		} catch (SQLException e) {
//			e.printStackTrace();
//			return false;
//		}
//	}
//
//	public boolean deleteUser(int UserId) {
//		if (isConnectionError)
//			return false;
//
//		String deleteQuery = "DELETE FROM User WHERE User_id = ?";
//		try (PreparedStatement stmt = dbConn.prepareStatement(deleteQuery)) {
//			stmt.setInt(1, UserId);
//
//			int rowsDeleted = stmt.executeUpdate();
//			return rowsDeleted > 0;
//		} catch (SQLException e) {
//			e.printStackTrace();
//			return false;
//		}
//	}
//
//	public String getProgramName(int id) {
//		if (isConnectionError)
//			return null;
//
//		String deleteQuery = "select name from program where program_id = ?";
//		try (PreparedStatement stmt = dbConn.prepareStatement(deleteQuery)) {
//			stmt.setInt(1, id);
//
//			ResultSet result = stmt.executeQuery();
//			if (result.next())
//				return result.getString("name");
//			else
//				return "";
//		} catch (SQLException e) {
//			e.printStackTrace();
//			return null;
//		}
//	}
//
//	public int getProgramId(String name) {
//		if (isConnectionError)
//			return -1;
//
//		String deleteQuery = "select program_id from program where name  = ?";
//		try (PreparedStatement stmt = dbConn.prepareStatement(deleteQuery)) {
//			stmt.setString(1, name);
//
//			ResultSet result = stmt.executeQuery();
//			if (result.next())
//				return result.getInt("program_id");
//			else
//				return 0;
//		} catch (SQLException e) {
//			e.printStackTrace();
//			return -1;
//		}
//	}
//
//	public String getTotalUsers() {
//		if (isConnectionError) {
//			return null;
//		}
//
//		String countQuery = "SELECT COUNT(*) AS total FROM User;";
//		try (PreparedStatement stmt = dbConn.prepareStatement(countQuery)) {
//
//			ResultSet result = stmt.executeQuery();
//			if (result.next()) {
//				return result.getString("total");
//			} else {
//				return "";
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//			return null;
//		}
//	}
//
//	public String getComputingUsers() {
//		if (isConnectionError) {
//			return null;
//		}
//
//		String countQuery = "SELECT COUNT(*) AS total FROM User WHERE program_id = 1;";
//		try (PreparedStatement stmt = dbConn.prepareStatement(countQuery)) {
//			ResultSet result = stmt.executeQuery();
//			if (result.next()) {
//				return result.getString("total");
//			} else {
//				return "";
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//			return null;
//		}
//	}
//
//	public String getMultimediaUsers() {
//		if (isConnectionError) {
//			return null;
//		}
//
//		String countQuery = "SELECT COUNT(*) AS total FROM User WHERE program_id = 2;";
//		try (PreparedStatement stmt = dbConn.prepareStatement(countQuery)) {
//			ResultSet result = stmt.executeQuery();
//			if (result.next()) {
//				return result.getString("total");
//			} else {
//				return "";
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//			return null;
//		}
//	}
//
//	public String getNetworkingUsers() {
//		if (isConnectionError) {
//			return null;
//		}
//
//		String countQuery = "SELECT COUNT(*) AS total FROM User WHERE program_id = 3;";
//		try (PreparedStatement stmt = dbConn.prepareStatement(countQuery)) {
//			ResultSet result = stmt.executeQuery();
//			if (result.next()) {
//				return result.getString("total");
//			} else {
//				return "";
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//			return null;
//		}
//	}
//
//}