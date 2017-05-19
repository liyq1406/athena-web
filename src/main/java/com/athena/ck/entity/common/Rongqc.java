package com.athena.ck.entity.common;

public class Rongqc {
	private String id;//P_主键
	private String post_Id;//权限组ID
	private String usercenter;//用户中心
	private String rongqcbh;//容器场编号
	private String mender;//修改人
	private String modify_time;//修改时间
	private String creator;//创建人
	private String create_time;//创建时间
	private String shiffk; //容器场类型 R, F, J
	private String jizqbh; //记账区编号
	private String active;//是否有效
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPost_Id() {
		return post_Id;
	}
	public void setPost_Id(String post_Id) {
		this.post_Id = post_Id;
	}
	public String getUsercenter() {
		return usercenter;
	}
	public void setUsercenter(String usercenter) {
		this.usercenter = usercenter;
	}
	public String getRongqcbh() {
		return rongqcbh;
	}
	public void setRongqcbh(String rongqcbh) {
		this.rongqcbh = rongqcbh;
	}
	public String getMender() {
		return mender;
	}
	public void setMender(String mender) {
		this.mender = mender;
	}
	public String getModify_time() {
		return modify_time;
	}
	public void setModify_time(String modify_time) {
		this.modify_time = modify_time;
	}
	public String getCreator() {
		return creator;
	}
	public void setCreator(String creator) {
		this.creator = creator;
	}
	public String getCreate_time() {
		return create_time;
	}
	public void setCreate_time(String create_time) {
		this.create_time = create_time;
	}
	public String getShiffk() {
		return shiffk;
	}
	public void setShiffk(String shiffk) {
		this.shiffk = shiffk;
	}
	public String getJizqbh() {
		return jizqbh;
	}
	public void setJizqbh(String jizqbh) {
		this.jizqbh = jizqbh;
	}
	public String getActive() {
		return active;
	}
	public void setActive(String active) {
		this.active = active;
	}
}
