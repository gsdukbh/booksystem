package utils;

import com.edu.po.BookInfo;
import jxl.Sheet;
import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;


import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

/**
 * @author ：lijiawei
 * @date ：Created in 2019/06/2019/6/11 14:49
 * @description：0.0
 * @version: 1
 */
public class BookExcel {
    public static List<BookInfo> excelToDb(String excelpath) throws Exception {
        Connection conn = null;
        PreparedStatement ps = null;
        Workbook workbook = null;
        Sheet sheet = null;
        //conn = JdbcPoolUtils.getConnection();
        conn=null;

        List<BookInfo> list=new ArrayList<BookInfo>();

        workbook = Workbook.getWorkbook(new File(excelpath));
        sheet = workbook.getSheet(0);
        int r = sheet.getRows();

        for (int i = 1; i < r; i++) {
            BookInfo bookInfo=new BookInfo();
            bookInfo.setBookId(sheet.getCell(0, i).getContents());
            bookInfo.setBookName(sheet.getCell(1, i).getContents());
            bookInfo.setBookAuthor(sheet.getCell(2, i).getContents());
            bookInfo.setBookPublishUnit(sheet.getCell(3, i).getContents());
            bookInfo.setBookRate(Integer.parseInt(sheet.getCell(4, i).getContents()));
            bookInfo.setBookSort(sheet.getCell(5, i).getContents());
            bookInfo.setBookRemark(sheet.getCell(6, i).getContents());
            list.add(bookInfo);
        }
        workbook.close();

        return list;
    }

    public static  void dBToExcel(List <BookInfo> list,String[] titles, String file)
            throws Exception {

        WritableWorkbook wwb = null;
        WritableSheet ws = null;


          
        wwb = Workbook.createWorkbook(new File(file));
        ws = wwb.createSheet("sheet1", 0);

        for (int i = 0; i < titles.length; i++) {
            ws.addCell(new Label(i, 0, titles[i]));
        }
        int count = 1;
        
        BookInfo reader=new BookInfo();
        for(int i=0;i<list.size();i++){
            reader=list.get(i);
            ws.addCell(new Label(0, i+1,reader.getBookId()));
            ws.addCell(new Label(1, i+1,reader.getBookName() ));
            ws.addCell(new Label(2, i+1,reader.getBookAuthor() ));
            ws.addCell(new Label(3, i+1,reader.getBookPublishUnit() ));
            ws.addCell(new Label(4, i+1,reader.getBookRate().toString() ));
            ws.addCell(new Label(5, i+1,reader.getBookSort() ));
            ws.addCell(new Label(6, i+1,reader.getBookRemark() ));
        }
        wwb.write();

        if (wwb != null)
        {wwb.close();}
    }

}

