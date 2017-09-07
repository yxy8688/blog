package com.yc.ssm.us.aspect;

import org.apache.logging.log4j.LogManager;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

import com.yc.ssm.us.entity.B_admin;
import com.yc.ssm.us.entity.B_user;
import com.yc.ssm.us.util.Encrypt;

@Component("encryptAspect")
@Aspect
public class EncryptAspect {
	// 用户登录的加密
	@Before("execution ( * com.yc.ssm.us.service.impl.B_userServiceImpl.userLogin(com.yc.ssm.us.entity.B_user))") // com.yc.ssm.us.entity.B_user
	public void beforeuserLoginMethod(JoinPoint joinPoint) {
		LogManager.getLogger().debug("--------前置Login：EncryptAspect---------");
		B_user b_user = (B_user) joinPoint.getArgs()[0];
		LogManager.getLogger().debug("对密码加密前==》" + b_user);
		b_user.setUpassword(Encrypt.md5AndSha(b_user.getUpassword()));
		LogManager.getLogger().debug("对密码加密后==》" + b_user);
	}

	// 用户注册的加密
	@Before("execution ( * com.yc.ssm.us.service.impl.B_userServiceImpl.insertUser(com.yc.ssm.us.entity.B_user))") // 指定链接点和切点
	public void beforeinsertUserMethod(JoinPoint joinPoint) {
		LogManager.getLogger().debug("--------前置insertUser：EncryptAspect---------");
		B_user b_user = (B_user) joinPoint.getArgs()[0];
		LogManager.getLogger().debug("对密码加密前==》" + b_user);
		b_user.setUpassword(Encrypt.md5AndSha(b_user.getUpassword()));
		LogManager.getLogger().debug("对密码加密后==》" + b_user);
	}

	// 管理员登录的加密
	
	@Before("execution ( * com.yc.ssm.us.service.impl.B_adminServiceImpl.login(com.yc.ssm.us.entity.B_admin))")
	public void beforeuserLoginAdminMethod(JoinPoint joinPoint) {
		LogManager.getLogger().debug("--------前置Login：EncryptAspect---------");
		B_admin b_admin = (B_admin) joinPoint.getArgs()[0];
		LogManager.getLogger().debug("对密码加密前==》" + b_admin);
		b_admin.setAdpassword(Encrypt.md5AndSha(b_admin.getAdpassword()));
		LogManager.getLogger().debug("对密码加密后==》" + b_admin);
	}

	// 管理员添加的加密
	@Before("execution ( * com.yc.ssm.us.service.impl.B_adminServiceImpl.insertUser(com.yc.ssm.us.entity.B_admin))") 
	public void beforeinsertAdminMethod(JoinPoint joinPoint) {
		LogManager.getLogger().debug("--------前置insertUser：EncryptAspect---------");
		B_admin b_admin = (B_admin) joinPoint.getArgs()[0];
		LogManager.getLogger().debug("对密码加密前==》" + b_admin);
		b_admin.setAdpassword(Encrypt.md5AndSha(b_admin.getAdpassword()));
		LogManager.getLogger().debug("对密码加密后==》" + b_admin);
	}

	/*
	 * @Before(
	 * "execution ( * com.yc.ssm.us.service.impl.B_userServiceImpl.updateUser(com.yc.ssm.us.entity.B_user))"
	 * ) // 指定链接点和切点 public void beforeUpdateUserMethod(JoinPoint joinPoint) {
	 * LogManager.getLogger().debug(
	 * "--------前置modifyUser：EncryptAspect---------"); B_user b_user = (B_user)
	 * joinPoint.getArgs()[0]; LogManager.getLogger().debug("对密码加密前==》" +
	 * b_user); b_user.setUpassword(Encrypt.md5AndSha(b_user.getUpassword()));
	 * LogManager.getLogger().debug("对密码加密后==》" + b_user); }
	 */
}
