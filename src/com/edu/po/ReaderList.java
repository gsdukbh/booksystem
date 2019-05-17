package com.edu.po;

import java.util.List;

/**
 * @author ：lijiawei
 * @date ：Created in 2019/05/2019/5/17 19:43
 * @description：读者集合
 * @version: 1
 */
public class ReaderList {
    private List<Reader> readerList;

    public List<Reader> getReaderList() {
        return readerList;
    }

    public void setReaderList(List<Reader> readerList) {
        this.readerList = readerList;
    }

    @Override
    public String toString() {
        return "ReaderList{" +
                "readerList=" + readerList +
                '}';
    }
}

