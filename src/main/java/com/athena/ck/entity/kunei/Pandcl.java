package com.athena.ck.entity.kunei;

import java.util.Date;

/**
 * <p>
 * Title:盘点策略
 * </p>
 * <p>
 * Description:定义盘点策略实体类
 * </p>
 * <p>
 * Copyright: Copyright (c) 2011
 * </p>
 * <p>
 * Company: 软通动力
 * </p>
 * 
 * @author 甘露
 * @version v1.0
 * @date 2012-03-01
 */
public class Pandcl {
	private String cangkbh;
	private String celbh;
	private String pandzq;
	
	/**
	 * 返回仓库编号
	 * 
	 * @return the cangkbh
	 */
	public String getCangkbh() {
		return cangkbh;
	}
	
	/**
	 * 设置仓库编号
	 * 
	 * @param cangkbh
	 *            the cangkbh to set
	 */
	public void setCangkbh(String cangkbh) {
		this.cangkbh = cangkbh;
	}
	
	/**
	 * 返回策略编号
	 * 
	 * @return the celbh
	 */
	public String getCelbh() {
		return celbh;
	}
	
	/**
	 * 设置策略编号
	 * 
	 * @param celbh
	 *            the celbh to set
	 */
	public void setCelbh(String celbh) {
		this.celbh = celbh;
	}
	
	/**
	 * 返回盘点周期
	 * 
	 * @return the pandzq
	 */
	public String getPandzq() {
		return pandzq;
	}
	
	/**
	 * 设置盘点周期
	 * 
	 * @param pandzq
	 *            the pandzq to set
	 */
	public void setPandzq(String pandzq) {
		this.pandzq = pandzq;
	}
}
