package com.edu.po;

import java.util.List;

/**
 * @author ：lijiawei
 * @date ：Created in 2019/05/2019/5/17 19:44
 * @description：借阅信息集合
 * @version: 1
 */
public class BorrowList {
    private List<BorrowInfo> borrowInfoList;

    public List<BorrowInfo> getBorrowInfoList() {
        return borrowInfoList;
    }

    public void setBorrowInfoList(List<BorrowInfo> borrowInfoList) {
        this.borrowInfoList = borrowInfoList;
    }

    @Override
    public String toString() {
        return "BorrowList{" +
                "borrowInfoList=" + borrowInfoList +
                '}';
    }
}

