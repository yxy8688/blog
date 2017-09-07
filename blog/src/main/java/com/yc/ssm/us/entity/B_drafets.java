package com.yc.ssm.us.entity;

public class B_drafets {
	private Integer drid;
	private Integer usid;
	private String drtitle;
	private Integer drtypeid;
	private Integer drtagid;
	private String drtime;
	private String drcontent;
	private String drpic;
	public Integer getDrid() {
		return drid;
	}
	public void setDrid(Integer drid) {
		this.drid = drid;
	}
	public Integer getUsid() {
		return usid;
	}
	public void setUsid(Integer usid) {
		this.usid = usid;
	}
	public String getDrtitle() {
		return drtitle;
	}
	public void setDrtitle(String drtitle) {
		this.drtitle = drtitle;
	}
	
	
	public Integer getDrtypeid() {
		return drtypeid;
	}
	public void setDrtypeid(Integer drtypeid) {
		this.drtypeid = drtypeid;
	}
	public Integer getDrtagid() {
		return drtagid;
	}
	public void setDrtagid(Integer drtagid) {
		this.drtagid = drtagid;
	}
	public String getDrtime() {
		return drtime;
	}
	public void setDrtime(String drtime) {
		this.drtime = drtime;
	}
	public String getDrcontent() {
		return drcontent;
	}
	public void setDrcontent(String drcontent) {
		this.drcontent = drcontent;
	}
	public String getDrpic() {
		return drpic;
	}
	public void setDrpic(String drpic) {
		this.drpic = drpic;
	}
	@Override
	public String toString() {
		return "\nB_drafets [drid=" + drid + ", usid=" + usid + ", drtitle=" + drtitle + ", drtypeid=" + drtypeid
				+ ", drtagid=" + drtagid + ", drtime=" + drtime + ", drcontent=" + drcontent + ", drpic=" + drpic + "]";
	}

	
	
}
