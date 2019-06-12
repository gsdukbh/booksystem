package utils;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

import com.edu.po.Reader;
import org.springframework.stereotype.Component;



import jxl.Sheet;
import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

@Component
public class DbToExcel {
	/**
	 * 该方法实现将电子表中的数据导入对应的数据库内
	 * 
	 * @param excelpath:电子表路径
	 * @param     ：数据库数据表名
	 * @param    ：数据库字段名串，在插入数据库中，各字段信息，并且用逗号间隔，
	 * @param     ：要添加的字段的个数
	 * @throws Exception
	 */
	public static List<Reader>  excelToDb(String excelpath) throws Exception {
		Connection conn = null;
		PreparedStatement ps = null;
		Workbook workbook = null;
		Sheet sheet = null;
		//conn = JdbcPoolUtils.getConnection();
		conn=null;
		
		List<Reader> list=new ArrayList<Reader>();
		
		workbook = Workbook.getWorkbook(new File(excelpath));
		sheet = workbook.getSheet(0);
		int r = sheet.getRows();
		
		for (int i = 1; i < r; i++) {
			Reader reader=new Reader();
			reader.setBorrowID(sheet.getCell(0, i).getContents());
			reader.setPasswd(sheet.getCell(1, i).getContents());
			reader.setReaderName(sheet.getCell(2, i).getContents());
			reader.setReaderSex(sheet.getCell(3, i).getContents());
			reader.setReaderUnit(sheet.getCell(4, i).getContents());
			reader.setReaderPhone(sheet.getCell(5, i).getContents());
			reader.setReaderIDCard(sheet.getCell(6, i).getContents());
			reader.setReaderType(sheet.getCell(7, i).getContents());
			reader.setRaederCondition(sheet.getCell(8, i).getContents());
			
			list.add(reader);
		}
		workbook.close();
		
		return list;
	}

	/**
	 * 该方法实现将数据库中的某数据表数据形成电子表Excel
	 * 
	 * @param 
	 *            :数据表名字
	 * @param 
	 *            ：数据表字段名，采用字符串数组依次存放
	 * @param titles
	 *            ：所形成的电子表表头字段信息，采用字符串数组存放
	 * @param 
	 *            ：查询数据库的条件，将满足该条件的记录存放到电子表中
	 * @param 
	 *            ：排序字段与排序方式（asc\desc）
	 * @param file
	 *            ：电子表名字
	 * @throws Exception
	 */
	public static  void dBToExcel(List <Reader> list,String[] titles, String file)
			throws Exception {
	
		WritableWorkbook wwb = null;
		WritableSheet ws = null;


		
		wwb = Workbook.createWorkbook(new File(file));
		ws = wwb.createSheet("sheet1", 0);

		for (int i = 0; i < titles.length; i++) {
			ws.addCell(new Label(i, 0, titles[i]));
		}
		int count = 1;



		Reader reader=new Reader();
		for(int i=0;i<list.size();i++){
			reader=list.get(i);
			ws.addCell(new Label(0, i+1,reader.getBorrowID()));
			ws.addCell(new Label(1, i+1,reader.getReaderName() ));
			ws.addCell(new Label(2, i+1,reader.getReaderSex() ));
			ws.addCell(new Label(3, i+1,reader.getReaderUnit() ));
			ws.addCell(new Label(4, i+1,reader.getReaderPhone() ));
			ws.addCell(new Label(5, i+1,reader.getReaderType() ));
			ws.addCell(new Label(6, i+1,reader.getReaderIDCard() ));
			ws.addCell(new Label(7, i+1,reader.getReaderTime().toString() ));
			ws.addCell(new Label(8, i+1,reader.getRaederCondition() ));
		}		
		wwb.write();

		if (wwb != null)
		{wwb.close();}
	

	}

}
