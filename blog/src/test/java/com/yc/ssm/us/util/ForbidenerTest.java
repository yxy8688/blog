package com.yc.ssm.us.util;

import org.junit.AfterClass;
import org.junit.Assert;
import org.junit.Test;

public class ForbidenerTest {

	   public static void setup(){  
	        //构造初始化数据  
	    }  
	      
	    @AfterClass  
	    public static void clear(){  
	    }  
	    /** 
	     * @throws InterruptedException  
	     */  
	    @Test  
	    public void check() throws InterruptedException{  
	        //测试十次封禁  
	        Forbidener fb = Forbidener.getInstance();  
	        fb.setMaxTime(10); //最大点击数 
	        fb.setMinInteval(10*1000);  
	        fb.setForbidenTime(60*1000);  
	        fb.setMaxMapSize(3);  
	        String testIP = "127.0.0.1";  
	        for(int i = 1 ; i <= 10;i++){  
	            System.out.println("check");  
	            Assert.assertTrue(fb.check(testIP));  
	            Thread.sleep(1000);  
	        }  
	        Assert.assertFalse(fb.check(testIP));  
	          
	        //测试解封  
	        System.out.println("sleep more than 1 min");  
	        Thread.sleep(65*1000);  
	        Assert.assertTrue(fb.check(testIP));  
	          
	        //测试最短周期  
	        for(int i = 1;i<= 9 ;i++){  
	            Assert.assertTrue(fb.check(testIP));  
	            System.out.println("check");  
	            Thread.sleep(1000);  
	        }  
	        System.out.println("sleep more than 10 sec");  
	        Thread.sleep(15*1000);  
	        Assert.assertTrue(fb.check(testIP));  
	          
	        //测试淘汰  
	        fb.check("1");  
	        fb.check("2");  
	        Assert.assertTrue(fb.getMapSize() == 3);  
	        fb.check("3");  
	        Assert.assertTrue(fb.getMapSize() == 3);  
	        //  
	    }  
}
