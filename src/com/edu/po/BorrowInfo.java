package com.edu.po;

import java.util.Date;

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
    private  Integer    borrowstatus;
    private Integer  start;
    private Integer  rows;

    public Integer getStart() {
        return start;
    }

    public void setStart(Integer start) {
        this.start = start;
    }

    public Integer getRows() {
        return rows;
    }

    public void setRows(Integer rows) {
        this.rows = rows;
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

    public Integer getBorrowstatus() {
        return borrowstatus;
    }

    public void setBorrowstatus(Integer borrowstatus) {
        this.borrowstatus = borrowstatus;
    }

    @Override
    public String toString() {
        return "BorrowInfo{" +
                "borrowID='" + borrowID + '\'' +
                ", bookId='" + bookId + '\'' +
                ", borrowDay=" + borrowDay +
                ", borrowRenewDay=" + borrowRenewDay +
                ", borrowRemandDay=" + borrowRemandDay +
                ", borrowPenalty=" + borrowPenalty +
                ", borrowstatus=" + borrowstatus +
                '}';
    }
}

