package com.edu.service.impl;

import com.edu.dao.ReaderDao;
import com.edu.po.Reader;
import com.edu.service.ReaderInfoService;
import org.apache.ibatis.type.IntegerTypeHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import utils.Page;

import java.util.List;

/**
 * @author ：lijiawei
 * @date ：Created in 2019/05/2019/5/17 21:47
 * @description：
 * @version: 1
 */
@Service
@Transactional
public class ReaderInfoServiceImpl implements ReaderInfoService {
    
     @Autowired
    private    ReaderDao readerDao;

    /**
     * 查询读者信息
     *
     * @return 读者全部信息
     */
    @Override
    public Page<Reader> findAllReaderMsg(Integer page, Integer rows) {
           Reader reader=new Reader();
           reader.setStart((page - 1) * rows);
           reader.setRows(rows);
           List<Reader>  readerList=readerDao.findAllReaderMsg(reader);
           Integer integer=readerDao.selectReaderListCount();
           Page<Reader> readerPage=new Page<>();
           readerPage.setRows(readerList);
           readerPage.setPage(page);
           readerPage.setTotal(integer);
           readerPage.setSize(rows);
        return readerPage;
    }

    /**
     * 查询读者信息
     *
     * @return 读者全部信息数目
     */
    @Override
    public Integer selectReaderListCount() {
        return this.readerDao.selectReaderListCount();
    }

    /**
     * 条件查询信息
     *
     * @param borrowID     借阅证号
     * @param readerName   姓名
     * @param readerPhone  电话
     * @param readerIDCard 身份证
     * @param readerUnit   单位
     * @return 读者信息
     */
    @Override
    public List<Reader> findLikeReaderMsg(String borrowID, String readerName, String readerPhone, String readerIDCard, String readerUnit) {
        return this.readerDao.findLikeReaderMsg(borrowID,readerName,readerPhone,readerIDCard,readerUnit);
    }

    @Override
    public Reader findReaderId(String borrowID) {
        return this.readerDao.findReaderId(borrowID);
    }

    /**
     * 添加读者信息
     * 不包含时间 时间自动生成
     * @param reader 添加读者信息
     * @return 一条数据
     */
    @Override
    public Integer addReaderMsg(Reader reader) {
        return this.readerDao.addReaderMsg(reader);
    }

    /**
     * 修改数据
     * @param reader 读者信息更新
     * @return 修改信息
     */
    @Override
    public Integer upReaderMsg(Reader reader) {
        return this.readerDao.upReaderMsg(reader);
    }

    /**
     * 删除数据
     *
     * @param borrowID     借阅证号
     * @return 信息
     */
    @Override
    public Integer delReaderMsg(String borrowID) {
        return this.readerDao.delReaderMsg(borrowID);
    }
}

