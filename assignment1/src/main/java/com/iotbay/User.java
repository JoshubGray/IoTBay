package com.iotbay;

import java.io.Serializable;

public class User implements Serializable {
    private String email;
    private String password;
    private Address address;
    private String homePhoneNumber;
    private String mobilePhoneNumber;
    private boolean isActivated;
    private int savedPaymentID;

    public User() {
    }

    public User(String email, String password) {
        this.email = email;
        this.password = password;
    }

    public User(String email, String password, Address address, String homePhoneNumber, String mobilePhoneNumber,
            boolean isActivated, int savedPaymentID, int savedShiptmentID) {
        this.email = email;
        this.password = password;
        this.address = address;
        this.homePhoneNumber = homePhoneNumber;
        this.mobilePhoneNumber = mobilePhoneNumber;
        this.isActivated = isActivated;
        this.savedPaymentID = savedPaymentID;
        this.savedShiptmentID = savedShiptmentID;
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
    public String getHomePhoneNumber() {
        return homePhoneNumber;
    }
    public void setHomePhoneNumber(String homePhoneNumber) {
        this.homePhoneNumber = homePhoneNumber;
    }
    public String getMobilePhoneNumber() {
        return mobilePhoneNumber;
    }
    public void setMobilePhoneNumber(String mobilePhoneNumber) {
        this.mobilePhoneNumber = mobilePhoneNumber;
    }
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


}
