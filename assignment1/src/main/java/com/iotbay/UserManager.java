package com.iotbay;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import com.iotbay.*;
import com.iotbay.Dao.DBConnector;
import com.iotbay.Dao.UserDAO;

/*
     * Helper class for people to check what user is logged in...
     * 
     * Reference (as per Assessment Guidelines):
     * 
     * Customer => Not Registered
     * They only have an email registered if they have placed an order
     * I've also provided a method to update that if someone needs it
     * 
     * CustomerUser => Registered
     * All details are required (except Phone/Mobile)
     * 
     * Staff => Registered
     * All details are required
     * You can check staff type for special priviledges (see getStaffType())
     * 
     */

public class UserManager {

    private static ArrayList<User> userList;

    private static void populateUserList(){
        try {
            DBConnector dbConnector = new DBConnector();
            Connection connection = dbConnector.openConnection();
            UserDAO ud = new UserDAO(connection);
            try {

            userList = new ArrayList<>();
            userList.addAll(ud.fetchCustomerUsers());
            userList.addAll(ud.fetchStaffUsers());
            }
            catch (SQLException e) {
                System.out.print(e);
            }
            finally {
                dbConnector.closeConnection();
            }
        }
        catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
        }
    }

    /*
    * Login
    * Returns registered User if user is found
    * Returns null if not found, or incorrect password
    */
    public static User getUserFromDB(String email, String password) {
        populateUserList();
        for (User user : userList) {
            if (user.getEmail().equals(email)) {
                if (user.getPassword().equals(password)) {
                    return user;
                }
                else {
                    return null;
                }
            }
        }
        return null;
    }

    /*
     * Registration
     * Adds new User to DB
     */
    public static void addUserToDB(User user) {
        try {
        DBConnector dbConnector = new DBConnector();
        Connection connection = dbConnector.openConnection();
        UserDAO ud = new UserDAO(connection);
            switch (user.getUserType()) {
                case CUSTOMER_USER:
                    ud.addCustomer((CustomerUser)user);
                    break;
                case STAFF:
                    ud.addStaff(((Staff)user));
                    break;
                default:
                System.out.println("User Type: " + user.getUserType() + " - not found in method");
                    break;
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.print(e);
        }
    }
}
