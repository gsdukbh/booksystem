package com.edu.controller;

import com.edu.po.BookInfo;
import com.edu.po.BorrowInfo;
import com.edu.po.Reader;
import com.edu.service.BookInfoService;
import com.edu.service.BorrowInfoService;
import com.edu.service.ReaderInfoService;
import com.fasterxml.jackson.annotation.JsonTypeInfo;
import org.jcp.xml.dsig.internal.SignerOutputStream;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import utils.Page;
import java.sql.Timestamp;
import java.util.Date;

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
    @Autowired
    private ReaderInfoService readerInfoService;
    @Autowired
    private BookInfoService bookInfoService;
    @RequestMapping("/borrow/list.action")
    public String list(@RequestParam(defaultValue = "1")Integer page,
                       @RequestParam(defaultValue = "10") Integer rows,
                       Model model)
    {
        Page<BorrowInfo> borrowInfoPage=borrowInfoService.findAllBorrowMsg(page,rows);
        Page<BookInfo>  bookInfoPage=bookInfoService.findAllBookMsg(page,rows);
        Page<Reader> readerPage=readerInfoService.findAllReaderMsg(page,rows);
        model.addAttribute("page",borrowInfoPage);
        model.addAttribute("book",bookInfoPage);
        model.addAttribute("reader",readerPage) ;
        return "borrow";
    }
    
    @RequestMapping(value ="/borrow/find.action", method = RequestMethod.POST)
    public String find( BorrowInfo borrowInfo,Model model){
        
          Page<BorrowInfo>  borrowInfoPage=borrowInfoService.findBorrowMsgById(borrowInfo);
           model.addAttribute("page",borrowInfoPage);
        return "findBorrow";
    }
    @RequestMapping("/borrow/addBorrow.action")
    @ResponseBody
    public String addBorrow(BorrowInfo borrowInfo){
        
        int rows=borrowInfoService.addBorrowMsg(borrowInfo);
        if (rows > 0){
            return "OK";
        }
        else {
            return null;
        }
    }

    @RequestMapping("/borrow/delete.action")
    @ResponseBody
    public String del(String borrowID,String bookId){
        System.out.println(borrowID+bookId);
        BorrowInfo borrowInfo=new BorrowInfo();
        borrowInfo.setBookId(bookId);
        borrowInfo.setBorrowID(borrowID); 
        int rows=borrowInfoService.delBorrowMsgByid(borrowInfo);
        if (rows>0)
        {
            return "OK";
        }
        else {
            return null;
        }
    }
    @RequestMapping("/borrow/upBorrow.action")
    @ResponseBody
    public String upReader(String borrowID,String bookId,String borrowRemandDay,String borrowRenewDay,String borrowstatus) {
        BorrowInfo borrowInfo=new BorrowInfo();
        Date date=new Date();
        borrowInfo.setBookId(bookId);
        borrowInfo.setBorrowID(borrowID);
        String chick="2";
        borrowInfo.setBorrowstatus(new Integer(borrowstatus));
        if (borrowRemandDay.equals(chick)){
            borrowInfo.setBorrowRemandDay(date.toString());
        }
        if (borrowRenewDay.equals(chick)){
            borrowInfo.setBorrowRenewDay(date.toString());
        }
        System.out.println(date);
        System.out.println(borrowInfo);
        int rows=borrowInfoService.upBorrowMsg(borrowInfo);
        if (rows>0){
            return "OK";
        }
        else {
            return null;
        }
        /*  return null;*/
    }   
    
}

