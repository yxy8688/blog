package com.yc.ssm.us.service.impl;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.ssm.us.entity.PaginationBean;
import com.yc.ssm.us.entity.B_article;
import com.yc.ssm.us.mapper.B_articleMapper;
import com.yc.ssm.us.service.B_articleService;

@Service("b_articleService")

public class B_articleServiceImpl implements B_articleService {
	@Autowired
	private B_articleMapper b_articleMapper;

	// 首页按评论数显示热度文章
	@Override
	public List<B_article> findArticleByHot(B_article b_article) {
		LogManager.getLogger().debug("首页按评论数显示热度文章");
		return b_articleMapper.findArticleByHot(b_article);
	}

	@Override
	public List<B_article> listArticleBytagname(B_article b_article) {
		// 通过标签名查询博客文章
		return b_articleMapper.listArticleBytagname(b_article);
	}

	// 更改博客文章
	@Override
	public int modifyArticle(B_article b_article) {
		LogManager.getLogger().debug("更改博客文章：");
		return b_articleMapper.modifyArticle(b_article);
	}

	// 添加新文章
	@Override
	public boolean insertArticle(B_article b_article) {
		b_article.setAtitle(b_article.getAtitle().replace(" ", ""));// 标签去空格
		LogManager.getLogger().debug("添加新文章：");
		return b_articleMapper.insertArticle(b_article) > 0;
	}

	// 通过用户id查询查询个人文章
	@Override
	public List<B_article> findPersonArticle(Integer usid) {
		LogManager.getLogger().debug("我是通过usid查询来的");
		return b_articleMapper.findPersonArticle(usid);
	}

	// 指定用户id分页查询文章(by 类型)
	public List<B_article> findArticleByType(B_article b_article){
		return b_articleMapper.findArticleByType(b_article);
	}

	// 查询博客文章(通过文章id)
	public B_article findArticleByAid(Integer aid) {
		LogManager.getLogger().debug(" 查询博客文章(通过文章id)");
		return b_articleMapper.findArticleByAid(aid);
	}

	//查询用户id所作的文章数及总页数
	@Override
	public B_article findArticleNum(B_article b_article) {
		LogManager.getLogger().debug("查询用户id所作的文章数及总页数");
		return b_articleMapper.findArticleNum(b_article);
	}
	//查询用户id所作的文章数及总页数 (以  类型分类)
	public B_article findArticleNumByType(B_article b_article){
		return b_articleMapper.findArticleNumByType(b_article);
	}

	// 指定用户id分页查询文章(by 类别)
	public List<B_article> findArticleByTag(B_article b_article){
		return b_articleMapper.findArticleByTag(b_article);
	}

	//查询用户id所作的文章数及总页数 (以  类别（tag）分类)
	public B_article findArticleNumByTag(B_article b_article){
		return b_articleMapper.findArticleNumByTag(b_article);
	}

	//查询文章的所有总数和总页数
	@Override
	public B_article findArticleTotal() {
		LogManager.getLogger().debug("查询文章的所有总数和总页数");
		return b_articleMapper.findArticleTotal();
	}

	// 查询所有的文章
	@Override
	public List<B_article> findArticle() {
		LogManager.getLogger().debug("我是articleService里的：");
		return b_articleMapper.findArticle();
	}
	//分页显示所有的文章（按时间）
	@Override
	public List<B_article> findArticleByTime(B_article b_article) {
		LogManager.getLogger().debug("我是articleService里的：");
		return b_articleMapper.findArticleByTime(b_article);
	}

	//文章分页查询
	@Override
	public PaginationBean<B_article> partArticle(String page, String rows) {
		PaginationBean<B_article> pb = new PaginationBean<>();
		if (page != null) {
			pb.setCurrPage(Integer.parseInt(page));
		}
		if (rows != null) {
			pb.setPageSize(Integer.parseInt(rows));
		}
		pb = b_articleMapper.partArticle(pb);
		return pb;
	}

	// 浏览量的增加
	public int updateAviewNum(Integer aid) {
		LogManager.getLogger().debug("浏览量的增加");
		return b_articleMapper.updateAviewNum(aid);
	}

	// 通过用户id分页
	public List<B_article> partArticleById(B_article b_article) {
		LogManager.getLogger().debug("通过用户id分页");
		return b_articleMapper.partArticleById(b_article);
	}

	// 删除博客文章
	@Override
	public int deleteArticle(Integer aid) {
		LogManager.getLogger().debug("删除博客文章");
		return b_articleMapper.deleteArticle(aid);
	}

	// 通过用户名查询文章
	@Override
	public List<B_article> findArticleByuname(String uname) {
		return b_articleMapper.listArticleByuname(uname);
	}

	// 通过标签名查询文章
	@Override
	public List<B_article> findArticleBytname(String tname) {
		return b_articleMapper.listArticleBytname(tname);
	}

	// 文章排行分析
	@Override
	public List<B_article> ArticleAnalytics() {
		return b_articleMapper.articleAnalytics();
	}

	//查询板块文章
	@Override
	public List<B_article> listArticleByCoaid(List<String> listcoaid) {
		return b_articleMapper.listArticleByCoaid(listcoaid);
	}
	
	//个人文章的模糊查询
	public List<B_article> findArticleByAtitle(B_article b_article){
		return b_articleMapper.findArticleByAtitle(b_article);
	}

	//查询用户id所作的文章数及总页数 (以  atitle 标题）分类)
	public B_article findArticleNumByAtitle(B_article b_article){
		return b_articleMapper.findArticleNumByAtitle(b_article);
	}

}
