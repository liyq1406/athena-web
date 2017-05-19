package com.athena.ck.entity.anxorder;

import java.math.BigDecimal;

import com.toft.core3.support.PageableSupport;

/**
 * 
 * @author wuyichao
 *
 */
public class PandModel extends PageableSupport
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 7097051263178211615L;

	
	private BigDecimal daixh;      //待消耗
	 
	private BigDecimal chukl;       //出库量
	 
	private BigDecimal yicdxh;     //异常待消耗
	 
	private String pandtime;     //盘点时间

	private String usercenter;	//用户中心
	
	private String xiaohd;		//消耗点
	
	private String lingjbh;		//零件编号
	
	private BigDecimal xianbllkc;   //线边理论库存
	
	private String anxscjssj;   //按需上次计算时间
	
	private BigDecimal chay;        //差异
	
	private BigDecimal pandljsl;   //盘点零件数量
	
	private String creator;     //创建人
	
	private String create_time;  //创建时间
	
	private String zhengclsh;  //流水号
	
	private String shengcxbh;   //生产线编号
	
	private String mos;
	
	private BigDecimal daijf;
	
	private BigDecimal xiaohl;
	
	private BigDecimal yingyl;
	
	public BigDecimal getDaixh() {
		return daixh;
	}

	public void setDaixh(BigDecimal daixh) {
		this.daixh = daixh;
	}

	public BigDecimal getChukl() {
		return chukl;
	}

	public void setChukl(BigDecimal chukl) {
		this.chukl = chukl;
	}

	public BigDecimal getYicdxh() {
		return yicdxh;
	}

	public void setYicdxh(BigDecimal yicdxh) {
		this.yicdxh = yicdxh;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getPandtime() {
		return pandtime;
	}

	public void setPandtime(String pandtime) {
		this.pandtime = pandtime;
	}

	public String getUsercenter() {
		return usercenter;
	}

	public void setUsercenter(String usercenter) {
		this.usercenter = usercenter;
	}


	public String getXiaohd() {
		return xiaohd;
	}

	public void setXiaohd(String xiaohd) {
		this.xiaohd = xiaohd;
	}

	public String getLingjbh() {
		return lingjbh;
	}

	public void setLingjbh(String lingjbh) {
		this.lingjbh = lingjbh;
	}

	public BigDecimal getXianbllkc() {
		return xianbllkc;
	}

	public void setXianbllkc(BigDecimal xianbllkc) {
		this.xianbllkc = xianbllkc;
	}

	public String getAnxscjssj() {
		return anxscjssj;
	}

	public void setAnxscjssj(String anxscjssj) {
		this.anxscjssj = anxscjssj;
	}

	public BigDecimal getChay() {
		return chay;
	}

	public void setChay(BigDecimal chay) {
		this.chay = chay;
	}

	public BigDecimal getPandljsl() {
		return pandljsl;
	}

	public void setPandljsl(BigDecimal pandljsl) {
		this.pandljsl = pandljsl;
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

	public String getZhengclsh() {
		return zhengclsh;
	}

	public void setZhengclsh(String zhengclsh) {
		this.zhengclsh = zhengclsh;
	}

	public String getShengcxbh() {
		return shengcxbh;
	}

	public void setShengcxbh(String shengcxbh) {
		this.shengcxbh = shengcxbh;
	}

	public String getMos() {
		return mos;
	}

	public void setMos(String mos) {
		this.mos = mos;
	}

	public BigDecimal getDaijf() {
		return daijf;
	}

	public void setDaijf(BigDecimal daijf) {
		this.daijf = daijf;
	}

	public BigDecimal getXiaohl() {
		return xiaohl;
	}

	public void setXiaohl(BigDecimal xiaohl) {
		this.xiaohl = xiaohl;
	}

	public BigDecimal getYingyl() {
		return yingyl;
	}

	public void setYingyl(BigDecimal yingyl) {
		this.yingyl = yingyl;
	}
	
	
	
}
