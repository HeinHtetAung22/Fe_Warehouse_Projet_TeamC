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
    public List<Supplier> getSuppliersByPage(int pageid, int total) {
        String sql = "SELECT * FROM supplier LIMIT " + (pageid - 1) + "," + total;
        return template.query(sql, new RowMapper<Supplier>() {
            public Supplier mapRow(ResultSet rs, int row) throws SQLException {
                Supplier s = new Supplier();
                s.setSupplierID(rs.getString("SupplierID"));
                s.setSupplierName(rs.getString("SupplierName"));
                s.setSupplierPh(rs.getString("SupplierPh"));
                s.setSupplierAddress(rs.getString("SupplierAddress"));
                return s;
            }
        });
    }

    public int countSuppliers() {
        String sql = "SELECT COUNT(*) FROM supplier";
        return template.queryForObject(sql, Integer.class);
    }
}