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
 * @WebServlet("/debugVenue") public class DebugVenueController extends
 * HttpServlet { private static final long serialVersionUID = 1L;
 * 
 * protected void doGet(HttpServletRequest request, HttpServletResponse
 * response) throws ServletException, IOException {
 * response.setContentType("text/html"); PrintWriter out = response.getWriter();
 * 
 * out.println("<html><head><title>Venue Table Debug</title>"); out.
 * println("<style>body{font-family:Arial,sans-serif;margin:20px;} table{border-collapse:collapse;width:100%;} th,td{border:1px solid #ddd;padding:8px;text-align:left;} th{background-color:#f2f2f2;}</style>"
 * ); out.println("</head><body>"); out.println("<h1>Venue Table Debug</h1>");
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
 * // Check if venue table exists boolean venueTableExists = false; ResultSet
 * tables = conn.getMetaData().getTables(null, null, "venue", null); if
 * (tables.next()) { venueTableExists = true;
 * out.println("<p style='color:green;'>✅ Venue table exists!</p>"); } else {
 * out.println("<p style='color:red;'>❌ Venue table does not exist!</p>"); }
 * 
 * if (venueTableExists) { // Display venue table data Statement stmt =
 * conn.createStatement(); ResultSet rs =
 * stmt.executeQuery("SELECT * FROM venue");
 * 
 * out.println("<h2>Venue Table Data</h2>"); out.println("<table>");
 * out.println(
 * "<tr><th>Venue_ID</th><th>Name</th><th>Address</th><th>Capacity</th><th>Facilities</th><th>Availability</th><th>VenueTags</th></tr>"
 * );
 * 
 * boolean hasData = false; while (rs.next()) { hasData = true;
 * out.println("<tr>"); out.println("<td>" + rs.getInt("Venue_ID") + "</td>");
 * out.println("<td>" + rs.getString("Name") + "</td>"); out.println("<td>" +
 * rs.getString("Address") + "</td>"); out.println("<td>" +
 * rs.getInt("Capacity") + "</td>"); out.println("<td>" +
 * rs.getString("Facilities") + "</td>"); out.println("<td>" +
 * rs.getString("Availability") + "</td>"); out.println("<td>" +
 * rs.getString("VenueTags") + "</td>"); out.println("</tr>"); }
 * 
 * if (!hasData) { out.
 * println("<tr><td colspan='7' style='text-align:center;'>No data found in venue table</td></tr>"
 * ); }
 * 
 * out.println("</table>");
 * 
 * // Display table structure ResultSet columns =
 * conn.getMetaData().getColumns(null, null, "venue", null);
 * out.println("<h2>Venue Table Structure</h2>"); out.println("<table>"); out.
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
 * out.println("</table>"); }
 * 
 * // Create venue table if it doesn't exist if (!venueTableExists) {
 * out.println("<h2>Creating Venue Table</h2>"); try { Statement createStmt =
 * conn.createStatement(); String createTableSQL = "CREATE TABLE venue (" +
 * "Venue_ID INT AUTO_INCREMENT PRIMARY KEY, " + "Name VARCHAR(100) NOT NULL, "
 * + "Address VARCHAR(255) NOT NULL, " + "Capacity INT NOT NULL, " +
 * "Facilities TEXT, " + "Availability VARCHAR(50) NOT NULL, " +
 * "VenueTags VARCHAR(255)" + ")"; createStmt.executeUpdate(createTableSQL);
 * out.println("<p style='color:green;'>✅ Venue table created successfully!</p>"
 * );
 * 
 * // Insert sample data String insertSQL =
 * "INSERT INTO venue (Name, Address, Capacity, Facilities, Availability, VenueTags) VALUES "
 * +
 * "('Grand Ballroom', '123 Main St, Kathmandu', 500, 'Air Conditioning, WiFi, Parking', 'Available', 'wedding,corporate,large'), "
 * +
 * "('Garden Terrace', '456 Park Ave, Lalitpur', 200, 'Outdoor Space, Catering, Sound System', 'Available', 'outdoor,wedding,medium'), "
 * +
 * "('Conference Center', '789 Business Blvd, Bhaktapur', 100, 'Projector, WiFi, Whiteboard', 'Available', 'corporate,meeting,small')"
 * ; createStmt.executeUpdate(insertSQL); out.
 * println("<p style='color:green;'>✅ Sample data inserted successfully!</p>");
 * 
 * out.
 * println("<p>Please refresh the venue management page to see the new data.</p>"
 * ); } catch (Exception e) {
 * out.println("<p style='color:red;'>❌ Error creating venue table: " +
 * e.getMessage() + "</p>"); } }
 * 
 * conn.close();
 * 
 * } catch (Exception e) {
 * out.println("<p style='color:red;'>❌ Database connection failed: " +
 * e.getMessage() + "</p>"); out.println("<h3>Stack Trace:</h3>");
 * out.println("<pre>"); e.printStackTrace(out); out.println("</pre>"); }
 * 
 * out.println("<p><a href='" + request.getContextPath() +
 * "/EventManagement?section=venue'>Back to Venue Management</a></p>");
 * out.println("</body></html>"); } }
 */