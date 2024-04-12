package com.iotbay;

import java.io.Serializable;

public class Staff implements Serializable {
    private String email;
    private String password;
    private String name;
    private int staffID;
    private int staffTypeID;
    
    public Staff() {
    }
    
    public Staff(String email, String password, String name, int staffID, int staffTypeID) {
        this.email = email;
        this.password = password;
        this.name = name;
        this.staffID = staffID;
        this.staffTypeID = staffTypeID;
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
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
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

    


}
