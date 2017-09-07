package com.yc.ssm.us.handler;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.yc.ssm.us.entity.B_article;
import com.yc.ssm.us.entity.B_drafets;
import com.yc.ssm.us.entity.B_user;
import com.yc.ssm.us.service.B_drafetsService;
import com.yc.ssm.us.util.ServletUtil;

@Controller
@RequestMapping("drafets")
public class B_drafetsHander {

	@Autowired
	private B_drafetsService drafetsService;

	//添加草稿
	@RequestMapping("addDrafet")
	@ResponseBody
	public boolean addDrafet(@RequestParam("upicDate") MultipartFile upicDate,B_article b_article , HttpSession session){
		B_user currUser = (B_user) session.getAttribute("loginUser");
		Integer usid = currUser.getUsid();
		if(usid != null){
			String picPath = null;
			if (upicDate != null && !upicDate.isEmpty()) {// 判断是否有文件上传
				try {
					upicDate.transferTo(ServletUtil.getUploadFile(upicDate.getOriginalFilename()));
					picPath = ServletUtil.VIRTUAL_UPLOAD_DIR + upicDate.getOriginalFilename();
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				b_article.setApic(picPath);
			}else{
				LogManager.getLogger().debug("我是空的");
				b_article.setApic("");
			}
			b_article.setUsid(usid);
			return drafetsService.addDrafet(b_article) > 0;
		}else{
			return false;
		}
	}

	//根据用户id查询
	@RequestMapping(value = "findDrafetsByUsid" ,method = RequestMethod.POST)
	@ResponseBody
	public List<B_drafets> findDrafetByUsid(Integer usid,HttpSession session){
		B_user currUser = (B_user) session.getAttribute("loginUser");
		usid = currUser.getUsid();
		if(usid != null){
			return drafetsService.findDrafetByUsid(usid);
		}else{
			return null;
		}
	}

	//根据草稿drid查询
	@RequestMapping(value = "findDrafetByDrid" ,method = RequestMethod.POST)
	@ResponseBody
	public B_drafets findDrafetByDrid(Integer drid){
		return drafetsService.findDrafetByDrid(drid);
	}

	//删除草稿
	@RequestMapping(value = "deleteDrafets" ,method = RequestMethod.POST)
	@ResponseBody
	public boolean deleteDrafet(Integer drid){
		return drafetsService.deleteDrafet(drid) > 0;
	}

	//立即发表
	@RequestMapping(value = "publishArticle" ,method = RequestMethod.POST)
	@ResponseBody
	public int publishArticle(Integer drid){
		LogManager.getLogger().debug("立即发表");
		B_drafets b_drafets = drafetsService.findDrafetByDrid(drid);  //获取草稿
		if(b_drafets.getDrpic() == null){
			b_drafets.setDrpic("");
		}
		System.out.println(b_drafets);
		return drafetsService.publishArticle(b_drafets);
	}
	//修改草稿
	@RequestMapping(value = "updateDrafets" ,method = RequestMethod.POST)
	@ResponseBody
	public boolean updateDrafets(@RequestParam("upicDate") MultipartFile upicDate,B_drafets b_drafets){
		LogManager.getLogger().debug("修改草稿");
		String picPath = null;
		if (upicDate != null && !upicDate.isEmpty()) {// 判断是否有文件上传
			try {
				upicDate.transferTo(ServletUtil.getUploadFile(upicDate.getOriginalFilename()));
				picPath = ServletUtil.VIRTUAL_UPLOAD_DIR + upicDate.getOriginalFilename();
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			b_drafets.setDrpic(picPath);
		}else{
			LogManager.getLogger().debug("我是空的");
			b_drafets.setDrpic("");
		}
		return drafetsService.updateDrafets(b_drafets);
	}


}
