package com.javatpoint.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.javatpoint.beans.StockOut;


public class StockOutDao {
    private JdbcTemplate template;

    public void setTemplate(JdbcTemplate template) {
        this.template = template;
    }

    // Pagination methods
    public List<StockOut> getStockOutsByPage(int pageid, int total) {
        String sql = "SELECT * FROM stock_out LIMIT " + (pageid - 1) + "," + total;
        return template.query(sql, new RowMapper<StockOut>() {
            public StockOut mapRow(ResultSet rs, int row) throws SQLException {
                StockOut so = new StockOut();
                so.setOutID(rs.getString("OutID"));
                so.setStockID(rs.getString("StockID"));
                so.setQuantity(rs.getInt("Quantity"));
                so.setDateOut(rs.getDate("DateOut"));
                so.setCustomerID(rs.getString("CustomerID"));
                so.setWareHouseID(rs.getString("WareHouseID"));
                so.setRemarks(rs.getString("Remarks"));
                return so;
            }
        });
    }

    public int countStockOuts() {
        String sql = "SELECT COUNT(*) FROM stock_out";
        return template.queryForObject(sql, Integer.class);
    }
}