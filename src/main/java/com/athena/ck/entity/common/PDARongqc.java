package com.athena.ck.entity.common;

import java.util.ArrayList;
import java.util.List;

public class PDARongqc {

	private String usercenter; //用户中心
	
	private String username;  //用户名
	
	private String caption;   //用户描述信息
	
	private String password;  //密码
	
	private String version;  //版本号
	
	private String userrole;  //用户权限
		
	private List<PDARongqbh> containerlist;  //容器List集合 0010495		
	
	private String loginkey;   //当前用户登陆的唯一Key值
	

	public String getUsercenter() {
		return usercenter;
	}

	public void setUsercenter(String usercenter) {
		this.usercenter = usercenter;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getCaption() {
		return caption;
	}

	public void setCaption(String caption) {
		this.caption = caption;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getVersion() {
		return version;
	}

	public void setVersion(String version) {
		this.version = version;
	}

	public String getUserrole() {
		return userrole;
	}

	public void setUserrole(String userrole) {
		this.userrole = userrole;
	}
	
	public List<PDARongqbh> getContainerlist() {
		if (containerlist==null){
			containerlist = new ArrayList<PDARongqbh>();
		}
		return containerlist;
	}

	public void setContainerlist(List<PDARongqbh> containerlist) {
		this.containerlist = containerlist;
	}

	public String getLoginkey() {
		return loginkey;
	}

	public void setLoginkey(String loginkey) {
		this.loginkey = loginkey;
	}
}
