package com.iotbay;

import java.io.Serializable;

public class Staff implements Serializable{
    private String email;
    private String password;
    private String firstName;
    private String lastName;
    private int staffID;
    private int staffTypeID;
    private UserType userType;

    public Staff() {
    }
    
    public Staff(String email, String password, String firstName, String lastName, int staffID, int staffTypeID) {
        this.email = email;
        this.password = password;
        this.firstName = firstName;
        this.lastName = lastName;
        this.staffID = staffID;
        this.staffTypeID = staffTypeID;
        this.userType = UserType.STAFF;
    }

    public Staff(String email, String password, String firstName, String lastName, String staffID, String staffTypeID) {
        this.email = email;
        this.password = password;
        this.firstName = firstName;
        this.lastName = lastName;
        this.staffID = Integer.parseInt(staffID);
        this.staffTypeID = Integer.parseInt(staffTypeID);
        this.userType = UserType.STAFF;
    }

    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public int getStaffID() {
        return staffID;
    }
    public void setStaffID(int staffID) {
        this.staffID = staffID;
    }
    public int getStaffTypeID() {
        return staffTypeID;
    }
    public void setStaffTypeID(int staffTypeID) {
        this.staffTypeID = staffTypeID;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public void setUserType(UserType userType) {
        this.userType = userType;
    }

    public UserType getUserType() {
        return userType;
    }
}
