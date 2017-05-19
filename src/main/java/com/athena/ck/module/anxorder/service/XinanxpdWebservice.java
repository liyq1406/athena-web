package com.athena.ck.module.anxorder.service;

import java.math.BigDecimal;
import java.util.List;

import com.athena.ck.entity.anxorder.NoAnxjssjException;
import com.athena.ck.entity.anxorder.Pand;
import com.athena.ck.entity.anxorder.TranslateListToMapException;
import com.athena.ck.entity.anxorder.Xiaohcxhdmb;
import com.athena.ck.entity.anxorder.XinAnxpd;

//@WebService
public interface XinanxpdWebservice {
	/**
	 * @SEE   将CDMD上次计算时间以及线边理论库存初始化到pandModels内
	 * @param pandModels
	 * @return
	 * @throws NoAnxjssjException
	 */
	public List<XinAnxpd> initXinAnxpd(List<XinAnxpd> xinanxpds) throws NoAnxjssjException , TranslateListToMapException ;

	
	/**
	 * 计算待消耗
	 * @param pandModels
	 * @throws TranslateListToMapException
	 */
	public BigDecimal jsDxh(Xiaohcxhdmb xhc, Pand pand);

	/**
	 * 计算盈余量
	 * @param pandModels
	 * @throws TranslateListToMapException
	 */
	public BigDecimal jsYingyl(XinAnxpd xinanxpd);

	
	/**
	 * 保存盘点结果信息
	 * @param pandModels
	 * @throws TranslateListToMapException
	 */
	public void savePandModel(List<XinAnxpd> pandModels) throws TranslateListToMapException;
}
