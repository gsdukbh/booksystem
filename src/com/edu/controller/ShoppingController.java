package com.edu.controller;

import com.edu.po.BookInfo;
import com.edu.po.Reader;
import com.edu.po.Shopping;
import com.edu.service.BookInfoService;
import com.edu.service.ShoppingService;
import com.sun.rowset.internal.Row;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class ShoppingController {
    /**
     * 自动装配
     */
    @Autowired
    private ShoppingService shoppingService;

    @Autowired
    private BookInfoService bookInfoService;

    @RequestMapping("/Shop/addShopping.action")
    @ResponseBody
    public String addShopping(@RequestParam("id") String id, HttpSession session){
        Reader reader=(Reader)session.getAttribute("Reader_SESSION");
        BookInfo bookInfo=this.bookInfoService.findBookById(id);
        Shopping shopping=new Shopping();
        shopping.setBookId(id);
        shopping.setBorrowID(reader.getBorrowID());
        shopping.setQuantity(bookInfo.getBookRate());
        int row=this.shoppingService.addShopping(shopping);
        if (row>0){
            return "OK";
        }else {
            return "FAIL";
        }

    }


   @RequestMapping("/me/MyShop.action")
    public String MyShop(HttpSession session, Model model){
       Reader reader=(Reader)session.getAttribute("Reader_SESSION");
       List<Shopping> shopping=this.shoppingService.findShopping(reader.getBorrowID());
       BookInfo bookInfo=new BookInfo();
       model.addAttribute("myshop",shopping);
       for (int i=0;i<shopping.size();i++){

       }
       System.out.println("我的购物车"+shopping);
        return "/Reader/MyShop";
    }

    @RequestMapping("/Shop/del.action")
    @ResponseBody
    public String del(@RequestParam("id") String id ,HttpSession session){
        Reader reader=(Reader)session.getAttribute("Reader_SESSION");
        Shopping shopping=new Shopping();
        shopping.setBookId(id);
        shopping.setBorrowID(reader.getBorrowID());
        int row=this.shoppingService.delShopping(shopping);
        if (row>0){
            return "OK";
        }else {
            return "FAIL";
        }
    }
    @RequestMapping("/Shop/delS.action")
    @ResponseBody
    public String dels(@RequestParam("ShopIds") String[] ShopIds ,HttpSession session){
        int row=0;
        for (String s:ShopIds){
            String s1=this.del(s,session);
            if (s1.equals("OK")){
                row++;
            }
        }
        if (row>0){
            return "成功！";
        }else {
            return "失败！";
        }
    }

    @RequestMapping("/Order/toBuy.action")
    public String toBuy(Model model,@RequestParam("id")String id){
        model.addAttribute("id",id);
        return "/Reader/buybook";
    }
}
