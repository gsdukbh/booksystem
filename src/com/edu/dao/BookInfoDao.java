package com.edu.dao;

import com.edu.po.BookInfo;

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
     * @return    BookInfo
     */
    public List<BookInfo> findAllBookMsg();

    /**
     * 添加查询
     * @param bookId            图书id
     * @param bookName           书名
     * @param bookAuthor         作者
     * @param bookPublishUnit     出版单位   
     * @param bookSort               分类号
     * @return       BookInfo
     */
    public List<BookInfo> findBookMsgBys(String bookId,String bookName,String bookAuthor,String bookPublishUnit,String bookSort);

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
    
}
