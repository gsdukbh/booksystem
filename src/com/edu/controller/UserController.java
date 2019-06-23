package com.edu.controller;

import com.edu.po.Reader;
import com.edu.po.Shopping;
import com.edu.po.User;
import com.edu.service.Order_formService;
import com.edu.service.ReaderInfoService;
import com.edu.service.ShoppingService;
import com.edu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.util.List;

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

    @Autowired
    private ReaderInfoService readerInfoService;

    @Autowired
    private Order_formService orderFormService;

    @Autowired
    private ShoppingService shoppingService;
    /**
     * 用户登录
     */
    @RequestMapping(value = "/login.action", method = RequestMethod.POST)
    public String login(String usercode,String password, Model model,
                        HttpSession session) {
        // 通过账号和密码查询用户
        User user = userService.findUser(usercode, password);
        Reader reader=readerInfoService.finReader(usercode,password);
        String forword="";
        if (reader !=null){
            session.setAttribute("Reader_SESSION",reader);
            List<Shopping> shopping=this.shoppingService.findShopping(reader.getBorrowID());
            int row=shopping.size();
            model.addAttribute("page",reader);
            model.addAttribute("shu",row);
            forword="/Reader/index";
            return forword;
        }
        else if (user !=null){
            // 将用户对象添加到Session
            session.setAttribute("USER_SESSION", user);
            model.addAttribute("number",this.orderFormService.findOrder_formconut());

            // 跳转到主页面
            final String s = "ad";
            return s;
        }
        return "../index";
        
    }
    /**
     * 退出登录
     */
    @RequestMapping(value = "/logout.action")
    public String logout(HttpSession session) {
        // 清除Session
        session.invalidate();
        // 重定向到登录页面的跳转方法
        return "../index";
    }
    
    /*
    * 用户注册*/
    
    
    @RequestMapping(value = "/toRegister.action")
    public String register() {
        
        return "zhuce";
    }

    @RequestMapping(value = "/totoREder.action")
    public String toREder() {

        return "/Reader/index";
    }

    @RequestMapping(value = "/to404.action")
    public String to404() {

        return "404";
    } 
    
    @RequestMapping(value = "/tologin.action")
    public String tologin() {
        return "../index";
    }

    @RequestMapping(value = "/admin.action")
    public String toadmin() {

        return "ad";
    }
}

