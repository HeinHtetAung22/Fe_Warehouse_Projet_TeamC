package com.javatpoint.beans;

public class Supplier {
    private int supplierID;
    private String supplierName;
    private String supplierPh;
    private String supplierAddress;

    // Getters and Setters
    public int getSupplierID() {
        return supplierID;
    }

    public void setSupplierID(int supplierID) {
        this.supplierID = supplierID;
    }

    public String getSupplierName() {
        return supplierName;
    }

    public void setSupplierName(String supplierName) {
        this.supplierName = supplierName;
    }

    public String getSupplierPh() {
        return supplierPh;
    }

    public void setSupplierPh(String supplierPh) {
        this.supplierPh = supplierPh;
    }

    public String getSupplierAddress() {
        return supplierAddress;
    }

    public void setSupplierAddress(String supplierAddress) {
        this.supplierAddress = supplierAddress;
    }
 // Helper method to get formatted ID
    public String getFormattedId() {
        return "SUP" + this.supplierID;
    }
}