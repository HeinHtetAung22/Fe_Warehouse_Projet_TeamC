package com.javatpoint.beans;

public class Customer {
    private int customerID;
    private String customerName;
    private String customerPh;
    private String customerAddress;

    // Getters and Setters
    public int getCustomerID() {
        return customerID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getCustomerPh() {
        return customerPh;
    }

    public void setCustomerPh(String customerPh) {
        this.customerPh = customerPh;
    }

    public String getCustomerAddress() {
        return customerAddress;
    }

    public void setCustomerAddress(String customerAddress) {
        this.customerAddress = customerAddress;
    }
    // Helper method to get formatted ID
    public String getFormattedId() {
        return "CUST" + this.customerID;
    }
}