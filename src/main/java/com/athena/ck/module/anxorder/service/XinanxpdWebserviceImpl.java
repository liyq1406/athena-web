package com.athena.ck.module.anxorder.service;

import java.lang.reflect.InvocationTargetException;
import java.math.BigDecimal;
import java.util.HashMap;
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
import com.athena.xqjs.module.common.CommonFun;
import com.toft.core3.container.annotation.Component;
import com.toft.core3.transaction.annotation.Transactional;


@SuppressWarnings("rawtypes")
//@WebService(endpointInterface="com.athena.ck.module.anxorder.service.XinanxpdWebservice", serviceName="/xinanxpdWebservice")
@Component
public class XinanxpdWebserviceImpl extends BaseService implements XinanxpdWebservice {

	//日志
	private Logger logger = Logger.getLogger(XinanxpdWebserviceImpl.class);
	
	@Override
	public List<XinAnxpd> initXinAnxpd(List<XinAnxpd> xinanxpds)
			throws NoAnxjssjException, TranslateListToMapException {
		logger.info("新按需盘点webservice调用查询盘点信息开始");
		if(null != xinanxpds && xinanxpds.size() > 0)
		{
			//初始化参数
			String anxjssjUL = "" , anxjssjUW = "" , anxjssjVD = "";
			final String  ANX_UW_DINGDH = "C1DDD0009";  //UW用户中心所属的按需订单
			final String  ANX_UL_DINGDH = "C1DDD0008";  //UL用户中心所属的按需订单
			final String  ANX_VD_DINGDH = "C1DDD0007";  //UD用户中心所属的按需订单
			final String  ANX_UW_USERCENTER = "UW";  //UW用户中心
			final String  ANX_UL_USERCENTER = "UL";  //UL用户中心
			final String  ANX_VD_USERCENTER = "VD";  //UD用户中心
			
			Map<String, String> paramMap = new HashMap<String, String>();
			
			
			paramMap.put("dingdh", ANX_UW_DINGDH);
			paramMap.put("usercenter", ANX_UW_USERCENTER);
			// 按需上次计算时间
			anxjssjUW =  (String) baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).selectObject("xinanxpd.queryCDscjssj",paramMap);
			
			paramMap.put("dingdh", ANX_UL_DINGDH);
			paramMap.put("usercenter", ANX_UL_USERCENTER);
			anxjssjUL = (String) baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).selectObject("xinanxpd.queryCDscjssj",paramMap);
			
