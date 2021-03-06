package com.edu.service;
import com.edu.po.Reader;
import utils.Page;

import java.util.List;

/**
 * @author ：lijiawei
 * @date ：Created in 2019/05/2019/5/14 9:13
 * @description：readerinfo 服务层接口
 * @modified By：
 * @version: 1$
 */
public interface ReaderInfoService {
    /**
     * 查询读者信息
     * @return 读者全部信息
     */
    public Page<Reader> findAllReaderMsg(Integer page, Integer rows);
    public Integer selectReaderListCount();
    /**
     * 条件查询信息
     * @return   读者信息
     */
    public Page<Reader> findLikeReaderMsg(Reader reader,Integer page, Integer rows);
    
    public  Reader findReaderId(String borrowID);
    /**
     *  添加读者信息
     *  不包含时间 时间自动生成
     * @param reader 添加读者信息
     * @return  一条数据
     */
    public Integer addReaderMsg(Reader reader);
    
    public Integer addReaderMsgs(List<Reader> readerList);

    /**
     * 修改数据
     * @param reader  读者信息更新
     * @return  修改信息
     */
    public Integer upReaderMsg(Reader reader);

    /**
     * 删除数据
     * @param borrowID  借阅证号     
     * @return 信息
     */
    public Integer delReaderMsg(String borrowID);
    
    public Reader finReader(String usercode,String password);
    
    
    public  List<Reader> findReaderIds(String[] ids);
    public Reader findMyBook(String borrowID);
    
}
