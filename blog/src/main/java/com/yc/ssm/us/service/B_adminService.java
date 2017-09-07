package com.yc.ssm.us.service;

import com.yc.ssm.us.entity.B_admin;
import com.yc.ssm.us.entity.PaginationBean;

public interface B_adminService {
	// 管理员登陆
	B_admin login(B_admin b_admin);

	// 分页显示员工信息
	PaginationBean<B_admin> partUser(String page, String rows);

	// 修改员工信息
	boolean modifyUser(B_admin b_admin);

	// 增加管理员
	int insertUser(B_admin b_admin);

	// 忘记密码
	B_admin forgetPassword(B_admin b_admin);

	// 删除管理员
	int deleteUser(String adid);

}
