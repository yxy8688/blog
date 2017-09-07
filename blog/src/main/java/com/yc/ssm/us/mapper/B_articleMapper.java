package com.yc.ssm.us.mapper;

import com.yc.ssm.us.entity.PaginationBean;

import java.util.List;

import com.yc.ssm.us.entity.B_article;

public interface B_articleMapper {
	// 查询所有的文章
	List<B_article> findArticle();

	// 分页显示所有的文章（按时间）
	List<B_article> findArticleByTime(B_article b_article);

	// 首页按评论数显示热度文章
	List<B_article> findArticleByHot(B_article b_article);

	// 通过用户id查询个人文章
	List<B_article> findPersonArticle(Integer usid);

	// 指定用户id分页查询文章(by 类型)
	List<B_article> findArticleByType(B_article b_article);

	// 指定用户id分页查询文章(by 类别)
	List<B_article> findArticleByTag(B_article b_article);

	// 通过用户名查找文章
	List<B_article> listArticleByuname(String uname);

	// 通过文章类型查找文章
	List<B_article> listArticleBytname(String tname);

	// 通过标签名查询文章
	List<B_article> listArticleBytagname(B_article b_article);

	// 查询板块的文章
	List<B_article> listArticleByCoaid(List<String> listcoaid);

	// 查询博客文章(通过文章id)
	B_article findArticleByAid(Integer aid);

	// 分页
	PaginationBean<B_article> partArticle(PaginationBean<B_article> pb);

	// 通过用户id分页
	List<B_article> partArticleById(B_article b_article);

	// 个人文章的模糊查询
	List<B_article> findArticleByAtitle(B_article b_article);

	// 查询用户id所作的文章数及总页数
	B_article findArticleNum(B_article b_article);

	// 查询用户id所作的文章数及总页数 (以 类型(type)分类)
	B_article findArticleNumByType(B_article b_article);

	// 查询用户id所作的文章数及总页数 (以 类别（tag）分类)
	B_article findArticleNumByTag(B_article b_article);

	// 查询用户id所作的文章数及总页数 (以 atitle 标题）分类)
	B_article findArticleNumByAtitle(B_article b_article);

	// 查询文章的所有总数和总页数
	B_article findArticleTotal();

	// 查询每个用户发表文章的数量（后台数据分析）
	List<B_article> articleAnalytics();

	// 更新博客文章
	int modifyArticle(B_article b_article);

	// 写博客
	int insertArticle(B_article b_article);

	// 删除文章
	int deleteArticle(int aid);

	// 浏览量的增加
	int updateAviewNum(Integer aid);

}
