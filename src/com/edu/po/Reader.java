package com.edu.po;

import java.util.Date;

/**
        * @author ：lijiawei
        * @date ：Created in 2019/5/9 11:47
        * @description：${description}
        * @modified By：
        * @version: $version$
        */
public class Reader {
    private  String borrowID;
    private String readerName;
    private String readerSex;
    private String readerUnit;
    private String readerPhone;
    private String readerIDCard;
    private String readerType;
    private Date readerTime;
    private String raederCondition;
    private Integer  start;
    private Integer  rows;

    @Override
    public String toString() {
        return "Reader{" +
                "borrowID='" + borrowID + '\'' +
                ", readerName='" + readerName + '\'' +
                ", readerSex='" + readerSex + '\'' +
                ", readerUnit='" + readerUnit + '\'' +
                ", readerPhone='" + readerPhone + '\'' +
                ", readerIDCard='" + readerIDCard + '\'' +
                ", readerType='" + readerType + '\'' +
                ", readerTime=" + readerTime +
                ", raederCondition='" + raederCondition + '\'' +
                '}';
    }

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

    public String getReaderName() {
        return readerName;
    }

    public void setReaderName(String readerName) {
        this.readerName = readerName;
    }

    public String getReaderSex() {
        return readerSex;
    }

    public void setReaderSex(String readerSex) {
        this.readerSex = readerSex;
    }

    public String getReaderUnit() {
        return readerUnit;
    }

    public void setReaderUnit(String readerUnit) {
        this.readerUnit = readerUnit;
    }

    public String getReaderPhone() {
        return readerPhone;
    }

    public void setReaderPhone(String readerPhone) {
        this.readerPhone = readerPhone;
    }

    public String getReaderIDCard() {
        return readerIDCard;
    }

    public void setReaderIDCard(String readerIDCard) {
        this.readerIDCard = readerIDCard;
    }

    public String getReaderType() {
        return readerType;
    }

    public void setReaderType(String readerType) {
        this.readerType = readerType;
    }

    public Date getReaderTime() {
        return readerTime;
    }

    public void setReaderTime(Date readerTime) {
        this.readerTime = readerTime;
    }

    public String getRaederCondition() {
        return raederCondition;
    }

    public void setRaederCondition(String raederCondition) {
        this.raederCondition = raederCondition;
    }
}
