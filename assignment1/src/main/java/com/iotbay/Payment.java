package com.iotbay;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.SQLException;

import com.iotbay.Dao.DBConnector;
import com.iotbay.Dao.PaymentDAO;

public class Payment implements Serializable {
    public static void makePayment(String PaymentID, String cardType, String cardNumber, String cvn, double amount, String customerEmail, String expiryDateMonth, String expiryDateYear) {
        try {
            DBConnector dbConnector = new DBConnector();
            Connection connection = dbConnector.openConnection();
            PaymentDAO pd = new PaymentDAO(connection);
            pd.addPayment(PaymentID, cardType, cardNumber, cvn, amount, customerEmail, expiryDateMonth, expiryDateYear);
            dbConnector.closeConnection();
            } 
            catch (ClassNotFoundException | SQLException e) {
                System.out.println("UserManager addUserToDB: " + e);
            }
    }
    
}
