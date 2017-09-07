package com.yc.ssm.us.entity;

public class B_admin {

	private Integer adid;
	private String adname;
	private String adpassword;
	private String admail;

	public B_admin() {
	}

	public B_admin(Integer adid, String adname, String adpassword, String admail) {
		this.adid = adid;
		this.adname = adname;
		this.adpassword = adpassword;
		this.admail = admail;
	}

	@Override
	public String toString() {
		return "\nB_admin [adid=" + adid + ", adname=" + adname + ", adpassword=" + adpassword + ", admail=" + admail
				+ "]";
	}

	public String getAdmail() {
		return admail;
	}

	public void setAdmail(String admail) {
		this.admail = admail;
	}

	public Integer getAdid() {
		return adid;
	}

	public void setAdid(Integer adid) {
		this.adid = adid;
	}

	public String getAdname() {
		return adname;
	}

	public void setAdname(String adname) {
		this.adname = adname;
	}

	public String getAdpassword() {
		return adpassword;
	}

	public void setAdpassword(String adpassword) {
		this.adpassword = adpassword;
	}

}
