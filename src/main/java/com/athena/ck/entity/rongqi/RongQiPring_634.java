package com.athena.ck.entity.rongqi;
/**
 * <p>
 * Title: 634 容器接收返还单打印
 * </p>
 * <p>
 * Description:定义到容器接收返还信息实体类
 * </p>
 * <p>
 * Copyright: Copyright (c) 2012
 * </p>
 * <p>
 * Company: 软通动力
 * </p>
 * 
 * @author 陈剑峰
 * @version v1.0
 * @date 2012-12-29
 */
public class RongQiPring_634 {
	//接收/返还单号
	private String jsfhdh;
	//供应商编号/名称
	private String gongysdm;
	//承运商编号/名称
	private String chengysdm;
	//卡车号
	private String kach;
	//容器型号
	private String rongqxh;
	//容器数量
	private String rongqsl;
	//容器余额
	private String rongqye;
	//摘要
	private String zhaiy;
	//日期
	private String riq;
	//时间
	private String shij;
	//供应商名称
	private String gongysmc;
	//承运商名称
	private String chengysmc;
	
	//0010495 容器包号
	private String rongqbh;
		
	
	public String getRongqbh() {
		return rongqbh;
	}
	public void setRongqbh(String rongqbh) {
		this.rongqbh = rongqbh;
	}
	public String getGongysmc() {
		return gongysmc;
	}
	public void setGongysmc(String gongysmc) {
		this.gongysmc = gongysmc;
	}
	public String getChengysmc() {
		return chengysmc;
	}
	public void setChengysmc(String chengysmc) {
		this.chengysmc = chengysmc;
	}
	public String getJsfhdh() {
		return jsfhdh;
	}
	public void setJsfhdh(String jsfhdh) {
		this.jsfhdh = jsfhdh;
	}
	public String getGongysdm() {
		return gongysdm;
	}
	public void setGongysdm(String gongysdm) {
		this.gongysdm = gongysdm;
	}
	public String getChengysdm() {
		return chengysdm;
	}
	public void setChengysdm(String chengysdm) {
		this.chengysdm = chengysdm;
	}
	public String getKach() {
		return kach;
	}
	public void setKach(String kach) {
		this.kach = kach;
	}
	public String getRongqxh() {
		return rongqxh;
	}
	public void setRongqxh(String rongqxh) {
		this.rongqxh = rongqxh;
	}
	public String getRongqsl() {
		return rongqsl;
	}
	public void setRongqsl(String rongqsl) {
		this.rongqsl = rongqsl;
	}
	public String getRongqye() {
		return rongqye;
	}
	public void setRongqye(String rongqye) {
		this.rongqye = rongqye;
	}
	public String getZhaiy() {
		return zhaiy;
	}
	public void setZhaiy(String zhaiy) {
		this.zhaiy = zhaiy;
	}
	public String getRiq() {
		return riq;
	}
	public void setRiq(String riq) {
		this.riq = riq;
	}
	public String getShij() {
		return shij;
	}
	public void setShij(String shij) {
		this.shij = shij;
	}
	

}
