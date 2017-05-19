package com.athena.ck.entity.rongqi;

/**
 * <p>
 * Title:容器接收
 * </p>
 * <p>
 * Description:容器接收
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
public class Rongqjs {
	//接收/返还单号
	private String jsfhdh;
	//接收日期
	private String jiesrq;
	//修改时间
	private String edit_time;
	//制造商（容器接收单：来源）
	private String zhizs;
	//供应商（容器返还单：去向）
	private String gongysdm;
	//TC号
	private String tch;
	//容器型号
	private String rongqxh;
	//容器数量
	private String rongqsl;
	//调拨数量
	private String yidbsl;
	//容器余额
	private String rongqye;
	//摘要
	private String zaiy;
	//单据类型
	private String danjlx;
	//单据属性
	private String danjsx;
	//来源
	private String laiy;
	//送货人
	private String songhr;
	//承运商
	private String chengys;

	public String getChengys() {
		return chengys;
	}
	public void setChengys(String chengys) {
		this.chengys = chengys;
	}
	public String getSonghr() {
		return songhr;
	}
	public void setSonghr(String songhr) {
		this.songhr = songhr;
	}
	public String getLaiy() {
		return laiy;
	}
	public void setLaiy(String laiy) {
		this.laiy = laiy;
	}
	public String getDanjsx() {
		return danjsx;
	}
	public void setDanjsx(String danjsx) {
		this.danjsx = danjsx;
	}
	public String getJsfhdh() {
		return jsfhdh;
	}
	public void setJsfhdh(String jsfhdh) {
		this.jsfhdh = jsfhdh;
	}
	public String getJiesrq() {
		return jiesrq;
	}
	public void setJiesrq(String jiesrq) {
		this.jiesrq = jiesrq;
	}
	public String getEdit_time() {
		return edit_time;
	}
	public void setEdit_time(String edit_time) {
		this.edit_time = edit_time;
	}
	public String getZhizs() {
		return zhizs;
	}
	public void setZhizs(String zhizs) {
		this.zhizs = zhizs;
	}
	public String getGongysdm() {
		return gongysdm;
	}
	public void setGongysdm(String gongysdm) {
		this.gongysdm = gongysdm;
	}
	public String getTch() {
		return tch;
	}
	public void setTch(String tch) {
		this.tch = tch;
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
	public String getYidbsl() {
		return yidbsl;
	}
	public void setYidbsl(String yidbsl) {
		this.yidbsl = yidbsl;
	}
	public String getRongqye() {
		return rongqye;
	}
	public void setRongqye(String rongqye) {
		this.rongqye = rongqye;
	}
	public String getZaiy() {
		return zaiy;
	}
	public void setZaiy(String zaiy) {
		this.zaiy = zaiy;
	}
	public String getDanjlx() {
		return danjlx;
	}
	public void setDanjlx(String danjlx) {
		this.danjlx = danjlx;
	}
}
