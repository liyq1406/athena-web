package com.athena.ck.entity.shouhuo;

public class Tongbyhl {
/**
 * 用户中心
 */
private String  usercenter;

/**
 * BL号
 */
private  String    blh;
/**
 * 卸货站台
 */
private  String     xiehzt;
/**
 *起始时间
 */
private  String     qissj;
/**
 * 终止时间
 */
private  String     zhongzsj;
/**
 * UT号
 */
private  String     uth;
/**
 * 承运商代码
 */
private  String     chengysdm;
/**
 * 仓库编号
 */
private  String     cangkbh;
/**
 * 包装单元卡号
 */
private String     yaohlh;
/**
 * 是否跳号
 */
private  String  shifth;
/**
 * UA号
 */
private  String   uah;
/**
 * 位置号
 */
private String   weizh;
/**
 * 整车流水号
 */
private  String zhengclsh;
/**
 * 零件编号
 */
private String  lingjbh;
/**
 *零件名称
 */
private  String lingjmc;
/**
 * 供应商代码
 */
private  String  gongysdm;
/**
 * 供应商名称
 */
private String  gongysmc;
/**
 * 零件数量
 */
private  String  lingjsl;
/**
 * 零件单位
 */
private String danw;
/**
 * 包装型号
 */
private String baozxh;
/**
 * 包装容量
 */
private  String  usxh;
/**
 * 整车上线时间
 */
private  String  zhengcsxsj;
/**
 *要货令状态 
 */
private  String  yaohlzt;
/**
 * 要货令状态属性
 */
private  String  yaohlztxx;

public String getYaohlztxx() {
	return yaohlztxx;
}
public void setYaohlztxx(String yaohlztxx) {
	if("00".equals(yaohlztxx)){
		this.yaohlztxx="C_YAOHL_00";
	}else if("01".equals(yaohlztxx)){
		this.yaohlztxx="C_YAOHL_01";
	}else if("02".equals(yaohlztxx)){
		this.yaohlztxx="C_YAOHLWB_02";
	}else if("03".equals(yaohlztxx)){
		this.yaohlztxx="C_YAOHLWB_03";
	}else if("05".equals(yaohlztxx)){
		this.yaohlztxx="C_YAOHL_05";
	}else if("07".equals(yaohlztxx)){
		this.yaohlztxx="C_YAOHL_07";
	}else if("08".equals(yaohlztxx)){
		this.yaohlztxx="C_YAOHL_08";
	}else if("09".equals(yaohlztxx)){
		this.yaohlztxx="C_YAOHL_09";
	}else{
	this.yaohlztxx = yaohlztxx;
	}
}
public String getYaohlzt() {
	return yaohlzt;
}
public void setYaohlzt(String yaohlzt) {
	this.yaohlzt = yaohlzt;
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
public String getQissj() {
	return qissj;
}
public void setQissj(String qissj) {
	this.qissj = qissj;
}
public String getZhongzsj() {
	return zhongzsj;
}
public void setZhongzsj(String zhongzsj) {
	this.zhongzsj = zhongzsj;
}
public String getUth() {
	return uth;
}
public void setUth(String uth) {
	this.uth = uth;
}
public String getChengysdm() {
	return chengysdm;
}
public void setChengysdm(String chengysdm) {
	this.chengysdm = chengysdm;
}
public String getCangkbh() {
	return cangkbh;
}
public void setCangkbh(String cangkbh) {
	this.cangkbh = cangkbh;
}
public String getYaohlh() {
	return yaohlh;
}
public void setYaohlh(String yaohlh) {
	this.yaohlh = yaohlh;
}
public String getShifth() {
	return shifth;
}
public void setShifth(String shifth) {
	this.shifth = shifth;
}
public String getUah() {
	return uah;
}
public void setUah(String uah) {
	this.uah = uah;
}
public String getWeizh() {
	return weizh;
}
public void setWeizh(String weizh) {
	this.weizh = weizh;
}
public String getZhengclsh() {
	return zhengclsh;
}
public void setZhengclsh(String zhengclsh) {
	this.zhengclsh = zhengclsh;
}
public String getLingjbh() {
	return lingjbh;
}
public void setLingjbh(String lingjbh) {
	this.lingjbh = lingjbh;
}
public String getLingjmc() {
	return lingjmc;
}
public void setLingjmc(String lingjmc) {
	this.lingjmc = lingjmc;
}
public String getGongysdm() {
	return gongysdm;
}
public void setGongysdm(String gongysdm) {
	this.gongysdm = gongysdm;
}
public String getGongysmc() {
	return gongysmc;
}
public void setGongysmc(String gongysmc) {
	this.gongysmc = gongysmc;
}
public String getLingjsl() {
	return lingjsl;
}
public void setLingjsl(String lingjsl) {
	this.lingjsl = lingjsl;
}
public String getDanw() {
	return danw;
}
public void setDanw(String danw) {
	this.danw = danw;
}
public String getUsercenter() {
	return usercenter;
}
public void setUsercenter(String usercenter) {
	this.usercenter = usercenter;
}
public String getBaozxh() {
	return baozxh;
}
public void setBaozxh(String baozxh) {
	this.baozxh = baozxh;
}
public String getUsxh() {
	return usxh;
}
public void setUsxh(String usxh) {
	this.usxh = usxh;
}
public String getZhengcsxsj() {
	return zhengcsxsj;
}
public void setZhengcsxsj(String zhengcsxsj) {
	this.zhengcsxsj = zhengcsxsj;
}




}
