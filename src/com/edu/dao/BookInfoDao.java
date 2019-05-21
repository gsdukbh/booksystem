package com.edu.dao;

import com.edu.po.BookInfo;
import org.apache.ibatis.type.IntegerTypeHandler;
import org.apache.taglibs.standard.extra.spath.Step;
import utils.Page;

import java.util.List;

/**
 * @author ：lijiawei
 * @date ：Created in 2019/05/2019/5/14 9:11
 * @description：bookinfo 文件接口
 * @modified By：
 * @version: 1$
 */
public interface BookInfoDao {
    /**
     * 查找所有的图书信息
     *  @param bookInfo       BookInfo
     * @return    BookInfo
     */
    public List<BookInfo> findAllBookMsg(BookInfo bookInfo);
    public Integer selectBookListCount();
    /**
     * 添加查询
     *  @param bookInfo       BookInfo
     * @return       BookInfo
     */
    public List<BookInfo> findBookMsgBys(BookInfo bookInfo);
    public  BookInfo  findBookById(String id);

    /**
     * 添加图书信息
     * @param bookInfo       BookInfo
     * @return     Integer
     */
    public Integer addBookMsg(BookInfo bookInfo);

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
}
