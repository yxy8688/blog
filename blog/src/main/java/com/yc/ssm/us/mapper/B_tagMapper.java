package com.yc.ssm.us.mapper;

import java.util.List;

import com.yc.ssm.us.entity.B_tag;
import com.yc.ssm.us.entity.PaginationBean;

public interface B_tagMapper {
	// 查询所有的类别标签
	List<B_tag> findALlTags();

	// 结合文章表查询所有的标签
	List<B_tag> findAll();

	// 结合文章表（返回所引用对应类别的文章数）查询用户个人 id 的标签
	List<B_tag> findAllByUsid(B_tag b_tag);

	boolean findTag(String tagname);

	// 添加类别标签
	int insertTag(B_tag b_tag);

	// 修改操作
	boolean modifyTag(B_tag b_tag);

	PaginationBean<B_tag> partTag(PaginationBean<B_tag> pb);

	// 删除类别标签
	int deleteTag(int tagid);

	// 标签排行（前十）
	List<B_tag> TagAnalytics();

	// 查询标签信息
	B_tag tagInfo(String tagname);

}
