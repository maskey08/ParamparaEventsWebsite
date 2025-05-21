package com.paramparaevents.model;

public class UserModel {

	private String userName;
	private String email;
	private String number;
	private String password;
	private int id;
	private String role;
	
		
	public UserModel() {}
	
	public UserModel(String username, String pasword) {
		this.userName = username;
		this.password = pasword;
	}


	public UserModel( String userName, String email, String number, String password) {
		super();

		this.userName = userName;
		this.email = email;
		this.number = number;
		this.password = password;

	}
	
	public UserModel(int id, String userName, String email, String number) {
		this.userName = userName;
		this.email = email;
		this.number = number;
		this.id = id;
	}

	

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}



	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	

	


}
