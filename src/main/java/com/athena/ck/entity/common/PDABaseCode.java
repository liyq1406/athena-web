package com.athena.ck.entity.common;

public class PDABaseCode {
	private String code; //用户中心
	
	private String name;  //用户名
	
	private String type;   //用户描述信息

	private String usercenter;  //用户中心
	 
	private String loginkey;   //登陆唯一标识
	
	
	private String logindate; // 系统日期-0012191-xss
		

	public String getLogindate() {
		return logindate;
	}

	public void setLogindate(String logindate) {
		this.logindate = logindate;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getUsercenter() {
		return usercenter;
	}

	public void setUsercenter(String usercenter) {
		this.usercenter = usercenter;
	}

	public String getLoginkey() {
		return loginkey;
	}

	public void setLoginkey(String loginkey) {
		this.loginkey = loginkey;
	}
}
