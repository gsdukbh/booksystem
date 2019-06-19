package com.edu.controller;

import com.edu.po.BookInfo;
import com.edu.po.Reader;
import com.edu.po.User;
import com.edu.service.ReaderInfoService;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import utils.Page;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.net.URLEncoder;
import java.util.List;
import java.util.UUID;
import utils.DbToExcel;

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
    @RequestMapping ("/addReader.action")
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
    
    
    @RequestMapping("/reader/findMyBook.action")
    public String findMyBook(HttpSession session,Model model){
        Reader reader=(Reader)session.getAttribute("Reader_SESSION") ;
        Reader reader1=this.readerInfoService.findMyBook(reader.getBorrowID());
        model.addAttribute("myBooks",reader1);
        return "myBook";
    }
    
    @RequestMapping("/myinformation.action")
    public String myinformation(){
        
        return "/Reader/information";
    }

    @RequestMapping("/editMyinformation.action")
    public String editMyinformation(){

        return "/Reader/editinfo";
    }
    @RequestMapping("/read/list.action")
    public String list(@RequestParam(defaultValue = "1")Integer page,
                       @RequestParam(defaultValue = "10") Integer rows,
                       Model model)
    {
        Page<Reader> readerPage=readerInfoService.findAllReaderMsg(page,rows);
        model.addAttribute("page",readerPage);
        return "reader";
    }
    
    
    
    @RequestMapping("/reader/delete.action")
    @ResponseBody
    public String del(String id){
           int rows=readerInfoService.delReaderMsg(id);
           if (rows>0)
           {
               return "OK";
           }
            else {
                return "FAIL";
           }
    }

    /**
     * 
     * @param id    id
     * @return     reader
     */
    @RequestMapping("/reader/findId.action")
    @ResponseBody
    public Reader findReaderID(String id){
        return  this.readerInfoService.findReaderId(id);
    }
    
    
    @RequestMapping("/reader/upReader.action")
    @ResponseBody
    public String upReader(Reader reader,HttpSession session){
        int rows=readerInfoService.upReaderMsg(reader);
        if (rows>0){
            session.setAttribute("Reader_SESSION",reader);
            return "OK";
        }
        else {
            return "FAIL";
        }
    }

    @RequestMapping("/downloadReader.action")
    public ResponseEntity<byte[]> downloadReader(Model model, String[] readerids, HttpServletRequest request)throws Exception {

        List<Reader> readers=readerInfoService.findReaderIds(readerids);
        String[] titles={"借阅账号","姓名","性别","单位","电话","借阅证件类型","身份证","注册时间","备注"};
        String path="/upload/";
        String filename="reader.xls";

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

            DbToExcel.dBToExcel(readers,titles,path+filename);



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
    
    @RequestMapping(value = "/reader/find.action", method = RequestMethod.POST)
    public String find(@RequestParam(defaultValue = "1")Integer page,
                       @RequestParam(defaultValue = "10") Integer rows,Reader reader, Model Model)
    {
        Page<Reader> readerPage= readerInfoService.findLikeReaderMsg(reader,page,rows)  ;
        Model.addAttribute("page",readerPage);
        return "findReader";
    }


    @RequestMapping("/readerRegister.action")
    @ResponseBody
    public String register(String email,String password)
    {
        Reader reader = new Reader();
        reader.setBorrowID(email);
        reader.setPasswd(password);
        int rows = readerInfoService.addReaderMsg(reader);
        if (rows > 0) {

            return "ok";
        } else {

            return "FAIL";
        }
        
    }


    @RequestMapping("/readerUpfile.action")
    public String studentFileUpload(@RequestParam("uploadfile") List<MultipartFile> uploadfile,
                                    HttpServletRequest request,Model msg) {
        int row=0;
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
                    List<Reader> readerList=DbToExcel.excelToDb(dirPath + newFilename);
                    row+=this.readerInfoService.addReaderMsgs(readerList);
                    
                } catch (Exception e) {
                    e.printStackTrace();
                    return "error";
                }
            }
            msg.addAttribute("msg",row);
            // 跳转到成功页面
            return "success";
        }else{
            return"error";
        }
    }
     @RequestMapping("/toFindReader.action")
    public String toFindReader(){
       return "findReaders" ;
    }
    @RequestMapping("/toUpReader.action")
    public String toUpReader(){
        return "fileUpReader" ;
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
