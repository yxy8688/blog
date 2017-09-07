package com.yc.ssm.us.handler;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.yc.ssm.us.entity.B_user;
import com.yc.ssm.us.entity.PaginationBean;
import com.yc.ssm.us.service.B_userService;
import com.yc.ssm.us.util.Encrypt;
import com.yc.ssm.us.util.ImageUtil;
import com.yc.ssm.us.util.ServletUtil;

@Controller
@RequestMapping("blog")
public class B_userHandler {
	public B_userHandler() {
		LogManager.getLogger().debug("我进入了userHandler");
	}

	@Autowired
	private B_userService userService;

	private B_user current_user;

	// 用户登录
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String userLogin(B_user user, @RequestParam("yzm") String yzm, HttpServletRequest request) {

		user = userService.userLogin(user);
		HttpSession session = request.getSession();
		// 获取图片验证码
		String imageCode = (String) session.getAttribute("imageCode");
		LogManager.getLogger().debug("项目发布ming:" + session.getAttribute("deployName"));
		LogManager.getLogger().debug("user的值是：" + user);
		if (user == null) {
			request.setAttribute(ServletUtil.ERROR_MESSAGE, "用户名或密码错误！！！");
			return "forward:/login.jsp";
		} else if (imageCode.equalsIgnoreCase(yzm) == false) {
			request.setAttribute(ServletUtil.ERROR_MESSAGE, "验证码错误！！！");
			return "forward:/login.jsp";
		} else {
			session.setAttribute(ServletUtil.LOGIN_USER, user);
			current_user = (B_user) session.getAttribute("loginUser");
			LogManager.getLogger().debug("用户session" + session.getAttribute("loginUser"));
			return "redirect:/homePage.jsp";

		}
	}

	// 用户退出
	@RequestMapping("login_out")
	@ResponseBody
	public boolean login_out(HttpSession session) {
		if (current_user != null) {
			session.setAttribute(ServletUtil.LOGIN_USER, "");
			LogManager.getLogger().debug("我是退出用户的处理");
			return true;
		} else {
			LogManager.getLogger().debug("我是退出用户的失败处理");
			return false;
		}
	}

	// 生成验证码图片
	@RequestMapping("valicode") // 对应/user/valicode.do请求
	@ResponseBody
	public void valicode(HttpServletResponse response, HttpSession session) throws Exception {
		// 利用图片工具生成图片
		// 第一个参数是生成的验证码，第二个参数是生成的图片
		Object[] objs = ImageUtil.createImage();
		System.out.println("输出" + objs[0]);
		// 将验证码存入Session
		session.setAttribute("imageCode", objs[0]);
		// 将图片输出给浏览器
		BufferedImage images = (BufferedImage) objs[1];
		response.setContentType("image/png");
		OutputStream os = response.getOutputStream();
		ImageIO.write(images, "png", os);
	}

	// 用户注册（通过邮箱）
	@RequestMapping(value = "register", method = RequestMethod.POST)
	@ResponseBody
	public int insertUser(B_user b_user) {
		LogManager.getLogger().debug("我是register的处理");
		return userService.insertUser(b_user);
	}

	// 分页显示用户
	@RequestMapping(value = "list", method = RequestMethod.POST)
	@ResponseBody
	public PaginationBean<B_user> list(String rows, String page) {
		System.out.println("list:row==>" + rows + ",page==>" + page);
		return userService.partUser(page, rows);// 异步数据响应
	}

	// 根据用户usid查询用户
	@RequestMapping(value = "findUserInfoByUsid", method = RequestMethod.POST)
	@ResponseBody
	public B_user findUserByUsid(Integer usid) {
		LogManager.getLogger().debug("根据用户usid查询用户");
		return userService.findUserByUsid(usid);
	}

	// 修改用户图片）
	@RequestMapping(value = "update_img", method = RequestMethod.POST)
	@ResponseBody
	public boolean update_img(@RequestParam("upicDate") MultipartFile upicDate) {
		Integer usid = current_user.getUsid();
		System.out.println("upicPath ==>> " + upicDate);
		String picPath = null;
		if (upicDate != null && !upicDate.isEmpty()) {// 判断是否有文件上传
			try {
				upicDate.transferTo(ServletUtil.getUploadFile(upicDate.getOriginalFilename()));
				picPath = ServletUtil.VIRTUAL_UPLOAD_DIR + upicDate.getOriginalFilename();
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		B_user buser = new B_user();
		buser.setUsid(usid);
		buser.setUpic(picPath);
		System.out.println("上传图片==》user:" + buser);
		return userService.updateUser(buser);// 异步数据响应
	}

	// 更改用户信息（不包含图片）
	@RequestMapping("update_userInfo")
	@ResponseBody
	public boolean update_userInfo(B_user user, HttpSession session) {
		user.setUsid(current_user.getUsid());
		System.out.println("user:" + user);
		return userService.updateUser(user);
	}

	// 更改用户密码
	@RequestMapping("update_pwd")
	@ResponseBody
	public boolean update_pwd(@RequestParam("upassword") String upassword, @RequestParam("old_pwd") String old_pwd) {
		B_user user = new B_user();
		user.setUpassword(upassword);
		if (!current_user.getUpassword().equals(Encrypt.md5AndSha(old_pwd))) {
			return false;
		} else {
			user.setUsid(current_user.getUsid());
			return userService.updateUser(user);
		}
	}

	// 显示用户信息
	@RequestMapping("showUserInfo")
	@ResponseBody
	public B_user showUserInfo(HttpSession session) {
		Integer usid = current_user.getUsid();
		current_user = userService.findUserByUsid(usid);
		session.setAttribute(ServletUtil.LOGIN_USER, current_user);
		return current_user;
	}

	// 查询所有的博客专家
	@RequestMapping(value = "professor", method = RequestMethod.POST)
	@ResponseBody
	public List<B_user> findProfessor() {
		return userService.findProfessor();
	}

	// 后台数据对文章的条件查询
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "", method = RequestMethod.GET)
	@ResponseBody
	public List<B_user> comboselect(String uinfo1) {
			return  userService.findUserAll();
	}

	// 后台通过条件查询(name为条件查询参数名 ，param为条件查询的参数值 例如:{name: tname,param:'原创')
	@RequestMapping(value = "findByParam", method = RequestMethod.POST)
	@ResponseBody
	public List<B_user> findUserByParam(String name, String param, String rows, String page)
			throws UnsupportedEncodingException {
		// param = new String(param.getBytes("ISO-8859-1"), "UTF-8");
		LogManager.getLogger().debug("条件查询用户  neme:" + name + ",param :" + param);
		if (name.trim().equals("uname")) {
			return userService.findUserByuname(param);
		} else if (name.trim().equals("uemail")) {
			return userService.findUserByuemail(param);
		} 
		return userService.findUserAll();
	}

}
