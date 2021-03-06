package com.edu.po;

import java.util.Date;
import java.util.List;

/**
        * @author ：lijiawei
        * @date ：Created in 2019/5/9 11:47
        * @description：${description}
        * @modified By：
        * @version: $version$
        */
public class Reader {
    private String borrowID;
    private String readerName;
    private String passwd;
    private String readerSex;
    private String readerUnit;
    private String readerPhone;
    private String readerIDCard;
    private String readerType;
    private Date readerTime;
    private String raederCondition;

    private String reader_shipping_address;

    private List<BookInfo> bookInfoList;

    @Override
    public String toString() {
        return "Reader{" +
                "borrowID='" + borrowID + '\'' +
                ", readerName='" + readerName + '\'' +
                ", passwd='" + passwd + '\'' +
                ", readerSex='" + readerSex + '\'' +
                ", readerUnit='" + readerUnit + '\'' +
                ", readerPhone='" + readerPhone + '\'' +
                ", readerIDCard='" + readerIDCard + '\'' +
                ", readerType='" + readerType + '\'' +
                ", readerTime=" + readerTime +
                ", raederCondition='" + raederCondition + '\'' +
                ", reader_shipping_address='" + reader_shipping_address + '\'' +
                ", bookInfoList=" + bookInfoList +
                '}';
    }

    public String getReader_shipping_address() {
        return reader_shipping_address;
    }

    public void setReader_shipping_address(String reader_shipping_address) {
        this.reader_shipping_address = reader_shipping_address;
    }


     public String getPasswd() {
        return passwd;
    }

    public void setPasswd(String passwd) {
        this.passwd = passwd;
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

    public List<BookInfo> getBookInfoList() {
        return bookInfoList;
    }

    public void setBookInfoList(List<BookInfo> bookInfoList) {
        this.bookInfoList = bookInfoList;
    }
}
