package com.javatpoint.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import com.javatpoint.beans.Customer;

public class CustomerDao {
    private JdbcTemplate template;

    public void setTemplate(JdbcTemplate template) {
        this.template = template;
    }

    // Pagination method
    public List<Customer> getCustomersByPage(int pageid, int total) {
        int offset = (pageid - 1) * total;
        String sql = "SELECT * FROM customer LIMIT ?, ?";
        return template.query(sql, new Object[]{offset, total}, new RowMapper<Customer>() {
            public Customer mapRow(ResultSet rs, int row) throws SQLException {
                Customer c = new Customer();
                c.setCustomerID(rs.getInt("CustomerID"));
                c.setCustomerName(rs.getString("CustomerName"));
                c.setCustomerPh(rs.getString("CustomerPh"));
                c.setCustomerAddress(rs.getString("CustomerAddress"));
                return c;
            }
        });
    }

    // Count all customers
    public int countCustomers() {
        String sql = "SELECT COUNT(*) FROM customer";
        return template.queryForObject(sql, Integer.class);
    }

    // Save customer
    public int save(Customer c) {
        String sql = "INSERT INTO customer(CustomerName, CustomerPh, CustomerAddress) VALUES(?,?,?)";
        return template.update(sql, c.getCustomerName(), c.getCustomerPh(), c.getCustomerAddress());
    }

    // Get single customer by ID
    public Customer getCustomerById(int id) {
        String sql = "SELECT * FROM customer WHERE CustomerID=?";
        return template.queryForObject(sql, new Object[]{id}, new RowMapper<Customer>() {
            public Customer mapRow(ResultSet rs, int row) throws SQLException {
                Customer c = new Customer();
                c.setCustomerID(rs.getInt("CustomerID"));
                c.setCustomerName(rs.getString("CustomerName"));
                c.setCustomerPh(rs.getString("CustomerPh"));
                c.setCustomerAddress(rs.getString("CustomerAddress"));
                return c;
            }
        });
    }

    // Update customer
    public int update(Customer c) {
        String sql = "UPDATE customer SET CustomerName=?, CustomerPh=?, CustomerAddress=? WHERE CustomerID=?";
        return template.update(sql, c.getCustomerName(), c.getCustomerPh(), c.getCustomerAddress(), c.getCustomerID());
    }

    // Delete customer
    public int delete(int id) {
        String sql = "DELETE FROM customer WHERE CustomerID=?";
        return template.update(sql, id);
    }
    
    // Search customers with pagination
    public List<Customer> searchCustomers(String query, int pageid, int total) {
        int offset = (pageid - 1) * total;
        String sql = "SELECT * FROM customer WHERE CustomerName LIKE ? OR CustomerPh LIKE ? OR CustomerAddress LIKE ? LIMIT ?, ?";
        String searchQuery = "%" + query + "%";
        return template.query(sql, new Object[]{searchQuery, searchQuery, searchQuery, offset, total}, 
            new RowMapper<Customer>() {
                public Customer mapRow(ResultSet rs, int row) throws SQLException {
                    Customer c = new Customer();
                    c.setCustomerID(rs.getInt("CustomerID"));
                    c.setCustomerName(rs.getString("CustomerName"));
                    c.setCustomerPh(rs.getString("CustomerPh"));
                    c.setCustomerAddress(rs.getString("CustomerAddress"));
                    return c;
                }
            });
    }

    // Count search results
    public int countSearchResults(String query) {
        String sql = "SELECT COUNT(*) FROM customer WHERE CustomerName LIKE ? OR CustomerPh LIKE ? OR CustomerAddress LIKE ?";
        String searchQuery = "%" + query + "%";
        return template.queryForObject(sql, new Object[]{searchQuery, searchQuery, searchQuery}, Integer.class);
    }
}