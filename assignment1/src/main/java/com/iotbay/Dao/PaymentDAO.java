package com.iotbay.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;



public class PaymentDAO {
    private Connection connection;
    private final String addPaymentQuery = "INSERT INTO Payment (paymentID, cardType, cardNumber, cvn, amount, customerEmail, timestamp, expiryDateMonth, expiryDateYear) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
    private final String queryHistory = "SELECT paymentID, cardType, cardNumber, amount, timestamp FROM payment";

    public PaymentDAO(Connection connection) throws SQLException {
        connection.setAutoCommit(true);
        this.connection = connection;
    } 


    public void addPayment(String paymentID, String cardType, String cardNumber, String cvn, double amount, String customerEmail, String expiryDateMonth, String expiryDateYear) {
        try (PreparedStatement statement = connection.prepareStatement(addPaymentQuery)) {
            statement.setString(1, paymentID);
            statement.setString(2, cardType);
            statement.setString(3, cardNumber);
            statement.setString(4, cvn);
            statement.setDouble(5, amount);
            statement.setString(6, customerEmail);
            statement.setTimestamp(7, new Timestamp(System.currentTimeMillis()));
            statement.setString(8, expiryDateMonth);
            statement.setString(9, expiryDateYear);
            statement.executeUpdate();

        } 
        catch (SQLException e) {
            System.out.println("addPayment" + e);
        }
    }

    public ResultSet queryHistory() {
        try {
            PreparedStatement statement=connection.prepareStatement(queryHistory);
            ResultSet results=statement.executeQuery();
            return results;
        } 
        catch (SQLException e) {
            System.out.println("queryHistory" + e);
        }
        return null;
    }
}
    