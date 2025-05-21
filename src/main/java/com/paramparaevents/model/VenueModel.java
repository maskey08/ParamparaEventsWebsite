package com.paramparaevents.model;

public class VenueModel {
    private int id;
    private String name;
    private String address;
    private int capacity;
    private String facilities;
    private String availability;
    private String venueTags;

    // Constructors
    public VenueModel() {}

    public VenueModel(int id, String name, String address, int capacity, String facilities, String availability, String venueTags) {
        this.id = id;
        this.name = name;
        this.address = address;
        this.capacity = capacity;
        this.facilities = facilities;
        this.availability = availability;
        this.venueTags = venueTags;
    }

    // Getters & Setters
    public int getId() { 
        return id; 
    }
    
    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }
    
    public void setName(String name) {
        this.name = name; 
    }

    public String getAddress() {
        return address; 
    }
    
    public void setAddress(String address) { 
        this.address = address;
    }

    public int getCapacity() { 
        return capacity;
    }
    
    public void setCapacity(int capacity) { 
        this.capacity = capacity; 
    }
    
    public String getFacilities() {
        return facilities;
    }
    
    public void setFacilities(String facilities) {
        this.facilities = facilities;
    }
    
    public String getAvailability() {
        return availability;
    }
    
    public void setAvailability(String availability) {
        this.availability = availability;
    }
    
    public String getVenueTags() {
        return venueTags;
    }
    
    public void setVenueTags(String venueTags) {
        this.venueTags = venueTags;
    }
}

