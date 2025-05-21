package com.paramparaevents.model;

import java.math.BigDecimal;
import java.sql.Timestamp;

/**
 * Model class representing a product in the event management system.
 */
public class ProductModel {
    private int productId;
    private String name;
    private String description;
    private BigDecimal price;
    private String category;
    private int stockQuantity;
    private String imagePath;
    private boolean isFeatured;
    private Timestamp createdAt;
    private Timestamp updatedAt;

    /**
     * Default constructor.
     */
    public ProductModel() {
    }

    /**
     * Constructor with essential fields.
     *
     * @param productId     The unique identifier for the product
     * @param name          The name of the product
     * @param description   A detailed description of the product
     * @param price         The price of the product
     * @param category      The category of the product
     * @param imagePath     The path to the product image
     */
    public ProductModel(int productId, String name, String description, BigDecimal price, 
                        String category, String imagePath) {
        this.productId = productId;
        this.name = name;
        this.description = description;
        this.price = price;
        this.category = category;
        this.imagePath = imagePath;
    }

    /**
     * Constructor with all fields.
     *
     * @param productId     The unique identifier for the product
     * @param name          The name of the product
     * @param description   A detailed description of the product
     * @param price         The price of the product
     * @param category      The category of the product
     * @param stockQuantity The available stock quantity
     * @param imagePath     The path to the product image
     * @param isFeatured    Whether the product is featured
     * @param createdAt     When the product was created
     * @param updatedAt     When the product was last updated
     */
    public ProductModel(int productId, String name, String description, BigDecimal price, 
                        String category, int stockQuantity, String imagePath, 
                        boolean isFeatured, Timestamp createdAt, Timestamp updatedAt) {
        this.productId = productId;
        this.name = name;
        this.description = description;
        this.price = price;
        this.category = category;
        this.stockQuantity = stockQuantity;
        this.imagePath = imagePath;
        this.isFeatured = isFeatured;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    // Getters and Setters

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
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

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public int getStockQuantity() {
        return stockQuantity;
    }

    public void setStockQuantity(int stockQuantity) {
        this.stockQuantity = stockQuantity;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public boolean isFeatured() {
        return isFeatured;
    }

    public void setFeatured(boolean featured) {
        isFeatured = featured;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public Timestamp getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Timestamp updatedAt) {
        this.updatedAt = updatedAt;
    }

    @Override
    public String toString() {
        return "ProductModel{" +
                "productId=" + productId +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", price=" + price +
                ", category='" + category + '\'' +
                ", stockQuantity=" + stockQuantity +
                ", imagePath='" + imagePath + '\'' +
                ", isFeatured=" + isFeatured +
                '}';
    }
}
