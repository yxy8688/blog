package com.yc.ssm.us.web.filter;



import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yc.ssm.us.entity.B_user;
import com.yc.ssm.us.service.B_userService;

@Controller
public class CheckLoginUserFilter{

	@Autowired
	private B_userService buserService;
	//检查用户是否登陆
	@RequestMapping("login_check")
	@ResponseBody
	public boolean checkLogin(HttpSession session){
		System.out.println("我是检查登陆类");
		System.out.println(session.getAttribute("loginUser"));
		B_user current_user = (B_user) session.getAttribute("loginUser");
		if(current_user == null){
			return false;
		}else{
			return buserService.findUser(current_user.getUsid());
		}
	}
}
