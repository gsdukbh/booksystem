package com.edu.controller;

import com.edu.po.BookInfo;
import com.edu.po.User;
import com.edu.service.BookInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.portlet.bind.annotation.ResourceMapping;
import utils.Page;

import javax.servlet.http.HttpSession;

/**
 * @author ：lijiawei
 * @date ：Created in 2019/05/2019/5/14 9:37
 * @description：图书信息控制类
 * @modified By：
 * @version: 1$
 */
@Controller
public class BookInfoController {
    @Autowired 
    private  BookInfoService bookInfoService;
    
     @RequestMapping("reader/list")
    public String list(@RequestParam(defaultValue = "1")Integer page,
                       @RequestParam(defaultValue = "10") Integer rows, 
                       Model model)
    {
        Page<BookInfo> bookInfoList=bookInfoService.findAllBookMsg(page,rows);
        model.addAttribute("page",bookInfoList);
        return "admin";
        /*转跳*/
    }
    
    @RequestMapping()
    @ResponseBody
    public String addBookinfo(BookInfo bookInfo, HttpSession session){
        User user = (User) session.getAttribute("USER_SESSION");
         int rows=bookInfoService.addBookMsg(bookInfo);
         if (rows>0){
             
             
         }
       return "";  
    }
    
}

