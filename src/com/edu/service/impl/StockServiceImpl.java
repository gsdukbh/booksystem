package com.edu.service.impl;

import com.edu.dao.StockDao;
import com.edu.po.Stock;
import com.edu.service.StockService;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import utils.Page;

import java.util.List;
@Service
@Transactional
public class StockServiceImpl implements StockService {

    @Autowired
    private StockDao stockDao;
    @Override
    public Integer findStockBysCount(Stock stock) {

        return this.stockDao.findStockBysCount(stock);
    }

    @Override
    public Integer reduceStock(String bookId) {
        Stock stock=this.stockDao.findStock(bookId);
        int  tmp=stock.getStock_inventory();
        stock.setStock_inventory(tmp-1);
        System.out.println(stock.getBookId()+"：数量减一");

        return this.stockDao.reduceStock(stock);
    }


    @Override
    public Integer addStock(Stock stock) {
        return this.stockDao.addStock(stock);
    }

    @Override
    public Integer editStock(Stock stock) {
        return this.stockDao.editStock(stock);
    }

    @Override
    public Page<Stock> findStockBys(Stock stock, Integer page, Integer rows) {
        RowBounds rowBounds=new RowBounds((page-1)*rows,rows);
        List<Stock> stockList=this.stockDao.findStockBys(stock,rowBounds);
        int count=this.findStockBysCount(stock);
        Page<Stock> stockPage=new Page<>();
        stockPage.setRows(stockList);
        stockPage.setTotal(count);
        stockPage.setPage(page);
        stockPage.setSize(rows);
        return stockPage;
    }



    @Override
    public Stock findStock(String bookId) {
        return this.stockDao.findStock(bookId);
    }


}
