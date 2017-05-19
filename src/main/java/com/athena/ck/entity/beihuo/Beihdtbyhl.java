package com.athena.ck.entity.beihuo;

/**
 * <p>
 * Title:备货单同步要货令
 * </p>
 * <p>
 * Description:备货单同步要货令
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
public class Beihdtbyhl {
	//要货令
	private String yaohlh;
	//配送类别
	private String peislb;
	//产线
	private String chanx;
	//消耗点
	private String xiaohd;
	//要货总数量
	private String yaohslsum;
	//备货总数量
	private String beihslsum;
	
	public String getYaohlh() {
		return yaohlh;
	}

	public void setYaohlh(String yaohlh) {
		this.yaohlh = yaohlh;
	}

	public String getPeislb() {
		return peislb;
	}

	public void setPeislb(String peislb) {
		this.peislb = peislb;
	}

	public String getChanx() {
		return chanx;
	}

	public void setChanx(String chanx) {
		this.chanx = chanx;
	}

	public String getXiaohd() {
		return xiaohd;
	}

	public void setXiaohd(String xiaohd) {
		this.xiaohd = xiaohd;
	}

	public String getYaohslsum() {
		return yaohslsum;
	}

	public void setYaohslsum(String yaohslsum) {
		this.yaohslsum = yaohslsum;
	}

	public String getBeihslsum() {
		return beihslsum;
	}

	public void setBeihslsum(String beihslsum) {
		this.beihslsum = beihslsum;
	}
}
