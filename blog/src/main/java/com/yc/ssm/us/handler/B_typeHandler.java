package com.yc.ssm.us.handler;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yc.ssm.us.entity.B_type;
import com.yc.ssm.us.entity.PaginationBean;
import com.yc.ssm.us.service.B_typeService;

@Controller
@RequestMapping("type")
public class B_typeHandler {
	public B_typeHandler() {
		LogManager.getLogger().debug("我进入了B_typeHandler");
	}

	@Autowired
	private B_typeService b_typeService;

	// 分页显示文章类型
	@RequestMapping(value = "list", method = RequestMethod.POST)
	@ResponseBody
	public PaginationBean<B_type> list(String rows, String page) {
		LogManager.getLogger().debug("list:row==>" + rows + ",page==>" + page);
		return b_typeService.partType(page, rows);// 异步数据响应
	}

	// 修改文章类型
	@RequestMapping("modify")
	@ResponseBody
	public boolean modify(B_type b_type) {
		LogManager.getLogger().debug("modify:type==>" + b_type);
		return b_typeService.modifyType(b_type);// 异步数据响应
	}

	// 添加文章类型
	@RequestMapping(value = "add", method = RequestMethod.POST)
	@ResponseBody
	public int insertUser(B_type b_type) {
		LogManager.getLogger().debug("我是add type的处理");
		return b_typeService.insertType(b_type);
	}
	// 删除文章类型
	@RequestMapping(value = "delete", method = RequestMethod.POST)
	@ResponseBody
	public int deleteType(String tid) {
		LogManager.getLogger().debug("我是delete admin的处理");
		return b_typeService.deleteType(tid);
	}
	//查询所有的文章类型
	@RequestMapping("findAll")
	@ResponseBody
	public List<B_type> findAllType(){
		LogManager.getLogger().debug("我是查询所有的文章类型");
		return b_typeService.findAll();
	}

}
