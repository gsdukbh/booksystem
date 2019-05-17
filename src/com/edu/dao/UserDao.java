package com.edu.dao;

import com.edu.po.User;
import org.apache.ibatis.annotations.Param;

/**
 * @author ：lijiawei
 * @date ：Created in 2019/05/2019/5/17 18:56
 * @description：数据操作
 * @version: 1
 */
public interface UserDao {
    /**
     * 通过账号和密码登录
     */
    public User findUser(@Param("usercode") String usercode,
                         @Param("password") String password);
    

}
