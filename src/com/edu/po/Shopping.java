package com.edu.po;

public class Shopping {
    private String bookId;
    private String borrowID;
    private Integer quantity;
    private BookInfo bookInfo;

    public BookInfo getBookInfo() {
        return bookInfo;
    }

    public void setBookInfo(BookInfo bookInfo) {
        this.bookInfo = bookInfo;
    }

    @Override
    public String toString() {
        return "Shopping{" +
                "bookId='" + bookId + '\'' +
                ", borrowID='" + borrowID + '\'' +
                ", quantity=" + quantity +
                ", bookInfo=" + bookInfo +
                '}';
    }

    public String getBookId() {
        return bookId;
    }

    public void setBookId(String bookId) {
        this.bookId = bookId;
    }

    public String getBorrowID() {
        return borrowID;
    }

    public void setBorrowID(String borrowID) {
        this.borrowID = borrowID;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }
}
