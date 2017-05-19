package com.athena.ck.module.anxorder.service;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

import com.athena.ck.entity.anxorder.AnxjssjSjerrException;
import com.athena.ck.entity.anxorder.NoAnxjssjException;
import com.athena.ck.entity.anxorder.Pand;
import com.athena.ck.entity.anxorder.TranslateListToMapException;
import com.athena.ck.entity.anxorder.Xiaohcxhdmb;
import com.athena.ck.entity.anxorder.XinAnxpd;
import com.athena.component.service.BaseService;
import com.athena.db.ConstantDbCode;
import com.toft.core3.container.annotation.Component;
import com.toft.core3.support.PageableSupport;


@Component
public class XinAnxpdService extends BaseService{
	private Logger logger = Logger.getLogger(XinAnxpdService.class);
	/*
	 	1、	线边盘点时间为线边盘点开始计算时间。
		2、	按需订单计算时间如下：条件为用户中心、订单号。
			select to_char(d.dingdjssj,'yyyy-mm-dd hh24:mi:ss') dingdjssj  
			from xqjs_dingdjssj d 
			where d.usercenter='VD' 
			and d.dingdbh='C1DDD0007';
		3、	插入或更新盘点表为xqjs_kucjscsb.
	 */

	/**
	 * @see   查询盘点信息
	 * @param pageBean
	 * @param params
	 * @return
	 */
	public Map<String, Object> pdquery(PageableSupport pageBean, Map<String, String> params)
	{
		//init 变量
		Map<String, Object> map = new HashMap<String, Object>();
		StringBuffer errorSb = new StringBuffer();
		List<XinAnxpd> pandMdelByCD = new ArrayList<XinAnxpd>();
		List<XinAnxpd> pandMdelByCS = new ArrayList<XinAnxpd>();
		List<XinAnxpd> pandMdelAll = new ArrayList<XinAnxpd>();
		//检查参数
		if(checkPdqueryParam(params))
		{
			map.put("message", "零件编号与消耗点编号必填一项!");
		}
		else
		{
			//查询消耗点信息
			map = baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).selectPages("xinanxpd.queryPandinfo", params, pageBean);
			if(null != map)
			{
				//查询盘点信息
				List<XinAnxpd> xinAnxpdMdels = (List<XinAnxpd>) map.get("rows");
				if(null != xinAnxpdMdels && xinAnxpdMdels.size() > 0)
				{
					//区分C0 CD模式
					for (XinAnxpd xinAnxpdMdel : xinAnxpdMdels)
					{
						String mos = xinAnxpdMdel.getMos();
						if(StringUtils.isNotBlank(mos)){
							if(mos.equalsIgnoreCase("CD")){
								pandMdelByCD.add(xinAnxpdMdel);
							}else if(mos.equalsIgnoreCase("CS")){
								pandMdelByCS.add(xinAnxpdMdel);
							}
						}
					}
					//初始盘点数据
					if(pandMdelByCD.size() > 0)
					{
						//初始CD盘点数据
						try
						{
							pandMdelByCD = this.queryCDPandmodel(pandMdelByCD);
						}
						catch (TranslateListToMapException e)
						{
							pandMdelByCD = null;
							errorSb.append("调用wevservice时,进行list转map过程中出现错误,请联系管理员!");
							logger.error(errorSb.toString()+e.getMessage());
						}
						catch (NoAnxjssjException e)
						{
							pandMdelByCD = null;
							errorSb.append("调用wevservice时,查询CDMD按需上次计算时间有误,请联系管理员!");
							logger.error(errorSb.toString()+e.getMessage());
						}
						catch (Exception e) 
						{
							pandMdelByCD = null;
							errorSb.append("调用wevservice时出现错误,情况可能为(网络中断等..),请联系管理员!");
							logger.error(errorSb.toString()+e.getMessage());
						}
					}
					if(null != pandMdelByCS && pandMdelByCS.size() > 0)
					{
						pandMdelAll.addAll(pandMdelByCS);
					}
					if(null != pandMdelByCD && pandMdelByCD.size() > 0)
					{
						pandMdelAll.addAll(pandMdelByCD);
					}
					if(errorSb.length() > 0)
					{
						map.put("message", errorSb.toString());
					}
					map.put("rows",pandMdelAll);
				}
			}
		}
		return map;
	}
	
	/**
	 * 判断总装流水号,盘点计算入口
	 * 1.输入总装流水号（或焊装流水号）并验证总装流水号（或焊装流水号）是否存在ck_zhengcgd表（或ck_hanzgd表）中，
	 * 		不存在则退出并提示用户。
	 * （1）	查询零件所对应的总装流水号（或焊装流水号）是否存在。
		select count(1) from ck_zhengcgd z where z.usercenter='UL' and z.zongzlsh='1E1050244' and z.shengcx='UL5L1';
	 */
	@SuppressWarnings("unchecked")
	public Map pandLiush(Map paramMap, Pand pand)
	{
		if(null == pand){
			return null;
		}
		String checkLsh = null;
		Map resultMap = new HashMap();
		StringBuffer error = new StringBuffer("您选取的数据中: ");
		StringBuffer errorSb = new StringBuffer();
		
		if(StringUtils.isBlank(paramMap.get("usercenter").toString()))
		{
			errorSb.append("用户中心为空!");
		}
		if(StringUtils.isBlank(paramMap.get("zhengclsh").toString()))
		{
			errorSb.append("总装流水号为空!");
		}
		if(StringUtils.isBlank(paramMap.get("lingjbh").toString()))
		{
			errorSb.append("零件编号为空!");
		}
		if(StringUtils.isBlank(paramMap.get("xiaohd").toString()))
		{
			errorSb.append("消耗点为空!");
		}
		if(StringUtils.isBlank(paramMap.get("shengcxbh").toString()))
		{
			errorSb.append("产线为空!");
		}
		
		String anxscjssj = (String) paramMap.get("anxscjssj");
		if(!pand.equals(Pand.CS))
		{
			if(StringUtils.isBlank(anxscjssj))
			{
				errorSb.append("上次计算时间为空!");
			}
		}
		
		String scx = paramMap.get("shengcxbh").toString().substring(2,3);
		if(scx.equals("2")){
			checkLsh = "xinanxpd.hzcheckLsh";
		}else{
			checkLsh = "xinanxpd.zzcheckLsh";
		}
		
		if(errorSb.length() > 0)
		{
			error.append(errorSb);
			resultMap.put("message", error.toString());
		}
		else
		{
			if(!pand.equals(Pand.CS))
			{
				String flagTime1 = anxscjssj.substring(0, 10);
				String flagTime2 = anxscjssj.substring(11, anxscjssj.length());
				paramMap.put("anxscjssj",flagTime1 + " " + flagTime2);
			}
			
			Integer countLsh = (Integer) baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).selectObject(checkLsh, paramMap);
			//流水号正确
			if(null != countLsh && countLsh > 0){
				Map masterMap = this.masterJs(paramMap, pand);
				XinAnxpd xinAnxpd = (XinAnxpd)masterMap.get("xinAnxpd");
				if(null != xinAnxpd){
					resultMap.put("result", xinAnxpd);
				}else{
					error.append("查询流水号有误,请联系管理人员!");
					resultMap.put("message", error.toString());
				}
			}else{
				error.append("流水号不存在!");
				resultMap.put("message", error.toString());
			}
		}
		return resultMap;
	}
	
	
	/**
	 * 获取整车序号
	 * 2.根据整车流水号（或焊装流水号）在ck_zhengcgd表（或ck_hanzgd表）中找出对应的整车序号（或焊装序号），
	 * 条件：用户中心、总装流水号（或焊装流水号）、零件、消耗点。
	 * 
	 * 整车流水号/总装流水号:车在生产线上的编号
	 * 整车序号：程序自己生成的，车辆进总装6000点时生成的序号
	 * 
	 * （2）	如果是总装流水号则根据总装流水号、过点数6000在整车过点表（ck_zhengcgd）中找出对应的整车序号。
		select z.zhengcxh 
		from ck_zhengcgd z 
		where z.usercenter='UL' 
		and z.wuld='6000' 
		and z.zongzlsh='1E1050244' 
		and z.shengcx='UL5L1';
		其中：wuld为默认值，zongzlsh、shengcx为页面输入值
	 */
	
	public Map getZhengcxh(Map paramMap)
	{
		Map resultMap = new HashMap();
		StringBuffer error = new StringBuffer("您选取的数据中: ");
		StringBuffer errorSb = new StringBuffer();
		
		if(StringUtils.isBlank((String)paramMap.get("usercenter")))
		{
			errorSb.append("用户中心为空!");
		}
		if(StringUtils.isBlank((String)paramMap.get("zhengclsh")))
		{
			errorSb.append("总装流水号为空!");
		}
		if(StringUtils.isBlank((String)paramMap.get("lingjbh")))
		{
			errorSb.append("零件编号为空!");
		}
		if(StringUtils.isBlank((String)paramMap.get("xiaohd")))
		{
			errorSb.append("消耗点为空!");
		}
		if(StringUtils.isBlank((String)paramMap.get("shengcxbh")))
		{
			errorSb.append("生产线为空!");
		}
		
		if(errorSb.length() > 0)
		{
			error.append(errorSb);
			resultMap.put("message", error.toString()); 
		}else{
			String scx = paramMap.get("shengcxbh").toString().substring(2,3);
			String checkZhengcxh = null;
			if(scx.equals("2")){
				checkZhengcxh = "xinanxpd.hzzhengcxh";
			}else{
				checkZhengcxh = "xinanxpd.zzzhengcxh";
			}
			Integer zhengcxh = (Integer) baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).selectObject(checkZhengcxh, paramMap);
			if(null != zhengcxh && zhengcxh > 0)
			{
				resultMap.put("result", zhengcxh);
			}
			else
			{
				error.append("查询整车序号有误,请联系管理人员!");
				resultMap.put("message", error.toString());
			}
		}
		return resultMap;
	}
	
	/**
	 * 推算小火车,趟次
	 * 3.根据整车序号（焊装序号）推算出消耗点-小火车模拟表 ddbh_xiaohcxhdmb  表中起始流水号和结束流水号对应的小火车及趟次，
	 * 条件：用户中心、消耗点、产线、整车序号（或焊装序号）。
	 * 
	 * （3）	如果是焊装流水号则根据焊装流水号、过点数1000在焊装过点表（ck_hanzgd）中找出对应的焊装序号。
	 * （4）	根据根据用户中心、生产线、消耗点、整车序号在小火车-消耗点模板表ddbh_xiaohcxhdmb中找出对应的小火车的起始流水号、结束流水号，并确定小火车、趟次。
		select x. usercenter ,x. shengcxbh ,x. xiaohdbh,x. xiaohcbh,x. tangc,x. xiaohcrq,x. kaislsh,x. jieslsh 
		from ddbh_xiaohcxhdmb x 
		where x.usercenter='UL' 
		and x.shengcxbh='UL5L1' 
		and x.xiaohdbh=' L95F004BN ' 
		and (kaislsh<=整车序号 and jieslsh>=整车序号)
	 */
	public Map getXiaohctc(Map paramMap)
	{
		Map resultMap = new HashMap();
		StringBuffer error = new StringBuffer("您选取的数据中: ");
		StringBuffer errorSb = new StringBuffer();
		String usercenter = (String) paramMap.get("usercenter");
		String xiaohd = (String) paramMap.get("xiaohd");
		String zhengclsh = (String) paramMap.get("zhengclsh");
		String lingjbh = (String) paramMap.get("lingjbh");
		
		if(StringUtils.isBlank(usercenter))
		{
			errorSb.append("用户中心为空!");
		}
		if(StringUtils.isBlank(xiaohd))
		{
			errorSb.append("消耗点为空!");
		}
		if(StringUtils.isBlank(lingjbh))
		{
			errorSb.append("生产线编号为空!");
		}
		if(StringUtils.isBlank(zhengclsh))
		{
			errorSb.append("整车流水号为空!");
		}
		
		if(errorSb.length() > 0)
		{
			error.append(errorSb);
			resultMap.put("message", error.toString());
		}
		else
		{
			paramMap.put("zhengcxh", getZhengcxh(paramMap).get("result"));
			String xiaohcxhdmbStr = "xinanxpd.xiaohcAndTangc";
			Xiaohcxhdmb xiaohcxhdmb = (Xiaohcxhdmb)baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).selectObject(xiaohcxhdmbStr, paramMap);
			if(null != paramMap.get("zhengcxh")&& null != xiaohcxhdmb)
			{
				resultMap.put("result", xiaohcxhdmb);
			}
			else
			{
				error.append("查询小火车,趟次有误,请联系管理人员!");
				resultMap.put("message", error.toString());
			}
		}
		return resultMap;
	}
	
	/**
	 * 归集出待交付零件数量
	 * 4.归集出待交付零件数量，查询ck_yaonbhl，
	 * 条件：用户中心、零件、消耗点、要货令状态（不为00或05）。
	 * 
	 * 待交付：根据用户中心、零件、消耗点（MUDD&MUDDLX=1）或仓库（MUDD&MUDDLX=2）在内部要货令表中找出所有待交付的要货令数量（要货令状态不为00或05）
		要货令状态：00:已交付，01:表达，02:在途，03:等待交付，04:延迟交付，05:已终止
		目标表为：ck_yaonbhl
		
		页面上的字段“模式”值如果为CD的，MUDD为消耗点，MUDDLX=1；
		如果为MD，则MUDD为仓库，MUDDLX=2

	 */
	private BigDecimal jsDaijf(Map paramMap, Pand pand)
	{
		String daijfStr = "xinanxpd.queryDefaultDaijf";
		BigDecimal daijf = (BigDecimal)baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).selectObject(daijfStr, paramMap);
		if(null == daijf){
			return BigDecimal.ZERO;
		}
		return daijf;
	}
	
	
	/**
	 * 归集待消耗
	 * 5.归集待消耗.webservice查询xqjs_anxmaoxq_jl，找出订单上次计算时间后的所有打标的JL毛需求并汇总毛需求，
	 * 条件：用户中心、零件、消耗点、总装焊装标识、小火车日期、小火车、趟次。
	 * @throws Exception 
	 */
	public BigDecimal jsDxh(Xiaohcxhdmb xhc, Pand pand) throws Exception 
	{
		XinanxpdWebserviceUtil pandWebserviceUtil = new XinanxpdWebserviceUtil();
		return pandWebserviceUtil.jsDxh(xhc, pand);
	}
	
	public BigDecimal jsYingyl(Xiaohcxhdmb xhc, Pand pand, Map paramMap) throws Exception 
	{
		//mantis:  20161202 by CSY CS模式直接查询执行层线边库存CS表
		BigDecimal yingy = BigDecimal.ZERO;
		if (pand != null && pand.equals(Pand.CS)) {
			yingy = (BigDecimal)baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).selectObject("xinanxpd.queryDefaultYingyl", paramMap);
			if (yingy == null) {
				yingy = BigDecimal.ZERO;
			}
		}else {
			XinAnxpd xax = new XinAnxpd();
			xax.setUsercenter(xhc.getUsercenter());
			xax.setLingjbh(xhc.getLingjbh());
			xax.setXiaohd(xhc.getXiaohdbh());	
			xax.setShengcxbh(xhc.getShengcxbh());
			XinanxpdWebserviceUtil pandWebserviceUtil = new XinanxpdWebserviceUtil();
			yingy = pandWebserviceUtil.jsYingyl(xax);
		}
		return yingy;
	}
	
	/**
	 * @see   计算异常待消耗
	 * @param paramMap
	 * @param pand
	 * @return
	 */
	private BigDecimal jsYicdxh(Map paramMap , Pand pand)
	{
		if(null == pand){
			return BigDecimal.ZERO;
		}
		//String queryYicdxh = "xianbkc.queryDefaultYicdxh";
		String queryYicdxh = "xinanxpd.queryDefaultYicdxhCS";
		BigDecimal yicdxh = BigDecimal.ZERO;
//		if(pand.equals(Pand.CD))
//		{
//			
//		}
//		else if(pand.equals(Pand.CS))
//		{
//			String queryYicdxh = "xinanxpd.queryDefaultYicdxhCS";
//			yicdxh = (BigDecimal)baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).selectObject(queryYicdxh, paramMap);
//			if(null == yicdxh){
//				yicdxh = BigDecimal.ZERO;
//			}
//			return yicdxh;
//		}
		if(StringUtils.isNotBlank(queryYicdxh))
		{
			yicdxh = (BigDecimal)baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).selectObject(queryYicdxh, paramMap);	
			if(null == yicdxh)
			{
				return BigDecimal.ZERO;
			}
		}
		return yicdxh;
	}
	
	
	/**
	 * SPPV过点消耗数量
	 * 6.如果为总装流水号则取整车过点表的SPPV过点消耗数量(ddbh_caifjg_cs.sum(lingjsl))，查询ck_zhengcgd表取出整车序号；
	 *   如果为焊装流水号则取焊装过点表的SPPV过点消耗数量。
	 *   条件：小火车起始流水号、整车序号（或焊装序号）、用户中心、零件、消耗点、小火车、趟次、FLAG=2（CS处理完成的）。
	 *   
	 *   Sppv已消耗：在整车过点表（ck_zhengcgd）或焊装过点表（ck_hanzgd）中找出sppv整车序号，再根据小火车消耗点模板找出整车序号对应的起始流水号和结束流水号，查询ddbh_caifjg_cs表找出范围内的零件消耗数量
	 *   （条件：用户中心、零件、消耗点、小火车、趟次、整车序号区间X）
			select sum(lingjsl)    
			from ZXC_TEST.ddbh_caifjginfo c    
			join ZXC_TEST.ck_zhengcgd z    
				on z.usercenter = c.usercenter     
				and z.shengcx = c.chanx     
				and z.zongzlsh = c.zhongzlxh     
			where 1=1       
			and z.zhengcxh>='434830' and z.zhengcxh < '434880'         
			and  z.usercenter = 'UL'      
			and  c.lingjbh = '9656866580'      
			and  xiaohd = 'L45FK11K1'
			and c.chanx ='UL5L1'
			
			整车序号区间为：小火车-消耗点模板表中的起始流水号<=X<整车序号
			焊装序号区间为：小火车-消耗点模板表中的起始流水号<=X<焊装序号

	 */
	private BigDecimal jsXiaohl(Map paramMap, Pand pand) 
	{
		if(null == pand){
			return BigDecimal.ZERO;
		}
		String queryXiaohl = "xinanxpd.queryDefaultXiaohl";
		
		BigDecimal xiaohl = BigDecimal.ZERO;
		String targetxh = paramMap.get("kaislsh").toString();
		//0013141: 新按需线边盘点修正----SPPV待消耗统计有问题 by CSY 20170118
		String maxxh = paramMap.get("zhengcxh").toString();

		if(null != maxxh && null != targetxh)
		{
			int target = Integer.parseInt(targetxh);
			int max = Integer.parseInt(maxxh);
			//如果手动输入小于或等于maxLsh
			if(max < target)
			{
				paramMap.put("targetxh", max);
				paramMap.put("maxxh", target);
				//取负
				xiaohl = BigDecimal.ZERO.subtract((BigDecimal) baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).selectObject(queryXiaohl, paramMap));
			}
			else if(max > target)
			{
				paramMap.put("targetxh", target);
				paramMap.put("maxxh", max);
				//取正
				xiaohl = (BigDecimal) baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).selectObject(queryXiaohl, paramMap);
			}
		}
		if(null == xiaohl){
			return BigDecimal.ZERO;
		}
		return xiaohl;
	}
	
	/**
	 * 
	 * 7.获取输入的盘点实际库存。
	 */

	/**
	 * 取出准备层零件的上次盈余
	 * 8.webservice取出准备层零件的上次盈余xqjs_xianbkc.yingy，
	 * 条件：用户中心、零件、消耗点。
	 */
	
	/**
	 * 计算盘点差异
	 * 9.计算盘点差异=上次盈余 -（待交付-（待消耗-sppv消耗）+零件数量）。
	 * 
	 * 盘点差异 =（该零件消耗的）上次盈余 - 推算盈余 
	        上次盈余：xqjs_xianbkc.yingy，它是根据用户中心、产线、零件编号、消耗点（或仓库）查询得到。SQL如下：
		select xb.yingy from xqjs_xianbkc xb where xb.usercenter='UL' and xb.chanx='UL5L2' and xb.lingjbh='9810175680' and xb.mudd='L95F004BN'
		查询条件值从页面列表获得。
		Mudd表示消耗点或仓库，如果是CD模式其值为消耗点，如果是MD模式其值为线边仓库。
		
		推算盈余= 内部要货令的待交付-（JL毛需求的待消耗-sppv消耗）+（线边盘点）零件数量
	 * @throws Exception 
	 */
	//页面js计算
