package com.edu.po;

import java.util.List;

/**
 * @author ：lijiawei
 * @date ：Created in 2019/05/2019/5/17 19:44
 * @description：图书集合
 * @version: 1
 */
public class BookList {
    private List<BookInfo> bookInfoList;

    public List<BookInfo> getBookInfoList() {
        return bookInfoList;
    }

    public void setBookInfoList(List<BookInfo> bookInfoList) {
        this.bookInfoList = bookInfoList;
    }

    @Override
    public String toString() {
        return "BookList{" +
                "bookInfoList=" + bookInfoList +
                '}';
    }
}

