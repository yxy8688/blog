package com.yc.ssm.us.service;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yc.ssm.us.entity.B_article;
import com.yc.ssm.us.entity.PaginationBean;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring.xml")
public class B_articleServiceTest {
	@Autowired
	private B_articleService bart;

	// 条件查询文章
	@Test
	public void testListArticleBytagname() {
		B_article article=new B_article();
		article.setTagname("java");
		List<B_article> articles = bart.listArticleBytagname(article);
		System.out.println("查询结果==》");
		for (B_article b_article : articles) {
			System.out.println(b_article);
		}
		assertNotNull(articles);
	}
	// 查询博客文章(通过文章id)
	@Test
	public void testFindArticleByAid() {
		Integer aid = 102;
		B_article b_article = bart.findArticleByAid(aid);
		System.out.println(b_article);
		assertNotNull(b_article);
	}

	// 修改通过文章id修改文章
	@Test
	public void testModifyArticle() {
		B_article b_article = new B_article();
		b_article.setAid(122);
		b_article.setAcontent("java的一个集成开发环境");
		b_article.setAtitle("eclispe");
		b_article.setApic("/upload/22-1.jpg");
		bart.modifyArticle(b_article);
	}
	
	//按标题查询文章
	@Test
	public void testFindArticleByAtitle(){
		B_article b_article = new B_article();
		b_article.setUsid(10001);
		b_article.setAtitle("生");
		List<B_article> list = bart.findArticleByAtitle(b_article);
		System.out.println(list);
		assertNotNull(list);
	}

	// 查找所有文章
	@Test
	public void testFindArticle() {
		
		List<B_article> list = bart.findArticle();
		System.out.println(list);
		assertNotNull(list);
	}
	//首页按评论数显示热度文章
		@Test
		public void testFindArticleByHot() {
			B_article b_article = new B_article();
			b_article.setCurrPage(3);
			b_article.setPageSize(10);
			List<B_article> list = bart.findArticleByHot(b_article);
			System.out.println(list);
			assertNotNull(list);
		}

	// 分页查询
	@Test
	public void testPartArticle() {
		PaginationBean<B_article> lists = bart.partArticle("1", "10");
		System.out.println(lists);
		assertNotNull(lists);
	}

	// 通过usid分页查询
	@Test
	public void testPartArticleById() {
		B_article b_article = new B_article();
		b_article.setUsid(10007);
		
		b_article.setCurrPage(1);
		b_article.setPageSize(5);
		List<B_article> lists = bart.partArticleById(b_article);
		
		System.out.println(lists);
		assertNotNull(lists);
	}
	// 查询用户id所作的文章数及总页数
	@Test
	public void testFindArticleNum() {
		B_article b_article = new B_article();
		b_article.setUsid(10007);
		B_article lists = bart.findArticleNum(b_article);
		System.out.println(lists);
		assertNotNull(lists);
	}
	//查询文章的所有总数和总页数
		@Test
		public void testFindArticleTotal() {
			B_article lists = bart.findArticleTotal();
			System.out.println(lists);
			assertNotNull(lists);
		}
	
	//新建博客
	@Test
	public void testInsertArticle() {
		B_article article = new B_article();
		article.setAtitle("eclispe");
		article.setTid(2);
		article.setTagid(1);
		article.setUsid(10007);
		article.setAcontent("java的一个集成开发环境");
		article.setApic("");
		boolean result = bart.insertArticle(article);
		System.out.println(result);
		assertEquals(result, true);
	}
	// 删除文章
	@Test
	public void testDeleteArticle() {
		int aid = 44;
		Integer list = bart.deleteArticle(aid);
		System.out.println(list);
		assertNotNull(list);
	}
	
	//查询所有用户所作的文章数的排行
	@Test
	public void testarticleAnalytics() {
		List<B_article> list=bart.ArticleAnalytics();
		System.out.println(list);
		assertNotNull(list);
	}
	//<!-- 更改指定博客的浏览量 -->
	@Test
	public void testUpdateAviewNum(){
		Integer aid = 122;
		int result = bart.updateAviewNum(aid);
		System.out.println(result);
		assertNotNull(result);
	} 
}
