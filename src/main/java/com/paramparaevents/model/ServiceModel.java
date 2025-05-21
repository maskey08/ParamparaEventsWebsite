package com.paramparaevents.model;

/**
 * Model class representing a service in the event management system.
 */
public class ServiceModel {
    private int serviceId;
    private String name;
    private String description;
    private int cost;
    private String type;
    private String serviceTags;
    private String imgPath;

    /**
     * Default constructor.
     */
    public ServiceModel() {
    }

    /**
     * Constructor with all fields.
     * 
     * @param serviceId   The unique identifier for the service
     * @param name        The name of the service
     * @param description A detailed description of the service
     * @param cost        The cost of the service
     * @param type        The category or type of the service
     * @param serviceTags Tags associated with the service
     */
    public ServiceModel(int serviceId, String name, String description, int cost, String type, String serviceTags,
            String imgPath) {
        this.serviceId = serviceId;
        this.name = name;
        this.description = description;
        this.cost = cost;
        this.type = type;
        this.serviceTags = serviceTags;
        this.imgPath = imgPath;
    }

    public ServiceModel(int serviceId, String name, String description,  String type, String serviceTags, int cost) {
    	this.serviceId = serviceId;
        this.name = name;
        this.description = description;
        this.cost = cost;
        this.type = type;
        this.serviceTags = serviceTags;
    }
    public ServiceModel(int serviceId, String name, String description, int cost, String type, String imgPath) {
        this.serviceId = serviceId;
        this.name = name;
        this.description = description;
        this.cost = cost;
        this.type = type;
        this.imgPath = imgPath;
    }

    // Getters and Setters

    public int getServiceId() {
        return serviceId;
    }

    public void setServiceId(int serviceId) {
        this.serviceId = serviceId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getCost() {
        return cost;
    }

    public void setCost(int cost) {
        this.cost = cost;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getServiceTags() {
        return serviceTags;
    }

    public void setServiceTags(String serviceTags) {
        this.serviceTags = serviceTags;
    }

    public String getImgPath() {
        return imgPath;
    }

    public void setImgPath(String imgPath) {
        this.imgPath = imgPath;
    }

    @Override
    public String toString() {
        return "ServiceModel [serviceId=" + serviceId + ", name=" + name + ", description=" + description + ", cost="
                + cost + ", type=" + type + ", serviceTags=" + serviceTags + ", imgPath=" + imgPath + "]";
    }

}