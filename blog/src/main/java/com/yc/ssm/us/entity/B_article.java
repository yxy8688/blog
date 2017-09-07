package com.yc.ssm.us.entity;

import java.io.Serializable;

public class B_article implements Serializable {


	private static final long serialVersionUID = 1L;
	private Integer aid;
	private String atitle;
	private Integer tid;
	private Integer tagid;
	private Integer usid;
	private String atime;
	private String acontent;
	private String apic;
	private String aviewnum;

	private String uname;//作者
	private String upic;//作者头像
	private String upersondesc; //作者描述
	private String tname;// 文章所属类型
	private String tagname;// 文章标签类别
	private Integer commentnum; //评论数
	private Integer articleNum;//文章数
	
	private Integer currPage = 1; // 当前页
	private Integer pageSize = 10; // 每页的数据条数

	// 响应数据
	private Integer total; // 数据的总条数
	private Integer totalPage; // 总页数
	
	private Integer drid; // 草稿箱id
	
	public Integer getDrid() {
		return drid;
	}

	public void setDrid(Integer drid) {
		this.drid = drid;
	}

	public Integer getArticleNum() {
		return articleNum;
	}

	public void setArticleNum(Integer articleNum) {
		this.articleNum = articleNum;
	}

	public String getUpic() {
		return upic;
	}

	public void setUpic(String upic) {
		this.upic = upic;
	}

	public String getUpersondesc() {
		return upersondesc;
	}

	public void setUpersondesc(String upersondesc) {
		this.upersondesc = upersondesc;
	}

	public Integer getCurrPage() {
		return currPage;
	}

	public void setCurrPage(Integer currPage) {
		this.currPage = currPage;
	}
	

	public Integer getTotal() {
		return total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}

	public Integer getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}


	public Integer getCommentnum() {
		return commentnum;
	}

	public void setCommentnum(Integer commentnum) {
		this.commentnum = commentnum;
	}

	public String getTname() {
		return tname;
	}

	public void setTname(String tname) {
		this.tname = tname;
	}

	public String getTagname() {
		return tagname;
	}

	public void setTagname(String tagname) {
		this.tagname = tagname;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public Integer getAid() {
		return aid;
	}

	public void setAid(Integer aid) {
		this.aid = aid;
	}

	public String getAtitle() {
		return atitle;
	}

	public void setAtitle(String atitle) {
		this.atitle = atitle;
	}

	public Integer getTid() {
		return tid;
	}

	public void setTid(Integer tid) {
		this.tid = tid;
	}

	public Integer getTagid() {
		return tagid;
	}

	public void setTagid(Integer tagid) {
		this.tagid = tagid;
	}

	public Integer getUsid() {
		return usid;
	}

	public void setUsid(Integer usid) {
		this.usid = usid;
	}

	public String getAtime() {
		return atime;
	}

	public void setAtime(String atime) {
		this.atime = atime;
	}

	public String getAcontent() {
		return acontent;
	}

	public void setAcontent(String acontent) {
		this.acontent = acontent;
	}

	public String getApic() {
		return apic;
	}

	public void setApic(String apic) {
		this.apic = apic;
	}

	public String getAviewnum() {
		return aviewnum;
	}

	public void setAviewnum(String aviewnum) {
		this.aviewnum = aviewnum;
	}

	@Override
	public String toString() {
		return "\nB_article [aid=" + aid + ", atitle=" + atitle + ", tid=" + tid + ", tagid=" + tagid + ", usid=" + usid
				+ ", atime=" + atime + ", acontent=" + acontent + ", apic=" + apic + ", aviewnum=" + aviewnum
				+ ", uname=" + uname + ", upic=" + upic + ", upersondesc=" + upersondesc + ", tname=" + tname
				+ ", tagname=" + tagname + ", commentnum=" + commentnum + ", articleNum=" + articleNum + ", currPage="
				+ currPage + ", pageSize=" + pageSize + ", total=" + total + ", totalPage=" + totalPage + ", drid="
				+ drid + "]";
	}

	


	

}
