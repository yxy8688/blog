package com.yc.ssm.us.mapper;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yc.ssm.us.entity.B_user;
import com.yc.ssm.us.service.B_userService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring.xml")
public class B_userMapperTest {

	@Autowired 
	private B_userService userService;
	@Test
	public void testUpdateUser() {
		B_user buser = new B_user();
		buser.setUsid(10009);
		buser.setUpassword("b");
		boolean result = userService.updateUser(buser);
		assertEquals(result, true);
	}
	
	@Test
	public void testUpdate_userInfo() {
		B_user buser = new B_user();
		buser.setUsid(10009);
		buser.setUname("无恒");
		buser.setUphone("31222211");
		boolean result = userService.updateUser(buser);
		assertEquals(result, true);
	}
	

}
