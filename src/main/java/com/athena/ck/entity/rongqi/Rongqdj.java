package com.athena.ck.entity.rongqi;
/**
 * <p>
 * Title:容器单据
 * </p>
 * <p>
 * Description:容器单据
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
public class Rongqdj {
	//单据编号
	private String danjbh;
	//修改时间:日期(edit_time)
	private String riq;
	//修改时间:时间(edit_time)
	private String shij;
	//容器型号
	private String rongqlx;
	//容器数量
	private String rongqsl;
	//物理点
	private String wuld;
	//制造商
	private String zhizsdm;
	//摘要
	private String zaiy;
	//来源
	private String laiy;
	//卡车号
	private String tch;	
	//创建人
	private String creator;
	
	//次数
	private String cishu;	
	
	
	
	public String getCishu() {
		return cishu;
	}
	public void setCishu(String cishu) {
		this.cishu = cishu;
	}
	public String getCreator() {
		return creator;
	}
	public void setCreator(String creator) {
		this.creator = creator;
	}
	public String getTch() {
		return tch;
	}
	public void setTch(String tch) {
		this.tch = tch;
	}
	
	public String getLaiy() {
		return laiy;
	}
	public void setLaiy(String laiy) {
		this.laiy = laiy;
	}
	
	public String getDanjbh() {
		return danjbh;
	}
	public void setDanjbh(String danjbh) {
		this.danjbh = danjbh;
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
	public String getRongqlx() {
		return rongqlx;
	}
	public void setRongqlx(String rongqlx) {
		this.rongqlx = rongqlx;
	}
	public String getRongqsl() {
		return rongqsl;
	}
	public void setRongqsl(String rongqsl) {
		this.rongqsl = rongqsl;
	}
	public String getWuld() {
		return wuld;
	}
	public void setWuld(String wuld) {
		this.wuld = wuld;
	}
	public String getZhizsdm() {
		return zhizsdm;
	}
	public void setZhizsdm(String zhizsdm) {
		this.zhizsdm = zhizsdm;
	}
	public String getZaiy() {
		return zaiy;
	}
	public void setZaiy(String zaiy) {
		this.zaiy = zaiy;
	}
}