			paramMap.put("dingdh", ANX_VD_DINGDH);
			paramMap.put("usercenter", ANX_VD_USERCENTER);
			anxjssjVD = (String) baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).selectObject("xinanxpd.queryCDscjssj",paramMap);
			
				//初始化赋值
				for (XinAnxpd pandModel : xinanxpds)
				{
					//查询盈余
					paramMap.put("usercenter", pandModel.getUsercenter());
					paramMap.put("lingjbh", pandModel.getLingjbh());
					paramMap.put("xiaohd", pandModel.getXiaohd());
					paramMap.put("shengcxbh", pandModel.getShengcxbh());
					BigDecimal yingyu = jsYingyl(pandModel);
					pandModel.setYingyl(yingyu);
					paramMap.put("yingy", yingyu.toString());
					//为UL中心
					if(pandModel.getUsercenter().equalsIgnoreCase(ANX_UL_USERCENTER))
					{
						if(StringUtils.isBlank(anxjssjUL))
						{
							throw new NoAnxjssjException();
						}
						else
						{
							pandModel.setAnxscjssj(anxjssjUL);
						}
					}
					//为UW中心
					else if(pandModel.getUsercenter().equalsIgnoreCase(ANX_UW_USERCENTER))
					{
						if(StringUtils.isBlank(anxjssjUW))
						{
							throw new NoAnxjssjException();
						}
						else
						{
							pandModel.setAnxscjssj(anxjssjUW);
						}
					}
					//0011310: CD盘点修正，一个工作日只算一次 
					//为VD中心
					else if(pandModel.getUsercenter().equalsIgnoreCase(ANX_VD_USERCENTER))
					{
						if(StringUtils.isBlank(anxjssjVD))
						{
							throw new NoAnxjssjException();
						}
						else
						{
							pandModel.setAnxscjssj(anxjssjVD);
						}
					}	
				}
			}
		logger.info("盘点webservice调用查询盘点信息结束");
		return xinanxpds;
	}

	@Override
	public BigDecimal jsYingyl(XinAnxpd xinAnxpd) {
		BigDecimal yingyu = (BigDecimal) baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).selectObject("xinanxpd.Shangcyy",xinAnxpd);
		return CommonFun.getBigDecimal(yingyu);
	}


	/**
	 * 归集待消耗
	 * 5.归集待消耗，查询xqjs_anxmaoxq_jl，找出订单上次计算时间后的所有打标的JL毛需求并汇总毛需求，
	 * 条件：用户中心、零件、消耗点、总装焊装标识、小火车日期、小火车、趟次。
	 * 
	 * 待消耗=大于订单上次计算的所有打标的JL毛需求数量
		待消耗：根据用户中心、总装流水号（或焊装流水号）、零件、产线、消耗点去小火车-消耗点模板表中找出对应的小火车及趟次。
		
		（5）	根据用户中心、小火车日期、小火车、趟次、零件、消耗点找出JL毛需求表中所有打标的零件数量即待消耗。
		select nvl(sum(nvl(xiaohxs, 0)), 0) as dxh 
		from xqjs_anxmaoxq_jl m  
		where m.usercenter='UL' 
		and m.lingjbh='9677682180' 
		and m.xiaohd='L45N004AN' 
		and  replace(m.xiaohcrq,'-','')||m.xiaohcbh||m.tangc>'2015121101' 
		and m.flag='2'
	 */
	public BigDecimal jsDxh(Xiaohcxhdmb xhc, Pand pand) {
		if(null == pand){
			return BigDecimal.ZERO;
		}
		BigDecimal dxh = BigDecimal.ZERO;
		if(pand.equals(Pand.CS))
		{
			return dxh;
		}
		String dxhStr = "xinanxpd.queryDaixh";
		dxh = (BigDecimal)baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).selectObject(dxhStr, xhc);
		if(null == dxh){
			return BigDecimal.ZERO;
		}
		return dxh;
	}
	
	/**
	 * 计算上次盈余
	 *     上次盈余：xqjs_xianbkc.yingy，它是根据用户中心、产线、零件编号、消耗点（或仓库）查询得到。SQL如下：
		select xb.yingy from xqjs_xianbkc xb where xb.usercenter='UL' and xb.chanx='UL5L2' and xb.lingjbh='9810175680' and xb.mudd='L95F004BN'
		查询条件值从页面列表获得。
		Mudd表示消耗点或仓库，如果是CD模式其值为消耗点，如果是MD模式其值为线边仓库。
	 */
	
	/**
	 * @throws NoSuchMethodException 
	 * @throws InvocationTargetException 
	 * @throws IllegalAccessException 
	 * @see   保存盘点信息
	 */
	@Transactional
	public void savePandModel(List<XinAnxpd> pandModels) throws TranslateListToMapException 
	{
		logger.info("盘点webservice调用保存盘点信息开始");
		if(null != pandModels)
		{
//			List<EmergencyModel> emergencyModels = this.translatePandToEmergency(pandModels);
//			//零件信息map
//			Map<String, EmergencyModel> lingjxxMap = new HashMap<String, EmergencyModel>();
//			//物流信息map
//			Map<String, EmergencyModel> wulxxMap = new HashMap<String, EmergencyModel>();
//			//供应商承运信息map
//			Map<String, EmergencyModel> gongysAndChengysxxMap = new HashMap<String, EmergencyModel>();
//			//消耗点信息map
//			Map<String, EmergencyModel> xiaohdxxMap = new HashMap<String, EmergencyModel>();
//			//零件供应商信息map
//			Map<String, EmergencyModel> lingjgysxxMap = new HashMap<String, EmergencyModel>();
			//初始化参数
			//0011310: CD盘点修正，一个工作日只算一次  2015-04-13
			String anxjssjUL = "" , anxjssjUW = "" , anxjssjVD = "";
			final String  ANX_UW_DINGDH = "C1DDD0009";  //UW用户中心所属的按需订单
			final String  ANX_UL_DINGDH = "C1DDD0008";  //UL用户中心所属的按需订单
			final String  ANX_VD_DINGDH = "C1DDD0007";  //VD用户中心所属的按需订单
			final String  ANX_UW_USERCENTER = "UW";  //UW用户中心
			final String  ANX_UL_USERCENTER = "UL";  //UL用户中心
			final String  ANX_VD_USERCENTER = "VD";  //UL用户中心
//			Map<String , Object> flagMap = null;
			Map<String, String> paramMap = new HashMap<String, String>();
			paramMap.put("dingdh", ANX_UW_DINGDH);
			paramMap.put("usercenter", ANX_UW_USERCENTER);
			// 按需上次计算时间
			anxjssjUW =  (String) baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).selectObject("xinanxpd.queryCDscjssj",paramMap);
			paramMap.put("dingdh", ANX_UL_DINGDH);
			paramMap.put("usercenter", ANX_UL_USERCENTER);
			anxjssjUL = (String) baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).selectObject("xinanxpd.queryCDscjssj",paramMap);
			
			paramMap.put("dingdh", ANX_VD_DINGDH);
			paramMap.put("usercenter", ANX_VD_USERCENTER);
			anxjssjVD = (String) baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).selectObject("xinanxpd.queryCDscjssj",paramMap);
			
			for(XinAnxpd pandModel : pandModels){
				String uc = pandModel.getUsercenter();
				String axjssjZxc = pandModel.getAnxscjssj();
				String axjssj = pandModel.getAnxscjssj();
				if(axjssjZxc!=null && axjssjZxc.length()>16){
					axjssjZxc = axjssjZxc.trim();
					axjssj = axjssjZxc.substring(0, 10)+" " + axjssjZxc.substring(axjssjZxc.length()-8);
				}
				logger.info("盘点长度："+pandModels.size()+"盘点uc:"+uc+"	axjssj:"+axjssj+"	anxjssjUL:"+anxjssjUL+"	anxjssjUW:"+anxjssjUW+"	anxjssjVD:"+anxjssjVD);
				if(uc!=null && !"".equals(uc) && axjssj!=null && !"".equals(axjssj)){
					if(uc.equals(ANX_UW_USERCENTER)){
						if(!anxjssjUW.equals(axjssj)){
							throw new AnxjssjSjerrException();
						}
					}else if(uc.equals(ANX_UL_USERCENTER)){
						if(!anxjssjUL.equals(axjssj)){
							throw new AnxjssjSjerrException();
						}
					}else if(uc.equals(ANX_VD_USERCENTER)){
						if(!anxjssjVD.equals(axjssj)){
							throw new AnxjssjSjerrException();
						}
					}
				}
			}
			logger.info("盘点长度："+pandModels.size());
