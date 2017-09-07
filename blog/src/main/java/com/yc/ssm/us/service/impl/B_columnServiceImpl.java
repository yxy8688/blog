package com.yc.ssm.us.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.ssm.us.entity.PaginationBean;
import com.yc.ssm.us.entity.B_column;
import com.yc.ssm.us.mapper.B_columnMapper;
import com.yc.ssm.us.service.B_columnService;

@Service("b_columnService")
public class B_columnServiceImpl implements B_columnService {
	@Autowired 
	private B_columnMapper b_columnMapper;

	@Override
	public PaginationBean<B_column> partColumn(String page, String rows) {
		PaginationBean<B_column> pb = new PaginationBean<>();
		if (page != null) {
			pb.setCurrPage(Integer.parseInt(page));
		}
		if (rows != null) {
			pb.setPageSize(Integer.parseInt(rows));
		}
		pb=b_columnMapper.partColumn(pb);
		return pb;
	}

	@Override
	public int addColumn(B_column b_column) {
		return b_columnMapper.addColumn(b_column);
	}

	@Override
	public int deleteColumn(String coid) {
		return b_columnMapper.deleteColumn(coid);
	}

	@Override
	public List<B_column> findColumnAll() {
		return b_columnMapper.findColumnAll();
	}

	@Override
	public String findCoaidByCotitle(String cotitle) {
		return b_columnMapper.findCoaidByCotitle(cotitle);
	}

	@Override
	public String findCoaidByCoid(String coid) {
		return b_columnMapper.findCoaidByCoid(coid);
	}
	
	//添加个人板块
	@Override
	public int addColumnByUsid(B_column b_column) {
		
		return b_columnMapper.addColumnByUsid(b_column);
	}
	//查询个人模板
	public List<B_column> findColumnByUsid(B_column b_column){
		return b_columnMapper.findColumnByUsid(b_column);
	}
		//删除个人板块
	public int deleteColumnByCoid(Integer coid){
		return b_columnMapper.deleteColumnByCoid(coid);
	}
	//添加个人板块的文章
	public int addArticleByCoid(B_column b_column){
		return b_columnMapper.addArticleByCoid(b_column);
	}

	//更改板块的浏览量
	public boolean updateAviewNum(B_column b_column){
		return b_columnMapper.updateAviewNum(b_column);
	}
	//查询指定板块
	public B_column findColumnByCoid(Integer coid){
		return b_columnMapper.findColumnByCoid(coid);
	}
	//更改板块
	public int updateColumn(B_column b_column){
		return b_columnMapper.updateColumn(b_column);
	}
	
	
}
