package com.athena.ck.entity.yaohl;

import com.athena.component.entity.Domain;
import com.toft.core3.support.PageableSupport;

/**
 * 仓库要货令实体
 * @author 贺志国
 * @E-mail zghe@isoftstone.com
 * @version v1.0
 * @date 2014-10-31
 */
public class Yaohls extends PageableSupport implements Domain{

	private String usercenter;    //用户中心
	private String yaohlh;        //要货令号
	private String yaohllx;       //要货令类型
	private String yaohlzt;       //要货令状态
	private String chanx;         //产线
	private String mudd;          //目的地
	private String lingjbh;       //零件编号
	private String lingjmc;       //零件名称
	private String baozxh;        //包装型号
	private String yaohsl;        //要货数量
	private String daijfsl;       //待交付数量
	private String dingdh;        //订单号
	private String gongysdm;      //供应商代码
	private String chengysdm;     //承运商代码
	private String cangkbh;       //仓库编号
	private String zick;          //子仓库编号
	private String yaohlscsj;     //要货令生成时间
	private String zuiwsj;        //最晚时间
	private String jiaofj;        //交付时间
	private String jiaofzt;       //交付状态
	private String beihsj;        //备货时间
	private String shangxsj;      //上线时间
	private String xiaohch;       //小火车编号
	private String tangc;         //趟次
	private String chex;          //车厢
	private String shij;          //时间
	private String qissj;         //起始时间
	private String jiessj;        //结束时间
	
	private String qiandYaohlh;    //前段要货令
	private String qiandYaohlhzt;  //前段要货令状态
	private String houdYaohlh;     //后段要货令
	private String houdYaohlhzt;   //后段要货令状态
	private String qiandJiaofsl;   //前段交付数量
	private String houdJiaofsl;    //后段交付数量
	private String dinghCangkbh;   //订货仓库编号
	private String dinghZick;      //订货子仓库编号
	private String xianbCangkbh;   //线边仓库编号
	private String xianbZick;      //线边子仓库
	private String yaohlbdsj;      //要货令表达时间
	private String qiandYjjfsj;    //前段预计交付时间
	private String qiandSjjfsj;    //前段实际交付时间
	private String qiandDdzt;      //前段到达状态
	private String xiaohcBhsj;     //小火车备货时间
	private String xiaohcYjsxsj;   //小火车预计上线时间
	private String xiaohcSjsxsj;   //小火车实际上线时间
	
	
	
	public String getQiandYaohlh() {
		return qiandYaohlh;
	}

	public void setQiandYaohlh(String qiandYaohlh) {
		this.qiandYaohlh = qiandYaohlh;
	}

	public String getQiandYaohlhzt() {
		return qiandYaohlhzt;
	}

	public void setQiandYaohlhzt(String qiandYaohlhzt) {
		this.qiandYaohlhzt = qiandYaohlhzt;
	}

	public String getHoudYaohlh() {
		return houdYaohlh;
	}

	public void setHoudYaohlh(String houdYaohlh) {
		this.houdYaohlh = houdYaohlh;
	}

	public String getHoudYaohlhzt() {
		return houdYaohlhzt;
	}

	public void setHoudYaohlhzt(String houdYaohlhzt) {
		this.houdYaohlhzt = houdYaohlhzt;
	}

	public String getQiandJiaofsl() {
		return qiandJiaofsl;
	}

	public void setQiandJiaofsl(String qiandJiaofsl) {
		this.qiandJiaofsl = qiandJiaofsl;
	}

	public String getHoudJiaofsl() {
		return houdJiaofsl;
	}

	public void setHoudJiaofsl(String houdJiaofsl) {
		this.houdJiaofsl = houdJiaofsl;
	}

	public String getDinghCangkbh() {
		return dinghCangkbh;
	}

	public void setDinghCangkbh(String dinghCangkbh) {
		this.dinghCangkbh = dinghCangkbh;
	}

	public String getDinghZick() {
		return dinghZick;
	}

	public void setDinghZick(String dinghZick) {
		this.dinghZick = dinghZick;
	}

	public String getXianbCangkbh() {
		return xianbCangkbh;
	}

	public void setXianbCangkbh(String xianbCangkbh) {
		this.xianbCangkbh = xianbCangkbh;
	}

	public String getXianbZick() {
		return xianbZick;
	}

	public void setXianbZick(String xianbZick) {
		this.xianbZick = xianbZick;
	}

	public String getYaohlbdsj() {
		return yaohlbdsj;
	}

	public void setYaohlbdsj(String yaohlbdsj) {
		this.yaohlbdsj = yaohlbdsj;
	}

	public String getQiandYjjfsj() {
		return qiandYjjfsj;
	}

	public void setQiandYjjfsj(String qiandYjjfsj) {
		this.qiandYjjfsj = qiandYjjfsj;
	}

