package com.javatpoint.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.javatpoint.beans.Customer;


public class CustomerDao {
    private JdbcTemplate template;

    public void setTemplate(JdbcTemplate template) {
        this.template = template;
    }

    // Insert a new customer
    public int save(Customer customer) {
        String sql = "INSERT INTO customer (CustomerID, CustomerName, CustomerPh, CustomerAddress) VALUES(?, ?, ?, ?)";
        return template.update(sql, 
            customer.getCustomerID(), 
            customer.getCustomerName(), 
            customer.getCustomerPh(), 
            customer.getCustomerAddress()
        );
    }

    // Update a customer by ID
    public int update(Customer customer) {
        String sql = "UPDATE customer SET CustomerName=?, CustomerPh=?, CustomerAddress=? WHERE CustomerID=?";
        return template.update(sql, 
            customer.getCustomerName(), 
            customer.getCustomerPh(), 
            customer.getCustomerAddress(), 
            customer.getCustomerID()
        );
    }

    // Delete a customer by ID
    public int delete(String customerID) {
        String sql = "DELETE FROM customer WHERE CustomerID=?";
        return template.update(sql, customerID);
    }

    // Get a single customer by ID (using BeanPropertyRowMapper)
    public Customer getCustomerById(String customerID) {
        String sql = "SELECT * FROM customer WHERE CustomerID=?";
        return template.queryForObject(sql, new Object[]{customerID}, 
               new BeanPropertyRowMapper<>(Customer.class));
    }

    // Get all customers (using RowMapper for demonstration)
    public List<Customer> getAllCustomers() {
        return template.query("SELECT * FROM customer", new RowMapper<Customer>() {
            @Override
            public Customer mapRow(ResultSet rs, int rowNum) throws SQLException {
                Customer customer = new Customer();
                customer.setCustomerID(rs.getString("CustomerID"));
                customer.setCustomerName(rs.getString("CustomerName"));
                customer.setCustomerPh(rs.getString("CustomerPh"));
                customer.setCustomerAddress(rs.getString("CustomerAddress"));
                return customer;
            }
        });
    }
    
    // Alternative getAllCustomers using BeanPropertyRowMapper
    public List<Customer> getAllCustomersSimple() {
        String sql = "SELECT * FROM customer";
        return template.query(sql, new BeanPropertyRowMapper<>(Customer.class));
    }
    
    public List<Customer> getCustomersByPage(int pageid, int total) {
        String sql = "SELECT * FROM customer LIMIT " + (pageid - 1) + "," + total;
        return template.query(sql, new RowMapper<Customer>() {
            public Customer mapRow(ResultSet rs, int row) throws SQLException {
                Customer customer = new Customer();
                customer.setCustomerID(rs.getString("CustomerID"));
                customer.setCustomerName(rs.getString("CustomerName"));
                customer.setCustomerPh(rs.getString("CustomerPh"));
                customer.setCustomerAddress(rs.getString("CustomerAddress"));
                return customer;
            }
        });
    }

    public int countCustomers() {
        String sql = "SELECT COUNT(*) FROM customer";
        return template.queryForObject(sql, Integer.class);
    }
    
}