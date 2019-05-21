package com.edu.controller;

import com.edu.po.BookInfo;
import com.edu.po.BorrowInfo;
import com.edu.po.Reader;
import com.edu.service.BookInfoService;
import com.edu.service.BorrowInfoService;
import com.edu.service.ReaderInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import utils.Page;
import java.sql.Timestamp;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
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
    @RequestMapping("/borrow/list")
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
    
    @RequestMapping("/borrow/addBorrow")
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
    @RequestMapping("/borrow/reBorrow")
    @ResponseBody
    public String reBorrow(String borrowID,String bookId){
        BorrowInfo borrowInfo=new BorrowInfo();
        borrowInfo.setBorrowID(borrowID);
        borrowInfo.setBookId(bookId);
        Date date=new Date();
        Timestamp timeStamp = new Timestamp(date.getTime());
        borrowInfo.setBorrowRemandDay(timeStamp);
        int row=borrowInfoService.upBorrowMsg(borrowInfo);
        if (row >0){
            return "OK";
        }
          else {return null;}
    }
    @RequestMapping("/borrow/renewBorrow")
    @ResponseBody
    public String renewBorrow(String borrowID,String bookId){
        BorrowInfo b=new BorrowInfo();
        b.setBorrowID(borrowID);
        b.setBookId(bookId);
        Date date=new Date();
        Timestamp timeStamp = new Timestamp(date.getTime());
        b.setBorrowRenewDay(timeStamp);
        int rows=borrowInfoService.upBorrowMsg(b) ;
        if (rows >0){
            return "OK";
        }
        else {return null;}
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

