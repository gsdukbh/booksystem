package com.edu.service.impl;

        import com.edu.dao.UserDao;
        import com.edu.po.User;
        import com.edu.service.UserService;
        import org.springframework.beans.factory.annotation.Autowired;
        import org.springframework.stereotype.Service;
        import org.springframework.transaction.annotation.Transactional;

/**
 * @author ：lijiawei
 * @date ：Created in 2019/05/2019/5/17 19:04
 * @description：
 * @version: 1
 */
@Service
@Transactional
public class UserServiceImpl implements UserService {
    
    
    @Autowired
    private UserDao userDao;
    
    // 通过账号和密码查询用户
    
    @Override
    public User findUser(String usercode, String password) {
        User user = this.userDao.findUser(usercode, password);
        return user;
    }
}