//	private BigDecimal jspdcy(Map paramMap, Pand pand) throws Exception
//	{
//		//上次盈余
//		BigDecimal shangcyy = queryShangcyy(paramMap,pand);
//		//内部要货令的待交付
//		BigDecimal daijf = jsDaijf(paramMap,pand);
//		//JL毛需求的待消耗
//		BigDecimal daixh = this.jsDxh(paramMap,pand);
//		//sppv消耗
//		BigDecimal sppvXiaohl = jsXiaohl(paramMap,pand);
//		//零件数量(用户手动输入)
//		BigDecimal lingjsl = (BigDecimal)paramMap.get("lingjsl");
//		//推算盈余= 内部要货令的待交付-（JL毛需求的待消耗-sppv消耗）+（线边盘点）零件数量
//		BigDecimal tuisyy = daijf.subtract(daixh.subtract(sppvXiaohl)).add(lingjsl);
//		//盘点差异 =（该零件消耗的）上次盈余 - 推算盈余 
//		BigDecimal pdcy = shangcyy.subtract(tuisyy);
//		return pdcy;
//	}
	
	
	 /**保存零件盘点差异信息
	  * 10.	保存零件盘点差异信息到准备层xqjs_kucjscsb表中（webservice），存在则更新，不存在则插入. 使用merge来作更新或插入。
	 */
	
	/**
	 * @see   保存盘点信息,并且给与客户反馈信息
	 * @param pandModels
	 * @return
	 */
	public Map pdsave(List<XinAnxpd> pandModels , String creator)
	{
		//init 变量
		Map<String, Object> map = new HashMap<String, Object>();
		StringBuffer errorSb = new StringBuffer();
		List<XinAnxpd> pandMdelByCD = new ArrayList<XinAnxpd>();
		List<XinAnxpd> pandMdelByCS = new ArrayList<XinAnxpd>();
		int index = 1;
		if(null != pandModels)
		{
			for (XinAnxpd pandModel : pandModels) 
			{
				if(checkPandModel(pandModel))
				{
					//初始化盘点人和盘点时间
					pandModel.setCreator(creator);
					pandModel.setCreate_time(formatDateToString(new Date()));
					String mos = pandModel.getMos();
					if(StringUtils.isNotBlank(mos))
					{
						if(mos.equalsIgnoreCase("CD"))
						{
							pandMdelByCD.add(pandModel);
						}
						else if(mos.equalsIgnoreCase("CS"))
						{
							pandMdelByCS.add(pandModel);
						}
					}
				}
				else
				{
					errorSb.append("选取提交的第").append(index).append("行数据不完整,请检查..");
					break;
				}
				index ++;
			}
			//如检查数据有误反馈信息
			if(errorSb.length() > 0)
			{
				map.put("message", errorSb.toString());
			}
			else
			{
				if(pandMdelByCD.size() > 0)
				{
					try 
					{
						pdsaveByCDPandModel(pandMdelByCD);
					} 
					catch (TranslateListToMapException e) 
					{
						errorSb.append("调用Webservice时转换数据有误!");
						logger.error(errorSb+e.getMessage());
					}
					catch (AnxjssjSjerrException e) 
					{
						errorSb.append("按需已重新计算，请重新盘点!");
						logger.error(errorSb+e.getMessage());
					}
					catch (Exception e) 
					{
						errorSb.append("CD盘点数据插入批处理出错!");
						logger.error(errorSb+e.getMessage());
					}
				}
				if(pandMdelByCS.size() > 0)
				{
					try
					{
						pdsaveByCSPandModel(pandMdelByCS);
					}
					catch (Exception e)
					{
						errorSb.append("CS盘点数据插入批处理出错!");
						logger.error(e);
						e.printStackTrace();
					}
				}
				if(errorSb.length() > 0)
				{
					map.put("message", errorSb.toString());
				}
				else
				{
					map.put("message", "盘点数据保存成功!");
				}
			}
		}
		return map;
	}
	
	/**
	 * @see   保存CD盘点数据
	 * @param pandModels
	 * @throws Exception 
	 */
	private void pdsaveByCDPandModel(List<XinAnxpd> pandModels) throws Exception
	{
		XinanxpdWebserviceUtil pandWebserviceUtil = new XinanxpdWebserviceUtil();
		pandWebserviceUtil.savePandModel(pandModels);
	}

	private void pdsaveByCSPandModel(List<XinAnxpd> pandModels) throws Exception 
	{
		pandModels = translatePandModel(pandModels);
		baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).executeBatch("xinanxpd.saveCSpandModel", pandModels);
	}
	
	private List<XinAnxpd> translatePandModel(List<XinAnxpd> pandModels) throws Exception
	{
		Map<String, XinAnxpd> flagMap = new HashMap<String, XinAnxpd>();
		XinAnxpd flagPandModel = null;
		for (XinAnxpd pandModel : pandModels) 
		{
			flagPandModel = flagMap.get(pandModel.getUsercenter() + pandModel.getLingjbh() + pandModel.getShengcxbh() + pandModel.getXiaohd());
			if(null != flagPandModel)
			{
				try 
				{
					if(checkLaterOtherTime(pandModel.getPandtime(),flagPandModel.getPandtime()))
					{
						flagMap.put(pandModel.getUsercenter() + pandModel.getLingjbh() + pandModel.getShengcxbh() + pandModel.getXiaohd(), pandModel);
					}
				} 
				catch (Exception e)
				{
					logger.error(e);
					e.printStackTrace();
					throw e;
				}
			}
			else 
			{
				flagMap.put(pandModel.getUsercenter() + pandModel.getLingjbh() + pandModel.getShengcxbh() + pandModel.getXiaohd(), pandModel);
			}
		}
		pandModels = new ArrayList<XinAnxpd>();
		for(Iterator<XinAnxpd> it = flagMap.values().iterator();it.hasNext();)
		{
			pandModels.add(it.next());
		}
		return pandModels;
	}
	
	
	/**
	 * @see 验证查询的参数信息是否完整，如不完整返回true
	 * @param params
	 * @return
	 */
	private boolean checkPdqueryParam(Map<String, String> params)
	{
		String lingjbh = null , xiaohd = null;
		if(null != params)
		{
			lingjbh = params.get("lingjbh");
			xiaohd = params.get("xiaohd");
		}
		return StringUtils.isNotBlank(lingjbh) || StringUtils.isNotBlank(xiaohd) ? false : true;
	}
	
	//盘点计算主类 add by zbb
	private Map masterJs(Map paramMap , Pand pand)
	{
		XinAnxpd xinAnxpd = new XinAnxpd();
		try
		{
			String pandtime = formatDateToString(new Date());
			paramMap.put("systime", pandtime);
			xinAnxpd.setPandtime(pandtime);
			
			Xiaohcxhdmb xhc = (Xiaohcxhdmb)getXiaohctc(paramMap).get("result");
			//2016-07-22 by CSY 通过查询获得的小火车消耗点数据没有零件编号，但在查询待消耗和盈余量时需要零件编号为查询条件，因此添加
			xhc.setLingjbh(paramMap.get("lingjbh").toString());
			
			paramMap.put("usercenter", xhc.getUsercenter());//用户中心
			paramMap.put("xiaohdbh", xhc.getXiaohdbh());//消耗点编号
			paramMap.put("xiaohcrq", xhc.getXiaohcrq());//小火车日期
			paramMap.put("xiaohcbh", xhc.getXiaohcbh());//小火车编号
			paramMap.put("tangc", xhc.getTangc());//趟次
			paramMap.put("kaislsh", xhc.getKaislsh());//开始流水号
			paramMap.put("jieslsh", xhc.getJieslsh());//结束流水号
			
			//计算待消耗
			xinAnxpd.setDaixh(this.jsDxh(xhc, pand));
			//计算待交付
			xinAnxpd.setDaijf(this.jsDaijf(paramMap, pand));
			//计算sppv消耗量
			xinAnxpd.setXiaohl(this.jsXiaohl(paramMap, pand));
			//计算盈余量
			xinAnxpd.setYingyl(this.jsYingyl(xhc, pand, paramMap));
			
			//计算异常待消耗
			xinAnxpd.setYicdxh(this.jsYicdxh(paramMap, pand));
		} 
		catch (Exception e) 
		{
			paramMap.put("message", "获取小火车模板数据为空，参数：输入流水号与零件编号无法匹配。");
			logger.error("获取小火车模板数据为空，参数：输入流水号与零件编号无法匹配。"+e.getMessage());
			xinAnxpd = null;
		}
		paramMap.put("xinAnxpd", xinAnxpd);
		return paramMap;
	}
	
	private String formatDateToString(Date date)
	{
		if (null == date){
			return null;
		}
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String strDate = formatter.format(date);
		return strDate;
	}
	
	/**
	 * @throws Exception 
	 * @see   init 盘点数据模型
	 * @param c0List
	 * @return
	 * @throws  
	 */
	public List<XinAnxpd> queryCDPandmodel(List<XinAnxpd> cdList) throws Exception 
	{
		XinanxpdWebserviceUtil pandWebserviceUtil = new XinanxpdWebserviceUtil();
		return pandWebserviceUtil.initXinAnxpd(cdList);
	}
	
	
	/**
	 * @see   验证盘点信息是否完整
	 * @param pandModel
	 * @return
	 */
	private boolean checkPandModel(XinAnxpd pandModel) 
	{
		boolean flagResult = true;
		if(null == pandModel)
		{
			flagResult = false;
		}
		else
		{
			if(null == pandModel.getDaixh() || //null == pandModel.getXiaohcbh() ||
			StringUtils.isBlank(pandModel.getPandtime()) || null == pandModel.getDaijf() || 
			null == pandModel.getXiaohl() || null == pandModel.getYingyl() ||
			StringUtils.isBlank(pandModel.getUsercenter()) || StringUtils.isBlank(pandModel.getXiaohd()) ||
			StringUtils.isBlank(pandModel.getLingjbh()) || null == pandModel.getChay() || null == pandModel.getPandljsl() || 
			 StringUtils.isBlank(pandModel.getZhengclsh()) || StringUtils.isBlank(pandModel.getShengcxbh()) ||
			 StringUtils.isBlank(pandModel.getMos())
			){
				flagResult = false;
			}
			if((!pandModel.getMos().equalsIgnoreCase("CS") && StringUtils.isBlank(pandModel.getAnxscjssj()))){
				flagResult = false;
			}
		}
		return flagResult;
	}
	
	
	/**
	 * @see   效验时间是否大于消耗时间
	 * @param anxjssj
	 * @param xhsj
	 * @return
	 * @throws Exception
	 */
	private boolean checkLaterOtherTime(String anxjssj,String xhsj) throws Exception
	{
		Date anxjssjDate = formatStringToDate(anxjssj);
		Date xhsjDate = formatStringToDate(xhsj);
		boolean error =  null == anxjssjDate || null == xhsjDate;
		if(error)
			throw new Exception();
		return targetDateLaterOtherDate(anxjssjDate,xhsjDate);
	}
	
	/**
	 * @see 时间转换
	 * @param strDate
	 * @return
	 */
	private  Date formatStringToDate(String strDate)
	{
		if (null == strDate)
			return null;
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = null;
		try
		{
			date = formatter.parse(strDate);
		}
		catch (Exception e)
		{
			System.err.println("Format string to date error!");
			e.printStackTrace();
		}
		return date;
	}
	
	/**
	 * @see   判断target时间是否大于other时间
	 * @param target
	 * @param other
	 * @return
	 */
	private boolean targetDateLaterOtherDate(Date target , Date other)
	{
		Calendar c1 = Calendar.getInstance();
		c1.setTime(target);
		Calendar c2 = Calendar.getInstance();
		c2.setTime(other);
		long second1 = c1.getTimeInMillis() / 1000;
		long second2 = c2.getTimeInMillis() / 1000;
		return second1 > second2;
	}
}
