package com.iotbay.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.iotbay.Dao.Orderclass;

public class OrderDAO {
    private Connection connection;

    public OrderDAO(Connection connection) {
        this.connection = connection;
    }

    public void insertOrder(Order order) throws SQLException {
        String sql = "INSERT INTO orders (name, email, date) VALUES (?, ?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, order.getName());
            statement.setString(2, order.getEmail());
            statement.setString(3, order.getDate());
            statement.executeUpdate();
            System.out.println("Order inserted into database: " + order);
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Error executing SQL: " + sql);
            throw e;
        }
    }

    public List<Order> selectAllOrders() throws SQLException {
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT * FROM orders";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                int orderId = resultSet.getInt("orderId");
                String date = resultSet.getString("date");
                Order order = new Order(name, email, orderId, date);
                orders.add(order);
            }
        }
        return orders;
    }

    public Order selectOrder(int orderId) throws SQLException {
        Order order = null;
        String sql = "SELECT * FROM orders WHERE orderId = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, orderId);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String date = resultSet.getString("date");
                order = new Order(name, email, orderId, date);
            }
        }
        return order;
    }

    public boolean updateOrder(Order order) throws SQLException {
        String sql = "UPDATE orders SET name = ?, email = ?, date = ? WHERE orderId = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, order.getName());
            statement.setString(2, order.getEmail());
            statement.setString(3, order.getDate());
            statement.setInt(4, order.getOrderId());
            return statement.executeUpdate() > 0;
        }
    }

    public boolean deleteOrder(int orderId) throws SQLException {
        String sql = "DELETE FROM orders WHERE orderId = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, orderId);
            return statement.executeUpdate() > 0;
        }
    }

    // search order by id
    public List<Order> selectOrderById(int orderId) throws SQLException {
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT * FROM orders WHERE orderId = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, orderId);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String date = resultSet.getString("date");
                Order order = new Order(name, email, orderId, date);
                orders.add(order);
            }
        }
        return orders;
    }

    // search order by date
    public List<Order> selectOrderByDate(String date) throws SQLException {
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT * FROM orders WHERE date = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, date);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                int orderId = resultSet.getInt("orderId");
                Order order = new Order(name, email, orderId, date);
                orders.add(order);
            }
        }
        return orders;
    }
}
