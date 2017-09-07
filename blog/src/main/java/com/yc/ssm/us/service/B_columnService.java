package com.yc.ssm.us.service;

import java.util.List;

import com.yc.ssm.us.entity.B_column;
import com.yc.ssm.us.entity.PaginationBean;

public interface B_columnService {
	// 分页查询板块
	PaginationBean<B_column> partColumn(String page, String rows);

	// 添加板块
	int addColumn(B_column b_column);

	// 删除板块
	int deleteColumn(String coid);

	// 查询所有板块
	List<B_column> findColumnAll();

	// 通过板块名查询板块文章id
	String findCoaidByCotitle(String cotitle);


	//添加个人板块
	int addColumnByUsid(B_column b_column);
	
	//查询个人模板
	List<B_column> findColumnByUsid(B_column b_column);
	//删除个人板块
	int deleteColumnByCoid(Integer coid);

	// 通过板块id查询文章id
	String findCoaidByCoid(String coid);
	//添加个人板块的文章
	int addArticleByCoid(B_column b_column);

	//更改板块的浏览量
	boolean updateAviewNum(B_column b_column);
	//查询指定板块
	B_column findColumnByCoid(Integer coid);

	//更改板块
	int updateColumn(B_column b_column);


}
