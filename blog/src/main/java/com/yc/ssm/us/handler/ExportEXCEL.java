package com.yc.ssm.us.handler;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yc.ssm.us.util.ServletUtil;

import jxl.Workbook;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

@Controller
@RequestMapping("ExportExcel")
public class ExportEXCEL {
	/**
	 * 
	 * @param list要存到EXCEL中的数据
	 *            map中的键就是表的标题 map的值就是插入的内容
	 * @param titlename
	 * @param filepath
	 * @throws Exception
	 */
	public ExportEXCEL() {
		System.out.println("ExportExcel我进来了");
	}

	@RequestMapping(value = "", method = RequestMethod.POST)
	@ResponseBody
	public void CreateEXCELs(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String json = request.getParameter("data");
		// 转换json格式
		json = json.replace(",\"", "*\"").replace("\":", "\"#").toString();
		LogManager.getLogger().debug(json);
		
		// 去除表名
		json = json.substring(json.indexOf("[") + 1);
		json = json.substring(0, json.indexOf("]"));

		// open file.
		WritableWorkbook book = Workbook.createWorkbook(new File(ServletUtil.VIRTUAL_UPLOAD_DIR+"文章详情导出"+".xls"));

		// create Sheet named "Sheet_1". 0 means this is 1st page.
		WritableSheet sheet = book.createSheet("Sheet_1", 0);

		/*
		 * for(int i=0;i<titlename.length;i++){ Label label=new
		 * Label(i,0,titlename[i]);
		 * 
		 * sheet.addCell(label); } int j=1; for(Map<String,Object> map:list){
		 * for(int i=0;i<titlename.length;i++){ Label labels=new
		 * Label(i,j,String.valueOf(map.get(titlename[i])));
		 * sheet.addCell(labels); } j++; }
		 */
		// add defined all cell above to case.
		book.write();
		// close file case.
		book.close();

	}

}
