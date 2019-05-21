package com.edu.service.impl;

import com.edu.dao.BorrowInfoDao;
import com.edu.po.BookInfo;
import com.edu.po.BorrowInfo;
import com.edu.service.BorrowInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import utils.Page;

import java.util.List;

/**
 * @author ：lijiawei
 * @date ：Created in 2019/05/2019/5/18 10:37
 * @description：
 * @version: 1
 */  
@Service
@Transactional
public class BorrowInfoServiceImpl implements BorrowInfoService {

        @Autowired
    private BorrowInfoDao borrowInfoDao;
    /**
     * 查看所有的借阅信息
     *
     * @return 所有信息 BorrowInfo数组对象
     */
    @Override
    public Page<BorrowInfo> findAllBorrowMsg(Integer page, Integer rows) {
        BorrowInfo borrowInfo=new BorrowInfo();
        borrowInfo.setStart((page - 1) * rows);
        borrowInfo.setRows(rows);
        List<BorrowInfo>  borrowInfos=borrowInfoDao.findAllBorrowMsg(borrowInfo);
        Integer integer=borrowInfoDao.selectBorrowListCount();
        Page<BorrowInfo> res= new Page<>();
        res.setPage(page);
        res.setSize(rows);
        res.setRows(borrowInfos);
        res.setTotal(integer);
        return res;
    }

    @Override
    public Integer selectBorrowListCount() {
        return this.borrowInfoDao.selectBorrowListCount();
    }

    /**
     * 多条件查询
     *
     * @param borrowID 借阅id
     * @param bookId   图书id
     * @return BorrowInfo数组对象
     */
    @Override
    public List<BorrowInfo> findBorrowMsgById(String borrowID, String bookId) {
        return this.borrowInfoDao.findBorrowMsgById(borrowID,bookId);
    }

    @Override
    public BorrowInfo findBorrowById(String borrowID, String bookId) {
        return this.borrowInfoDao.findBorrowById(borrowID,bookId);
    }

    /**
     * 增加信息
     * @param borrowInfo 借阅信息
     * @return integer 插入成功条数
     */
    @Override
    public Integer addBorrowMsg(BorrowInfo borrowInfo) {
        return this.borrowInfoDao.addBorrowMsg(borrowInfo);
    }

    /**
     * 修改借阅信息
     *
     * @param borrowInfo 借阅信息
     * @return integer 修改成功条数
     */
    @Override
    public Integer upBorrowMsg(BorrowInfo borrowInfo) {
        
        return this.borrowInfoDao.upBorrowMsg(borrowInfo);
    }

    /**
     * 删除信息
     *
     * @param borrowID 借阅id
     * @param bookId   图书id
     * @return integer 删除成功条数
     */
    @Override
    public Integer delBorrowMsgByid(String borrowID, String bookId) {
        return this.borrowInfoDao.delBorrowMsgByid(borrowID,bookId);
    }
}

