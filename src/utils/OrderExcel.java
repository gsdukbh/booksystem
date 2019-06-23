package utils;

import com.edu.po.BookInfo;
import com.edu.po.Order_form;
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

public class OrderExcel {
    public static  void dBToExcel(List<Order_form> list, String[] titles, String file)
            throws Exception {

        WritableWorkbook wwb = null;
        WritableSheet ws = null;



        wwb = Workbook.createWorkbook(new File(file));
        ws = wwb.createSheet("sheet1", 0);

        for (int i = 0; i < titles.length; i++) {
            ws.addCell(new Label(i, 0, titles[i]));
        }
        int count = 1;

        Order_form order_form=new Order_form();
        for(int i=0;i<list.size();i++){
            order_form=list.get(i);
            ws.addCell(new Label(0, i+1,order_form.getOrde_form_id()));
            ws.addCell(new Label(1, i+1,order_form.getBookId() ));
            ws.addCell(new Label(2, i+1,order_form.getOrde_form_create_time().toString() ));
            ws.addCell(new Label(3, i+1,order_form.getOrde_form_Pay_time() ));
            ws.addCell(new Label(4, i+1,order_form.getOrde_form_consignee() ));
            ws.addCell(new Label(5, i+1,order_form.getOrde_form_shipping_address() ));
            ws.addCell(new Label(6, i+1,order_form.getOrde_form_order_amount().toString() ));
        }
        wwb.write();

        if (wwb != null)
        {wwb.close();}
    }
}
