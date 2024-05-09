package com.iotbay.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import com.iotbay.*;

public class UserDAO {
    private Connection connection;
    private final String customerUserReadQuery = "SELECT * FROM CustomerUser";
    private final String staffUserReadQuery = "SELECT * FROM Staff";
    private final String userLoginReadQuery = "SELECT * FROM (SELECT * FROM CustomerUser UNION SELECT * FROM Staff) AS userTable WHERE email=? AND password=?";
    private final String updateCustomerQuery = "UPDATE CustomerUser SET email=?, password=?, firstName=?, lastName=?, streetAddress=?, postcode=?, city=?, state=?, homePhoneNumber=?, mobilePhoneNumber=?, isActivated=?, savedPaymentID=?, savedShipmentID=? WHERE email=?";
    private final String updateStaffQuery = "UPDATE Staff SET email=?, password=?, firstName=?, lastName=?, staffID=?, staffTypeID=? WHERE email=?";
    private final String addCustomerQuery = "INSERT INTO CustomerUser (email, password, firstName, lastName, streetAddress, postcode, city, state, homePhoneNumber, mobilePhoneNumber, isActivated) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    private final String addStaffQuery = "INSERT INTO Staff (email, password, firstName, lastName, staffID, staffTypeID) VALUES (?, ?, ?, ?, ?, ?)";

    public UserDAO(Connection connection) throws SQLException {
        connection.setAutoCommit(true);
        this.connection = connection;
    }

    public ArrayList<User> fetchCustomerUsers() throws SQLException {
        PreparedStatement customerSt = connection.prepareStatement(customerUserReadQuery);
        ResultSet rs = customerSt.executeQuery();

        ArrayList<User> customerUsers = new ArrayList<User>();
        while (rs.next()) {
            User customerUser = new CustomerUser();
            customerUser.setEmail(rs.getString(1));
            customerUser.setPassword(rs.getString(2));
            customerUser.setFirstName(rs.getString(3));
            customerUser.setLastName(rs.getString(4));
            String streetAddress = rs.getString(5);
            String postcode = rs.getString(6);
            String city = rs.getString(7);
            String state = rs.getString(8);
            ((CustomerUser)customerUser).setAddress(new Address(streetAddress, Integer.parseInt(postcode), city, state));
            ((CustomerUser)customerUser).setHomePhoneNumber(Integer.parseInt(rs.getString(9)));
            ((CustomerUser)customerUser).setMobilePhoneNumber(Integer.parseInt(rs.getString(10)));
            ((CustomerUser)customerUser).setActivated(Boolean.parseBoolean(rs.getString(11)));
            ((CustomerUser)customerUser).setSavedPaymentID(Integer.parseInt(rs.getString(12)));
            ((CustomerUser)customerUser).setSavedShipmentID(Integer.parseInt(rs.getString(13)));
            customerUsers.add(customerUser);
        }
        return customerUsers;
    }

    public ArrayList<User> fetchStaffUsers() throws SQLException {
        PreparedStatement staffSt = connection.prepareStatement(staffUserReadQuery);
        ResultSet rs = staffSt.executeQuery();
        ArrayList<User> staffUsers = new ArrayList<User>();
        while (rs.next()) {
            User staff = new Staff();
            staff.setEmail(rs.getString(1));
            staff.setPassword(rs.getString(2));
            staff.setFirstName(rs.getString(3));
            staff.setLastName(rs.getString(4));
            ((Staff)staff).setStaffID(Integer.parseInt(rs.getString(5)));
            ((Staff)staff).setStaffTypeID(Integer.parseInt(rs.getString(6)));
            staffUsers.add(staff);
        }
        return staffUsers;
    }

