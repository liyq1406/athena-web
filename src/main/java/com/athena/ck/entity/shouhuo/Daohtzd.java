package com.athena.ck.entity.shouhuo;

import java.util.Date;

/**
 * <p>
 * Title:到货通知单
 * </p>
 * <p>
 * Description:定义到货通知单实体类
 * </p>
 * <p>
 * Copyright: Copyright (c) 2011
 * </p>
 * <p>
 * Company: 软通动力
 * </p>
 * 
 * @author 林笛
 * @version v1.0
 * @date 2011-12-26
 */
public class Daohtzd {
	private String usercenter;
	private String uth;
	private Date utscsj;
	private String blh;
	private String xiehzt;
	private String tch;
	private String chengysdm;
	private String chengysmc;
	private long fayzsl;
	private int zhuangt;
	private Date yujddsj;
	private Date blscsj;
	private char dayzt;
	private String jzsl;
	private String uah;
	private String dpcadw;
	
	//0011460/0011522 	
	private String elh;
	private String lingjbh;
	private String gongysdm;
	private String wuld;
	private String yanssl;
	private String lingjsl;
	private String zhuangtxx;
	private String yikbs;
	
	//11468
	private String  danjbh;
	private String  gongysmc;
	private String  creator;
	private String  create_time;
	
	
	//xss-20160816
	private String cangkbh;
	private String yblh; 
	private String ysblh;
	private String yuth;
	private String ucgs ; 
	private String uaxh;
	private String ucxh;
	private String uchl;	
	private String danw;
	private String beiz;
	private String tishi;
	private String rongqgs;
	private String shifdyus;
	
	
	
     public String getShifdyus() {
		return shifdyus;
	}

	public void setShifdyus(String shifdyus) {
		this.shifdyus = shifdyus;
	}

	public String getRongqgs() {
		return rongqgs;
	}

	public void setRongqgs(String rongqgs) {
		this.rongqgs = rongqgs;
	}

	public String getTishi() {
		return tishi;
	}

	public void setTishi(String tishi) {
		this.tishi = tishi;
	}

	public String getUcgs() {
		return ucgs;
	}

	public void setUcgs(String ucgs) {
		this.ucgs = ucgs;
	}

	public String getUaxh() {
		return uaxh;
	}

	public void setUaxh(String uaxh) {
		this.uaxh = uaxh;
	}

	public String getUcxh() {
		return ucxh;
	}

	public void setUcxh(String ucxh) {
		this.ucxh = ucxh;
	}

	public String getUchl() {
		return uchl;
	}

	public void setUchl(String uchl) {
		this.uchl = uchl;
	}

	public String getDanw() {
		return danw;
	}

	public void setDanw(String danw) {
		this.danw = danw;
	}

	public String getBeiz() {
		return beiz;
	}

	public void setBeiz(String beiz) {
		this.beiz = beiz;
	}

	public String getYuth() {
		return yuth;
	}

	public void setYuth(String yuth) {
		this.yuth = yuth;
	}

	public String getCreator() {
		return creator;
	}

	public void setCreator(String creator) {
		this.creator = creator;
	}

	public String getYblh() {
		return yblh;
	}

	public void setYblh(String yblh) {
		this.yblh = yblh;
	}

	public String getYsblh() {
		return ysblh;
	}

	public void setYsblh(String ysblh) {
		this.ysblh = ysblh;
	}

	public String getCangkbh() {
		return cangkbh;
	}

	public void setCangkbh(String cangkbh) {
		this.cangkbh = cangkbh;
	}

	public String getElh() {
		return elh;
	}

	public void setElh(String elh) {
		this.elh = elh;
	}

	public String getLingjbh() {
		return lingjbh;
	}

	public void setLingjbh(String lingjbh) {
		this.lingjbh = lingjbh;
	}

	public String getGongysdm() {
		return gongysdm;
	}

	public void setGongysdm(String gongysdm) {
		this.gongysdm = gongysdm;
	}

	public String getWuld() {
		return wuld;
	}

	public void setWuld(String wuld) {
		this.wuld = wuld;
	}

	public String getYanssl() {
		return yanssl;
	}

	public void setYanssl(String yanssl) {
		this.yanssl = yanssl;
	}

	public String getLingjsl() {
		return lingjsl;
	}

	public void setLingjsl(String lingjsl) {
		this.lingjsl = lingjsl;
	}

	public String getZhuangtxx() {
		return zhuangtxx;
	}

	public void setZhuangtxx(String zhuangtxx) {
		this.zhuangtxx = zhuangtxx;
	}

	public String getYikbs() {
		return yikbs;
	}

	public void setYikbs(String yikbs) {
		this.yikbs = yikbs;
	}

	public String getDpcadw() {
		return dpcadw;
	}

	public void setDpcadw(String dpcadw) {
		this.dpcadw = dpcadw;
	}

