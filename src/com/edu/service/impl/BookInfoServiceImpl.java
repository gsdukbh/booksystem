package com.edu.service.impl;

import com.edu.dao.BookInfoDao;
import com.edu.po.BookInfo;
import com.edu.service.BookInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
    public List<BookInfo> findAllBookMsg() {
        return this.bookInfoDao.findAllBookMsg();
    }

    /**
     * 添加查询
     *
     * @param bookId          图书id
     * @param bookName        书名
     * @param bookAuthor      作者
     * @param bookPublishUnit 出版单位
     * @param bookSort        分类号
     * @return BookInfo
     */
    @Override
    public List<BookInfo> findBookMsgBys(String bookId, String bookName, String bookAuthor, String bookPublishUnit, String bookSort) {
        return this.bookInfoDao.findBookMsgBys(bookId,bookName,bookAuthor,bookPublishUnit,bookSort);
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
}

