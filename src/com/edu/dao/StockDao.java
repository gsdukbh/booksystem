package com.edu.dao;

import com.edu.po.Stock;
import org.apache.ibatis.session.RowBounds;

import java.util.List;

public interface StockDao {
    /**
     * 查询库存
     * @param stock Stock
     * @return List<Stock>
     */
   public List<Stock> findStockBys(Stock stock, RowBounds rowBounds);
   public Stock findStock(String bookId);
    /**
     * 查询库存数量
     * @param stock s
     * @return Integer
     */
   public Integer findStockBysCount(Stock stock);

    /**
     * 减少库存
     * @return Integer
     */
   public Integer reduceStock(Stock stock);

    /**
     *
     * @param stock Stock
     * @return Integer
     */
   public Integer addStock(Stock stock);

    /**
     *
     * @param stock stock
     * @return Integer
     */
   public Integer editStock(Stock stock);

}
