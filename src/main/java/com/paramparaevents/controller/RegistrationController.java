package com.paramparaevents.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.paramparaevents.model.UserModel;
import com.paramparaevents.service.RegistrationService;
import com.paramparaevents.util.PasswordUtil;
import com.paramparaevents.util.ValidationUtil;

/**
 * Servlet implementation class RegistrationController
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/registration" })
public class RegistrationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final RegistrationService registrationService = new RegistrationService();

    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrationController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("showRegister", true);
		request.getRequestDispatcher("/WEB-INF/pages/userPortal.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("showRegister", true);

		try {
			// Validate and extract student model
			String validationMessage = validateRegistrationForm(request);
			if (validationMessage != null) {
				handleError(request, response, validationMessage);
				return;
			}

			UserModel userModel = extractUserModel(request);
			Boolean isAdded = registrationService.addUser(userModel);

			if (isAdded == null) {
				handleError(request, response, "Our server is under maintenance. Please try again later!");
			}  else if (isAdded) {
				handleSuccess(request, response, "Your account is successfully created!", "/WEB-INF/pages/login.jsp");
			} else {
				handleError(request, response, "Could not register your account. Please try again later!");
			}
		} catch (Exception e) {
			handleError(request, response, "An unexpected error occurred. Please try again later!");
			e.printStackTrace(); // Log the exception
		}
	}
	
    private String validateRegistrationForm(HttpServletRequest request){

		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String number = request.getParameter("phone");
		String password = request.getParameter("password");
		//String retypePassword = request.getParameter("cpassword");

		

		if (ValidationUtil.isNullOrEmpty(username))
			return "Username is required.";

		if (ValidationUtil.isNullOrEmpty(email))
			return "Email is required.";
		if (ValidationUtil.isNullOrEmpty(number))
			return "Phone number is required.";
		if (ValidationUtil.isNullOrEmpty(password))
			return "Password is required.";
		//if (ValidationUtil.isNullOrEmpty(retypePassword))
			//return "Please retype the password.";
		
		// Validate fields
		if (!ValidationUtil.isAlphanumericStartingWithLetter(username))
			return "Username must start with a letter and contain only letters and numbers.";
	
		if (!ValidationUtil.isValidEmail(email))
			return "Invalid email format.";
		if (!ValidationUtil.isValidPhoneNumber(number))
			return "Phone number must be 10 digits and start with 98 or 97.";
		if (!ValidationUtil.isValidPassword(password))
			return "Password must be at least 8 characters long, with 1 uppercase letter, 1 number, and 1 symbol.";
		//if (!ValidationUtil.doPasswordsMatch(password, retypePassword))
			//return "Passwords do not match.";

		
		return null; // All validations passed
	}

    private UserModel extractUserModel(HttpServletRequest req) throws Exception {

		String username = req.getParameter("username");
		String email = req.getParameter("email");
		String number = req.getParameter("phone");

		String password = req.getParameter("password");

		// Assuming password validation is already done in validateRegistrationForm
		password = PasswordUtil.encrypt(username, password);

		return new UserModel(username,email, number, password);
	}
    

	private void handleSuccess(HttpServletRequest req, HttpServletResponse resp, String message, String redirectPage)
			throws ServletException, IOException {
		req.setAttribute("success", message);
		req.getRequestDispatcher(redirectPage).forward(req, resp);
	}

	private void handleError(HttpServletRequest req, HttpServletResponse resp, String message)
			throws ServletException, IOException {
		req.setAttribute("Rerror", message);
		
		req.setAttribute("username", req.getParameter("username"));

		req.setAttribute("email", req.getParameter("email"));
		req.setAttribute("phoneNumber", req.getParameter("phoneNumber"));
		req.getRequestDispatcher("/WEB-INF/pages/userPortal.jsp").forward(req, resp);
	}
   
	
	

}
