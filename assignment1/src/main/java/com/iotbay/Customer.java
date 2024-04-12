package com.iotbay;

import java.io.Serializable;

public class Customer implements Serializable {

    private String email;

    public Customer() {
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    
}
