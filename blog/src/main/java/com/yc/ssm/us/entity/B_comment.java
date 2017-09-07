package com.yc.ssm.us.entity;
public class B_comment {

	public String getUemail() {
		return uemail;
	}

	public void setUemail(String uemail) {
		this.uemail = uemail;
	}

	public String getAtitle() {
		return atitle;
	}

	public void setAtitle(String atitle) {
		this.atitle = atitle;
	}

	private Integer cid;
	private Integer caid;
	private Integer usid;
	private String ccontent;//评论内容
	private String ctime;
	 
	private String atitle;//评论文章标题
	private String uname;	//用户昵称
	private String uemail;//用户邮箱
	private String upic;	//用户图片
	private Integer rn;  //排行
	
	private Integer total; //获取评论总数
	private Integer pageSize = 5; //每页的大小
	private Integer currPage = 1; //当前页
	private Integer totalPage; // 总页数
	
	
	
	
	public Integer getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}

	public Integer getTotal() {
		return total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public Integer getCurrPage() {
		return currPage;
	}

	public void setCurrPage(Integer currPage) {
		this.currPage = currPage;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getUpic() {
		return upic;
	}

	public void setUpic(String upic) {
		this.upic = upic;
	}

	public Integer getRn() {
		return rn;
	}

	public void setRn(Integer rn) {
		this.rn = rn;
	}

	public Integer getCaid() {
		return caid;
	}

	public void setCaid(Integer caid) {
		this.caid = caid;
	}

	public Integer getCid() {
		return cid;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
	}

	public Integer getUsid() {
		return usid;
	}

	public void setUsid(Integer usid) {
		this.usid = usid;
	}

	public String getCcontent() {
		return ccontent;
	}

	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}

	public String getCtime() {
		return ctime;
	}

	public void setCtime(String ctime) {
		this.ctime = ctime;
	}

	@Override
	public String toString() {
		return "B_comment [cid=" + cid + ", caid=" + caid + ", usid=" + usid + ", ccontent=" + ccontent + ", ctime="
				+ ctime + ", atitle=" + atitle + ", uname=" + uname + ", uemail=" + uemail + ", upic=" + upic + ", rn="
				+ rn + ", total=" + total + ", pageSize=" + pageSize + ", currPage=" + currPage + ", totalPage="
				+ totalPage + "]";
	}

	


}
