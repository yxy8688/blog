package com.yc.ssm.us.service.impl;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.ssm.us.entity.B_tag;
import com.yc.ssm.us.entity.PaginationBean;
import com.yc.ssm.us.mapper.B_tagMapper;
import com.yc.ssm.us.service.B_tagService;

/*@Component//一般bean
@Controller//控制分发层的bean
@Repository//数据访问层bean
*/
@Service("b_tagService") // 业务处理层 相当于配置中的 <bean id="userService"
							// class="com.yc.mybatis.us.service.impl.UserServiceImpl">
public class B_tagServiceImpl implements B_tagService {
	@Autowired // 相当于spring.xml中的<property name="userMapper" ref="userMapper" />
	private B_tagMapper b_tagMapper;

	@Override
	public boolean findTag(String tagname) {
		return b_tagMapper.findTag(tagname);
	}

	//添加类别标签
	@Override
	public int insertTag(B_tag b_tag){
		LogManager.getLogger().debug("添加类别标签");
		return b_tagMapper.insertTag(b_tag);
	}
	//获得所有的类别标签
	@Override
	public List<B_tag> findALlTags() {
		return b_tagMapper.findALlTags();
	}

	//更改类别标签
	@Override
	public boolean modifyTag(B_tag b_tag) {
		return b_tagMapper.modifyTag(b_tag);
	}

	@Override
	public PaginationBean<B_tag> partTag(String page, String rows) {
		PaginationBean<B_tag> pb = new PaginationBean<>();
		if (page != null) {
			pb.setCurrPage(Integer.parseInt(page));
		}
		if (rows != null) {
			pb.setPageSize(Integer.parseInt(rows));
		}
		pb = b_tagMapper.partTag(pb);
		return pb;
	}
	//删除类别标签
	@Override
	public int deleteTag(int tagid){
		return b_tagMapper.deleteTag(tagid);
	}
	
	//结合文章表查询所有的标签
	public List<B_tag> findAll(){
		return b_tagMapper.findAll();
	}
	
	// 结合文章表（返回所引用对应类别的文章数）查询用户个人 id 的标签
	public	List<B_tag> findAllByUsid(B_tag b_tag){
		LogManager.getLogger().debug("结合文章表查询所有的标签");
		return b_tagMapper.findAllByUsid(b_tag);
	}

	@Override
	public List<B_tag> TagAnalytics() {
		return b_tagMapper.TagAnalytics();
	}

	@Override
	public B_tag tagInfo(String tagname) {
		return b_tagMapper.tagInfo(tagname);
	}
}
