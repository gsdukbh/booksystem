package com.edu.dao;

import com.edu.po.Reader;

/**
 * @author ：lijiawei
 * @date ：Created in 2019/05/2019/5/14 9:09
 * @description：Reader 文件接口
 * @modified By：
 * @version: 1$
 */

public interface ReaderDao {
    /**
     * 查询读者信息
     * @return 读者全部信息
     */
    public Reader findAllReaderMsg();

    /**
     * 条件查询信息
     * 包括按姓名,借阅证号,电话,身份证,单位
     * @param msg 查询的条件
     * @return   读者信息
     */
    public Reader findLikeReaderMsg(String msg);

    /**
     *  添加读者信息
     *  不包含时间 时间自动生成
     * @param reader 添加读者信息
     * @return  一条数据
     */
    public Reader addReaderMsg(Reader reader);

    /**
     * 修改数据
     * @param reader  读者信息更新
     * @return  修改信息
     */
    public Reader upReaderMsg(Reader reader);

    /**
     * 删除数据
     * @param msg  删除的条件
     * @return 信息
     */
    public Reader delReaderMsg(String msg);
}
