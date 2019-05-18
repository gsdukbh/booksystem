package com.edu.controller;

import com.edu.po.Reader;
import com.edu.po.User;
import com.edu.service.ReaderInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.portlet.bind.annotation.ResourceMapping;

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
    @ResourceMapping ("/addReader")
    @ResponseBody
    public String readerCreate(Reader reader, HttpSession session){
        User user=(User) session.getAttribute("admin");
        int rows =readerInfoService.addReaderMsg(reader);
        if (rows>0)
        {
            return "ok";
        }
        else 
            {
                return "fail";
            }
    }
    
    
}
