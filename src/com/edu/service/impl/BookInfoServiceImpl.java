package com.edu.service.impl;

import com.edu.dao.BookInfoDao;
import com.edu.po.BookInfo;
import com.edu.service.BookInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import utils.Page;

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
          BookInfo bookInfo=new BookInfo();
          bookInfo.setStart((page - 1)*rows);
          bookInfo.setRows(rows);
          List<BookInfo>  bookInfoList=bookInfoDao.findAllBookMsg(bookInfo);
          Integer integer=bookInfoDao.selectBookListCount();
          Page<BookInfo> res= new Page<>();
          res.setPage(page);
          res.setSize(rows);
          res.setRows(bookInfoList);
          res.setTotal(integer);
        return   res;
    }

    @Override
    public Integer selectBookListCount() {
        
        return this.bookInfoDao.selectBookListCount();
    }

    /**
     * 查询
     * 没有做分页处理
     * @param bookId          图书id
     * @param bookName        书名
     * @param bookAuthor      作者
     * @param bookPublishUnit 出版单位
     * @param bookSort        分类号
     * @return BookInfo
     */
    @Override
    public Page<BookInfo> findBookMsgBys(String bookId, String bookName, String bookAuthor, String bookPublishUnit, String bookSort) {
        List<BookInfo> bookInfoList=   bookInfoDao.findBookMsgBys(bookId,bookName,bookAuthor,bookPublishUnit,bookSort);
        Page<BookInfo> page=new Page<>();
        page.setRows(bookInfoList);         
        return  page;
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
}

