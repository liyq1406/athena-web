package com.athena.ddbh.entity;

import com.athena.component.entity.Domain;
import com.toft.core3.support.PageableSupport;
/**
 * 车辆拆分结果
 * @author chenlei
 * @vesion 1.0
 * @date 2012-3-29
 */
public class Chelcfjg extends PageableSupport implements Domain {
	//序列化序号
	private static final long serialVersionUID = 1L;
	//OF号
	private String ofh; 
	//零件
	private String lj; 
	//消耗点
	private String xhd; 
	//数量
	private double sl; 
	//日期
	private String rq; 

	//获取of号
	public String getOfh() {
		return ofh;
	}
	//设置of号
	public void setOfh(String ofh) {
		this.ofh = ofh;
	}
	//获取零件号
	public String getLj() {
		return lj;
	}
	//设置零件号
	public void setLj(String lj) {
		this.lj = lj;
	}
	//获取消耗点
	public String getXhd() {
		return xhd;
	}
	//设置消耗点
	public void setXhd(String xhd) {
		this.xhd = xhd;
	}
	//获取数量
	public double getSl() {
		return sl;
	}
	//设置数量
	public void setSl(double sl) {
		this.sl = sl;
	}
	//获取日期
	public String getRq() {
		return rq;
	}
	//设置日期
	public void setRq(String rq) {
		this.rq = rq;
	}
	//获取主键
	public void setId(String id) {
	}
	//设置主键
	public String getId() {
		return null;
	}
}
