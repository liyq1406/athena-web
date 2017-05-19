package com.athena.ck.entity.beihuo;
/**
 * <p>
 * Title:根据出库单收货
 * </p>
 * <p>
 * Description:根据出库单收货Entity
 * </p>
 * <p>
 * Copyright: Copyright (c) 2011
 * </p>
 * <p>
 * Company: 软通动力
 * </p>
 * 
 * @author夏晖
 * @version v1.0
 * @date 2013-5-6
 */
public class Chukdsh {
/*
 * 零件数量
 */
private String lingjsl;
/*
 * 实发数量
 */
private String shifsl;
/*
 * UC号
 */
private String uch;
/*
 * 包装型号
 */
private String baozxh;
/*
 * 库位编号
 */
private String kuwbh;
/*
 *子仓库编号 
 */
private String zickbh;
public String getLingjsl() {
	return lingjsl;
}
public void setLingjsl(String lingjsl) {
	this.lingjsl = lingjsl;
}
public String getShifsl() {
	return shifsl;
}
public void setShifsl(String shifsl) {
	this.shifsl = shifsl;
}
public String getUch() {
	return uch;
}
public void setUch(String uch) {
	this.uch = uch;
}
public String getBaozxh() {
	return baozxh;
}
public void setBaozxh(String baozxh) {
	this.baozxh = baozxh;
}
public String getKuwbh() {
	return kuwbh;
}
public void setKuwbh(String kuwbh) {
	this.kuwbh = kuwbh;
}
public String getZickbh() {
	return zickbh;
}
public void setZickbh(String zickbh) {
	this.zickbh = zickbh;
}
}