	public String getUah() {
		return uah;
	}

	public void setUah(String uah) {
		this.uah = uah;
	}

	//纠正数量
	public String getJzsl() {
		return jzsl;
	}

	public void setJzsl(String jzsl) {
		this.jzsl = jzsl;
	}

	/**
	 * 返回用户中心
	 * 
	 * @return the usercenter
	 */
	public String getUsercenter() {
		return usercenter;
	}

	/**
	 * 设置用户中心
	 * 
	 * @param usercenter
	 *            the usercenter to set
	 */
	public void setUsercenter(String usercenter) {
		this.usercenter = usercenter;
	}

	/**
	 * 返回UT号
	 * 
	 * @return the uth
	 */
	public String getUth() {
		return uth;
	}

	/**
	 * 设置UT号
	 * 
	 * @param uth
	 *            the uth to set
	 */
	public void setUth(String uth) {
		this.uth = uth;
	}

	/**
	 * 返回UT生成时间
	 * 
	 * @return the utscsj
	 */
	public Date getUtscsj() {
		return utscsj;
	}

	/**
	 * 设置UT生成时间
	 * 
	 * @param utscsj
	 *            the utscsj to set
	 */
	public void setUtscsj(Date utscsj) {
		this.utscsj = utscsj;
	}

	/**
	 * 返回BL号
	 * 
	 * @return the blh
	 */
	public String getBlh() {
		return blh;
	}

	/**
	 * 设置BL号
	 * 
	 * @param blh
	 *            the blh to set
	 */
	public void setBlh(String blh) {
		this.blh = blh;
	}

	/**
	 * 返回卸货站台
	 * 
	 * @return the xiehzt
	 */
	public String getXiehzt() {
		return xiehzt;
	}

	/**
	 * 设置卸货站台
	 * 
	 * @param xiehzt
	 *            the xiehzt to set
	 */
	public void setXiehzt(String xiehzt) {
		this.xiehzt = xiehzt;
	}

	/**
	 * 返回TC号
	 * 
	 * @return the tch
	 */
	public String getTch() {
		return tch;
	}

	/**
	 * 设置TC号
	 * 
	 * @param tch
	 *            the tch to set
	 */
	public void setTch(String tch) {
		this.tch = tch;
	}

	/**
	 * 返回承运商代码
	 * 
	 * @return the chengysdm
	 */
	public String getChengysdm() {
		return chengysdm;
	}

	/**
	 * 设置承运商代码
	 * 
	 * @param chengysdm
	 *            the chengysdm to set
	 */
	public void setChengysdm(String chengysdm) {
		this.chengysdm = chengysdm;
	}

	/**
	 * 返回承运商名称
	 * 
	 * @return the chengysmc
	 */
	public String getChengysmc() {
		return chengysmc;
	}

	/**
	 * 设置承运商名称
	 * 
	 * @param chengysmc
	 *            the chengysmc to set
	 */
	public void setChengysmc(String chengysmc) {
		this.chengysmc = chengysmc;
	}

	/**
	 * 返回发运总数量
	 * 
	 * @return the fayzsl
	 */
	public long getFayzsl() {
		return fayzsl;
	}

	/**
	 * 设置发运总数量
	 * 
	 * @param fayzsl
	 *            the fayzsl to set
	 */
	public void setFayzsl(long fayzsl) {
		this.fayzsl = fayzsl;
	}

	/**
	 * 返回状态
	 * 
	 * @return the zhuangt
	 */
	public int getZhuangt() {
		return zhuangt;
	}

	/**
	 * 设置状态
	 * 
	 * @param zhuangt
	 *            the zhuangt to set
	 */
	public void setZhuangt(int zhuangt) {
		this.zhuangt = zhuangt;
	}

	/**
	 * 返回预计到达时间
	 * 
	 * @return the yujddsj
	 */
	public Date getYujddsj() {
		return yujddsj;
	}

	/**
	 * 设置预计到达时间
	 * 
	 * @param yujddsj
	 *            the yujddsj to set
	 */
	public void setYujddsj(Date yujddsj) {
		this.yujddsj = yujddsj;
	}

	/**
	 * 返回BL生成时间
	 * 
	 * @return the blscsj
	 */
	public Date getBlscsj() {
		return blscsj;
	}

	/**
	 * 设置BL生成时间
	 * 
	 * @param blscsj
	 *            the blscsj to set
	 */
	public void setBlscsj(Date blscsj) {
		this.blscsj = blscsj;
	}

	/**
	 * 返回打印状态
	 * 
	 * @return the dayzt
	 */
	public char getDayzt() {
		return dayzt;
	}

	/**
	 * 设置打印状态
	 * 
	 * @param dayzt
	 *            the dayzt to set
	 */
	public void setDayzt(char dayzt) {
		this.dayzt = dayzt;
	}

}
