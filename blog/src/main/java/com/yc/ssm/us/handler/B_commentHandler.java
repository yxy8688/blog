package com.yc.ssm.us.handler;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yc.ssm.us.entity.B_comment;
import com.yc.ssm.us.entity.B_user;
import com.yc.ssm.us.entity.PaginationBean;
import com.yc.ssm.us.service.B_commentService;

@Controller
@RequestMapping("comment")
public class B_commentHandler {
	public B_commentHandler() {
		LogManager.getLogger().debug("我进入了commentHandler");
	}

	@Autowired
	private B_commentService b_commentService;


	// 通过文章id 查询所有的评论（分页）
	@RequestMapping("findCommentByCaid")
	@ResponseBody
	public List<B_comment> findCommentByCaid(B_comment b_comment) {
		return b_commentService.findCommentByCaid(b_comment);
	}

	// 通过用户usid 查询所有的评论（分页）
	@RequestMapping(value = "findCommentByUsid",method= RequestMethod.POST)
	@ResponseBody
	public List<B_comment> findCommentByUsid(B_comment b_comment,HttpSession session){
		B_user b_user = (B_user) session.getAttribute("loginUser");
		Integer usid = b_user.getUsid();
		b_comment.setUsid(usid);
		return b_commentService.findCommentByUsid(b_comment);
	}

	// 查询指定文章的评论数(返回评论总数和评论的页码)
	@RequestMapping(value = "listNum", method = RequestMethod.POST)
	@ResponseBody
	public B_comment selectCommentNum(B_comment b_comment) {
		return b_commentService.selectCommentNum(b_comment);
	}
	//  查询指定用户所发的评论数(返回评论总数和评论的页码)
	@RequestMapping(value = "findNumByUsid", method = RequestMethod.POST)
	@ResponseBody
	public B_comment findCommentNumByUsid(B_comment b_comment,HttpSession session) {
		B_user b_user = (B_user) session.getAttribute("loginUser");
		Integer usid = b_user.getUsid();
		b_comment.setUsid(usid);
		return b_commentService.findCommentNumByUsid(b_comment);
	}

	// 分页显示所有评论
	@RequestMapping(value = "list", method = RequestMethod.POST)
	@ResponseBody
	public PaginationBean<B_comment> list(String rows, String page) {
		LogManager.getLogger().debug("list:row==>" + rows + ",page==>" + page);
		return b_commentService.partComment(page, rows);// 异步数据响应
	}

	// 添加评论
	@RequestMapping("addComment")
	@ResponseBody
	public boolean insertComment(B_comment b_comment, HttpSession session) {
		B_user currUser = (B_user) session.getAttribute("loginUser");
		Integer usid = currUser.getUsid();
		b_comment.setUsid(usid);
		return b_commentService.insertComment(b_comment);
	}

	// 判断用户是否登录
	public String isLogin(HttpSession session) {
		B_user user = (B_user) session.getAttribute("loginUser");
		if (user == null) {
			return "redirect:/login.jsp";
		} else {
			int usid = user.getUsid();
			return String.valueOf(usid);
		}

	}
	// 删除评论
	@RequestMapping(value = "delete", method = RequestMethod.POST)
	@ResponseBody
	public int deleteComment(Integer cid) {
		LogManager.getLogger().debug("我是delete 的处理");
		return b_commentService.deleteComment(cid);
	}

	//查询用户所发文章的所有评论内容（分页）
	@RequestMapping(value = "findComment",method=RequestMethod.POST)
	@ResponseBody
	public List<B_comment> findComment(B_comment b_comment,HttpSession session){
		B_user b_user = (B_user) session.getAttribute("loginUser");
		Integer usid = b_user.getUsid();
		b_comment.setUsid(usid);
		return b_commentService.findComment(b_comment);
	}
	
	// 查询用户文章的总评论数及页码
	@RequestMapping(value = "findNum", method = RequestMethod.POST)
	@ResponseBody
	public B_comment findCommentNum(B_comment b_comment,HttpSession session) {
		B_user b_user = (B_user) session.getAttribute("loginUser");
		Integer usid = b_user.getUsid();
		b_comment.setUsid(usid);
		return b_commentService.findCommentNum(b_comment);
	}
}
