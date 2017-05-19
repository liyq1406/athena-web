package com.athena.jk.entity;

import com.athena.component.entity.Domain;
import com.toft.core3.support.PageableSupport;

public class In_zidb extends PageableSupport implements Domain {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1444511352154580614L;

	private String inbh;        //接口编号
	private String inname;      //接口名称
	private String lastcpltime; //上次完成时间
	private String lastlctime;  //上上次完成时间 
	private String outfiletype; //输出文件类型(usercenter)，如果是多用户中心，请用逗号隔开
	private String isgoon;      //是否分发  0：不分发  1：分发
	private String yunxzt;      //运行状态：1:运行中  0:未运行 2:运行出错
	private String yunxkssj;    //运行开始时间
	private String yunxkssjTo;  //接口运行开始时间
	private String shengcts;    //生成的条数
	private String chucts;      //生成文件出错的条数
	private String wenjsl;      //解析文件数量
	private String wenjcwsl;    //解析文件错误数量
	
	public String getInbh() {
		return inbh;
	}

	public void setInbh(String inbh) {
		this.inbh = inbh;
	}

	public String getInname() {
		return inname;
	}

	public void setInname(String inname) {
		this.inname = inname;
	}

	public String getLastcpltime() {
		return lastcpltime;
	}

	public void setLastcpltime(String lastcpltime) {
		this.lastcpltime = lastcpltime;
	}

	public String getLastlctime() {
		return lastlctime;
	}

	public void setLastlctime(String lastlctime) {
		this.lastlctime = lastlctime;
	}

	public String getOutfiletype() {
		return outfiletype;
	}

	public void setOutfiletype(String outfiletype) {
		this.outfiletype = outfiletype;
	}

	public String getIsgoon() {
		return isgoon;
	}

	public void setIsgoon(String isgoon) {
		this.isgoon = isgoon;
	}

	public String getYunxzt() {
		return yunxzt;
	}

	public void setYunxzt(String yunxzt) {
		this.yunxzt = yunxzt;
	}

	public String getYunxkssj() {
		return yunxkssj;
	}

	public void setYunxkssj(String yunxkssj) {
		this.yunxkssj = yunxkssj;
	}

	public String getYunxkssjTo() {
		return yunxkssjTo;
	}

	public void setYunxkssjTo(String yunxkssjTo) {
		this.yunxkssjTo = yunxkssjTo;
	}

	public String getShengcts() {
		return shengcts;
	}

	public void setShengcts(String shengcts) {
		this.shengcts = shengcts;
	}

	public String getChucts() {
		return chucts;
	}

	public void setChucts(String chucts) {
		this.chucts = chucts;
	}

	public String getWenjsl() {
		return wenjsl;
	}

	public void setWenjsl(String wenjsl) {
		this.wenjsl = wenjsl;
	}

	public String getWenjcwsl() {
		return wenjcwsl;
	}

	public void setWenjcwsl(String wenjcwsl) {
		this.wenjcwsl = wenjcwsl;
	}
	
	public void setId(String id) {
		
	}

	public String getId() {
		
		return null;
	}

}
