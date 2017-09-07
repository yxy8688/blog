package com.yc.ssm.us.mapper;

import com.yc.ssm.us.entity.PaginationBean;

import java.util.List;

import com.yc.ssm.us.entity.B_user;

public interface B_userMapper {
	B_user userLogin(B_user b_user);// 用户登录

	PaginationBean<B_user> partUser(PaginationBean<B_user> pb);// 分页

	int updateUser(B_user b_user);// 更新用户信息
	// 注册用户

	int insertUser(B_user b_user);

	// 验证登录是否存在
	boolean findUser(Integer usid);

	// 通过用户id查询用户
	B_user findUserByUsid(Integer usid);

	// 查询所有的用户
	List<B_user> findUserAll();

	// 查询所有的博客专家
	List<B_user> findProfessor();

	// 通过用户名查询用户
	List<B_user> findUserByuname(String uname);

	// 通过邮件查询用户
	List<B_user> findUserByuemail(String uname);

}
