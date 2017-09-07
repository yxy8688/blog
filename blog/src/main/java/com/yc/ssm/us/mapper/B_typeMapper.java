package com.yc.ssm.us.mapper;

import java.util.List;

import com.yc.ssm.us.entity.B_type;
import com.yc.ssm.us.entity.PaginationBean;

public interface B_typeMapper {
	// 类型分页
	PaginationBean<B_type> partType(PaginationBean<B_type> pb);

	// 修改类型
	int modifyType(B_type b_type);

	// 添加类型
	int insertType(B_type b_type);

	// 删除类型
	int deleteType(int tid);
	
	//查询所有的类型
	List<B_type> findAll();

	List<B_type> findTypeAll();

}
