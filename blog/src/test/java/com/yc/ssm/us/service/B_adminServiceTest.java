package com.yc.ssm.us.service;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yc.ssm.us.entity.B_admin;
import com.yc.ssm.us.entity.PaginationBean;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring.xml")
public class B_adminServiceTest {
	@Autowired
	private B_adminService bad;

	@Test
	public void testLogin() {
		B_admin admin = new B_admin();
		admin.setAdname("admin");
		admin.setAdpassword("a");
		admin = bad.login(admin);
		System.out.println(admin);
		assertNotNull(admin);
	}

	@Test
	public void testPartUser() {
		PaginationBean<B_admin> pb = new PaginationBean<>();
		pb = bad.partUser("1", "10");
		System.out.println(pb);
		assertNotNull(pb);
	}

	@Test
	public void testModifyUser() {
		B_admin admin = new B_admin();
		admin.setAdid(1001);
		// admin.setAdpassword("admin");
		admin.setAdpassword("a");
		boolean result = bad.modifyUser(admin);
		assertEquals(result, true);
	}

	@Test
	public void testInsertUser() {
		B_admin admin = new B_admin();
		admin.setAdname("jm");
		admin.setAdpassword("a");
		int result = bad.insertUser(admin);
		assertNotNull(result);
	}
	@Test
	public void testForgetPassword(){
		B_admin admin = new B_admin();
		admin.setAdname("admin");
		admin.setAdmail("2576096522@qq.com");;
		admin = bad.forgetPassword(admin);
		System.out.println(admin);
		assertNotNull(admin);
	}
}
