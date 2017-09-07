package com.yc.ssm.us.mapper;

import com.yc.ssm.us.entity.B_admin;
import com.yc.ssm.us.entity.PaginationBean;

public interface B_adminMapper {
	// 管理员登录
	B_admin finUser(B_admin b_admin);

	// 分页查询管理员
	PaginationBean<B_admin> partUser(PaginationBean<B_admin> pb);

	// 修改管理员
	int modifyUser(B_admin b_admin);

	// 添加管理员
	int insertUser(B_admin b_admin);

	// 管理员忘记密码登录
	B_admin forgetPassword(B_admin b_admin);
	//删除管理员
	int deleteUser(int adid);
}
