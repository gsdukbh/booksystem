package com.edu.controller;

import com.edu.po.BookInfo;
import com.edu.po.User;
import com.edu.service.BookInfoService;
import com.sun.istack.internal.NotNull;
import javafx.concurrent.Worker;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.portlet.bind.annotation.ResourceMapping;
import utils.DbToExcel;
import utils.Page;

import javax.crypto.interfaces.PBEKey;
import javax.jws.WebParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.net.URLEncoder;
import java.util.List;
import java.util.UUID;

import utils.BookExcel;

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
    public String findBookMsg(@RequestParam(defaultValue = "1")Integer page,
                              @RequestParam(defaultValue = "10") Integer rows,
                              BookInfo bookInfo,Model model){
       Page<BookInfo> bookInfoPage=bookInfoService.findBookMsgBys(bookInfo,page,rows);

        System.out.println(bookInfo);
        model.addAttribute("page",bookInfoPage) ;
        
        return  "findBook" ;
    }
    
    @RequestMapping("/book/findId.action")
    @ResponseBody
    public BookInfo findId(String id){
        return this.bookInfoService.findBookById(id);
    }


    @RequestMapping(value = "/downloadBook.action",method = RequestMethod.POST)
    public ResponseEntity<byte[]> downloadBook(Model model, String[] bookInfoIds, HttpServletRequest request)throws Exception {

        List<BookInfo> bookInfoList=bookInfoService.findBookByIds(bookInfoIds);
        String[] titles={"图书编号","书名","作者","出版单位","单价","分类","备注"};
        String path="/upload/";
        String filename="bookInformation.xls";
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

            BookExcel.dBToExcel(bookInfoList,titles,path+filename);



        } catch (Exception e) {
            // TODO Auto-generated catch block
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


    @RequestMapping("/bookUpfile.action")
    public String BookFileUpload(@RequestParam("uploadfile") List<MultipartFile> uploadfile,
                                    HttpServletRequest request,Model msg) {
        int rows=0;
        // 判断所上传文件是否存在
        if (!uploadfile.isEmpty() && uploadfile.size() > 0) {
            //循环输出上传的文件
            for (MultipartFile file : uploadfile) {
                // 获取上传文件的原始名称
                String originalFilename = file.getOriginalFilename();
                // 设置上传文件的保存地址目录
                String dirPath =
                        request.getServletContext().getRealPath("/upload/");

                File filePath = new File(dirPath);

                System.out.println("dirPath:"+dirPath);

                // 如果保存文件的地址不存在，就先创建目录
                if (!filePath.exists()) {
                    filePath.mkdirs();
                }
                // 使用UUID重新命名上传的文件名称(上传人_uuid_原始文件名称)
                String newFilename = "_"+ UUID.randomUUID() +
                        "_"+originalFilename;
                try {
                    // 使用MultipartFile接口的方法完成文件上传到指定位置
                    file.transferTo(new File(dirPath + newFilename));
                    List<BookInfo> bookInfoList=BookExcel.excelToDb(dirPath + newFilename);
                    rows=this.bookInfoService.addBookMsgs(bookInfoList);
                    
                } catch (Exception e) {
                    e.printStackTrace();
                    return "error";
                }
            }
            msg.addAttribute("msg",rows);
            // 跳转到成功页面
            return "success";
        }else{
            return"error";
        }
    }
    @RequestMapping("/tofindBook.action")
    public String tofindBook(){
        return "findBooks";
    }

    @RequestMapping("/toUpBook.action")
    public String toUpBook()
    {
        return "fileUpBook";
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

