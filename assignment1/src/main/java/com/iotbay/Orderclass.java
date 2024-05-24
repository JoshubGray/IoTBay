package com.iotbay.Dao;

public class Order {
    private String name;
    private String email;
    private int orderId;
    private String date;

    public Order(String name, String email, int orderId, String date) {
        this.name = name;
        this.email = email;
        this.orderId = orderId;
        this.date = date;
    }

    // method of getter and setter
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
}
