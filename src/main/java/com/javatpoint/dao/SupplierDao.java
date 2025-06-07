package com.javatpoint.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import com.javatpoint.beans.Supplier;

public class SupplierDao {
	private JdbcTemplate template;

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

	// Pagination methods
//    public List<Supplier> getSuppliersByPage(int pageid, int total) {
//        String sql = "SELECT * FROM supplier LIMIT " + (pageid - 1) + "," + total;
//        return template.query(sql, new RowMapper<Supplier>() {
//            public Supplier mapRow(ResultSet rs, int row) throws SQLException {
//                Supplier s = new Supplier();
//                s.setSupplierID(rs.getInt("SupplierID"));
//                s.setSupplierName(rs.getString("SupplierName"));
//                s.setSupplierPh(rs.getString("SupplierPh"));
//                s.setSupplierAddress(rs.getString("SupplierAddress"));
//                return s;
//            }
//        });
//    }

	public List<Supplier> getSuppliersByPage(int pageid, int total) {
		int offset = (pageid - 1) * total;
		String sql = "SELECT * FROM supplier LIMIT " + offset + "," + total;
		return template.query(sql, new RowMapper<Supplier>() {
			public Supplier mapRow(ResultSet rs, int row) throws SQLException {
				Supplier s = new Supplier();
				s.setSupplierID(rs.getInt("SupplierID"));
				s.setSupplierName(rs.getString("SupplierName"));
				s.setSupplierPh(rs.getString("SupplierPh"));
				s.setSupplierAddress(rs.getString("SupplierAddress"));
				return s;
			}
		});
	}

	// Save supplier and return generated ID
	public int save(Supplier s) {
		String sql = "INSERT INTO supplier(SupplierName, SupplierPh, SupplierAddress) VALUES(?,?,?)";
		return template.update(sql, s.getSupplierName(), s.getSupplierPh(), s.getSupplierAddress());
	}

	public int countSuppliers() {
		String sql = "SELECT COUNT(*) FROM supplier";
		return template.queryForObject(sql, Integer.class);
	}
	
	
	// Get single supplier by ID
	public Supplier getSupplierById(int id) {
	    String sql = "SELECT * FROM supplier WHERE SupplierID=?";
	    return template.queryForObject(sql, new Object[]{id}, new RowMapper<Supplier>() {
	        public Supplier mapRow(ResultSet rs, int row) throws SQLException {
	            Supplier s = new Supplier();
	            s.setSupplierID(rs.getInt("SupplierID"));
	            s.setSupplierName(rs.getString("SupplierName"));
	            s.setSupplierPh(rs.getString("SupplierPh"));
	            s.setSupplierAddress(rs.getString("SupplierAddress"));
	            return s;
	        }
	    });
	}

	// Update supplier
	public int update(Supplier s) {
	    String sql = "UPDATE supplier SET SupplierName=?, SupplierPh=?, SupplierAddress=? WHERE SupplierID=?";
	    return template.update(sql, s.getSupplierName(), s.getSupplierPh(), s.getSupplierAddress(), s.getSupplierID());
	}

	// Delete supplier
	public int delete(int id) {
	    String sql = "DELETE FROM supplier WHERE SupplierID=?";
	    return template.update(sql, id);
	}
	
	// Search suppliers with pagination
	public List<Supplier> searchSuppliers(String query, int pageid, int total) {
	    int offset = (pageid - 1) * total;
	    String sql = "SELECT * FROM supplier WHERE SupplierName LIKE ? OR SupplierPh LIKE ? OR SupplierAddress LIKE ? LIMIT ?, ?";
	    String searchQuery = "%" + query + "%";
	    return template.query(sql, new Object[]{searchQuery, searchQuery, searchQuery, offset, total}, 
	        new RowMapper<Supplier>() {
	            public Supplier mapRow(ResultSet rs, int row) throws SQLException {
	                Supplier s = new Supplier();
	                s.setSupplierID(rs.getInt("SupplierID"));
	                s.setSupplierName(rs.getString("SupplierName"));
	                s.setSupplierPh(rs.getString("SupplierPh"));
	                s.setSupplierAddress(rs.getString("SupplierAddress"));
	                return s;
	            }
	        });
	}

	// Count search results
	public int countSearchResults(String query) {
	    String sql = "SELECT COUNT(*) FROM supplier WHERE SupplierName LIKE ? OR SupplierPh LIKE ? OR SupplierAddress LIKE ?";
	    String searchQuery = "%" + query + "%";
	    return template.queryForObject(sql, new Object[]{searchQuery, searchQuery, searchQuery}, Integer.class);
	}
}