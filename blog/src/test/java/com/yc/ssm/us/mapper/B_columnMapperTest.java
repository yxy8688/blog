package com.yc.ssm.us.mapper;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yc.ssm.us.entity.B_column;
import com.yc.ssm.us.entity.PaginationBean;
import com.yc.ssm.us.service.B_columnService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring.xml")
public class B_columnMapperTest {

	@Autowired
	private B_columnService b_columnService  ;

	// 查询板块信息
	@Test
	public void testPartColumn() {
		PaginationBean<B_column> pb=b_columnService.partColumn("1", "10");
		System.out.println(pb);
		assertNotNull(pb);
	}
	@Test
	public void testfindCoaidByCotitle(){
		String coaid=b_columnService.findCoaidByCotitle("三大框架的实现");
		System.out.println(coaid);
		assertNotNull(coaid);
	}
	@Test
	public void testfindColumnAll(){
		List<B_column>list=b_columnService.findColumnAll();
		for (B_column b_column : list) {
			System.out.println(b_column);
		}
		assertNotNull(list);
	}
	
}
