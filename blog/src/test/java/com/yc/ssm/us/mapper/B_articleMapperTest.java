package com.yc.ssm.us.mapper;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yc.ssm.us.entity.B_article;
import com.yc.ssm.us.service.B_articleService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring.xml")
public class B_articleMapperTest {

	@Autowired
	private B_articleService article;

	// 查询个人文章
	@Test
	public void testFindPersonArticle() {
		List<B_article> list = article.findPersonArticle(10002);
		System.out.println(list);
		assertNotNull(list);
	}

	// 查询板块文章id对应的文章信息
	@Test
	public void testFindlistArticleByCoaid() {
		String coaid = "4,5,9";
		String[]array=coaid.split(",");
		List<String> listcoaid = new ArrayList<String>();
		for (String str : array) {
			listcoaid.add(str);
		}
		List<B_article> list = article.listArticleByCoaid(listcoaid);
		System.out.println(list);
		assertNotNull(list);
	}

}
