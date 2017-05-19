package com.athena.ck.entity.anxorder;

import java.math.BigDecimal;

import com.toft.core3.support.PageableSupport;

/**
 * @see    盘点历史
 * @author wuyichao
 *
 */
public class Xianbllkcls extends PageableSupport 
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 5877265504573444996L;

	
	private String usercenter;
	
	private String chanx;
	
	private String xiaohd;
	
	private String lingjbh;
	
	private BigDecimal lingjsl;    //线边理论库存
	
	private BigDecimal pandljsl;
	
	private BigDecimal chay;  //差异
	
	private String zhengclsh; //整车流水号
	
	private String creator;
	
	private String create_time;
	
	private String editor;
	
	private String edit_time;
	
	private BigDecimal kucsldxh;
	
	private BigDecimal xianbllkc;
	
	private BigDecimal pandchukl;
	
	private BigDecimal pandycdxh;
	
	private BigDecimal daijf;
	
	private BigDecimal xiaohl;
	
	private BigDecimal yingyl;
	
	private String pandtime;     //盘点时间
	
	private String flag;   //打标
	
	private String anxscjssj;
	
	

	public String getUsercenter() {
		return usercenter;
	}

	public void setUsercenter(String usercenter) {
		this.usercenter = usercenter;
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

	public String getLingjbh() {
		return lingjbh;
	}

	public void setLingjbh(String lingjbh) {
		this.lingjbh = lingjbh;
	}

	public BigDecimal getLingjsl() {
		return lingjsl;
	}

	public void setLingjsl(BigDecimal lingjsl) {
		this.lingjsl = lingjsl;
	}

	public BigDecimal getPandljsl() {
		return pandljsl;
	}

	public void setPandljsl(BigDecimal pandljsl) {
		this.pandljsl = pandljsl;
	}

	public BigDecimal getChay() {
		return chay;
	}

	public void setChay(BigDecimal chay) {
		this.chay = chay;
	}

	public String getZhengclsh() {
		return zhengclsh;
	}

	public void setZhengclsh(String zhengclsh) {
		this.zhengclsh = zhengclsh;
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

	public String getEditor() {
		return editor;
	}

	public void setEditor(String editor) {
		this.editor = editor;
	}

	public String getEdit_time() {
		return edit_time;
	}

	public void setEdit_time(String edit_time) {
		this.edit_time = edit_time;
	}

	public BigDecimal getKucsldxh() {
		return kucsldxh;
	}

	public void setKucsldxh(BigDecimal kucsldxh) {
		this.kucsldxh = kucsldxh;
	}

	public BigDecimal getXianbllkc() {
		return xianbllkc;
	}

	public void setXianbllkc(BigDecimal xianbllkc) {
		this.xianbllkc = xianbllkc;
	}

	public BigDecimal getPandchukl() {
		return pandchukl;
	}

	public void setPandchukl(BigDecimal pandchukl) {
		this.pandchukl = pandchukl;
	}

	public BigDecimal getPandycdxh() {
		return pandycdxh;
	}

	public void setPandycdxh(BigDecimal pandycdxh) {
		this.pandycdxh = pandycdxh;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public String getAnxscjssj() {
		return anxscjssj;
	}

	public void setAnxscjssj(String anxscjssj) {
		this.anxscjssj = anxscjssj;
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
