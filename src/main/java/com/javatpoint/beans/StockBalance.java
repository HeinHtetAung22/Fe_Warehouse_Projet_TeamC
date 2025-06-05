package com.javatpoint.beans;

import java.util.Date;

public class StockBalance {
    private String balanceID;
    private String stockID;
    private int availableQty;
    private Date lastUpdated;

    // Getters and Setters
    public String getBalanceID() {
        return balanceID;
    }

    public void setBalanceID(String balanceID) {
        this.balanceID = balanceID;
    }

    public String getStockID() {
        return stockID;
    }

    public void setStockID(String stockID) {
        this.stockID = stockID;
    }

    public int getAvailableQty() {
        return availableQty;
    }

    public void setAvailableQty(int availableQty) {
        this.availableQty = availableQty;
    }

    public Date getLastUpdated() {
        return lastUpdated;
    }

    public void setLastUpdated(Date lastUpdated) {
        this.lastUpdated = lastUpdated;
    }
}