package com.edu.service.impl;

import com.edu.po.Reader;
import com.edu.service.ReaderInfoService;

/**
 * @author ：lijiawei
 * @date ：Created in 2019/05/2019/5/17 21:47
 * @description：
 * @version: 1
 */
public class ReaderInfoServiceImpl implements ReaderInfoService {

    /**
     * 查询读者信息
     *
     * @return 读者全部信息
     */
    @Override
    public Reader findAllReaderMsg() {
        return null;
    }

    /**
     * 条件查询信息
     * 包括按姓名,借阅证号,电话,身份证,单位
     *
     * @param msg 查询的条件
     * @return 读者信息
     */
    @Override
    public Reader findLikeReaderMsg(String msg) {
        return null;
    }

    /**
     * 添加读者信息
     *
     * @param reader 添加读者信息
     * @return 一条数据
     */
    @Override
    public Reader addReaderMsg(Reader reader) {
        return null;
    }

    /**
     * 修改数据
     *
     * @param reader 读者信息更新
     * @return 修改信息
     */
    @Override
    public Reader upReaderMsg(Reader reader) {
        return null;
    }

    /**
     * 删除数据
     *
     * @param msg 删除的条件
     * @return 信息
     */
    @Override
    public Reader delReaderMsg(String msg) {
        return null;
    }
}

