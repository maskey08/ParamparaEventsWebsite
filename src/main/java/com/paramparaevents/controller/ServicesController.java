package com.paramparaevents.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.paramparaevents.model.ServiceModel;
import com.paramparaevents.service.ServicesService;

/**
 * Servlet implementation class ServicesController
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/services" })
public class ServicesController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private ServicesService servicesService;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	@Override
	public void init() throws ServletException {
		this.servicesService = new ServicesService();
	}

	/**
	 * Handles GET requests for the services page.
	 *
	 * @param request  HttpServletRequest object
	 * @param response HttpServletResponse object
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException      if an I/O error occurs
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("ServicesController doGet() called");

		List<ServiceModel> services = servicesService.getServices();
		System.out.println("Service count: " + (services == null ? "null" : services.size()));

		request.setAttribute("serviceList", services);
		request.getRequestDispatcher("/WEB-INF/pages/services.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
