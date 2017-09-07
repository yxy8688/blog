package com.yc.ssm.us.entity;

import java.io.Serializable;

public class B_column implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer coid;//板块id
	private String cotitle;//板块标题
	private String coaid;//文章id
	private Integer usid;//板主id(用户)
	private String cotime;//板块创建时间
	private String cocontent;//板块描述内容
	private String copic;//板块图片
	private Integer coviewnum;//板块浏览量
	
	private Integer articlenum;//板块文章数
	private String uname;//板主昵称
	private String uemail;//板主邮箱
	
	

	public Integer getCoviewnum() {
		return coviewnum;
	}

	public void setCoviewnum(Integer coviewnum) {
		this.coviewnum = coviewnum;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getUemail() {
		return uemail;
	}

	public void setUemail(String uemail) {
		this.uemail = uemail;
	}

	public Integer getArticlenum() {
		return articlenum;
	}

	public void setArticlenum(Integer articlenum) {
		this.articlenum = articlenum;
	}

	public Integer getCoid() {
		return coid;
	}

	public void setCoid(Integer coid) {
		this.coid = coid;
	}

	public String getCotitle() {
		return cotitle;
	}

	public void setCotitle(String cotitle) {
		this.cotitle = cotitle;
	}

	public String getCoaid() {
		return coaid;
	}

	public void setCoaid(String coaid) {
		this.coaid = coaid;
	}

	public Integer getUsid() {
		return usid;
	}

	public void setUsid(Integer usid) {
		this.usid = usid;
	}

	public String getCotime() {
		return cotime;
	}

	public void setCotime(String cotime) {
		this.cotime = cotime;
	}

	public String getCocontent() {
		return cocontent;
	}

	public void setCocontent(String cocontent) {
		this.cocontent = cocontent;
	}

	public String getCopic() {
		return copic;
	}

	public void setCopic(String copic) {
		this.copic = copic;
	}
	
	@Override
	public String toString() {
		return "B_column [coid=" + coid + ", cotitle=" + cotitle + ", coaid=" + coaid + ", usid=" + usid + ", cotime="
				+ cotime + ", cocontent=" + cocontent + ", copic=" + copic + ", coviewnum=" + coviewnum
				+ ", articlenum=" + articlenum + ", uname=" + uname + ", uemail=" + uemail + "]";
	}
	

}
