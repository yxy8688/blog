package com.yc.ssm.us.service;

import java.util.List;

import com.yc.ssm.us.entity.B_article;
import com.yc.ssm.us.entity.PaginationBean;

public interface B_articleService {
	// 查询所有的文章
	List<B_article> findArticle();

	// 分页显示所有的文章（按时间）
	List<B_article> findArticleByTime(B_article b_article);

	// 首页按评论数显示热度文章
	List<B_article> findArticleByHot(B_article b_article);

	// 通过用户id查询个人文章
	List<B_article> findPersonArticle(Integer usid);

	// 通过标签名查询博客文章
	List<B_article> listArticleBytagname(B_article b_article);

	// 查询博客文章(通过文章id)
	B_article findArticleByAid(Integer aid);

	// 通过用户昵称查找博客文章
	List<B_article> findArticleByuname(String uname);

	// 通过文章类型名查找文章
	List<B_article> findArticleBytname(String tname);

	// 分页显示文章
	PaginationBean<B_article> partArticle(String page, String rows);

	// 通过用户id分页
	List<B_article> partArticleById(B_article b_article);

	// 查询用户id所作的文章数及总页数
	B_article findArticleNum(B_article b_article);

	// 查询用户id所作的文章数及总页数 (以 类型分类)
	B_article findArticleNumByType(B_article b_article);

	// 查询文章的所有总数和总页数
	B_article findArticleTotal();

	// 修改博客文章
	int modifyArticle(B_article b_article);// 更新博客信息
	// 删除博客文章

	int deleteArticle(Integer aid);

	// 添加博客文章
	boolean insertArticle(B_article b_article);

	List<B_article> ArticleAnalytics();

	// 浏览量的增加
	int updateAviewNum(Integer aid);

	// 查询板块的文章
	List<B_article> listArticleByCoaid(List<String> listcoaid);

	// 指定用户id分页查询文章(by 类型)
	List<B_article> findArticleByType(B_article b_article);

	// 指定用户id分页查询文章(by 类别)
	List<B_article> findArticleByTag(B_article b_article);

	// 查询用户id所作的文章数及总页数 (以 类别（tag）分类)
	B_article findArticleNumByTag(B_article b_article);

	// 个人文章的模糊查询
	List<B_article> findArticleByAtitle(B_article b_article);

	// 查询用户id所作的文章数及总页数 (以 atitle 标题）分类)
	B_article findArticleNumByAtitle(B_article b_article);

}
