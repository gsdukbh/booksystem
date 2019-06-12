package com.edu.service;

import com.edu.po.BookInfo;
import utils.Page;

import java.util.List;

/**
 * @author ：lijiawei
 * @date ：Created in 2019/05/2019/5/14 9:14
 * @description：bookinfo 服务层接口
 * @modified By：
 * @version: 1$
 */
public interface BookInfoService {

    /**
     * 查找所有的图书信息
     * @return    BookInfo
     */
    public Page<BookInfo> findAllBookMsg(Integer page, Integer rows);
    
    
    public Integer selectBookListCount();
    /**
     * 添加查询
     * @return       BookInfo
     */
    public Page<BookInfo> findBookMsgBys(BookInfo bookInfo,Integer page, Integer rows);
    public  BookInfo  findBookById(String id);

    /**
     * 添加图书信息
     * @param bookInfo       BookInfo
     * @return     Integer
     */
    public Integer addBookMsg(BookInfo bookInfo);
    public Integer addBookMsgs(List<BookInfo> bookInfos);

    /**
     * 修改图书信息 
     * @param bookInfo          BookInfo
     * @return     Integer
     */
    public Integer upBookMsgBys(BookInfo bookInfo);
    /**
     * 删除信息
     * @param id    BookInfo
     * @return        Integer
     */
    public Integer deleteBook(String id);
    public List<BookInfo> findBookByIds(String[] id);
}
