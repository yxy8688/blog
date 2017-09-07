package com.yc.ssm.us.util;


import java.util.Properties;

import javax.mail.Address;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Test{  
    public static void main(String[] args) throws MessagingException {  
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
        msg.setSubject("这是我的一个小小的测试");  
       // 设置邮件内容  
      msg.setText("别调皮，要成功啊！  主与你同在...");  
       // 设置发件人  
      //  msg.setFrom(new InternetAddress("13207343611@163.com"));  
      msg.setFrom(new InternetAddress("18773477307@163.com"));  
        Transport transport = session.getTransport();  
        // 连接邮件服务器  
        transport.connect("18773477307@163.com","ziupkzexofqavuoo");
    //    transport.connect("13207343611@163.com","yuan19961025");

        // 发送邮件  
     //  transport.sendMessage(msg, new Address[] {new InternetAddress("1506173890@qq.com")}); 
        transport.sendMessage(msg, new Address[] {new InternetAddress("13207343611@163.com")});
        // 关闭连接  
        transport.close();  
    }  
}  
