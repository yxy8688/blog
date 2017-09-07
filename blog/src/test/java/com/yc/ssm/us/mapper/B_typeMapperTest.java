package com.yc.ssm.us.mapper;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yc.ssm.us.entity.B_type;
import com.yc.ssm.us.service.B_typeService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring.xml")

public class B_typeMapperTest {
	
	@Autowired
	private B_typeService typeService;
	
	@Test
	public void testPartType() {
		fail("Not yet implemented");
	}

	@Test
	public void testModifyType() {
		fail("Not yet implemented");
	}

	@Test
	public void testInsertType() {
		fail("Not yet implemented");
	}

	@Test
	public void testDeleteType() {
		fail("Not yet implemented");
	}

	@Test
	public void testFindAll() {
		List<B_type> list = typeService.findAll();
		System.out.println(list);
		assertNotNull(list);
	}

}
