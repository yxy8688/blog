package com.yc.ssm.us.service.impl;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.yc.ssm.us.entity.B_type;
import com.yc.ssm.us.entity.PaginationBean;
import com.yc.ssm.us.mapper.B_typeMapper;
import com.yc.ssm.us.service.B_typeService;

/*@Component//一般bean
@Controller//控制分发层的bean
@Repository//数据访问层bean
 */
@Service("b_typeService") // 业务处理层 相当于配置中的 <bean id="userService"
// class="com.yc.mybatis.us.service.impl.UserServiceImpl">
public class B_typeServiceImpl implements B_typeService {

	@Autowired
	private B_typeMapper b_typeMapper;

	public PaginationBean<B_type> partType(String page, String rows) {
		PaginationBean<B_type> pb = new PaginationBean<>();
		if (page != null) {
			pb.setCurrPage(Integer.parseInt(page));
		}
		if (rows != null) {
			pb.setPageSize(Integer.parseInt(rows));
		}
		pb = b_typeMapper.partType(pb);
		return pb;
	}

	@Override
	public boolean modifyType(B_type b_type) {
		return b_typeMapper.modifyType(b_type) > 0;
	}

	@Override
	public int insertType(B_type b_type) {
		return b_typeMapper.insertType(b_type);
	}

	@Override
	public int deleteType(String tid) {
		int tid1=Integer.parseInt(tid);
		return b_typeMapper.deleteType(tid1);
	}
	
	//查询所有的类型
	public List<B_type> findAll(){
		LogManager.getLogger().debug("查询所有的类型");
		return b_typeMapper.findAll();
	}


	@Override
	public List<B_type> findTypeAll() {
		return b_typeMapper.findTypeAll();
	}

}
