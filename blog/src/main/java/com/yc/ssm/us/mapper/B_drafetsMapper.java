package com.yc.ssm.us.mapper;

import java.util.List;

import com.yc.ssm.us.entity.B_article;
import com.yc.ssm.us.entity.B_drafets;

public interface B_drafetsMapper {
	
	//添加草稿
	int addDrafet(B_article b_article);
	
	//根据用户id查询
	List<B_drafets> findDrafetByUsid(Integer usid);
	
	//删除草稿
	int deleteDrafet(Integer drid);
	
	//根据草稿drid查询
	B_drafets findDrafetByDrid(Integer drid);
	
	//立即发表
	int publishArticle(B_drafets b_drafets);
	
	//修改草稿
	boolean updateDrafets(B_drafets b_drafets);
}
