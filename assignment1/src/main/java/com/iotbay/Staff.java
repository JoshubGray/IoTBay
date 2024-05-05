package com.iotbay;

public class Staff extends User {
    private int staffID;
    private int staffTypeID;
    private UserType userType;

    public Staff() {
        
    }
    
    public Staff(String email, String password, String firstName, String lastName) {
        super(email, password, firstName, lastName, UserType.STAFF);
        this.userType = UserType.STAFF;
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

    public UserType getUserType() {
        return userType;
    }

    public void setUserType(UserType userType) {
        this.userType = userType;
    }
}
