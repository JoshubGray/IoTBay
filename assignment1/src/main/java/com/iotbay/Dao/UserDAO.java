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
    //private final String updateCustomerQuery = "";
    //private final String updateStaffQuery = "";
    private final String addCustomerQuery = "INSERT INTO CustomerUser (email, password, firstName, lastName, streetAddress, postcode, city, state, homePhoneNumber, mobilePhoneNumber, activated, savedPaymentID, savedShipmentID) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
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
            ((CustomerUser)customerUser).setAddress(new Address(streetAddress, postcode, city, state));
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
            statement.setInt(12, customer.getSavedPaymentID());
            statement.setInt(13, customer.getSavedShipmentID());
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

    public void updateCustomer(Customer customer) {

    }

    public void updateStaff(Staff staff) {

    }
}
