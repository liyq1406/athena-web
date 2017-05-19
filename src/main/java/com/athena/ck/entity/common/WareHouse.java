package com.athena.ck.entity.common;

public class WareHouse {
	private String id;//P_主键

	private String post_Id;//用户组ID
	
	private String usercenter;//用户中心
	
	private String cangkbh;//仓库编号
	
	private String mender;//修改人
	
	private String modify_time;//修改时间
	
	private String creator;//创建人
	
	private String create_time;//创建时间
	
	private String active;//是否有效
	
	private String cangklx;//仓库类型
	
	private Float daoctqq;
	
	private String rongqcbh;

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

	public String getCangkbh() {
		return cangkbh;
	}

	public void setCangkbh(String cangkbh) {
		this.cangkbh = cangkbh;
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

	public String getActive() {
		return active;
	}

	public void setActive(String active) {
		this.active = active;
	}

	public String getCangklx() {
		return cangklx;
	}

	public void setCangklx(String cangklx) {
		this.cangklx = cangklx;
	}

	public Float getDaoctqq() {
		return daoctqq;
	}

	public void setDaoctqq(Float daoctqq) {
		this.daoctqq = daoctqq;
	}

	public String getRongqcbh() {
		return rongqcbh;
	}

	public void setRongqcbh(String rongqcbh) {
		this.rongqcbh = rongqcbh;
	}
}
