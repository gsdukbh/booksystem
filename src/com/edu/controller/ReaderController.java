package com.edu.controller;

import com.edu.po.Reader;
import com.edu.po.User;
import com.edu.service.ReaderInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import utils.Page;

import javax.servlet.http.HttpSession;

@Controller
public class ReaderController {
    @Autowired
    private ReaderInfoService readerInfoService;

    /**
     * 添加读者信息
     * @param reader  读者信息
     * @param session   session
     * @return  String
     */
    @RequestMapping ("/addReader")
    @ResponseBody
    public String readerCreate(Reader reader, HttpSession session){
        User user=(User) session.getAttribute("USER_SESSION");
        int rows =readerInfoService.addReaderMsg(reader);
        if (rows>0)
        {
            return "OK";
        }
        else 
            {
                return "FAIL";
            }
    }
    @RequestMapping("/read/list")
    public String list(@RequestParam(defaultValue = "1")Integer page,
                       @RequestParam(defaultValue = "10") Integer rows,
                       Model model)
    {
        Page<Reader> readerPage=readerInfoService.findAllReaderMsg(page,rows);
        model.addAttribute("page",readerPage);
        return "reader";
    }
    
}
