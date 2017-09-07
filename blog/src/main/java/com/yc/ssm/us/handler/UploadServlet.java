package com.yc.ssm.us.handler;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspFactory;
import javax.servlet.jsp.PageContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yc.ssm.us.service.B_userService;
import com.yc.ssm.us.util.UploadUtil;

import sun.misc.BASE64Decoder;
@Controller
@SuppressWarnings({ "serial", "restriction" })
@RequestMapping("camera")
public class UploadServlet extends HttpServlet {
	
	@Autowired
	private B_userService userService;
	private PrintWriter out;

	@RequestMapping(value="add",method = RequestMethod.POST)
	@ResponseBody
	public void camere(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			out=response.getWriter();
			UploadUtil uploadUtil=new UploadUtil();
			PageContext context=JspFactory.getDefaultFactory().getPageContext(this,request,response,null,true,8192,true);

			Map<String,String> map=uploadUtil.update(context);
			BASE64Decoder base64=new BASE64Decoder(); 
			
			//64位解码  
			byte[] buffer=base64.decodeBuffer(map.get("imageData"));

			
			//写进文件  
			String filPath="../dataInfo/"+new Date().getTime()+""+new Random().nextInt(100000)+".png";
			filPath=this.getServletContext().getRealPath(filPath);
			FileOutputStream fos=new FileOutputStream(filPath); 
			fos.write(buffer);  
			fos.flush();  
			fos.close();  
			fos=null;  
			out.print(1);
		} catch (Exception e) {
			e.printStackTrace();
			out.print(0);
		}
		out.flush();
		out.close();
		
	}

}
