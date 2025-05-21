package com.paramparaevents.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.paramparaevents.config.DbConfig;
import com.paramparaevents.model.ServiceModel;
import com.paramparaevents.model.UserModel;

/**
 * Service class for handling event services operations.
 * Connects to the database and retrieves service information.
 */
public class ServicesService {
    private Connection dbConn;
    private boolean isConnectionError = false;

    /**
     * Constructor initializes the database connection.
     * Sets the connection error flag if the connection fails.
     */
    public ServicesService() {
        try {
            dbConn = DbConfig.getDbConnection();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            isConnectionError = true;
        }
    }

    /**
     * Retrieves all distinct service types from the database.
     *
     * @return List of unique service types
     */
    public List<String> getAllServiceTypes() {
        List<String> types = new ArrayList<>();

        if (isConnectionError) {
            System.out.println("Connection Error!");
            return types;
        }

        types.add("Service");
        return types;
    }

    /**
     * Retrieves services by type from the database.
     *
     * @param type The type of services to retrieve
     * @return List of ServiceModel objects filtered by type
     */
    public List<ServiceModel> getServicesByType(String type) {
        return getServices();
    }

    /**
     * Retrieves a service by its ID.
     *
     * @param serviceId The ID of the service to retrieve
     * @return ServiceModel object containing service information; null if not found
     */
    public ServiceModel getServiceById(int serviceId) {
        if (isConnectionError) {
            System.out.println("Connection Error!");
            return null;
        }

        String query = "SELECT Service_Id, Name, Description, Cost, ImgPath, ServiceTags FROM service WHERE Service_Id = ?";

        try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
            stmt.setInt(1, serviceId);
            ResultSet result = stmt.executeQuery();

            if (result.next()) {
                String name = result.getString("name");
                String description = result.getString("description");

                // Determine the type based on the service name or description
                String type = determineServiceType(name, description);

                ServiceModel service = new ServiceModel();
                service.setServiceId(result.getInt("Service_Id"));
                service.setName(name);
                service.setDescription(description);
                service.setCost(result.getInt("price"));
                service.setType(type);
                service.setServiceTags(result.getString("ServiceTags"));
                service.setImgPath(result.getString("image_url"));

                return service;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    /**
     * Retrieves all services from the database.
     *
     * @return List of ServiceModel objects containing service information; empty
     *         list if no services found or on error
     */
    public List<ServiceModel> getAllServices() {
        return getServices();
    }

    public List<ServiceModel> getServices() {
        if (isConnectionError) {
            System.out.println("Connection Error!");
            return new ArrayList<>();
        }

        String query = "SELECT Service_Id, Name, Description, Cost, ImgPath, ServiceTags FROM service";
        System.out.println("Running getServices()...");

        try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
            ResultSet result = stmt.executeQuery();
            List<ServiceModel> serviceList = new ArrayList<>();

            while (result.next()) {
                String name = result.getString("Name");
                String description = result.getString("Description");

                // Determine the type based on the service name or description
                String type = determineServiceType(name, description);

                ServiceModel s = new ServiceModel(
                        result.getInt("Service_Id"),
                        name,
                        description,
                        result.getInt("Cost"),
                        type,
                        result.getString("ServiceTags"),
                        result.getString("ImgPath"));
                serviceList.add(s);
                System.out.println("Fetched service: " + s.getName() + " (Type: " + type + ")");
            }

            System.out.println("Total services fetched: " + serviceList.size());
            return serviceList;

        } catch (SQLException e) {
            System.out.println("SQL error: " + e.getMessage());
            e.printStackTrace();
            return new ArrayList<>();
        }
    }

    /**
     * Determines the service type based on the service name and description.
     *
     * @param name        The name of the service
     * @param description The description of the service
     * @return The determined service type
     */
    private String determineServiceType(String name, String description) {
        String nameLower = name.toLowerCase();
        String descLower = description.toLowerCase();

        // Check for Venue
        if (nameLower.contains("venue") ||
                nameLower.contains("hall") ||
                nameLower.contains("palace") ||
                nameLower.contains("garden") ||
                nameLower.contains("retreat") ||
                nameLower.contains("manor") ||
                nameLower.contains("loft") ||
                descLower.contains("venue") ||
                descLower.contains("location") ||
                descLower.contains("place for") ||
                descLower.contains("space for")) {
            return "Venue";
        }

        // Check for Decoration
        if (nameLower.contains("decor") ||
                nameLower.contains("decoration") ||
                nameLower.contains("floral") ||
                nameLower.contains("arrangement") ||
                descLower.contains("decoration") ||
                descLower.contains("decor") ||
                descLower.contains("floral arrangement")) {
            return "Decoration";
        }

        // Check for Photography
        if (nameLower.contains("photo") ||
                nameLower.contains("photography") ||
                nameLower.contains("portrait") ||
                nameLower.contains("shoot") ||
                descLower.contains("photographer") ||
                descLower.contains("photography") ||
                descLower.contains("photoshoot") ||
                descLower.contains("camera")) {
            return "Photography";
        }

        // Check for Entrance Gate
        if (nameLower.contains("gate") ||
                nameLower.contains("entrance") ||
                nameLower.contains("arch") ||
                nameLower.contains("torana") ||
                descLower.contains("entrance gate") ||
                descLower.contains("gateway") ||
                descLower.contains("entrance arch")) {
            return "Entrance Gate";
        }

        // Check for Stage
        if (nameLower.contains("stage") ||
                nameLower.contains("platform") ||
                nameLower.contains("mandap") ||
                nameLower.contains("gazebo") ||
                descLower.contains("stage") ||
                descLower.contains("platform") ||
                descLower.contains("mandap")) {
            return "Stage";
        }

        // Check for Makeup Artist
        if (nameLower.contains("makeup") ||
                nameLower.contains("makeover") ||
                nameLower.contains("beauty") ||
                nameLower.contains("glam") ||
                descLower.contains("makeup") ||
                descLower.contains("makeover") ||
                descLower.contains("beautician")) {
            return "Makeup Artist";
        }

        // Check for Event Host
        if (nameLower.contains("host") ||
                nameLower.contains("mc") ||
                nameLower.contains("master of ceremonies") ||
                nameLower.contains("anchor") ||
                descLower.contains("host") ||
                descLower.contains("mc") ||
                descLower.contains("master of ceremonies") ||
                descLower.contains("emcee")) {
            return "Event Host";
        }

        // Default type if no specific category is matched
        return "Service";
    }

}
