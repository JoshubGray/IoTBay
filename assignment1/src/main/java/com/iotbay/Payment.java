package com.iotbay;

import java.io.Serializable;

public class Payment implements Serializable {
    private int paymentID;
    private String cardType;
    private String cardNumber;
    private String expiryDate;
    private Address billingAddress;

    public Payment() {
    }

    public int getPaymentID() {
        return paymentID;
    }
    public void setPaymentID(int paymentID) {
        this.paymentID = paymentID;
    }
    public String getCardType() {
        return cardType;
    }
    public void setCardType(String cardType) {
        this.cardType = cardType;
    }
    public String getCardNumber() {
        return cardNumber;
    }
    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }
    public String getExpiryDate() {
        return expiryDate;
    }
    public void setExpiryDate(String expiryDate) {
        this.expiryDate = expiryDate;
    }
    public Address getAddress() {
        return billingAddress;
    }
    public void setAddress(Address billingAddress) {
        this.billingAddress = billingAddress;
    }
    
}