package com.athena.ck.entity.shouhuo;

import java.util.List;

public class Tongbysd {
	private String usercenter; 	//用户中心
	private String uth;			//验收单号
	private String chengysdm;	//承运商代码
	private String chengysmc;	//承运商名称
	private List<Tongbysdmx> listbzxx;	//包装信息
	private List<Lingjuagx> listljhzxx;//零件汇总信息
	private List<Lingjuagx> listcyxx;	//差异信息
	
	public String getUsercenter() {
		return usercenter;
	}
	public void setUsercenter(String usercenter) {
		this.usercenter = usercenter;
	}
	public String getUth() {
		return uth;
	}
	public void setUth(String uth) {
		this.uth = uth;
	}
	public String getChengysdm() {
		return chengysdm;
	}
	public void setChengysdm(String chengysdm) {
		this.chengysdm = chengysdm;
	}
	public String getChengysmc() {
		return chengysmc;
	}
	public void setChengysmc(String chengysmc) {
		this.chengysmc = chengysmc;
	}
	public List<Tongbysdmx> getListbzxx() {
		return listbzxx;
	}
	public void setListbzxx(List<Tongbysdmx> listbzxx) {
		this.listbzxx = listbzxx;
	}
	public List<Lingjuagx> getListljhzxx() {
		return listljhzxx;
	}
	public void setListljhzxx(List<Lingjuagx> listljhzxx) {
		this.listljhzxx = listljhzxx;
	}
	public List<Lingjuagx> getListcyxx() {
		return listcyxx;
	}
	public void setListcyxx(List<Lingjuagx> listcyxx) {
		this.listcyxx = listcyxx;
	}
	
}
