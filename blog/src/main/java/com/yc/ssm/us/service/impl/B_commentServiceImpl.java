package com.yc.ssm.us.service.impl;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.ssm.us.entity.B_comment;
import com.yc.ssm.us.entity.PaginationBean;
import com.yc.ssm.us.mapper.B_commentMapper;
import com.yc.ssm.us.service.B_commentService;

@Service("b_commentService")
public class B_commentServiceImpl implements B_commentService {
	@Autowired
	private B_commentMapper b_commentMapper;

	@Override
	public PaginationBean<B_comment> partComment(String page, String rows) {
		PaginationBean<B_comment> pb = new PaginationBean<>();
		if (page != null) {
			pb.setCurrPage(Integer.parseInt(page));
		}
		if (rows != null) {
			pb.setPageSize(Integer.parseInt(rows));
		}
		pb=b_commentMapper.partComment(pb);
		return pb;
	}
	//添加评论
	@Override
	public boolean insertComment(B_comment b_comment) {
		LogManager.getLogger().debug("添加评论...");
		return b_commentMapper.insertComment(b_comment);
	}
	//通过文章id 查询所有的评论（分页）
	@Override
	public List<B_comment> findCommentByCaid(B_comment b_comment) {
		LogManager.getLogger().debug("通过文章id 查询所有的评论（分页）");
		return b_commentMapper.findCommentByCaid(b_comment);
	}
	//通过用户usid 查询所有的评论（分页）
	@Override
	public List<B_comment> findCommentByUsid(B_comment b_comment) {
		LogManager.getLogger().debug("通过文章id 查询所有的评论（分页）");
		return b_commentMapper.findCommentByUsid(b_comment);
	}

	//查询指定文章的评论数(返回评论总数和评论的页码)
	@Override
	public B_comment selectCommentNum(B_comment b_comment){
		LogManager.getLogger().debug("查询指定文章的评论数(返回评论总数和评论的页码)");
		return b_commentMapper.selectCommentNum(b_comment);
	}
	
	//查询指定用户所发的评论数(返回评论总数和评论的页码)
	public B_comment findCommentNumByUsid(B_comment b_comment){
		LogManager.getLogger().debug("查询指定用户所发的评论数(返回评论总数和评论的页码)");
		return b_commentMapper.findCommentNumByUsid(b_comment);
	}
	//删除评论
	@Override
	public int deleteComment(Integer cid) {
		return b_commentMapper.deleteComment(cid);
	}
	//查询用户所发文章的所有评论内容（分页）
	public List<B_comment>  findComment(B_comment b_comment){
		LogManager.getLogger().debug("查询用户所发文章的所有评论内容（分页）");
		return b_commentMapper.findComment(b_comment);
	}
	//查询用户文章的评论总数和页码
	public B_comment findCommentNum(B_comment b_comment){
		LogManager.getLogger().debug("查询用户文章的评论总数和页码");
		return b_commentMapper.findCommentNum(b_comment);
	}
}
