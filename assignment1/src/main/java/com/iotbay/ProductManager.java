package com.iotbay;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductManager {
    private Connection connection;

    public ProductManager(Connection connection) {
        this.connection = connection;
    }

    public void addProduct(Product product) throws SQLException {
        String query = "INSERT INTO Product (productID, name, description, unitPrice, quantityInStock) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, product.getProductID());
            stmt.setString(2, product.getName());
            stmt.setString(3, product.getDescription());
            stmt.setDouble(4, product.getUnitPrice());
            stmt.setInt(5, product.getQuantityInStock());
            stmt.executeUpdate();
        }
    }

    public List<Product> listProducts() throws SQLException {
        List<Product> products = new ArrayList<>();
        String query = "SELECT * FROM Product";
        try (Statement stmt = connection.createStatement(); ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                Product product = new Product();
                product.setProductID(rs.getInt("productID"));
                product.setName(rs.getString("name"));
                product.setDescription(rs.getString("description"));
                product.setUnitPrice(rs.getDouble("unitPrice"));
                product.setQuantityInStock(rs.getInt("quantityInStock"));
                products.add(product);
            }
        }
        return products;
    }

    public List<Product> searchProducts(String searchQuery) throws SQLException {
        List<Product> products = new ArrayList<>();
        String query = "SELECT * FROM Product WHERE name LIKE ? OR description LIKE ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, "%" + searchQuery + "%");
            stmt.setString(2, "%" + searchQuery + "%");
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Product product = new Product();
                    product.setProductID(rs.getInt("productID"));
                    product.setName(rs.getString("name"));
                    product.setDescription(rs.getString("description"));
                    product.setUnitPrice(rs.getDouble("unitPrice"));
                    product.setQuantityInStock(rs.getInt("quantityInStock"));
                    products.add(product);
                }
            }
        }
        return products;
    }

    public void updateProduct(Product product) throws SQLException {
        String query = "UPDATE Product SET name = ?, description = ?, unitPrice = ?, quantityInStock = ? WHERE productID = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, product.getName());
            stmt.setString(2, product.getDescription());
            stmt.setDouble(3, product.getUnitPrice());
            stmt.setInt(4, product.getQuantityInStock());
            stmt.setInt(5, product.getProductID());
            stmt.executeUpdate();
        }
    }

    public void deleteProduct(int productID) throws SQLException {
        String query = "DELETE FROM Product WHERE productID = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, productID);
            stmt.executeUpdate();
        }
    }

    public Product getProductById(int productID) throws SQLException {
        Product product = null;
        String query = "SELECT * FROM Product WHERE productID = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, productID);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    product = new Product();
                    product.setProductID(rs.getInt("productID"));
                    product.setName(rs.getString("name"));
                    product.setDescription(rs.getString("description"));
                    product.setUnitPrice(rs.getDouble("unitPrice"));
                    product.setQuantityInStock(rs.getInt("quantityInStock"));
                }
            }
        }
        return product;
    }
}
