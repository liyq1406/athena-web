package com.athena.ddbh.entity;

import java.math.BigDecimal;

import com.toft.core3.support.PageableSupport;
/**
 * @按需毛需求bean
 * @author   李明
 * @date     2012-3-19
 */
public class Anxmaoxq extends PageableSupport{
	
	private static final long serialVersionUID = 1L;
	private String usercenter ;
	private String ofh ;
	private String zongzlsh ;
	private String hanzzzbz ;
	private String emonsj ;
	private String shunxh ;
	private String lingj;
	private String danw;
	private String xiaohd;
	private String xiaohsj;
	private BigDecimal xiaohxs ;
	private String xuqly ;
	private String chej ;
	private String xianh ;
	private String zhizlx ;
	private String chaifsj ;
	//增加字段
	private String startTime ;
	private String startTime2 ;
	private String waibms;
	private String mos2;
	
	//   0007182: 增加按需毛需求查询界面  按需 毛需求主页面初始化
	private String laiybs;//来源标识1，CLV 商业化；2，JT；3，SPPV；
	
	private String dangqms; //当前模式
	
	private String flag;    //处理标识
	
	private String xhsjTo;  //消耗时间段从
	 
	private String xhsjFrom;  //消耗时间段至
	
	
	public String getZongzlsh() {
		return zongzlsh;
	}
	public void setZongzlsh(String zongzlsh) {
		this.zongzlsh = zongzlsh;
	}
	public String getHanzzzbz() {
		return hanzzzbz;
	}
	public void setHanzzzbz(String hanzzzbz) {
		this.hanzzzbz = hanzzzbz;
	}
	public String getEmonsj() {
		return emonsj;
	}
	public void setEmonsj(String emonsj) {
		this.emonsj = emonsj;
	}
	public String getLingj() {
		return lingj;
	}
	public void setLingj(String lingj) {
		this.lingj = lingj;
	}
	public String getXiaohsj() {
		return xiaohsj;
	}
	public void setXiaohsj(String xiaohsj) {
		this.xiaohsj = xiaohsj;
	}
	public String getChej() {
		return chej;
	}
	public void setChej(String chej) {
		this.chej = chej;
	}
	public String getXianh() {
		return xianh;
	}
	public void setXianh(String xianh) {
		this.xianh = xianh;
	}
	public String getLaiybs() {
		return laiybs;
	}
	public void setLaiybs(String laiybs) {
		this.laiybs = laiybs;
	}
	public String getDangqms() {
		return dangqms;
	}
	public void setDangqms(String dangqms) {
		this.dangqms = dangqms;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	
	public String getXhsjTo() {
		return xhsjTo;
	}
	public void setXhsjTo(String xhsjTo) {
		this.xhsjTo = xhsjTo;
	}
	public String getXhsjFrom() {
		return xhsjFrom;
	}
	public void setXhsjFrom(String xhsjFrom) {
		this.xhsjFrom = xhsjFrom;
	}
	public String getStartTime2() {
		return startTime2;
	}
	public void setStartTime2(String startTime2) {
		this.startTime2 = startTime2;
	}
	public String getWaibms() {
		return waibms;
	}
	public void setWaibms(String waibms) {
		this.waibms = waibms;
	}
	public String getMos2() {
		return mos2;
	}
	public void setMos2(String mos2) {
		this.mos2 = mos2;
	}
	public String getUsercenter() {
		return usercenter;
	}
	public void setUsercenter(String usercenter) {
		this.usercenter = usercenter;
	}
	public String getOfh() {
		return ofh;
	}
	public void setOfh(String ofh) {
		this.ofh = ofh;
	}
	
	public String getShunxh() {
		return shunxh;
	}
	public void setShunxh(String shunxh) {
		this.shunxh = shunxh;
	}
	public String getDanw() {
		return danw;
	}
	public void setDanw(String danw) {
		this.danw = danw;
	}
	public String getXiaohd() {
		return xiaohd;
	}
	public void setXiaohd(String xiaohd) {
		this.xiaohd = xiaohd;
	}
	public BigDecimal getXiaohxs() {
		return xiaohxs;
	}
	public void setXiaohxs(BigDecimal xiaohxs) {
		this.xiaohxs = xiaohxs;
	}
	
	public String getXuqly() {
		return xuqly;
	}
	public void setXuqly(String xuqly) {
		this.xuqly = xuqly;
	}
	public String getZhizlx() {
		return zhizlx;
	}
	public void setZhizlx(String zhizlx) {
		this.zhizlx = zhizlx;
	}
	
	public String getChaifsj() {
		return chaifsj;
	}
	public void setChaifsj(String chaifsj) {
		this.chaifsj = chaifsj;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	
	
}
