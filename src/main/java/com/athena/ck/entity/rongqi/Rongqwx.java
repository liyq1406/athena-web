package com.athena.ck.entity.rongqi;
/**
 * <p>
 * Title:容器维修
 * </p>
 * <p>
 * Description:容器维修
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
 * @date 2012-5-22
 */
public class Rongqwx {
	//维修单号
	private String weixdh;
	//修改时间:日期(edit_time)
	private String riq;
	//修改时间:时间(edit_time)
	private String shij;
	//容器型号
	private String rqxh;
	//容器数量
	private String shul;
	//物理点
	private String wld;
	//维修摘要
	private String yuany;
	
	//申请部门
	private String shenqbm;
	private String yjwcsj;
	
	public String getShenqbm() {
		return shenqbm;
	}
	public void setShenqbm(String shenqbu) {
		this.shenqbm = shenqbu;
	}
	public String getYjwcsj() {
		return yjwcsj;
	}
	public void setYjwcsj(String yjwcsj) {
		this.yjwcsj = yjwcsj;
	}
	public String getWeixdh() {
		return weixdh;
	}
	public void setWeixdh(String weixdh) {
		this.weixdh = weixdh;
	}
	public String getRiq() {
		return riq;
	}
	public void setRiq(String riq) {
		this.riq = riq;
	}
	public String getShij() {
		return shij;
	}
	public void setShij(String shij) {
		this.shij = shij;
	}
	public String getRqxh() {
		return rqxh;
	}
	public void setRqxh(String rqxh) {
		this.rqxh = rqxh;
	}
	public String getShul() {
		return shul;
	}
	public void setShul(String shul) {
		this.shul = shul;
	}
	public String getWld() {
		return wld;
	}
	public void setWld(String wld) {
		this.wld = wld;
	}
	public String getYuany() {
		return yuany;
	}
	public void setYuany(String yuany) {
		this.yuany = yuany;
	}
}
