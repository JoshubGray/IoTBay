package com.iotbay;

import java.io.Serializable;

public class CustomerUser implements Serializable{
    private String email;
    private String password;
    private Address address;
    //private int homePhoneNumber;
    //private int mobilePhoneNumber;
    private boolean isActivated;
    private Integer savedPaymentID;
    private Integer savedShiptmentID;
    private UserType userType;
    private String firstName;
    private String lastName;

    public CustomerUser() {
    }
    /* 
    For Prototype - will delete
    public CustomerUser(String email, String password) {
        this.email = email;
        this.password = password;
    }
    */

    public CustomerUser(String email, String password, String firstName, String lastName, Address address, boolean isActivated, int savedPaymentID, int savedShiptmentID) {
        this.email = email;
        this.password = password;
        this.firstName = firstName;
        this.lastName = lastName;
        this.address = address;
        //this.homePhoneNumber = homePhoneNumber;
        //this.mobilePhoneNumber = mobilePhoneNumber;
        this.isActivated = isActivated;
        this.savedPaymentID = savedPaymentID;
        this.savedShiptmentID = savedShiptmentID;
        this.userType = UserType.CUSTOMER_USER;
    }

    // Registration

    public CustomerUser(String email, String password, String firstName, String lastName, Address address) {
        this.email = email;
        this.password = password;
        this.firstName = firstName;
        this.lastName = lastName;
        this.address = address;
        this.isActivated = true;
        this.userType = UserType.CUSTOMER_USER;
    }

    public CustomerUser(String email, String password, String firstName, String lastName) {
        this.email = email;
        this.password = password;
        this.firstName = firstName;
        this.lastName = lastName;
        this.isActivated = true;
        this.userType = UserType.CUSTOMER_USER;
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
    public Address getAddress() {
        return address;
    }
    public void setAddress(Address address) {
        this.address = address;
    }
    /*
    public int getHomePhoneNumber() {
        return homePhoneNumber;
    }
    public void setHomePhoneNumber(int homePhoneNumber) {
        this.homePhoneNumber = homePhoneNumber;
    }
    public int getMobilePhoneNumber() {
        return mobilePhoneNumber;
    }
    public void setMobilePhoneNumber(int mobilePhoneNumber) {
        this.mobilePhoneNumber = mobilePhoneNumber;
    }
    */
    public boolean isActivated() {
        return isActivated;
    }
    public void setActivated(boolean isActivated) {
        this.isActivated = isActivated;
    }
    public int getSavedPaymentID() {
        return savedPaymentID;
    }
    public void setSavedPaymentID(int savedPaymentID) {
        this.savedPaymentID = savedPaymentID;
    }
    public int getSavedShiptmentID() {
        return savedShiptmentID;
    }
    public void setSavedShiptmentID(int savedShiptmentID) {
        this.savedShiptmentID = savedShiptmentID;
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

    // generate savedShipment ID


    // generate savedPaymentID


}
