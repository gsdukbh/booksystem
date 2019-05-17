package com.edu.service;

import com.edu.po.User;

/**
 * @author ：lijiawei
 * @date ：Created in 2019/05/2019/5/17 19:01
 * @description：ll
 * @version: 1
 */
public interface UserService {

    /**
     *   通过账号和密码查询用户
     * @param usercode   账号
     * @param password   密码
     * @return login
     */
    public User findUser(String usercode, String password);
    
    
}
