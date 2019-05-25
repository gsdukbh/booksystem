package com.edu.service;

import com.edu.po.BorrowInfo;
import utils.Page;

import java.util.List;

/**
 * @author ：lijiawei
 * @date ：Created in 2019/05/2019/5/14 9:15
 * @description：borrowInfo 服务层接口
 * @modified By：
 * @version: 1$
 */
public interface BorrowInfoService {
    /**
     * 查看所有的借阅信息
     * @return 所有信息 BorrowInfo数组对象        
     */
    public Page<BorrowInfo> findAllBorrowMsg(Integer page, Integer rows);
    public Integer selectBorrowListCount();
    /**
     * 多条件查询      
     * @return     BorrowInfo数组对象
     */
    public Page<BorrowInfo> findBorrowMsgById(BorrowInfo borrowInfo);
    public   BorrowInfo findBorrowById(String borrowID,String bookId);
    /**
     * 增加信息
     * @param    borrowInfo    借阅信息   
     * @return  integer 插入成功条数
     */
    public Integer addBorrowMsg(BorrowInfo borrowInfo);

    /**
     * 修改借阅信息
     * @return    integer 修改成功条数
     */
    public Integer upBorrowMsg(BorrowInfo borrowInfo);

    /**
     * 删除信息
     * @return     integer 删除成功条数
     */
    public Integer delBorrowMsgByid(BorrowInfo borrowInfo);
    
}
