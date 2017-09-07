package com.yc.ssm.us.service;

import com.yc.ssm.us.entity.PaginationBean;

import java.util.List;

import com.yc.ssm.us.entity.B_user;

public interface B_userService {
	B_user userLogin(B_user b_user);// 用户使用邮箱或者昵称进行登录
	// 查询所有用户

	List<B_user> findUserAll();

	// 分页显示用户信息
	PaginationBean<B_user> partUser(String page, String rows);

	// 修改用户信息
	boolean updateUser(B_user b_user);

	// 验证登录是否存在
	boolean findUser(Integer usid);

	// 插入用户
	int insertUser(B_user b_user);

	// 通过用户id查找用户
	B_user findUserByUsid(Integer usid);

	// 查询所有的博客专家
	List<B_user> findProfessor();

	// 通过用户名查询
	List<B_user> findUserByuname(String uname);

	// 通过邮件查询
	List<B_user> findUserByuemail(String uname);
}
