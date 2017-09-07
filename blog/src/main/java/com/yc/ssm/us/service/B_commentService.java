package com.yc.ssm.us.service;

import java.util.List;

import com.yc.ssm.us.entity.B_comment;
import com.yc.ssm.us.entity.PaginationBean;

public interface B_commentService {
	// 评论分页
	PaginationBean<B_comment> partComment(String page, String rows);

	// 添加评论
	boolean insertComment(B_comment b_comment);

	// 通过文章id 查询所有的评论（分页）
	List<B_comment> findCommentByCaid(B_comment b_comment);
	
	//通过用户usid 查询所有的评论（分页）
	List<B_comment> findCommentByUsid(B_comment b_comment);

	// 查询指定文章的评论数(返回评论总数和评论的页码)
	B_comment selectCommentNum(B_comment b_comment);
	
	//查询指定用户所发的评论数(返回评论总数和评论的页码)
	B_comment findCommentNumByUsid(B_comment b_comment);

	// 删除评论
	int deleteComment(Integer cid);
	
	//查询用户所发文章的所有评论内容（分页）
	List<B_comment>  findComment(B_comment b_comment);
	//查询用户文章的评论总数和页码
	B_comment findCommentNum(B_comment b_comment);

}
