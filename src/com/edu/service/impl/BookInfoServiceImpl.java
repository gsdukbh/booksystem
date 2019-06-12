package com.edu.service.impl;

import com.edu.dao.BookInfoDao;
import com.edu.po.BookInfo;
import com.edu.service.BookInfoService;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import utils.Page;

import java.util.ArrayList;
import java.util.List;

/**
 * @author ：lijiawei
 * @date ：Created in 2019/05/2019/5/18 13:48
 * @description：
 * @version: 1
 */
@Service
@Transactional
public class BookInfoServiceImpl implements BookInfoService {
    @Autowired
    private BookInfoDao     bookInfoDao;
    
    /**
     * 查找所有的图书信息
     *
     * @return BookInfo
     */
    @Override
    public Page<BookInfo> findAllBookMsg(Integer page, Integer rows) {

        RowBounds rowBounds=new RowBounds((page-1)*rows,rows);
        List<BookInfo> bookInfoList=bookInfoDao.findAllBookMsg(rowBounds);
        
        int  i=bookInfoDao.selectBookListCount();
        
        Page<BookInfo> bookInfoPage=new Page<>();
        bookInfoPage.setPage(page);
        bookInfoPage.setRows(bookInfoList);
        bookInfoPage.setSize(rows);
        bookInfoPage.setTotal(i);
        return  bookInfoPage ;
    }

    @Override
    public Integer selectBookListCount() {
        
        return this.bookInfoDao.selectBookListCount();
    }

    /**
     * 查询
     * @return BookInfo
     */
    @Override
    public Page<BookInfo> findBookMsgBys(BookInfo bookInfo,Integer page, Integer rows) {
        
        RowBounds rowBounds=new RowBounds((page-1)*rows,rows);
        List<BookInfo> bookInfoList=bookInfoDao.findBookMsgBys(rowBounds,bookInfo);
        int i=bookInfoDao.findBookMsgBysCount();
        Page<BookInfo> res= new Page<>();
        res.setPage(page);
        res.setRows(bookInfoList);
        res.setSize(rows);
        res.setTotal(i);
        return res; 
    }

    @Override
    public BookInfo findBookById(String id) {
        return this.bookInfoDao.findBookById(id);
    }

    /**
     * 添加图书信息
     *
     * @param bookInfo BookInfo
     * @return Integer
     */
    @Override
    public Integer addBookMsg(BookInfo bookInfo) {
        return this.bookInfoDao.addBookMsg(bookInfo);
    }

    @Override
    public Integer addBookMsgs(List<BookInfo> bookInfos) {
        int count=0;
        for (BookInfo bookInfo:bookInfos){
            count+=this.bookInfoDao.addBookMsg(bookInfo);
        }
        return count;
    }

    /**
     * 修改图书信息
     *
     * @param bookInfo BookInfo
     * @return Integer
     */
    @Override
    public Integer upBookMsgBys(BookInfo bookInfo) {
        return this.bookInfoDao.upBookMsgBys(bookInfo);
    }

    /**
     * 删除信息
     *
     * @param id BookInfo
     * @return Integer
     */
    @Override
    public Integer deleteBook(String id) {
        return this.bookInfoDao.deleteBook(id);
    }

    @Override
    public List<BookInfo> findBookByIds(String[] id) {
        List<BookInfo> bookInfoList=new ArrayList<>();
        for (String ids:id){
            bookInfoList.add(this.bookInfoDao.findBookById(ids));
        }
        return bookInfoList;
    }
}

