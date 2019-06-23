package com.edu.controller;

import com.edu.po.BookInfo;
import com.edu.po.Order_form;
import com.edu.po.Reader;
import com.edu.po.Shopping;
import com.edu.service.BookInfoService;
import com.edu.service.Order_formService;
import com.edu.service.ReaderInfoService;
import com.edu.service.ShoppingService;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import utils.OrderExcel;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.net.URLEncoder;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
public class Order_formController {


    @Autowired
    private Order_formService orderFormService;

    @Autowired
    private ReaderInfoService readerInfoService;

    @Autowired
    private ShoppingService shoppingService;

    @Autowired
    private BookInfoService bookInfoService;

    @RequestMapping("/downloadFrom.action")
    public ResponseEntity<byte[]> downloadFrom(Model model, String[] ids, HttpServletRequest request) throws Exception{
        List<Order_form> order_forms=this.orderFormService.findOrder_formByIds(ids);
        String[] titles={"订单号","图书编号","下单时间","支付时间","收货人","收货地址","订单金额"};
        String path="/upload/";
        String filename="订单详情.xls";
        File filePath = new File(path);
        try {

            if (!filePath.exists()) {
                filePath.mkdirs();
            }
            File testFile = new File(path+filename);
            if(!testFile .exists()) {
                testFile.createNewFile();
                System.out.println("测试文件不存在");
            }

            OrderExcel.dBToExcel(order_forms,titles,path+filename);


        } catch (Exception e) {

            e.printStackTrace();
        }

        File file = new File(path+filename);
        // 对文件名编码，防止中文文件乱码
        filename = this.getFilename(request, filename);
        // 设置响应头
        HttpHeaders headers = new HttpHeaders();
        // 通知浏览器以下载的方式打开文件
        headers.setContentDispositionFormData("attachment", filename);
        // 定义以流的形式下载返回文件数据
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        // 使用Sring MVC框架的ResponseEntity对象封装返回下载数据
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),
                headers, HttpStatus.OK);

    }


    @RequestMapping("/Order/getId.action")
    @ResponseBody
    public Order_form get(String id){
     return this.orderFormService.findOrder_formById(id);
    }


    @RequestMapping("/Order/edit.action")
    @ResponseBody
    public String edit(Order_form order_form){
        int rows=this.orderFormService.editOrder_form(order_form);
        if (rows>0){
            return "OK";
        }else {
            return "FAIL";
        }

    }
    @RequestMapping("/Order/buy.action")
    public String buy(Order_form order_form, HttpSession session){

        Reader reader=(Reader)session.getAttribute("Reader_SESSION");
        Shopping shopping=new Shopping();
        BookInfo bookInfo=bookInfoService.findBookById(order_form.getBookId());

        Date date=new Date();

        Integer ti=date.hashCode();
        String orde_form_id = UUID.randomUUID() +ti.toString();

        order_form.setOrde_form_order_amount(bookInfo.getBookRate());
        order_form.setOrde_form_id(orde_form_id);

        order_form.setBorrowID(reader.getBorrowID());

        order_form.setOrde_form_Pay_time(date.toString());

        reader.setReaderName(order_form.getOrde_form_consignee());

        reader.setReader_shipping_address(order_form.getOrde_form_shipping_address());

        System.out.println(reader);
        System.out.println(order_form);

        shopping.setBorrowID(reader.getBorrowID());
        shopping.setBookId(order_form.getBookId());
        int row=this.readerInfoService.upReaderMsg(reader);
        int rows=this.orderFormService.addOrder_form(order_form);
        if (row>0){
            System.out.println("Reder"+row);
        }
        if (rows>0){

           this.shoppingService.delShopping(shopping);

            return "Reader/info";
        }else {
            return "error";
        }
    }

    public String getFilename(HttpServletRequest request,
                              String filename) throws Exception {
        // IE不同版本User-Agent中出现的关键词
        String[] IEBrowserKeyWords = {"MSIE", "Trident", "Edge"};
        // 获取请求头代理信息
        String userAgent = request.getHeader("User-Agent");
        for (String keyWord : IEBrowserKeyWords) {
            if (userAgent.contains(keyWord)) {
                //IE内核浏览器，统一为UTF-8编码显示
                return URLEncoder.encode(filename, "UTF-8");
            }
        }
        //火狐等其它浏览器统一为ISO-8859-1编码显示
        return new String(filename.getBytes("UTF-8"), "ISO-8859-1");
    }
}
