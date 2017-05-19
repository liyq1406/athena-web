package com.athena.ck.entity.beihuo;

/**
 * <p>
 * Title:扫卡查询
 * </p>
 * <p>
 * Description:扫卡查询导出用Entity
 * </p>
 * <p>
 * Copyright: Copyright (c) 2011
 * </p>
 * <p>
 * Company: 软通动力
 * </p>
 * 
 * @author 陈川川
 * @version v1.0
 * @date 2012-5-12
 */
public class Saokcx {
	//循环编号
	private String xunhbm;
	//循环规模
	private String dangqxhgm;
	//循环类型
	private String gonghms;
	//要货令号
	private String yaohlh;
	//状态
	private String yaohlzt;
	//零件号
	private String lingjbh;
	//零件名称
	private String lingjmc;
	//零件数量
	private String yaohsl;
	//零件单位
	private String danw;
	//临时卡标识
	private String shiflsk;
	//取消标识
	private String quxbs;
	//客户
	private String keh;
	//扫卡时间
	private String saoksj;
	//最晚交付时间
	private String zuiwsj;
	//交付时间
	private String jiaofsj;
	//用户编号
	private String oper_no;
	//供应商
	private String gongysdm;
	//发送编号
	private String fasbh;
	
	public String getYaohsl() {
		return yaohsl;
	}
	public String getGonghms() {
		return gonghms;
	}
	public void setGonghms(String gonghms) {
		this.gonghms = gonghms;
	}
	public void setYaohsl(String yaohsl) {
		this.yaohsl = yaohsl;
	}
	
	public String getXunhbm() {
		return xunhbm;
	}
	public void setXunhbm(String xunhbm) {
		this.xunhbm = xunhbm;
	}

	public String getDangqxhgm() {
		return dangqxhgm;
	}
	public void setDangqxhgm(String dangqxhgm) {
		this.dangqxhgm = dangqxhgm;
	}

	
	
	public String getYaohlh() {
		return yaohlh;
	}
	public void setYaohlh(String yaohlh) {
		this.yaohlh = yaohlh;
	}
	public String getYaohlzt() {
		return yaohlzt;
	}
	public void setYaohlzt(String yaohlzt) {
		this.yaohlzt = yaohlzt;
	}
	public String getLingjbh() {
		return lingjbh;
	}
	public void setLingjbh(String lingjbh) {
		this.lingjbh = lingjbh;
	}
	public String getShiflsk() {
		return shiflsk;
	}
	public void setShiflsk(String shiflsk) {
		this.shiflsk = shiflsk;
	}
	public String getQuxbs() {
		return quxbs;
	}
	public void setQuxbs(String quxbs) {
		this.quxbs = quxbs;
	}
	public String getLingjmc() {
		return lingjmc;
	}
	public void setLingjmc(String lingjmc) {
		this.lingjmc = lingjmc;
	}
	public String getDanw() {
		return danw;
	}
	public void setDanw(String danw) {
		this.danw = danw;
	}

	public String getKeh() {
		return keh;
	}
	public void setKeh(String keh) {
		this.keh = keh;
	}
	public String getSaoksj() {
		return saoksj;
	}
	public void setSaoksj(String saoksj) {
		this.saoksj = saoksj;
	}
	public String getZuiwsj() {
		return zuiwsj;
	}
	public void setZuiwsj(String zuiwsj) {
		this.zuiwsj = zuiwsj;
	}
	public String getOper_no() {
		return oper_no;
	}
	public void setOper_no(String oper_no) {
		this.oper_no = oper_no;
	}
	public String getJiaofsj() {
		return jiaofsj;
	}
	public void setJiaofsj(String jiaofsj) {
		this.jiaofsj = jiaofsj;
	}
	public String getGongysdm() {
		return gongysdm;
	}
	public void setGongysdm(String gongysdm) {
		this.gongysdm = gongysdm;
	}
	public String getFasbh() {
		return fasbh;
	}
	public void setFasbh(String fasbh) {
		this.fasbh = fasbh;
	}
}
