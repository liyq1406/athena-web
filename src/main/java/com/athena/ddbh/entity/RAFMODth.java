package com.athena.ddbh.entity;

import com.athena.component.entity.Domain;
import com.toft.core3.support.PageableSupport;
/**
 * RAFMOD替换对象
 * @author chenlei
 * @vesion 1.0
 * @date 2012-3-29
 */
public class RAFMODth extends PageableSupport implements Domain {
	//序列化序号
	private static final long serialVersionUID = 1L;
	//主键
	private String id; 
	//OF号
	private String ofh; 
	//原消耗点
	private String yuanxhd; 
	//原零件
	private String yuanlj; 
	//原系数
	private String yuanxs;
	//新消耗点
	private String xinxhd;
	//新零件
	private String xinlj;
	//新系数
	private String xinxs;
	//操作标识  1：新增 2：替换 3：删除
	private int caozbs;
	//创建人
	private String chuangjr;
	//创建时间
	private String chuangjsj;
	//操作人
	private String caozr;
	//操作时间
	private String caozsj;
	//用户中心
	private String usercenter; 
	//生产线
	private String chanx;
	//单位
	private String danw;
	//制造路线
	private String zhizlx;
	//数量 替换
	private String count_th;
	//处理状态 默认为0
	private String flag;
	
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public String getCount_th() {
		return count_th;
	}
	public void setCount_th(String count_th) {
		this.count_th = count_th;
	}
	public String getChanx() {
		return chanx;
	}
	public void setChanx(String chanx) {
		this.chanx = chanx;
	}
	public String getDanw() {
		return danw;
	}
	public void setDanw(String danw) {
		this.danw = danw;
	}
	public String getZhizlx() {
		return zhizlx;
	}
	public void setZhizlx(String zhizlx) {
		this.zhizlx = zhizlx;
	}
	//获取用户中心
	public String getUsercenter() {
		return usercenter;
	}
	//设置用户中心
	public void setUsercenter(String usercenter) {
		this.usercenter = usercenter;
	}
	//获取of号
	public String getOfh() {
		return ofh;
	}
	//设置of号
	public void setOfh(String ofh) {
		this.ofh = ofh;
	}
	//获取原消耗点
	public String getYuanxhd() {
		return yuanxhd;
	}
	//设置原消耗点
	public void setYuanxhd(String yuanxhd) {
		this.yuanxhd = yuanxhd;
	}
	//获取原零件
	public String getYuanlj() {
		return yuanlj;
	}
	//设置原零件
	public void setYuanlj(String yuanlj) {
		this.yuanlj = yuanlj;
	}
	//获取新消耗点
	public String getXinxhd() {
		return xinxhd;
	}
	//设置新消耗点
	public void setXinxhd(String xinxhd) {
		this.xinxhd = xinxhd;
	}
	//获取新零件
	public String getXinlj() {
		return xinlj;
	}
	//设置新零件
	public void setXinlj(String xinlj) {
		this.xinlj = xinlj;
	}
	//获取原系数
	public String getYuanxs() {
		return yuanxs;
	}
	//设置原系数
	public void setYuanxs(String yuanxs) {
		this.yuanxs = yuanxs;
	}
	//获取新系数
	public String getXinxs() {
		return xinxs;
	}
	//设置新系数
	public void setXinxs(String xinxs) {
		this.xinxs = xinxs;
	}
	//获取操作标示
	public int getCaozbs() {
		return caozbs;
	}
	//设置操作标示
	public void setCaozbs(int caozbs) {
		this.caozbs = caozbs;
	}
	//获取创建人
	public String getChuangjr() {
		return chuangjr;
	}
	//设置创建人
	public void setChuangjr(String chuangjr) {
		this.chuangjr = chuangjr;
	}
	//获取创建时间
	public String getChuangjsj() {
		return chuangjsj;
	}
	//设置创建时间
	public void setChuangjsj(String chuangjsj) {
		this.chuangjsj = chuangjsj;
	}
	//获取操作人
	public String getCaozr() {
		return caozr;
	}
	//设置操作人
	public void setCaozr(String caozr) {
		this.caozr = caozr;
	}
	//获取操作时间
	public String getCaozsj() {
		return caozsj;
	}
	//设置操作时间
	public void setCaozsj(String caozsj) {
		this.caozsj = caozsj;
	}
	//设置主键
	public void setId(String id) {
		this.id = id;
	}
	//获取主键
	public String getId() {
		return id;
	}

}
