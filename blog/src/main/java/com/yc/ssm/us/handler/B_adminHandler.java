package com.yc.ssm.us.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yc.ssm.us.entity.B_admin;
import com.yc.ssm.us.entity.PaginationBean;
import com.yc.ssm.us.service.B_adminService;
import com.yc.ssm.us.util.Encrypt;
import com.yc.ssm.us.util.ServletUtil;

@Controller
@RequestMapping("admin")
public class B_adminHandler {
	public B_adminHandler() {
		LogManager.getLogger().debug("我进入了B_adminHandler");
	}

	@Autowired
	private B_adminService b_adminService;

	private B_admin current_admin;// 当前管理员

	// 管理员登录
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(B_admin b_admin, HttpServletRequest request) {
		LogManager.getLogger().debug("login:admin===>" + b_admin);
		b_admin = b_adminService.login(b_admin);
		if (b_admin == null) {
			request.setAttribute(ServletUtil.ERROR_MESSAGE, "管理员名称或密码错误！！！");
			return "/back/admin_login.jsp";
		} else {
			request.getSession().setAttribute(ServletUtil.LOGIN_ADMIN, b_admin);
			current_admin = (B_admin) request.getSession().getAttribute("loginAdmin");
			return "redirect:/back/manage.jsp";
		}
	}

	// 管理员退出
	@RequestMapping("login_out")
	@ResponseBody
	public boolean login_out(HttpSession session) {
		if (current_admin != null) {
			session.setAttribute(ServletUtil.LOGIN_ADMIN, "");
			LogManager.getLogger().debug("我是退出管理员登录成功的处理");
			return true;
		} else {
			LogManager.getLogger().debug("我是退出管理员登录的失败处理");
			return false;
		}
	}

	// 分页查询管理员
	@RequestMapping(value = "list", method = RequestMethod.POST)
	@ResponseBody
	public PaginationBean<B_admin> list(String rows, String page) {
		LogManager.getLogger().debug("list:row==>" + rows + ",page==>" + page);
		return b_adminService.partUser(page, rows);// 异步数据响应
	}

	// 管理员信息修改
	@RequestMapping("modify")
	@ResponseBody
	public boolean modify(B_admin user) {
		LogManager.getLogger().debug("modify:user==>" + user);
		return b_adminService.modifyUser(user);// 异步数据响应
	}

	// 修改密码
	@RequestMapping(value = "modifyPwd", method = RequestMethod.POST)
	@ResponseBody
	public boolean modifyPwd(@RequestParam("adpassword") String adpassword, @RequestParam("propwd") String propwd) {
		B_admin admin = new B_admin();
		admin.setAdpassword(Encrypt.md5AndSha(adpassword));
		admin.setAdid(current_admin.getAdid());
		if (!current_admin.getAdpassword().equals( Encrypt.md5AndSha(propwd))) {
			return false;
		} else if (b_adminService.modifyUser(admin)) {
			current_admin.setAdpassword(Encrypt.md5AndSha(adpassword));
			return true;
		}
		return false;
	}

	// 添加管理员
	@RequestMapping(value = "add", method = RequestMethod.POST)
	@ResponseBody
	public int insertUser(B_admin b_admin) {
		LogManager.getLogger().debug("我是add admin的处理");
		return b_adminService.insertUser(b_admin);
	}

	// 删除管理员
	@RequestMapping(value = "delete", method = RequestMethod.POST)
	@ResponseBody
	public int deleteUser(String adid) {
		LogManager.getLogger().debug("我是delete admin的处理");
		return b_adminService.deleteUser(adid);
	}

	// 管理员忘记密码登录
	@RequestMapping(value = "forgetPassword", method = RequestMethod.POST)
	public String forgetPassword(B_admin b_admin, HttpServletRequest request) {
		LogManager.getLogger().debug("forgetPassword:admin===>" + b_admin);
		b_admin = b_adminService.forgetPassword(b_admin);
		if (b_admin == null) {
			request.setAttribute(ServletUtil.ERROR_MESSAGE, "管理员名称或者邮箱错误！！！");
			return "/back/forgetPassword.jsp";
		} else {
			request.getSession().setAttribute(ServletUtil.LOGIN_ADMIN, b_admin);
			return "redirect:/back/manage.jsp";
		}
	}

}
