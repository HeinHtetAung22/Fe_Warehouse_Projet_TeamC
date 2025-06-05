package com.javatpoint.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.javatpoint.beans.StockIn;


public class StockInDao {
    private JdbcTemplate template;

    public void setTemplate(JdbcTemplate template) {
        this.template = template;
    }

    // Pagination methods
    public List<StockIn> getStockInsByPage(int pageid, int total) {
        String sql = "SELECT * FROM stock_in LIMIT " + (pageid - 1) + "," + total;
        return template.query(sql, new RowMapper<StockIn>() {
            public StockIn mapRow(ResultSet rs, int row) throws SQLException {
                StockIn si = new StockIn();
                si.setInID(rs.getString("InID"));
                si.setStockID(rs.getString("StockID"));
                si.setQuantity(rs.getInt("Quantity"));
                si.setDateIn(rs.getDate("DateIn"));
                si.setSupplierID(rs.getString("SupplierID"));
                si.setWareHouseID(rs.getString("WareHouseID"));
                si.setRemarks(rs.getString("Remarks"));
                return si;
            }
        });
    }

    public int countStockIns() {
        String sql = "SELECT COUNT(*) FROM stock_in";
        return template.queryForObject(sql, Integer.class);
    }
}