	public String getQiandSjjfsj() {
		return qiandSjjfsj;
	}

	public void setQiandSjjfsj(String qiandSjjfsj) {
		this.qiandSjjfsj = qiandSjjfsj;
	}

	public String getQiandDdzt() {
		return qiandDdzt;
	}

	public void setQiandDdzt(String qiandDdzt) {
		this.qiandDdzt = qiandDdzt;
	}

	public String getXiaohcBhsj() {
		return xiaohcBhsj;
	}

	public void setXiaohcBhsj(String xiaohcBhsj) {
		this.xiaohcBhsj = xiaohcBhsj;
	}

	public String getXiaohcYjsxsj() {
		return xiaohcYjsxsj;
	}

	public void setXiaohcYjsxsj(String xiaohcYjsxsj) {
		this.xiaohcYjsxsj = xiaohcYjsxsj;
	}

	public String getXiaohcSjsxsj() {
		return xiaohcSjsxsj;
	}

	public void setXiaohcSjsxsj(String xiaohcSjsxsj) {
		this.xiaohcSjsxsj = xiaohcSjsxsj;
	}

	public String getUsercenter() {
		return usercenter;
	}

	public void setUsercenter(String usercenter) {
		this.usercenter = usercenter;
	}

	public String getYaohlh() {
		return yaohlh;
	}

	public void setYaohlh(String yaohlh) {
		this.yaohlh = yaohlh;
	}

	public String getYaohllx() {
		return yaohllx;
	}

	public void setYaohllx(String yaohllx) {
		this.yaohllx = yaohllx;
	}

	public String getYaohlzt() {
		return yaohlzt;
	}

	public void setYaohlzt(String yaohlzt) {
		this.yaohlzt = yaohlzt;
	}

	public String getChanx() {
		return chanx;
	}

	public void setChanx(String chanx) {
		this.chanx = chanx;
	}

	public String getMudd() {
		return mudd;
	}

	public void setMudd(String mudd) {
		this.mudd = mudd;
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

	public String getBaozxh() {
		return baozxh;
	}

	public void setBaozxh(String baozxh) {
		this.baozxh = baozxh;
	}

	public String getYaohsl() {
		return yaohsl;
	}

	public void setYaohsl(String yaohsl) {
		this.yaohsl = yaohsl;
	}

	public String getDaijfsl() {
		return daijfsl;
	}

	public void setDaijfsl(String daijfsl) {
		this.daijfsl = daijfsl;
	}

	public String getDingdh() {
		return dingdh;
	}

	public void setDingdh(String dingdh) {
		this.dingdh = dingdh;
	}

	public String getGongysdm() {
		return gongysdm;
	}

	public void setGongysdm(String gongysdm) {
		this.gongysdm = gongysdm;
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

	public String getZick() {
		return zick;
	}

	public void setZick(String zick) {
		this.zick = zick;
	}

	public String getYaohlscsj() {
		return yaohlscsj;
	}

	public void setYaohlscsj(String yaohlscsj) {
		this.yaohlscsj = yaohlscsj;
	}

	public String getZuiwsj() {
		return zuiwsj;
	}

	public void setZuiwsj(String zuiwsj) {
		this.zuiwsj = zuiwsj;
	}

	public String getJiaofj() {
		return jiaofj;
	}

	public void setJiaofj(String jiaofj) {
		this.jiaofj = jiaofj;
	}

	public String getJiaofzt() {
		return jiaofzt;
	}

	public void setJiaofzt(String jiaofzt) {
		this.jiaofzt = jiaofzt;
	}

	public String getBeihsj() {
		return beihsj;
	}

	public void setBeihsj(String beihsj) {
		this.beihsj = beihsj;
	}

	public String getShangxsj() {
		return shangxsj;
	}

	public void setShangxsj(String shangxsj) {
		this.shangxsj = shangxsj;
	}

	public String getXiaohch() {
		return xiaohch;
	}

	public void setXiaohch(String xiaohch) {
		this.xiaohch = xiaohch;
	}

	public String getTangc() {
		return tangc;
	}

	public void setTangc(String tangc) {
		this.tangc = tangc;
	}

	public String getChex() {
		return chex;
	}

	public void setChex(String chex) {
		this.chex = chex;
	}

	public String getShij() {
		return shij;
	}

	public void setShij(String shij) {
		this.shij = shij;
	}

	public String getQissj() {
		return qissj;
	}

	public void setQissj(String qissj) {
		this.qissj = qissj;
	}

	public String getJiessj() {
		return jiessj;
	}

	public void setJiessj(String jiessj) {
		this.jiessj = jiessj;
	}

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	public String getId() {
		// TODO Auto-generated method stub
		return null;
	}

	
	public void setId(String arg0) {
		// TODO Auto-generated method stub
		
	}

	 
	 

}
