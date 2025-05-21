/*
 * package com.parampara.controller;
 * 
 * import jakarta.servlet.ServletException; import
 * jakarta.servlet.annotation.WebServlet; import
 * jakarta.servlet.http.HttpServlet; import
 * jakarta.servlet.http.HttpServletRequest; import
 * jakarta.servlet.http.HttpServletResponse; import java.io.IOException; import
 * java.io.PrintWriter; import java.sql.Connection; import java.sql.ResultSet;
 * import java.sql.Statement;
 * 
 * import com.parampara.config.Dbconfig;
 * 
 * @WebServlet("/debug") public class DebugController extends HttpServlet {
 * private static final long serialVersionUID = 1L;
 * 
 * protected void doGet(HttpServletRequest request, HttpServletResponse
 * response) throws ServletException, IOException {
 * response.setContentType("text/html"); PrintWriter out = response.getWriter();
 * 
 * out.println("<html><head><title>Database Debug</title>"); out.
 * println("<style>body{font-family:Arial,sans-serif;margin:20px;} table{border-collapse:collapse;width:100%;} th,td{border:1px solid #ddd;padding:8px;text-align:left;} th{background-color:#f2f2f2;}</style>"
 * ); out.println("</head><body>");
 * out.println("<h1>Database Connection Test</h1>");
 * 
 * try { // Test database connection Connection conn =
 * Dbconfig.getDbConnection();
 * out.println("<p style='color:green;'>✅ Database connection successful!</p>");
 * 
 * // Display database info out.println("<h2>Database Information</h2>");
 * out.println("<p>Database URL: " + conn.getMetaData().getURL() + "</p>");
 * out.println("<p>Database Product: " +
 * conn.getMetaData().getDatabaseProductName() + " " +
 * conn.getMetaData().getDatabaseProductVersion() + "</p>");
 * 
 * // Display customer table data Statement stmt = conn.createStatement();
 * ResultSet rs = stmt.executeQuery("SELECT * FROM customer");
 * 
 * out.println("<h2>Customer Table Data</h2>"); out.println("<table>");
 * out.println(
 * "<tr><th>Customer_ID</th><th>Username</th><th>Email</th><th>Phone_Number</th><th>Password</th></tr>"
 * );
 * 
 * boolean hasData = false; while (rs.next()) { hasData = true;
 * out.println("<tr>"); out.println("<td>" + rs.getInt("Customer_ID") +
 * "</td>"); out.println("<td>" + rs.getString("Username") + "</td>");
 * out.println("<td>" + rs.getString("Email") + "</td>"); out.println("<td>" +
 * rs.getString("Phone_Number") + "</td>"); out.println("<td>" +
 * (rs.getString("Password") != null ? "********" : "null") + "</td>");
 * out.println("</tr>"); }
 * 
 * if (!hasData) { out.
 * println("<tr><td colspan='5' style='text-align:center;'>No data found in customer table</td></tr>"
 * ); }
 * 
 * out.println("</table>");
 * 
 * // Display table structure ResultSet columns =
 * conn.getMetaData().getColumns(null, null, "customer", null);
 * out.println("<h2>Customer Table Structure</h2>"); out.println("<table>");
 * out.
 * println("<tr><th>Column Name</th><th>Type</th><th>Size</th><th>Nullable</th></tr>"
 * );
 * 
 * while (columns.next()) { out.println("<tr>"); out.println("<td>" +
 * columns.getString("COLUMN_NAME") + "</td>"); out.println("<td>" +
 * columns.getString("TYPE_NAME") + "</td>"); out.println("<td>" +
 * columns.getInt("COLUMN_SIZE") + "</td>"); out.println("<td>" +
 * (columns.getInt("NULLABLE") == 1 ? "Yes" : "No") + "</td>");
 * out.println("</tr>"); }
 * 
 * out.println("</table>");
 * 
 * conn.close();
 * 
 * } catch (Exception e) {
 * out.println("<p style='color:red;'>❌ Database connection failed: " +
 * e.getMessage() + "</p>"); out.println("<h3>Stack Trace:</h3>");
 * out.println("<pre>"); e.printStackTrace(out); out.println("</pre>"); }
 * 
 * out.println("<p><a href='" + request.getContextPath() +
 * "/admin'>Back to Dashboard</a></p>"); out.println("</body></html>"); } }
 */