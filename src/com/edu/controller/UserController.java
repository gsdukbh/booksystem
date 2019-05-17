package com.edu.controller;

import com.edu.po.User;
import com.edu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import sun.misc.Contended;

import javax.servlet.http.HttpSession;

/**
 * @author ：lijiawei
 * @date ：Created in 2019/05/2019/5/17 18:56
 * @description：用户
 * @version: 1
 */
@Controller
public class UserController {
    /**
     * 依赖注入 
     */
    @Autowired
    private UserService userService;
    /**
     * 用户登录
     */
    @RequestMapping(value = "/Login", method = RequestMethod.POST)
    public String login(String usercode,String password, Model model,
                        HttpSession session) {
        // 通过账号和密码查询用户
        User user = userService.findUser(usercode, password);
        if(user != null){
            // 将用户对象添加到Session
            session.setAttribute("USER_SESSION", user);
            // 跳转到主页面
			return "admin";
        }
        return "../index";
        
    }
    /**
     * 退出登录
     */
    @RequestMapping(value = "/logout")
    public String logout(HttpSession session) {
        // 清除Session
        session.invalidate();
        // 重定向到登录页面的跳转方法
        return "redirect:login";
    }
}

