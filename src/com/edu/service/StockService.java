package com.edu.service;

import com.edu.po.Stock;
import utils.Page;

import java.util.List;

public interface StockService {

    public Integer findStockBysCount(Stock stock);
    public Integer reduceStock(String bookId);
    public Integer addStock(Stock stock);
    public Integer editStock(Stock stock);
    public Page<Stock> findStockBys(Stock stock,Integer page, Integer rows);
    public Stock findStock(String bookId);
}
