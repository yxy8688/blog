package com.yc.ssm.us.util;

import javax.servlet.http.HttpServletRequest;
//解析获取主机ip的地址，实现浏览器兼容
public class IpUtils {  
    public static String getIpAddr(HttpServletRequest request) {  
           String ip = request.getHeader("X-Forwarded-For");  
           if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
               ip = request.getHeader("Proxy-Client-IP");  
           }  
           if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
               ip = request.getHeader("WL-Proxy-Client-IP");  
           }  
           if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
               ip = request.getHeader("HTTP_CLIENT_IP");  
           }  
           if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
               ip = request.getHeader("HTTP_X_FORWARDED_FOR");  
           }  
           if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
               ip = request.getRemoteAddr();  
           }  
           return ip;  
       }  
}
