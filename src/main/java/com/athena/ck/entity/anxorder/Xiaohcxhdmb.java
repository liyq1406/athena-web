package com.athena.ck.entity.anxorder;

import com.toft.core3.support.PageableSupport;

public class Xiaohcxhdmb extends PageableSupport {
	
    private String usercenter;	//用户中心
    
    private String shengcxbh;	//生产线编号
    
    private String lingjbh;
    
	private String xiaohcbh;	//小火车编号

    private Short tangc;	//趟次
    
    private String xiaohdbh;	//消耗点编号
    
    private String xiaohcrq;	//小火车日期

    private Long kaislsh;	//开始流水号

    private Long jieslsh;	//结束流水号
    
    public Short getTangc() {
        return tangc;
    }

    public void setTangc(Short tangc) {
        this.tangc = tangc;
    }

    public String getUsercenter() {
        return usercenter;
    }

    public void setUsercenter(String usercenter) {
        this.usercenter = usercenter == null ? null : usercenter.trim();
    }

    public String getXiaohcbh() {
        return xiaohcbh;
    }

    public void setXiaohcbh(String xiaohcbh) {
        this.xiaohcbh = xiaohcbh == null ? null : xiaohcbh.trim();
    }

    public String getXiaohcrq() {
        return xiaohcrq;
    }

    public void setXiaohcrq(String xiaohcrq) {
        this.xiaohcrq = xiaohcrq == null ? null : xiaohcrq.trim();
    }

    public String getXiaohdbh() {
        return xiaohdbh;
    }

    public void setXiaohdbh(String xiaohdbh) {
        this.xiaohdbh = xiaohdbh == null ? null : xiaohdbh.trim();
    }
    
   

    public String getShengcxbh() {
        return shengcxbh;
    }

    public void setShengcxbh(String shengcxbh) {
        this.shengcxbh = shengcxbh == null ? null : shengcxbh.trim();
    }

    public Long getKaislsh() {
        return kaislsh;
    }

    public void setKaislsh(Long kaislsh) {
        this.kaislsh = kaislsh;
    }

    public Long getJieslsh() {
        return jieslsh;
    }

    public void setJieslsh(Long jieslsh) {
        this.jieslsh = jieslsh;
    }
    
    public String getLingjbh() {
		return lingjbh;
	}

	public void setLingjbh(String lingjbh) {
		this.lingjbh = lingjbh;
	}
}