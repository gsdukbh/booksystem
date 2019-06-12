package com.edu.service.impl;

import com.edu.dao.BorrowInfoDao;
import com.edu.po.BorrowInfo;
import com.edu.service.BorrowInfoService;
import com.sun.rowset.internal.Row;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import utils.Page;

import java.util.Date;
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
        RowBounds rowBounds =new RowBounds((page-1)*rows,rows);
        List<BorrowInfo>  borrowInfos=borrowInfoDao.findAllBorrowMsg(rowBounds);
        Integer integer=borrowInfoDao.selectBorrowListCount();
        Page<BorrowInfo> res= new Page<>();
        res.setPage(page);
        res.setRows(borrowInfos);
        res.setSize(rows);
        res .setTotal(integer);
        return res;
    }

    @Override
    public Integer selectBorrowListCount() {
        return this.borrowInfoDao.selectBorrowListCount();
    }

    /**
     * 多条件查询
     * @return BorrowInfo数组对象
     */
    @Override
    public Page<BorrowInfo> findBorrowMsgById(BorrowInfo borrowInfo,Integer page, Integer rows) {
        RowBounds rowBounds =new RowBounds((page-1)*rows,rows);
        List<BorrowInfo>  borrowInfos=borrowInfoDao.findBorrowMsgById(borrowInfo,rowBounds);
        int i= borrowInfoDao.selectBorrowListCount();
        Page<BorrowInfo> res= new Page<>();
        res.setRows(borrowInfos);
        res.setPage(page);
        res.setSize(rows);
        res.setTotal(i);
        return  res;
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
        borrowInfo.setBorrowDay(null);
        borrowInfo.setBorrowRemandDay(null);
        borrowInfo.setBorrowRenewDay(null);
        return this.borrowInfoDao.addBorrowMsg(borrowInfo);
    }

    /**
     * 修改借阅信息
     * @return integer 修改成功条数
     */
    @Override
    public Integer upBorrowMsg(BorrowInfo borrowInfo) {
        return this.borrowInfoDao.upBorrowMsg(borrowInfo);
    }

    /**
     * 删除信息
     * @return integer 删除成功条数
     */
    @Override
    public Integer delBorrowMsgByid(BorrowInfo borrowInfo) {
        return this.borrowInfoDao.delBorrowMsgByid(borrowInfo);
    }
}

