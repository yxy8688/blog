package com.yc.ssm.us.entity;

public class B_tag {
	
	private Integer tagid;
	private String tagname;
	private Integer tusid;
	private Integer articlenum;

	public Integer getTusid() {
		return tusid;
	}

	public void setTusid(Integer tusid) {
		this.tusid = tusid;
	}

	public Integer getarticlenum() {
		return articlenum;
	}

	public void setarticlenum(Integer articlenum) {
		this.articlenum = articlenum;
	}

	public Integer getTagid() {
		return tagid;
	}

	public void setTagid(Integer tagid) {
		this.tagid = tagid;
	}

	public String getTagname() {
		return tagname;
	}

	public void setTagname(String tagname) {
		this.tagname = tagname;
	}

	@Override
	public String toString() {
		return "B_tag [tagid=" + tagid + ", tagname=" + tagname + ", tusid=" + tusid + ", articlenum=" + articlenum
				+ "]";
	}
	
}
