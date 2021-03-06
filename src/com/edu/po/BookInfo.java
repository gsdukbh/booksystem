package com.edu.po;


import java.util.List;

/**
        *@author ：lijiawei
        *@date ：Created in 2019/05/2019/5/14 8:35
        *@description：
        *@modified By：
        *@version:1$
        */

public class BookInfo {
    private  String   bookId;
    private  String   bookName ;
    private  String   bookAuthor;
    private  String   bookPublishUnit ;
    private  Integer  bookRate;
    private  String   bookSort;
    private  String   bookCover;
    private String    bookRemark;
     
    private List<Reader> readerList;
    private List<BorrowInfo>borrowInfoList;
    private  BorrowInfo borrowInfo;

    public BorrowInfo getBorrowInfo() {
        return borrowInfo;
    }

    public void setBorrowInfo(BorrowInfo borrowInfo) {
        this.borrowInfo = borrowInfo;
    }

    public List<BorrowInfo> getBorrowInfoList() {
        return borrowInfoList;
    }

    public void setBorrowInfoList(List<BorrowInfo> borrowInfoList) {
        this.borrowInfoList = borrowInfoList;
    }

    public List<Reader> getReaderList() {
        return readerList;
    }

    public void setReaderList(List<Reader> readerList) {
        this.readerList = readerList;
    }

    @Override
    public String toString() {
        return "BookInfo{" +
                "bookId='" + bookId + '\'' +
                ", bookName='" + bookName + '\'' +
                ", bookAuthor='" + bookAuthor + '\'' +
                ", bookPublishUnit='" + bookPublishUnit + '\'' +
                ", bookRate=" + bookRate +
                ", bookSort='" + bookSort + '\'' +
                ", bookCover=" + bookCover +
                ", bookRemark='" + bookRemark + '\'' +
                '}';
    }

    public String getBookSort() {
        return bookSort;
    }

    public void setBookSort(String bookSort) {
        this.bookSort = bookSort;
    }

    public String getBookCover() {
        return bookCover;
    }

    public void setBookCover(String bookCover) {
        this.bookCover = bookCover;
    }

    public String getBookRemark() {
        return bookRemark;
    }

    public void setBookRemark(String bookRemark) {
        this.bookRemark = bookRemark;
    }

    public String getBookId() {
        return bookId;
    }

    public void setBookId(String bookId) {
        this.bookId = bookId;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public String getBookAuthor() {
        return bookAuthor;
    }

    public void setBookAuthor(String bookAuthor) {
        this.bookAuthor = bookAuthor;
    }

    public String getBookPublishUnit() {
        return bookPublishUnit;
    }

    public void setBookPublishUnit(String bookPublishUnit) {
        this.bookPublishUnit = bookPublishUnit;
    }

    public Integer getBookRate() {
        return bookRate;
    }

    public void setBookRate(Integer bookRate) {
        this.bookRate = bookRate;
    }
    

    

    
}

