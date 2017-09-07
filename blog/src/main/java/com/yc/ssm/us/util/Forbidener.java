package com.yc.ssm.us.util;

import java.util.Date;

import org.apache.commons.collections.map.LRUMap;
import org.apache.commons.logging.Log;  
import org.apache.commons.logging.LogFactory;  
  
public class Forbidener {  
    final Log log = LogFactory  
            .getLog(Forbidener.class);  
    private Forbidener(){  
        ipmap = new LRUMap(100000); //LRUMAP用来做缓存，采用LRU算法实现 
    }  
    public static Forbidener forbidener;  
    public static Forbidener getInstance(){  
        if(forbidener == null){  
            forbidener = new Forbidener();  
        }  
        return forbidener;  
    }  
    LRUMap ipmap = null ;  
    /** 
     * 超过次数封禁 
     */  
   // long maxTime = 10; 
    long maxTime = 1; //最大点击数1次
    /** 
     * 超过访问时间重新计时 
     */  
    long minInteval = 60*1000*60*24;  
    /** 
     * 封禁的时间 
     */  
    long forbidenTime = 60*1000*60*24;  //封禁24小时
      
  
    public int getMapSize() {  
        return ipmap.size();  
    }  
  
    public void setMaxTime(int i) {  
        maxTime = i;  
    }  
  
    public void setMinInteval(int i) {  
        minInteval = i;   
    }  
  
    public void setForbidenTime(int i) {  
        forbidenTime = i;  
    }  
  
    public void setMaxMapSize(int i) {  
        ipmap = new LRUMap(i);  
    }  
      
      
    public boolean check(String IP){  
        IPer iper = (IPer)ipmap.get(IP);  
        if(iper == null){  
            iper = new IPer();  
            iper.lastVisiterTime = new Date();  
            iper.visitTimes = 1;  
            ipmap.put(IP, iper);  
            return true;  
        }  
        Date now = new Date();  
        if(iper.isForbiden){  
            if(now.getTime() -  iper.lastVisiterTime.getTime() > forbidenTime){  
                //解封  
                iper.isForbiden = false;  
                iper.visitTimes = 1;  
                iper.lastVisiterTime = now;  
                log.debug("unforbiden ip:" + IP);  
                return true;  
            }else{  
                return false;  
            }  
        }  
        if(now.getTime() - iper.lastVisiterTime.getTime() > minInteval){  
            //太久没有访问了,重新计时  
            iper.lastVisiterTime = now;  
            iper.visitTimes = 1;  
            iper.isForbiden = false;  
            log.debug("reset ip:" + IP);  
            return true;  
        }else{  
            iper.lastVisiterTime = now;  
            iper.visitTimes = iper.visitTimes +1;  
            if(iper.visitTimes > maxTime){  
                //封禁  
                iper.isForbiden = true;  
                log.debug("forbiden ip:" + IP);  
                return false;  
            }else{  
                return true;  
            }  
        }  
          
          
    }  
      
    public static void main(String[] args) throws InterruptedException {  
        Date d1 = new Date();  
        Thread.sleep(1000);  
        Date d2 = new Date();  
        System.out.println(d1.getTime() - d2.getTime());  
    }  
}  
  
class IPer {  
    Date lastVisiterTime ;  
    int visitTimes;  
    boolean isForbiden = false;  
}  