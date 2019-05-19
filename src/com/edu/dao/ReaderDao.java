package com.edu.dao;

import com.edu.po.Reader;
import utils.Page;

import java.util.List;

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
    public List<Reader> findAllReaderMsg();
    public Integer selectReaderListCount();
    /**
     * 条件查询信息
     * @param borrowID 借阅证号
     * @param readerName   姓名
     * @param readerPhone     电话
     * @param readerIDCard  身份证
     * @param readerUnit    单位
     * @return   读者信息
     */
    public List<Reader> findLikeReaderMsg(String borrowID,String readerName,String readerPhone,String readerIDCard,String readerUnit);

    /**
     *  添加读者信息
     *  不包含时间 时间自动生成
     * @param reader 添加读者信息
     * @return  一条数据
     */
    public Integer addReaderMsg(Reader reader);

    /**
     * 修改数据
     * @param reader  读者信息更新
     * @return  修改信息
     */
    public Integer upReaderMsg(Reader reader);

    /**
     * 删除数据
     * @param borrowID  借阅证号
     * @param readerIDCard  身份证                
     * @return 信息
     */
    public Integer delReaderMsg(String borrowID,String readerIDCard);
}
