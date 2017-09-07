package com.yc.ssm.us.service;

import static org.junit.Assert.*;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yc.ssm.us.entity.B_tag;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring.xml")
public class B_tagServiceTest {
	@Autowired
	private B_tagService b_tagService;

	@Test
	public void testFindALlTags() {
		List<B_tag> list = b_tagService.findALlTags();
		System.out.println(list);
		assertNotNull(list);
	}
	@Test
	public void testTagAnalytics() {
		List<B_tag> list = b_tagService.TagAnalytics();
		System.out.println(list);
		assertNotNull(list);
	}
	
	@Test
	public void testFindAll() {
		B_tag tag = new B_tag();
		tag.setTusid(1);
		List<B_tag> list = b_tagService.findAllByUsid(tag);
		LogManager.getLogger().debug(list);
		assertNotNull(list);
	}


	@Test
	public void testModifyTag() {
		B_tag btag = new B_tag();
		btag.setTagid(7);
		btag.setTagname("你好");
		boolean result = b_tagService.modifyTag(btag);
		System.out.println(result);
		assertEquals(result, true);
	}

	@Test
	public void testInsertTag() {
		B_tag tag = new B_tag();
		tag.setTagname("oracle1");
		int result = b_tagService.insertTag(tag);
		assertNotNull(result);
	}
	@Test
	public void testDeleteTag() {
		int tagid = 11;
		int result = b_tagService.deleteTag(tagid);
		assertNotNull(result);
	}

}
