package com.yc.ssm.us.handler;


import java.util.Properties;

import javax.mail.Address;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.NoSuchProviderException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.logging.log4j.LogManager;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yc.ssm.us.entity.B_admin;
import com.yc.ssm.us.entity.B_user;


@Controller
@RequestMapping("sendEmail")
public class EmailHandler{ 
	
	public EmailHandler() {
		LogManager.getLogger().debug("我进来了 sendEmail");
	}
	private static String random;

	public static void getRandom(){
		random = (int)(Math.random() * 1000000)+"";  
	}
	@RequestMapping("user")
	@ResponseBody
	public String yzm(B_user user){ 
		String Email = user.getUemail();
		getRandom();
		Properties props = new Properties(); //Properties 属性文件 
		// 开启debug调试  
		props.setProperty("mail.debug", "true");  
		// 发送服务器需要身份验证  
		props.setProperty("mail.smtp.auth", "true");  
		// 设置邮件服务器主机名  
		props.setProperty("mail.host", "smtp.163.com");  
		// 发送邮件协议名称  
		props.setProperty("mail.transport.protocol", "smtp");  

		// 设置环境信息  
		Session session = Session.getInstance(props);  

		// 创建邮件对象  
		Message msg = new MimeMessage(session);  
		try {
			msg.setSubject("获取注册Acosta Blog 的验证码");  
			// 设置邮件内容  
			msg.setText("你要注册的Acosta Blog 的验证码为："+ random);  
			// 设置发件人  
			//  msg.setFrom(new InternetAddress("13207343611@163.com"));  
			msg.setFrom(new InternetAddress("18773477307@163.com"));  
			Transport transport = session.getTransport();  
			// 连接邮件服务器  
			transport.connect("18773477307@163.com","ziupkzexofqavuoo");
			//transport.connect("13207343611@163.com","yuan19961025");

			// 发送邮件  
			transport.sendMessage(msg, new Address[] {new InternetAddress(Email)}); 
			// transport.sendMessage(msg, new Address[] {new InternetAddress("13207343611@163.com")});
			// 关闭连接  
			transport.close();
		} catch (AddressException e) {
			e.printStackTrace();
		} catch (NoSuchProviderException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		return random;
	}  
	
		// 管理员忘记密码的邮箱登录
	@RequestMapping("admin")
	@ResponseBody
	public String yzm(B_admin user) {
		String Email = user.getAdmail();
		getRandom();
		Properties props = new Properties(); // Properties 属性文件
		// 开启debug调试
		props.setProperty("mail.debug", "true");
		// 发送服务器需要身份验证
		props.setProperty("mail.smtp.auth", "true");
		// 设置邮件服务器主机名
		props.setProperty("mail.host", "smtp.163.com");
		// 发送邮件协议名称
		props.setProperty("mail.transport.protocol", "smtp");

		// 设置环境信息
		Session session = Session.getInstance(props);

		// 创建邮件对象
		Message msg = new MimeMessage(session);
		try {
			msg.setSubject("获取注册Acosta Blog 的验证码");
			// 设置邮件内容
			msg.setText("您通过忘记密码获取的验证码为：" + random);
			// 设置发件人
			// msg.setFrom(new InternetAddress("13207343611@163.com"));
			msg.setFrom(new InternetAddress("18773477307@163.com"));
			Transport transport = session.getTransport();
			// 连接邮件服务器
			transport.connect("18773477307@163.com", "ziupkzexofqavuoo");
			// transport.connect("13207343611@163.com","yuan19961025");

			// 发送邮件
			transport.sendMessage(msg, new Address[] { new InternetAddress(Email) });
			// transport.sendMessage(msg, new Address[] {new
			// InternetAddress("13207343611@163.com")});
			// 关闭连接
			transport.close();
		} catch (AddressException e) {
			e.printStackTrace();
		} catch (NoSuchProviderException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		return random;
	}
}  
