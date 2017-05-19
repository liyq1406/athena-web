package com.athena.ck.entity.clrc;

/**
 * <p>
 * Title:空车出厂单
 * @author xss
 * @date 2015-3-12
 */
public class KongChuc {
	
	private String usercenter;  //用户中心
	
	private String danjbh;		//单据编号
	
	private String fanhdh; 
	
	private String huoch;		//卡车号
	
	private String zhuangt;  //状态
	
	private String creator;     //创建者
	
	private String create_time;  //创建时间
	
	
	private String cangkbh; //仓库编号
	
	private String uth;
	
	private String blh;
	
	private String xiehzt;
	
	
	
	
	public String getFanhdh() {
		return fanhdh;
	}

	public void setFanhdh(String fanhdh) {
		this.fanhdh = fanhdh;
	}

	public String getCangkbh() {
		return cangkbh;
	}

	public void setCangkbh(String cangkbh) {
		this.cangkbh = cangkbh;
	}

	public String getUth() {
		return uth;
	}

	public void setUth(String uth) {
		this.uth = uth;
	}

	public String getBlh() {
		return blh;
	}

	public void setBlh(String blh) {
		this.blh = blh;
	}

	public String getXiehzt() {
		return xiehzt;
	}

	public void setXiehzt(String xiehzt) {
		this.xiehzt = xiehzt;
	}

	public String getHuoch() {
		return huoch;
	}

	public void setHuoch(String huoch) {
		this.huoch = huoch;
	}

	public String getUsercenter() {
		return usercenter;
	}

	public void setUsercenter(String usercenter) {
		this.usercenter = usercenter;
	}

	public String getDanjbh() {
		return danjbh;
	}

	public void setDanjbh(String danjbh) {
		this.danjbh = danjbh;
	}
	

	public String getZhuangt() {
		return zhuangt;
	}

	public void setZhuangt(String zhuangt) {
		this.zhuangt = zhuangt;
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
	
	
	
}
