package com.athena.ck.entity.anxorder;

import com.toft.core3.support.PageableSupport;

/**
 * <p>
 * Title:线边库存
 * </p>
 * <p>
 * Description:线边库存
 * </p>
 * <p>
 * Copyright: Copyright (c) 2012
 * </p>
 * <p>
 * Company: 软通动力
 * </p>
 * 
 * @author 甘露
 * @version v1.0
 * @date 2012-12-26
 */
public class Xianbkc extends PageableSupport  {
	private static final long serialVersionUID = 1L;
	private String usercenter;	//用户中心
	private String chanx;		//产线
	private String xiaohd;		//消耗点
	private String lingjbh;		//零件编号
	private String yuanljsl;    //原零件数量
	private String lingjsl;		//零件数量
	private String zhengclsh;	//整车流水号
	private String pandljsl;    //人工盘点实际数量
	private String chay;        //差异
	private String creator;     //创建人
	private String create_time;  //创建时间
	private String edit_time;	//修改时间
	private String edittime;    //新修改时间
	private String editor;      //修改人
	private String kucsldxh;   //待消耗
	
	
	private String anxscjssj;   //C0上次计算时间
	
	public String getKucsldxh() {
		return kucsldxh;
	}
	public void setKucsldxh(String kucsldxh) {
		this.kucsldxh = kucsldxh;
	}
	public String getYuanljsl() {
		return yuanljsl;
	}
	public void setYuanljsl(String yuanljsl) {
		this.yuanljsl = yuanljsl;
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
	public String getEdittime() {
		return edittime;
	}
	public void setEdittime(String edittime) {
		this.edittime = edittime;
	}
	public String getPandljsl() {
		return pandljsl;
	}
	public void setPandljsl(String pandljsl) {
		this.pandljsl = pandljsl;
	}
	public String getChay() {
		return chay;
	}
	public void setChay(String chay) {
		this.chay = chay;
	}
	public String getCreator() {
		return creator;
	}
	public void setCreator(String creator) {
		this.creator = creator;
	}
	
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
	public String getLingjsl() {
		return lingjsl;
	}
	public void setLingjsl(String lingjsl) {
		this.lingjsl = lingjsl;
	}
	public String getZhengclsh() {
		return zhengclsh;
	}
	public void setZhengclsh(String zhengclsh) {
		this.zhengclsh = zhengclsh;
	}
	public String getEdit_time() {
		return edit_time;
	}
	public void setEdit_time(String edit_time) {
		this.edit_time = edit_time;
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
	
	
}
