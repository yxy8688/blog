package com.yc.ssm.us.service.impl;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.ssm.us.entity.PaginationBean;
import com.yc.ssm.us.entity.B_user;
import com.yc.ssm.us.mapper.B_userMapper;
import com.yc.ssm.us.service.B_userService;
import com.yc.ssm.us.util.Encrypt;

/*@Component//一般bean
@Controller//控制分发层的bean
@Repository//数据访问层bean
*/
@Service("b_userService") // 业务处理层 相当于配置中的 <bean id="userService"
							// class="com.yc.mybatis.us.service.impl.UserServiceImpl">
public class B_userServiceImpl implements B_userService {
	@Autowired // 相当于spring.xml中的<property name="userMapper" ref="userMapper" />
	private B_userMapper b_userMapper;

	// 用户登陆
	public B_user userLogin(B_user b_user) {
		// user.setPassword(Encrypt.md5AndSha(user.getPassword()));
		LogManager.getLogger().debug("用户进行登录操作==》" + b_user);
		return b_userMapper.userLogin(b_user);
	}

	@Override
	public PaginationBean<B_user> partUser(String page, String rows) {
		PaginationBean<B_user> pb = new PaginationBean<>();
		if (page != null) {
			pb.setCurrPage(Integer.parseInt(page));
		}
		if (rows != null) {
			pb.setPageSize(Integer.parseInt(rows));
		}
		pb = b_userMapper.partUser(pb);
		return pb;
	}

	// 查询所有的博客专家
	public List<B_user> findProfessor() {
		LogManager.getLogger().debug("查询所有的博客专家");
		return b_userMapper.findProfessor();
	}

	// 用户信息修改
	@Override
	public boolean updateUser(B_user b_user) {

		if (b_user.getUpassword() != null) {
			b_user.setUpassword(Encrypt.md5AndSha(b_user.getUpassword()));
		}

		LogManager.getLogger().debug("用户进行修改操作==》" + b_user);
		return b_userMapper.updateUser(b_user) > 0;
	}

	@Override
	public int insertUser(B_user b_user) {
		LogManager.getLogger().debug("我是B_userService里的" + b_user);
		return b_userMapper.insertUser(b_user);
	}

	// 验证登录是否存在
	@Override
	public boolean findUser(Integer usid) {
		return b_userMapper.findUser(usid);
	}

	// 根据用户usid查询用户
	@Override
	public B_user findUserByUsid(Integer usid) {
		LogManager.getLogger().debug("根据用户usid查询用户");
		return b_userMapper.findUserByUsid(usid);
	}

	@Override
	public List<B_user> findUserAll() {
		return b_userMapper.findUserAll();
	}

	@Override
	public List<B_user> findUserByuname(String uname) {
		return b_userMapper.findUserByuname(uname);
	}

	@Override
	public List<B_user> findUserByuemail(String uname) {
		return b_userMapper.findUserByuemail(uname);
	}

}