//			try
//			{
//				lingjxxMap = this.translateListToMap2(baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("xianbkc.queryLingjxx"), "usercenter","lingjbh");
//				wulxxMap = this.translateListToMap3(baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("xianbkc.queryWulljxx"), "gongysfe","usercenter","lingjbh");
//				gongysAndChengysxxMap = this.translateListToMap2(baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("xianbkc.queryGongysChengysxx"), "usercenter","gongysbh");
//				xiaohdxxMap = this.translateListToMap2(baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("xianbkc.queryXiaohdxx"), "usercenter","lingjbh","xiaohd");
//				lingjgysxxMap = this.translateListToMap2(baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("xianbkc.queryLingjgysxx"), "usercenter","lingjbh","gongysbh");
//				EmergencyModel copyEmergencyModel = null;
//				for (EmergencyModel emergencyModel : emergencyModels) 
//				{
//					copyEmergencyModel = lingjxxMap.get(emergencyModel.getUsercenter()+emergencyModel.getLingjbh());
//					if(null != copyEmergencyModel)
//					{
//						emergencyModel.setJihy(copyEmergencyModel.getJihy());
//						emergencyModel.setLingjmc(copyEmergencyModel.getLingjmc());
//					}
//					copyEmergencyModel = wulxxMap.get(emergencyModel.getUsercenter()+emergencyModel.getLingjbh());
//					if(null != copyEmergencyModel)
//					{
//						emergencyModel.setGongysbh(copyEmergencyModel.getGongysbh());
//						emergencyModel.setChengysbh(copyEmergencyModel.getChengysbh());
//						emergencyModel.setGongysfe(copyEmergencyModel.getGongysfe());
//					}
//					copyEmergencyModel = gongysAndChengysxxMap.get(emergencyModel.getUsercenter() + emergencyModel.getGongysbh());
//					if(null != copyEmergencyModel) 
//					{
//						emergencyModel.setGongysmc(copyEmergencyModel.getGongysmc());
//					}
//					copyEmergencyModel = gongysAndChengysxxMap.get(emergencyModel.getUsercenter() + emergencyModel.getChengysbh());
//					if(null != copyEmergencyModel)
//					{
//						emergencyModel.setChengysmc(copyEmergencyModel.getChengysmc());
//					}
//					copyEmergencyModel = xiaohdxxMap.get(emergencyModel.getUsercenter() + emergencyModel.getLingjbh() + emergencyModel.getXiaohd());
//					if(null != copyEmergencyModel)
//					{
//						emergencyModel.setAnqkc(copyEmergencyModel.getAnqkc());
//					}
//					else
//					{
//						emergencyModel.setAnqkc(BigDecimal.ZERO);
//					}
//					copyEmergencyModel = lingjgysxxMap.get(emergencyModel.getUsercenter() + emergencyModel.getLingjbh() + emergencyModel.getGongysbh());
//					if(null != copyEmergencyModel)
//					{
//						emergencyModel.setUarl(copyEmergencyModel.getUarl());
//					}
//					else
//					{
//						emergencyModel.setUarl(BigDecimal.ZERO);
//					}
//				}
//			}
//			catch (Exception e) 
//			{
//				e.printStackTrace();
//				logger.error(e);
//				throw new TranslateListToMapException();
//			}
			
			//保存盘点信息
			baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).executeBatch("xinanxpd.saveCDpandModel", pandModels);
//			baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).executeBatch("xianbkc.saveEmergencyModel", emergencyModels);
		}
		logger.info("盘点webservice调用保存盘点信息结束");
	}

}
