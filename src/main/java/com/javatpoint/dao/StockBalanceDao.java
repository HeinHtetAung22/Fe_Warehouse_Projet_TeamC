package com.javatpoint.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.javatpoint.beans.StockBalance;


public class StockBalanceDao {
    private JdbcTemplate template;

    public void setTemplate(JdbcTemplate template) {
        this.template = template;
    }

    // Pagination methods
    public List<StockBalance> getStockBalancesByPage(int pageid, int total) {
        String sql = "SELECT * FROM stock_balance LIMIT " + (pageid - 1) + "," + total;
        return template.query(sql, new RowMapper<StockBalance>() {
            public StockBalance mapRow(ResultSet rs, int row) throws SQLException {
                StockBalance sb = new StockBalance();
                sb.setBalanceID(rs.getString("BalanceID"));
                sb.setStockID(rs.getString("StockID"));
                sb.setAvailableQty(rs.getInt("AvailableQty"));
                sb.setLastUpdated(rs.getDate("LastUpdated"));
                return sb;
            }
        });
    }

    public int countStockBalances() {
        String sql = "SELECT COUNT(*) FROM stock_balance";
        return template.queryForObject(sql, Integer.class);
    }
}