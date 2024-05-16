package com.iotbay;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

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

    public static void populateUserList(){
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
            System.out.println("UserManager populateUserList: " + e);
        }
    }

    /*
    * Login
    * Returns registered User if user is found
    * Returns null if not found, or incorrect password
    */
    public static User loginUser(String email, String password, String sessionId) {
        try {
            DBConnector dbConnector = new DBConnector();
            Connection connection = dbConnector.openConnection();
            UserDAO ud = new UserDAO(connection);
            return ud.userLogin(email, password, sessionId);
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("UserManager loginUser: " + e);
        }
        return null;
    }

    /*
     * Registration
     * Adds new User to DB
     */
    public static void addUserToDB(String sessionId, User user) {
        try {
        DBConnector dbConnector = new DBConnector();
        Connection connection = dbConnector.openConnection();
        UserDAO ud = new UserDAO(connection);
            switch (user.getUserType()) {
                case CUSTOMER_USER:
                    ud.addCustomer((CustomerUser)user, sessionId);
                    break;
                case STAFF:
                    ud.addStaff(((Staff)user), sessionId);
                    break;
                default:
                System.out.println("User Type: " + user.getUserType() + " - not found in method");
                    break;
            }
            dbConnector.closeConnection();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("UserManager addUserToDB: " + e);
        }
    }

    /*
     * Update User account details
     * checks UserType before performing update
     */
    public static void updateUserDetails(User newData, User oldData) {
        try {
        DBConnector dbConnector = new DBConnector();
        Connection connection = dbConnector.openConnection();
        UserDAO ud = new UserDAO(connection);
        switch (oldData.getUserType()) {
            case CUSTOMER_USER:
                ud.updateCustomer((CustomerUser) newData, (CustomerUser) oldData);
                break;
            case STAFF:
                ud.updateStaff((Staff) newData, (Staff) oldData);
                break;
            default:
            System.out.println("User Type: " + oldData.getUserType() + " - not found in method");
                break;
            }
            dbConnector.closeConnection();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("UserManager updateUserDetails: " + e);
        }
    }

    // Check duplicate email (Validation)
    public static boolean isEmailUnique(String email) {
        try {
            DBConnector dbConnector = new DBConnector();
            Connection connection = dbConnector.openConnection();
            UserDAO ud = new UserDAO(connection);
            boolean res = ud.checkDuplicateEmail(email);
            dbConnector.closeConnection();
            return res;
            } catch (ClassNotFoundException | SQLException e) {
                System.out.println("UserManager removeUser: " + e);
            }
            return false;
    }

    /*
     * Removes the user from the database
     * Does NOT remove the user from sessions
     * That is handled after pressing the "remove user" button (unregister_controller.jsp)
     */
    public static void removeUser(User user) {
        try {
            DBConnector dbConnector = new DBConnector();
            Connection connection = dbConnector.openConnection();
            UserDAO ud = new UserDAO(connection);
            ud.removeUser(user);
            dbConnector.closeConnection();
            } catch (ClassNotFoundException | SQLException e) {
                System.out.println("UserManager removeUser: " + e);
            }
    }

    // Data Log methods

    /*
     * Updates the time when user logs out to the DB
     */
    public static void updateLogoutData(String sessionId) {
        try {
            DBConnector dbConnector = new DBConnector();
            Connection connection = dbConnector.openConnection();
            UserDAO ud = new UserDAO(connection);
            ud.updateUserLogoutAccessLog(sessionId);
            dbConnector.closeConnection();
            } catch (ClassNotFoundException | SQLException e) {
                System.out.println("UserManager removeUser: " + e);
            }
    }

    /*
     * Get Access Log information from the DB based on the email passed through
     */
    public static ArrayList<Timestamp[]> getAccessDataLogs(String email) {
        ArrayList<Timestamp[]> results = new ArrayList<>();
        try {
            DBConnector dbConnector = new DBConnector();
            Connection connection = dbConnector.openConnection();
            UserDAO ud = new UserDAO(connection);
            results = ud.getUserLogs(email);
            dbConnector.closeConnection();
            return results;
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println("Error getting access logs: " + e);
            }
        return null;
    }

    public static void debug() {
        System.out.println("here");
    }
}
