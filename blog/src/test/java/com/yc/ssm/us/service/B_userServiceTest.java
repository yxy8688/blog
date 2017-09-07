package com.yc.ssm.us.service;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yc.ssm.us.entity.B_user;
import com.yc.ssm.us.entity.PaginationBean;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring.xml")
public class B_userServiceTest {
	@Autowired
	private B_userService bus;

	@Test
	public void testLogin() {
		B_user buser = new B_user();
		// buser.setUemail("PAQOqq.com");
		// buser.setUemail(10269);
		buser.setUemail("dukvauunwkhi");
		buser.setUpassword("aaaaaa");
		buser = bus.userLogin(buser);
		System.out.println("查询结果==》" + buser);
		assertNotNull(buser);
	}

	@Test
	public void testPartUser() {
		PaginationBean<B_user> tb = bus.partUser("2", "3");
		System.out.println(tb);
		assertNotNull(tb);
	}

	@Test
	public void testfindUser() {
		boolean result = bus.findUser(10007);
		System.out.println(result);
		assertNotNull(result);
	}

	@Test
	public void testfindUserByUsId() {
		B_user result = bus.findUserByUsid(10007);
		System.out.println(result);
		assertNotNull(result);
	}

	@Test
	public void testinsertUser() {
		B_user b_user = new B_user();
		b_user.setUemail("2576096522@qq.com");
		b_user.setUpassword("a");
		int result = bus.insertUser(b_user);
		System.out.println(result);
		assertNotNull(result);
	}

}
