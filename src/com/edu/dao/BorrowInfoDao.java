package com.edu.dao;

import com.edu.po.BorrowInfo;
import utils.Page;

import java.util.List;

/**
 * @author ：lijiawei
 * @date ：Created in 2019/05/2019/5/14 9:10
 * @description：借阅信息接口
 * @modified By：
 * @version: 1$
 */
public interface BorrowInfoDao {
    /**
     * 查看所有的借阅信息
     * @return 所有信息 BorrowInfo数组对象        
     */
    public List<BorrowInfo> findAllBorrowMsg(BorrowInfo borrowInfo);
    public Integer selectBorrowListCount();
    /**
     * 多条件查询
     * @param    borrowID  借阅id
     * @param    bookId     图书id               
     * @return     BorrowInfo数组对象
     */
    public List<BorrowInfo> findBorrowMsgById(String borrowID,String bookId);
    public   BorrowInfo findBorrowById(String borrowID,String bookId);

    /**
     * 增加信息
     * @param    borrowInfo    借阅信息   
     * @return  integer 插入成功条数
     */
    public Integer addBorrowMsg(BorrowInfo borrowInfo);

    /**
     * 修改借阅信息
     * @param    borrowInfo    借阅信息
     * @return    integer 修改成功条数
     */
    public Integer upBorrowMsg(BorrowInfo borrowInfo);

    /**
     * 删除信息
     * @param    borrowID  借阅id
     * @param    bookId     图书id
     * @return     integer 删除成功条数
     */
    public Integer delBorrowMsgByid(String borrowID,String bookId);
}
