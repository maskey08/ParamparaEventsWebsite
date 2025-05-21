package com.paramparaevents.controller;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.paramparaevents.model.ServiceModel;
import com.paramparaevents.model.VenueModel;
import com.paramparaevents.config.DbConfig;

@WebServlet(asyncSupported = true, urlPatterns = {"/EventManagement"})
public class EventManagementController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private void checkAndFixVenueTableStructure() {
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        
        try {
            conn = DbConfig.getDbConnection();
            
            // Check if venue table exists
            boolean venueTableExists = false;
            ResultSet tables = conn.getMetaData().getTables(null, null, "venue", null);
            if (tables.next()) {
                venueTableExists = true;
                System.out.println("Venue table exists");
            } else {
                System.out.println("Venue table does not exist");
            }
            
            if (venueTableExists) {
                // Check column types
                ResultSet columns = conn.getMetaData().getColumns(null, null, "venue", "Availability");
                
                boolean needToFixColumn = false;
                if (columns.next()) {
                    String columnType = columns.getString("TYPE_NAME");
                    System.out.println("Availability column type: " + columnType);
                    
                    // Check if column is not VARCHAR (could be INT, BIT, etc.)
                    if (!columnType.contains("VARCHAR") && !columnType.contains("TEXT") && !columnType.contains("CHAR")) {
                        needToFixColumn = true;
                        System.out.println("Availability column is " + columnType + ". Needs to be changed to VARCHAR.");
                    }
                }
                
                // Fix the table structure if needed
                if (needToFixColumn) {
                    System.out.println("Fixing venue table structure...");
                    
                    stmt = conn.createStatement();
                    
                    // Check if there's data to backup
                    ResultSet countRs = stmt.executeQuery("SELECT COUNT(*) as total FROM venue");
                    int totalVenues = 0;
                    if (countRs.next()) {
                        totalVenues = countRs.getInt("total");
                    }
                    
                    if (totalVenues > 0) {
                        // Create backup table
                        try {
                            stmt.executeUpdate("DROP TABLE IF EXISTS venue_backup");
                            stmt.executeUpdate("CREATE TABLE venue_backup AS SELECT * FROM venue");
                            System.out.println("Created backup of venue table with " + totalVenues + " records.");
                        } catch (Exception e) {
                            System.out.println("Error creating backup: " + e.getMessage());
                        }
                    }
                    
                    try {
                        // Alter the column type
                        stmt.executeUpdate("ALTER TABLE venue MODIFY COLUMN Availability VARCHAR(50) NOT NULL");
                        System.out.println("Successfully changed Availability column to VARCHAR(50)!");
                    } catch (Exception e) {
                        System.out.println("Error altering column: " + e.getMessage());
                        
                        // If altering fails, try recreating the table
                        try {
                            // Get table structure
                            ResultSet allColumns = conn.getMetaData().getColumns(null, null, "venue", null);
                            StringBuilder createTableSQL = new StringBuilder("CREATE TABLE venue_new (");
                            
                            while (allColumns.next()) {
                                String colName = allColumns.getString("COLUMN_NAME");
                                String colType = allColumns.getString("TYPE_NAME");
                                int colSize = allColumns.getInt("COLUMN_SIZE");
                                boolean isNullable = allColumns.getInt("NULLABLE") == 1;
                                
                                // Replace Availability column type with VARCHAR
                                if (colName.equals("Availability")) {
                                    createTableSQL.append(colName).append(" VARCHAR(50) NOT NULL, ");
                                } else {
                                    if (colType.contains("CHAR") || colType.contains("VARCHAR") || colType.contains("TEXT")) {
                                        createTableSQL.append(colName).append(" ").append(colType).append("(").append(colSize).append(")");
                                    } else {
                                        createTableSQL.append(colName).append(" ").append(colType);
                                    }
                                    
                                    if (!isNullable) {
                                        createTableSQL.append(" NOT NULL");
                                    }
                                    createTableSQL.append(", ");
                                }
                            }
                            
                            // Remove trailing comma and space
                            if (createTableSQL.toString().endsWith(", ")) {
                                createTableSQL.setLength(createTableSQL.length() - 2);
                            }
                            
                            createTableSQL.append(")");
                            
                            // Create new table with correct structure
                            stmt.executeUpdate("DROP TABLE IF EXISTS venue_new");
                            stmt.executeUpdate(createTableSQL.toString());
                            
                            // Set primary key if needed
                            try {
                                stmt.executeUpdate("ALTER TABLE venue_new ADD PRIMARY KEY (Venue_ID)");
                            } catch (Exception ex) {
                                System.out.println("Error setting primary key: " + ex.getMessage());
                            }
                            
                            // Copy data if any
                            if (totalVenues > 0) {
                                stmt.executeUpdate("INSERT INTO venue_new SELECT * FROM venue");
                            }
                            
                            // Replace old table with new one
                            stmt.executeUpdate("DROP TABLE venue");
                            stmt.executeUpdate("RENAME TABLE venue_new TO venue");
                            
                            System.out.println("Successfully recreated venue table with correct structure!");
                        } catch (Exception ex) {
                            System.out.println("Error recreating table: " + ex.getMessage());
                            ex.printStackTrace();
                        }
                    }
                    
                    // If there was data, we need to update it
                    if (totalVenues > 0) {
                        try {
                            // Update all records to have a valid availability status
                            stmt.executeUpdate("UPDATE venue SET Availability = 'Available' WHERE Availability = '1' OR Availability = 1");
                            stmt.executeUpdate("UPDATE venue SET Availability = 'Booked' WHERE Availability = '2' OR Availability = 2");
                            stmt.executeUpdate("UPDATE venue SET Availability = 'Under Maintenance' WHERE Availability = '3' OR Availability = 3");
                            stmt.executeUpdate("UPDATE venue SET Availability = 'Available' WHERE Availability NOT IN ('Available', 'Booked', 'Under Maintenance')");
                            
                            System.out.println("Updated existing records with proper availability values.");
                        } catch (Exception e) {
                            System.out.println("Error updating records: " + e.getMessage());
                        }
                    }
                }
            } else {
                // Create venue table if it doesn't exist
                System.out.println("Creating venue table...");
                
                stmt = conn.createStatement();
                String createTableSQL = "CREATE TABLE venue (" +
                    "Venue_ID INT AUTO_INCREMENT PRIMARY KEY, " +
                    "Name VARCHAR(100) NOT NULL, " +
                    "Address VARCHAR(255) NOT NULL, " +
                    "Capacity INT NOT NULL, " +
                    "Facilities TEXT, " +
                    "Availability VARCHAR(50) NOT NULL, " +
                    "VenueTags VARCHAR(255)" +
                    ")";
                stmt.executeUpdate(createTableSQL);
                System.out.println("Venue table created successfully!");
                
                // Insert sample data
                String insertSQL = "INSERT INTO venue (Name, Address, Capacity, Facilities, Availability, VenueTags) VALUES " +
                    "('Grand Ballroom', '123 Main St, Kathmandu', 500, 'Air Conditioning, WiFi, Parking', 'Available', 'wedding,corporate,large'), " +
                    "('Garden Terrace', '456 Park Ave, Lalitpur', 200, 'Outdoor Space, Catering, Sound System', 'Available', 'outdoor,wedding,medium'), " +
                    "('Conference Center', '789 Business Blvd, Bhaktapur', 100, 'Projector, WiFi, Whiteboard', 'Available', 'corporate,meeting,small')";
                stmt.executeUpdate(insertSQL);
                System.out.println("Sample data inserted successfully!");
            }
        } catch (Exception e) {
            System.out.println("Error checking/fixing venue table: " + e.getMessage());
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                System.out.println("Error closing resources: " + e.getMessage());
            }
        }
    }
    
    @Override
    public void init() throws ServletException {
        super.init();
        // Run the fix when the servlet is initialized
        checkAndFixVenueTableStructure();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // We'll run the fix in init() instead of every request
        
        String section = request.getParameter("section");
        String action = request.getParameter("action");
        
        if (section == null) section = "dashboard";
        if (action == null) action = "list";
        
        switch (section) {
            case "service":
                handleServiceSection(request, response, action);
                break;
            case "venue":
                handleVenueSection(request, response, action);
                break;
            default:
                // Load both services and venues for the dashboard
                List<ServiceModel> services = getAllServices();
                List<VenueModel> venues = getAllVenues();
                
                request.setAttribute("serviceList", services);
                request.setAttribute("venueList", venues);
                request.getRequestDispatcher("/WEB-INF/pages/eventmanagement.jsp").forward(request, response);
                break;
        }
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String section = request.getParameter("section");
        
        if (section == null) {
            response.sendRedirect("EventManagement");
            return;
        }
        
        switch (section) {
            case "service":
                handleServicePost(request, response);
                break;
            case "venue":
                handleVenuePost(request, response);
                break;
            default:
                response.sendRedirect("EventManagement");
                break;
        }
    }
    
    // Service Section Handlers
    private void handleServiceSection(HttpServletRequest request, HttpServletResponse response, String action) throws ServletException, IOException {
        switch (action) {
            case "add":
                request.getRequestDispatcher("/WEB-INF/pages/addservice.jsp").forward(request, response);
                break;
            case "edit":
                int serviceId = Integer.parseInt(request.getParameter("id"));
                ServiceModel service = getServiceById(serviceId);
                request.setAttribute("service", service);
                request.getRequestDispatcher("/WEB-INF/pages/addservice.jsp").forward(request, response);
                break;
            case "delete":
                int deleteServiceId = Integer.parseInt(request.getParameter("id"));
                deleteService(deleteServiceId);
                response.sendRedirect("EventManagement?section=service");
                break;
            default:
                List<ServiceModel> services = getAllServices();
                request.setAttribute("serviceList", services);
                request.getRequestDispatcher("/WEB-INF/pages/servicemanagement.jsp").forward(request, response);
                break;
        }
    }
    
    private void handleServicePost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String idStr = request.getParameter("id");
            int id = 0;
            if (idStr != null && !idStr.isEmpty() && !idStr.equals("0")) {
                id = Integer.parseInt(idStr);
            }
            
            String name = request.getParameter("name");
            String description = request.getParameter("description");
            int cost = Integer.parseInt(request.getParameter("cost"));
            String type = request.getParameter("type");
            String serviceTags = request.getParameter("serviceTags");
            
            ServiceModel service = new ServiceModel(id, name, description, cost, type, serviceTags);
            
            if (id == 0 || getServiceById(id) == null) {
                addService(service);
            } else {
                updateService(service);
            }
            
            response.sendRedirect("EventManagement?section=service");
            
        } catch (Exception e) {
            System.out.println("Error in service post: " + e.getMessage());
            e.printStackTrace();
            request.setAttribute("error", "Error processing form: " + e.getMessage());
            request.getRequestDispatcher("/WEB-INF/pages/addservice.jsp").forward(request, response);
        }
    }
    
    // Venue Section Handlers
    private void handleVenueSection(HttpServletRequest request, HttpServletResponse response, String action) throws ServletException, IOException {
        switch (action) {
            case "add":
                request.getRequestDispatcher("/WEB-INF/pages/addvenue.jsp").forward(request, response);
                break;
            case "edit":
                int venueId = Integer.parseInt(request.getParameter("id"));
                VenueModel venue = getVenueById(venueId);
                request.setAttribute("venue", venue);
                request.getRequestDispatcher("/WEB-INF/pages/addvenue.jsp").forward(request, response);
                break;
            case "delete":
                int deleteVenueId = Integer.parseInt(request.getParameter("id"));
                deleteVenue(deleteVenueId);
                response.sendRedirect("EventManagement?section=venue");
                break;
            default:
                List<VenueModel> venues = getAllVenues();
                // Debug print to check if venues are being retrieved
                System.out.println("Retrieved venues: " + venues.size());
                for (VenueModel v : venues) {
                    System.out.println("Venue: " + v.getId() + " - " + v.getName());
                }
                request.setAttribute("venueList", venues);
                request.getRequestDispatcher("/WEB-INF/pages/venuemanagement.jsp").forward(request, response);
                break;
        }
    }
    
    private void handleVenuePost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String idStr = request.getParameter("id");
            int id = 0;
            if (idStr != null && !idStr.isEmpty() && !idStr.equals("0")) {
                id = Integer.parseInt(idStr);
            }
            
            String name = request.getParameter("name");
            String address = request.getParameter("address");
            int capacity = Integer.parseInt(request.getParameter("capacity"));
            String facilities = request.getParameter("facilities");
            String availability = request.getParameter("availability");
            String venueTags = request.getParameter("venueTags");
            
            VenueModel venue = new VenueModel(id, name, address, capacity, facilities, availability, venueTags);
            
            if (id == 0 || getVenueById(id) == null) {
                addVenue(venue);
            } else {
                updateVenue(venue);
            }
            
            response.sendRedirect("EventManagement?section=venue");
            
        } catch (Exception e) {
            System.out.println("Error in venue post: " + e.getMessage());
            e.printStackTrace();
            request.setAttribute("error", "Error processing form: " + e.getMessage());
            request.getRequestDispatcher("/WEB-INF/pages/addvenue.jsp").forward(request, response);
        }
    }
    
    // Service CRUD Operations
    private List<ServiceModel> getAllServices() {
        List<ServiceModel> list = new ArrayList<>();
        try (Connection conn = DbConfig.getDbConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM service")) {
            
            while (rs.next()) {
                ServiceModel service = new ServiceModel(
                    rs.getInt("Service_ID"),
                    rs.getString("Name"),
                    rs.getString("Description"),
                    rs.getString("Type"),
                    rs.getString("ServiceTags"), 
                    rs.getInt("Cost")
                );
                list.add(service);
            }
        } catch (Exception e) {
            System.out.println("Error getting all services: " + e.getMessage());
            e.printStackTrace();
        }
        return list;
    }
    
    private ServiceModel getServiceById(int id) {
        try (Connection conn = DbConfig.getDbConnection();
             PreparedStatement ps = conn.prepareStatement("SELECT * FROM service WHERE Service_ID = ?")) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new ServiceModel(
                		rs.getInt("Service_ID"),
                        rs.getString("Name"),
                        rs.getString("Description"),
                        rs.getString("Type"),
                        rs.getString("ServiceTags"), 
                        rs.getInt("Cost")
                );
            }
        } catch (Exception e) {
            System.out.println("Error getting service by ID: " + e.getMessage());
            e.printStackTrace();
        }
        return null;
    }
    
    private void addService(ServiceModel service) {
        Connection conn = null;
        PreparedStatement ps = null;
        
        try {
            conn = DbConfig.getDbConnection();
            
            if (service.getServiceId() == 0) {
                ps = conn.prepareStatement(
                    "INSERT INTO service (Name, Description, Cost, Type, ServiceTags) VALUES (?, ?, ?, ?, ?)",
                    Statement.RETURN_GENERATED_KEYS);
                ps.setString(1, service.getName());
                ps.setString(2, service.getDescription());
                ps.setInt(3, service.getCost());
                ps.setString(4, service.getType());
                ps.setString(5, service.getServiceTags());
            } else {
                ps = conn.prepareStatement(
                    "INSERT INTO service (Service_ID, Name, Description, Cost, Type, ServiceTags) VALUES (?, ?, ?, ?, ?, ?)");
                ps.setInt(1, service.getServiceId());
                ps.setString(2, service.getName());
                ps.setString(3, service.getDescription());
                ps.setInt(4, service.getCost());
                ps.setString(5, service.getType());
                ps.setString(6, service.getServiceTags());
            }
            
            int rowsAffected = ps.executeUpdate();
            System.out.println("addService executed. Rows affected: " + rowsAffected);
            
            if (service.getServiceId() == 0 && rowsAffected > 0) {
                ResultSet generatedKeys = ps.getGeneratedKeys();
                if (generatedKeys.next()) {
                    service.setServiceId(generatedKeys.getInt(1));
                }
            }
            
        } catch (Exception e) {
            System.out.println("Error adding service: " + e.getMessage());
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                System.out.println("Error closing resources: " + e.getMessage());
            }
        }
    }
    
    private void updateService(ServiceModel service) {
        Connection conn = null;
        PreparedStatement ps = null;
        
        try {
            conn = DbConfig.getDbConnection();
            ps = conn.prepareStatement(
                "UPDATE service SET Name=?, Description=?, Cost=?, Type=?, ServiceTags=? WHERE Service_ID=?");
            ps.setString(1, service.getName());
            ps.setString(2, service.getDescription());
            ps.setInt(3, service.getCost());
            ps.setString(4, service.getType());
            ps.setString(5, service.getServiceTags());
            ps.setInt(6, service.getServiceId());
            
            int rowsAffected = ps.executeUpdate();
            System.out.println("updateService executed. Rows affected: " + rowsAffected);
            
        } catch (Exception e) {
            System.out.println("Error updating service: " + e.getMessage());
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                System.out.println("Error closing resources: " + e.getMessage());
            }
        }
    }
    
    private void deleteService(int id) {
        Connection conn = null;
        PreparedStatement ps = null;
        
        try {
            conn = DbConfig.getDbConnection();
            ps = conn.prepareStatement("DELETE FROM service WHERE Service_ID=?");
            ps.setInt(1, id);
            
            int rowsAffected = ps.executeUpdate();
            System.out.println("deleteService executed. Rows affected: " + rowsAffected);
            
        } catch (Exception e) {
            System.out.println("Error deleting service: " + e.getMessage());
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                System.out.println("Error closing resources: " + e.getMessage());
            }
        }
    }
    
    // Venue CRUD Operations
    private List<VenueModel> getAllVenues() {
        List<VenueModel> list = new ArrayList<>();
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        
        try {
            conn = DbConfig.getDbConnection();
            stmt = conn.createStatement();
            
            // Debug: Print SQL query
            String sql = "SELECT * FROM venue";
            System.out.println("Executing SQL: " + sql);
            
            rs = stmt.executeQuery(sql);
            
            while (rs.next()) {
                VenueModel venue = new VenueModel(
                    rs.getInt("Venue_ID"),
                    rs.getString("Name"),
                    rs.getString("Address"),
                    rs.getInt("Capacity"),
                    rs.getString("Facilities"),
                    rs.getString("Availability"),
                    rs.getString("VenueTags")
                );
                list.add(venue);
                System.out.println("Added venue: " + venue.getId() + " - " + venue.getName());
            }
        } catch (Exception e) {
            System.out.println("Error getting all venues: " + e.getMessage());
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                System.out.println("Error closing resources: " + e.getMessage());
            }
        }
        
        System.out.println("Total venues found: " + list.size());
        return list;
    }
    
    private VenueModel getVenueById(int id) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            conn = DbConfig.getDbConnection();
            ps = conn.prepareStatement("SELECT * FROM venue WHERE Venue_ID = ?");
            ps.setInt(1, id);
            rs = ps.executeQuery();
            
            if (rs.next()) {
                return new VenueModel(
                    rs.getInt("Venue_ID"),
                    rs.getString("Name"),
                    rs.getString("Address"),
                    rs.getInt("Capacity"),
                    rs.getString("Facilities"),
                    rs.getString("Availability"),
                    rs.getString("VenueTags")
                );
            }
        } catch (Exception e) {
            System.out.println("Error getting venue by ID: " + e.getMessage());
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                System.out.println("Error closing resources: " + e.getMessage());
            }
        }
        return null;
    }
    
    private void addVenue(VenueModel venue) {
        Connection conn = null;
        PreparedStatement ps = null;
        
        try {
            conn = DbConfig.getDbConnection();
            
            if (venue.getId() == 0) {
                ps = conn.prepareStatement(
                    "INSERT INTO venue (Name, Address, Capacity, Facilities, Availability, VenueTags) VALUES (?, ?, ?, ?, ?, ?)",
                    Statement.RETURN_GENERATED_KEYS);
                ps.setString(1, venue.getName());
                ps.setString(2, venue.getAddress());
                ps.setInt(3, venue.getCapacity());
                ps.setString(4, venue.getFacilities());
                ps.setString(5, venue.getAvailability());
                ps.setString(6, venue.getVenueTags());
            } else {
                ps = conn.prepareStatement(
                    "INSERT INTO venue (Venue_ID, Name, Address, Capacity, Facilities, Availability, VenueTags) VALUES (?, ?, ?, ?, ?, ?, ?)");
                ps.setInt(1, venue.getId());
                ps.setString(2, venue.getName());
                ps.setString(3, venue.getAddress());
                ps.setInt(4, venue.getCapacity());
                ps.setString(5, venue.getFacilities());
                ps.setString(6, venue.getAvailability());
                ps.setString(7, venue.getVenueTags());
            }
            
            int rowsAffected = ps.executeUpdate();
            System.out.println("addVenue executed. Rows affected: " + rowsAffected);
            
            if (venue.getId() == 0 && rowsAffected > 0) {
                ResultSet generatedKeys = ps.getGeneratedKeys();
                if (generatedKeys.next()) {
                    venue.setId(generatedKeys.getInt(1));
                }
            }
            
        } catch (Exception e) {
            System.out.println("Error adding venue: " + e.getMessage());
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                System.out.println("Error closing resources: " + e.getMessage());
            }
        }
    }
    
    private void updateVenue(VenueModel venue) {
        Connection conn = null;
        PreparedStatement ps = null;
        
        try {
            conn = DbConfig.getDbConnection();
            ps = conn.prepareStatement(
                "UPDATE venue SET Name=?, Address=?, Capacity=?, Facilities=?, Availability=?, VenueTags=? WHERE Venue_ID=?");
            ps.setString(1, venue.getName());
            ps.setString(2, venue.getAddress());
            ps.setInt(3, venue.getCapacity());
            ps.setString(4, venue.getFacilities());
            ps.setString(5, venue.getAvailability());
            ps.setString(6, venue.getVenueTags());
            ps.setInt(7, venue.getId());
            
            int rowsAffected = ps.executeUpdate();
            System.out.println("updateVenue executed. Rows affected: " + rowsAffected);
            
        } catch (Exception e) {
            System.out.println("Error updating venue: " + e.getMessage());
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                System.out.println("Error closing resources: " + e.getMessage());
            }
        }
    }
    
    private void deleteVenue(int id) {
        Connection conn = null;
        PreparedStatement ps = null;
        
        try {
            conn = DbConfig.getDbConnection();
            ps = conn.prepareStatement("DELETE FROM venue WHERE Venue_ID=?");
            ps.setInt(1, id);
            
            int rowsAffected = ps.executeUpdate();
            System.out.println("deleteVenue executed. Rows affected: " + rowsAffected);
            
        } catch (Exception e) {
            System.out.println("Error deleting venue: " + e.getMessage());
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                System.out.println("Error closing resources: " + e.getMessage());
            }
        }
    }
}
