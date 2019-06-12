package com.edu.po;

import java.util.Date;
import java.util.List;

/**
 * @author ：lijiawei
 * @date ：Created in 2019/05/2019/5/14 8:41
 * @description：借阅信息类
 * @modified By：
 * @version: 1$
 */
public class BorrowInfo {
    private  String   borrowID;
    private  String   bookId;
    /**
     *borrowDay 
     * 借阅日期
     * */
    private  Date    borrowDay;
    /**
     * borrowRenewDay
     * 续借日期
     */
    private  String    borrowRenewDay;
    /**
     *borrowRemandDay
     * 归还日期 
     */
    private  String    borrowRemandDay;
    private  Integer   borrowPenalty;
    private  String    borrowstatus;
    
    private List<Reader> readerList;

    @Override
    public String toString() {
        return "BorrowInfo{" +
                "borrowID='" + borrowID + '\'' +
                ", bookId='" + bookId + '\'' +
                ", borrowDay=" + borrowDay +
                ", borrowRenewDay='" + borrowRenewDay + '\'' +
                ", borrowRemandDay='" + borrowRemandDay + '\'' +
                ", borrowPenalty=" + borrowPenalty +
                ", borrowstatus='" + borrowstatus + '\'' +
                ", readerList=" + readerList +
                '}';
    }

    public String getBorrowID() {
        return borrowID;
    }

    public void setBorrowID(String borrowID) {
        this.borrowID = borrowID;
    }

    public String getBookId() {
        return bookId;
    }

    public void setBookId(String bookId) {
        this.bookId = bookId;
    }

    public Date getBorrowDay() {
        return borrowDay;
    }

    public void setBorrowDay(Date borrowDay) {
        this.borrowDay = borrowDay;
    }

    public String getBorrowRenewDay() {
        return borrowRenewDay;
    }

    public void setBorrowRenewDay(String borrowRenewDay) {
        this.borrowRenewDay = borrowRenewDay;
    }

    public String getBorrowRemandDay() {
        return borrowRemandDay;
    }

    public void setBorrowRemandDay(String borrowRemandDay) {
        this.borrowRemandDay = borrowRemandDay;
    }

    public Integer getBorrowPenalty() {
        return borrowPenalty;
    }

    public void setBorrowPenalty(Integer borrowPenalty) {
        this.borrowPenalty = borrowPenalty;
    }

    public String getBorrowstatus() {
        return borrowstatus;
    }

    public void setBorrowstatus(String borrowstatus) {
        this.borrowstatus = borrowstatus;
    }

    public List<Reader> getReaderList() {
        return readerList;
    }

    public void setReaderList(List<Reader> readerList) {
        this.readerList = readerList;
    }
}

