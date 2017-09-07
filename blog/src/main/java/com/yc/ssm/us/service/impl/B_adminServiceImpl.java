package com.yc.ssm.us.service.impl;

import org.apache.logging.log4j.LogManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.yc.ssm.us.entity.B_admin;
import com.yc.ssm.us.entity.PaginationBean;
import com.yc.ssm.us.mapper.B_adminMapper;
import com.yc.ssm.us.service.B_adminService;

/*@Component//一般bean
@Controller//控制分发层的bean
@Repository//数据访问层bean
 */
@Service("b_adminService") // 业务处理层 相当于配置中的 <bean id="userService"
// class="com.yc.mybatis.us.service.impl.UserServiceImpl">
public class B_adminServiceImpl implements B_adminService {

	@Autowired
	private B_adminMapper b_adminMapper;

	public B_admin login(B_admin b_admin) {
		LogManager.getLogger().debug("用户进行登录操作==》" + b_admin);
		return b_adminMapper.finUser(b_admin);
	}

	public PaginationBean<B_admin> partUser(String page, String rows) {
		PaginationBean<B_admin> pb = new PaginationBean<>();
		if (page != null) {
			pb.setCurrPage(Integer.parseInt(page));
		}
		if (rows != null) {
			pb.setPageSize(Integer.parseInt(rows));
		}
		pb = b_adminMapper.partUser(pb);
		return pb;
	}

	@Override
	public boolean modifyUser(B_admin b_admin) {
		return b_adminMapper.modifyUser(b_admin) > 0;
	}


	@Override
	public B_admin forgetPassword(B_admin b_admin) {
		LogManager.getLogger().debug("用户进行忘记密码操作==》" + b_admin);
		return b_adminMapper.forgetPassword(b_admin);
	}

	@Override
	public int insertUser(B_admin b_admin) {
		return b_adminMapper.insertUser(b_admin);
	}

	@Override
	public int deleteUser(String adid) {
		int adid1=Integer.parseInt(adid);
		return b_adminMapper.deleteUser(adid1);
	}
}
