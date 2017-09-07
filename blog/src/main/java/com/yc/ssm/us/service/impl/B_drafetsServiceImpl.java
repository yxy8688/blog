package com.yc.ssm.us.service.impl;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.ssm.us.entity.B_article;
import com.yc.ssm.us.entity.B_drafets;
import com.yc.ssm.us.mapper.B_drafetsMapper;
import com.yc.ssm.us.service.B_drafetsService;

@Service("b_drafetsService")
public class B_drafetsServiceImpl implements B_drafetsService {

	@Autowired
	private B_drafetsMapper drafetsMapper;

	//添加草稿
	@Override
	public int addDrafet(B_article b_article) {
		LogManager.getLogger().debug("添加草稿");
		return drafetsMapper.addDrafet(b_article);
	}
	//根据用户id查询草稿
	@Override
	public List<B_drafets> findDrafetByUsid(Integer usid){
		LogManager.getLogger().debug("根据用户id查询草稿");
		return drafetsMapper.findDrafetByUsid(usid);
	}
	//根据草稿drid查询
	@Override
	public B_drafets findDrafetByDrid(Integer drid){
		LogManager.getLogger().debug("根据草稿drid查询");
		return drafetsMapper.findDrafetByDrid(drid);
	}

	//删除草稿
	@Override
	public int deleteDrafet(Integer drid){
		LogManager.getLogger().debug("删除草稿");
		return drafetsMapper.deleteDrafet(drid);
	}
	
	//立即发表
	@Override
	public int publishArticle(B_drafets b_drafets){
		LogManager.getLogger().debug("立即发表");
		return drafetsMapper.publishArticle(b_drafets);
	}
	//修改草稿
	public boolean updateDrafets(B_drafets b_drafets){
		LogManager.getLogger().debug("修改草稿");
		return drafetsMapper.updateDrafets(b_drafets);
	}

}