    /*
     * Registration
     */
    public void addCustomer(CustomerUser customer) {
        try (PreparedStatement statement = connection.prepareStatement(addCustomerQuery)) {
            statement.setString(1, customer.getEmail());
            statement.setString(2, customer.getPassword());
            statement.setString(3, customer.getFirstName());
            statement.setString(4, customer.getLastName());
            statement.setString(5, customer.getAddress().getStreetAddress());
            statement.setInt(6, customer.getAddress().getPostcode());
            statement.setString(7, customer.getAddress().getCity());
            statement.setString(8, customer.getAddress().getState());
            statement.setInt(9, customer.getHomePhoneNumber());
            statement.setInt(10, customer.getMobilePhoneNumber());
            statement.setBoolean(11, customer.isActivated());
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void addStaff(Staff staff) {
        try (PreparedStatement statement = connection.prepareStatement(addStaffQuery)) {
            statement.setString(1, staff.getEmail());
            statement.setString(2, staff.getPassword());
            statement.setString(3, staff.getFirstName());
            statement.setString(4, staff.getLastName());
            statement.setInt(5, staff.getStaffID());
            statement.setInt(6, staff.getStaffTypeID());
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    /*
     * Update
     */
    public void updateCustomer(CustomerUser customerUser) {
        try {
            PreparedStatement statement = connection.prepareStatement(updateCustomerQuery);
            statement.setString(1, customerUser.getEmail());
            statement.setString(2, customerUser.getPassword());
            statement.setString(3, customerUser.getFirstName());
            statement.setString(4, customerUser.getLastName());
            statement.setString(5, customerUser.getAddress().getStreetAddress());
            statement.setInt(6, customerUser.getAddress().getPostcode());
            statement.setString(7, customerUser.getAddress().getCity());
            statement.setString(8, customerUser.getAddress().getState());
            statement.setInt(9, customerUser.getHomePhoneNumber());
            statement.setInt(10, customerUser.getMobilePhoneNumber());
            statement.setBoolean(11, customerUser.isActivated());
            statement.setInt(12, customerUser.getSavedPaymentID());
            statement.setInt(13, customerUser.getSavedShipmentID());
            statement.setString(14, customerUser.getEmail());
            int rowsAffected = statement.executeUpdate();
    
            if (rowsAffected == 0) {
                System.out.println("Update failed - Customer not likely found");
            }
            statement.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateStaff(Staff staff) {
        try (PreparedStatement statement = connection.prepareStatement(updateStaffQuery)) {
            statement.setString(1, staff.getEmail());
            statement.setString(2, staff.getPassword());
            statement.setString(3, staff.getFirstName());
            statement.setString(4, staff.getLastName());
            statement.setInt(5, staff.getStaffID());
            statement.setInt(6, staff.getStaffTypeID());
            statement.setString(7, staff.getEmail());
    
            int rowsUpdated = statement.executeUpdate();
            if (rowsUpdated == 0) {
                System.out.println("Update failed - Staff not likely found");
            }
            statement.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
    } 

    /*
     * Login
     */
    public User userLogin(String email, String password) {
        try {
            PreparedStatement statement = connection.prepareStatement(userLoginReadQuery);
        statement.setString(1, email);
        statement.setString(2, password);
        ResultSet result = statement.executeQuery();
        
        if (result.next()) {
            int userType = result.getInt("userType");
            switch (userType) {
                case 1:
                    CustomerUser customerUser = new CustomerUser();
                    customerUser.setEmail(result.getString("email"));
                    customerUser.setPassword(result.getString("password"));
                    Address address = new Address();
                    address.setCity(result.getString("city"));
                    address.setPostcode(result.getInt("postcode"));
                    address.setState(result.getString("state"));
                    address.setStreetAddress(result.getString("streetAddress"));
                    customerUser.setAddress(address);
                    customerUser.setFirstName(result.getString("firstName"));
                    customerUser.setLastName(result.getString("lastName"));
                    customerUser.setActivated(result.getBoolean("isActivated"));

                    Integer homePhoneNumber = result.getInt("homePhoneNumber");
                    if (homePhoneNumber != null) {
                        customerUser.setHomePhoneNumber(homePhoneNumber);
                    }

                    Integer mobilePhoneNumber = result.getInt("mobilePhoneNumber");
                    if (mobilePhoneNumber != null) {
                        customerUser.setMobilePhoneNumber(mobilePhoneNumber);
                    }

                    Integer paymentID = result.getInt("savedPaymentID");
                    if (paymentID != null) {
                        customerUser.setSavedPaymentID(paymentID);
                    }

                    Integer shipmentID = result.getInt("savedShipmentID");
                    if (shipmentID != null) {
                        customerUser.setSavedShipmentID(shipmentID);
                    }
                    return customerUser;
                case 2:
                    Staff staff = new Staff();
                    staff.setStaffID(result.getInt("staffID"));
                    staff.setEmail(result.getString("email"));
                    staff.setPassword(result.getString("password"));
                    staff.setFirstName(result.getString("firstName"));
                    staff.setLastName(result.getString("lastName"));
                    staff.setStaffTypeID(result.getInt("staffTypeID"));
                    return staff;
                default:
                System.out.println("User type not found");
                return null;
            }
        } 
    } catch (SQLException e) {
        System.out.println(e);
        }
    return null;
    }
}