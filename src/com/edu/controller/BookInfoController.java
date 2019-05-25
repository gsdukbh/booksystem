package com.edu.controller;

import com.edu.po.BookInfo;
import com.edu.po.User;
import com.edu.service.BookInfoService;
import com.sun.istack.internal.NotNull;
import javafx.concurrent.Worker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.portlet.bind.annotation.ResourceMapping;
import utils.Page;

import javax.crypto.interfaces.PBEKey;
import javax.jws.WebParam;
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
    
     @RequestMapping("/book/list.action")
    public String list(@RequestParam(defaultValue = "1")Integer page,
                       @RequestParam(defaultValue = "10") Integer rows, 
                       Model model)
    {
        Page<BookInfo> bookInfoList=bookInfoService.findAllBookMsg(page,rows);
        model.addAttribute("page",bookInfoList);
        return "admin";
        /*转跳*/
    }

    /**
     * 添加图书信息
     * @param bookInfo       图书对象
     * @return   成功
     */
    @RequestMapping("/book/create.action")
    @ResponseBody
    public String addBookInfo(BookInfo bookInfo) {
        int rows = bookInfoService.addBookMsg(bookInfo);
        if (rows > 0) {
            return "OK";
        } else {
         return null ;
        }
    }

    /**
     * 修改
     * @param bookInfo   图书对象
     * @return  STRING
     */
    @RequestMapping("/book/update.action")
    @ResponseBody
    public String upBookInfo(BookInfo bookInfo){
            int rows=bookInfoService.upBookMsgBys(bookInfo);
            if (rows > 0)
            {
                return "OK";
            }
            else 
            {
                return "FAIL";
            }
    }

    /**
     * 删除
     * @param id     ss
     * @return     integer
     */
    @RequestMapping("/book/deleteBook.action")
    @ResponseBody
    public String deleteBook(String id){
        int rows=bookInfoService.deleteBook(id);
        if (rows > 0){
            return "OK";
        }
       else {
           return null;
        }
    }

    /**
     * 
     * @return  转跳页面        
     */
    @RequestMapping(value = "/book/find.action", method = RequestMethod.POST)
    public String findBookMsg(BookInfo bookInfo,Model model){
       Page<BookInfo> bookInfoPage=bookInfoService.findBookMsgBys(bookInfo);

        System.out.println(bookInfo);
        model.addAttribute("page",bookInfoPage) ;
        
        return  "findBook" ;
    }
    
    @RequestMapping("/book/findId.action")
    @ResponseBody
    public BookInfo findId(String id){
        return this.bookInfoService.findBookById(id);
    }
    
}

