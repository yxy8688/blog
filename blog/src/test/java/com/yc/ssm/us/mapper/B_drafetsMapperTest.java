package com.yc.ssm.us.mapper;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yc.ssm.us.entity.B_article;
import com.yc.ssm.us.entity.B_drafets;
import com.yc.ssm.us.service.B_drafetsService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring.xml")
public class B_drafetsMapperTest {

	@Autowired
	private B_drafetsService drafets;
	
	//添加
	@Test
	public void testAddDrafet() {
		B_article b_article = new B_article();
		b_article.setUsid(10007);
		b_article.setAtitle("你好");
		b_article.setTid(1);
		b_article.setTagid(2);
		b_article.setAcontent("hello world");
		b_article.setApic("");
		
		int result = drafets.addDrafet(b_article);
		System.out.println(result);
		
		assertNotNull(result);

	}
	//按usid查询
	@Test
	public void testFindDrafetByUsid(){
		Integer usid = 10007;
		List<B_drafets> list = drafets.findDrafetByUsid(usid);
		System.out.println(list);
		assertNotNull(list);
	}
	//删除
	@Test
	public void testDeleteDrafet(){
		Integer drid = 2;
		int result = drafets.deleteDrafet(drid);
		System.out.println(result);
		assertNotNull(result);
	}
	//立即发表
	@Test
	public void testPublishArticle(){
		B_drafets b_drafets = new B_drafets();
		b_drafets.setUsid(10007);
		b_drafets.setDrtitle("你好");
		b_drafets.setDrtypeid(1);
		b_drafets.setDrtagid(4);
		b_drafets.setDrcontent("123");
		b_drafets.setDrpic("");
		
		int result = drafets.publishArticle(b_drafets);
		System.out.println(result);
		assertNotNull(result);
	}

}
