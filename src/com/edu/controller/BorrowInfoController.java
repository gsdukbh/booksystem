package com.edu.controller;

import com.edu.po.BorrowInfo;
import com.edu.po.User;
import com.edu.service.BorrowInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import utils.Page;

import javax.servlet.http.HttpSession;

/**
 * @author ：lijiawei
 * @date ：Created in 2019/05/2019/5/14 9:38
 * @description：借阅信息控制类
 * @modified By：
 * @version: 1$
 */
@Controller
public class BorrowInfoController {
    @Autowired
    private BorrowInfoService borrowInfoService;

    @RequestMapping("/borrow/list")
    public String list(@RequestParam(defaultValue = "1")Integer page,
                       @RequestParam(defaultValue = "10") Integer rows,
                       Model model)
    {
        Page<BorrowInfo> borrowInfoPage=borrowInfoService.findAllBorrowMsg(page,rows);
        model.addAttribute("page",borrowInfoPage);
        return "borrow";
    } 
    
    @RequestMapping("/borrow/addBorrow")
    @ResponseBody
    public String addBorrow(BorrowInfo borrowInfo){
        
        int rows=borrowInfoService.addBorrowMsg(borrowInfo);
        if (rows > 0){
            return "OK";
        }
        else {
            return "FAIL";
        }
    }

    @RequestMapping("/borrow/delete")
    @ResponseBody
    public String del(String borrowID,String bookId){
        int rows=borrowInfoService.delBorrowMsgByid(borrowID,bookId);
        if (rows>0)
        {
            return "OK";
        }
        else {
            return "FAIL";
        }
    }
    @RequestMapping("/borrow/findId")
    @ResponseBody
    public BorrowInfo findBorrowID(String borrowID,String bookId){
        return  this.borrowInfoService.findBorrowById(borrowID,bookId);
    } 
    
    @RequestMapping("/borrow/upBorrow")
    @ResponseBody
    public String upReader(BorrowInfo borrowInfo){
        int rows=borrowInfoService.upBorrowMsg(borrowInfo);
        if (rows>0){
            return "OK";
        }
        else {
            return "FAIL";
        }
    }


}

