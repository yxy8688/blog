package com.yc.ssm.us.service;

import java.util.List;

import com.yc.ssm.us.entity.B_tag;
import com.yc.ssm.us.entity.PaginationBean;

public interface B_tagService {
	// 查询所有标签
	List<B_tag> findALlTags();

	// 结合文章表查询所有的标签
	List<B_tag> findAll();

	// 结合文章表（返回所引用对应类别的文章数）查询用户个人 id 的标签
	List<B_tag> findAllByUsid(B_tag b_tag);

	// 通过标签名查询是否存在标签
	boolean findTag(String tagname);

	// 添加类别标签
	int insertTag(B_tag b_tag);

	// 修改标签
	boolean modifyTag(B_tag b_tag);

	// 分页显示标签
	PaginationBean<B_tag> partTag(String page, String rows);

	// 删除类别标签
	int deleteTag(int tagid);

	// 标签排行（前十）
	List<B_tag> TagAnalytics();

	// 查询标签信息
	B_tag tagInfo(String tagname);

}
