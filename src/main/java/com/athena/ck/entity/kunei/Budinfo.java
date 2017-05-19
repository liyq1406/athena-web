package com.athena.ck.entity.kunei;

import java.util.Date;

/**
 * <p>
 * Title:补打功能
 * </p>
 * <p>
 * Description:定义到补打实体类
 * </p>
 * <p>
 * Copyright: Copyright (c) 2011
 * </p>
 * <p>
 * Company: 软通动力
 * </p>
 * 
 * @author 聂柳
 * @version v1.0
 * @date 2012-03-01
 */
public class Budinfo {
	
	private String danjlx;		//单据类型
	private String danjbh;		//单据编号
	
	private String qid;
	private String sjqid;
	public String getSjqid() {
		return sjqid;
	}
	public void setSjqid(String sjqid) {
		this.sjqid = sjqid;
	}
	private String seq;
	private String sfilename;
	private String modelnumber;
	private String printnumber;
	private String printunitcount;
	private String printtype;
	private String status;
	private String daypc;
	private String quyzs;
	private String usercenter;
	public String getQid() {
		return qid;
	}
	public void setQid(String qid) {
		this.qid = qid;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getSfilename() {
		return sfilename;
	}
	public void setSfilename(String sfilename) {
		this.sfilename = sfilename;
	}
	public String getModelnumber() {
		return modelnumber;
	}
	public void setModelnumber(String modelnumber) {
		this.modelnumber = modelnumber;
	}
	public String getPrintnumber() {
		return printnumber;
	}
	public void setPrintnumber(String printnumber) {
		this.printnumber = printnumber;
	}
	public String getPrintunitcount() {
		return printunitcount;
	}
	public void setPrintunitcount(String printunitcount) {
		this.printunitcount = printunitcount;
	}
	public String getPrinttype() {
		return printtype;
	}
	public void setPrinttype(String printtype) {
		this.printtype = printtype;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getDaypc() {
		return daypc;
	}
	public void setDaypc(String daypc) {
		this.daypc = daypc;
	}
	public String getQuyzs() {
		return quyzs;
	}
	public void setQuyzs(String quyzs) {
		this.quyzs = quyzs;
	}
	public String getUsercenter() {
		return usercenter;
	}
	public void setUsercenter(String usercenter) {
		this.usercenter = usercenter;
	}
	public String getDanjlx() {
		return danjlx;
	}
	public void setDanjlx(String danjlx) {
		this.danjlx = danjlx;
	}
	public String getDanjbh() {
		return danjbh;
	}
	public void setDanjbh(String danjbh) {
		this.danjbh = danjbh;
	}
	
}
