package com.edu.po;

public class Stock {
    private String bookId;
    private Integer stock_inventory;
    private String stock_warehouse;
    private String stock_principal;

    @Override
    public String toString() {
        return "Stock{" +
                "bookId='" + bookId + '\'' +
                ", stock_inventory=" + stock_inventory +
                ", stock_warehouse='" + stock_warehouse + '\'' +
                ", stock_principal='" + stock_principal + '\'' +
                '}';
    }

    public String getBookId() {
        return bookId;
    }

    public void setBookId(String bookId) {
        this.bookId = bookId;
    }

    public Integer getStock_inventory() {
        return stock_inventory;
    }

    public void setStock_inventory(Integer stock_inventory) {
        this.stock_inventory = stock_inventory;
    }

    public String getStock_warehouse() {
        return stock_warehouse;
    }

    public void setStock_warehouse(String stock_warehouse) {
        this.stock_warehouse = stock_warehouse;
    }

    public String getStock_principal() {
        return stock_principal;
    }

    public void setStock_principal(String stock_principal) {
        this.stock_principal = stock_principal;
    }
}
