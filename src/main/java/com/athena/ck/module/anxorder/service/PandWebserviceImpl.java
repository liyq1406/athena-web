package com.athena.ck.module.anxorder.service;

import java.lang.reflect.InvocationTargetException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.jws.WebService;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

import com.athena.ck.entity.anxorder.AnxjssjSjerrException;
import com.athena.ck.entity.anxorder.NoAnxjssjException;
import com.athena.ck.entity.anxorder.PandModel;
import com.athena.ck.entity.anxorder.TranslateListToMapException;
import com.athena.component.service.BaseService;
import com.athena.db.ConstantDbCode;
import com.athena.xqjs.entity.emergency.EmergencyModel;
import com.toft.core3.container.annotation.Component;
import com.toft.core3.transaction.annotation.Transactional;



@SuppressWarnings("rawtypes")
@WebService(endpointInterface="com.athena.ck.module.anxorder.service.PandWebservice", serviceName="/pandWebservice")
@Component
public class PandWebserviceImpl extends BaseService implements PandWebservice
{

	//日志
	private Logger logger = Logger.getLogger(PandWebserviceImpl.class);
	
	/**
	 * 
	 */
	@SuppressWarnings("unchecked")
	public List<PandModel> initPandModel(List<PandModel> pandModels) throws NoAnxjssjException , TranslateListToMapException
	{
		logger.info("盘点webservice调用查询盘点信息开始");
		if(null != pandModels && pandModels.size() > 0)
		{
			//初始化参数
			String anxjssjUL = "" , anxjssjUW = "" , anxjssjVD = "";
			final String  ANX_UW_DINGDH = "C1DDD0009";  //UW用户中心所属的按需订单
			final String  ANX_UL_DINGDH = "C1DDD0008";  //UL用户中心所属的按需订单
			final String  ANX_VD_DINGDH = "C1DDD0007";  //UL用户中心所属的按需订单
			final String  ANX_UW_USERCENTER = "UW";  //UW用户中心
			final String  ANX_UL_USERCENTER = "UL";  //UL用户中心
			final String  ANX_VD_USERCENTER = "VD";  //UL用户中心
			Map<String , Object> flagMap = null;
			Map<String, String> paramMap = new HashMap<String, String>();
			paramMap.put("dingdh", ANX_UW_DINGDH);
			paramMap.put("usercenter", ANX_UW_USERCENTER);
			// 按需上次计算时间
			anxjssjUW =  (String) baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).selectObject("xianbkc.queryCDscjssj",paramMap);
			paramMap.put("dingdh", ANX_UL_DINGDH);
			paramMap.put("usercenter", ANX_UL_USERCENTER);
			anxjssjUL = (String) baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).selectObject("xianbkc.queryCDscjssj",paramMap);
			
			paramMap.put("dingdh", ANX_VD_DINGDH);
			paramMap.put("usercenter", ANX_VD_USERCENTER);
			anxjssjVD = (String) baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).selectObject("xianbkc.queryCDscjssj",paramMap);
			
			///查询线边理论库存
			List flagList =  baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("xianbkc.queryCDXianbck");
			if(null != flagList && flagList.size() > 0)
			{
				//集合转换
				try 
				{
					flagMap = translateListToMap(flagList, "xianbllkc", "usercenter","lingjbh","xiaohd");
				} 
				catch (Exception e) 
				{
					e.printStackTrace();
					logger.error(e);
					throw new TranslateListToMapException();
				}
				//初始化赋值
				for (PandModel pandModel : pandModels)
				{
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
					//0011310: CD盘点修正，一个工作日只算一次 gswang 2015-04-13
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
					Object flagValue = null;
					if(null != flagMap)
						flagValue = flagMap.get(pandModel.getUsercenter() + pandModel.getLingjbh() + pandModel.getXiaohd());
					if(null != flagValue)
					{
						pandModel.setXianbllkc(new BigDecimal(flagValue.toString()));
					}
					else
					{
						pandModel.setXianbllkc(BigDecimal.ZERO);
					}
				}
			}
		}
		logger.info("盘点webservice调用查询盘点信息结束");
		return pandModels;
	}

	

	/**
	 * @see   根据参数信息通过反射机制将List转换成Map
	 * @param objects
	 * @param valueProperty
	 * @param keyPropertys
	 * @return
	 * @throws IllegalAccessException
	 * @throws InvocationTargetException
	 * @throws NoSuchMethodException
	 */
	private Map<String,Object> translateListToMap(List<Object> objects,String valueProperty,String... keyPropertys) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException
	{
		Map<String, Object> result = new HashMap<String, Object>();
		Object obj = null;
		if(null != objects && objects.size() > 0 && null != keyPropertys && keyPropertys.length > 0)
		{
			for (int i=0,j=objects.size();i<j;i++) 
			{
				obj = objects.get(i);
				StringBuffer flagKey = new StringBuffer();
				for (int k = 0,p = keyPropertys.length; k < p; k++)
				{
					flagKey.append(BeanUtils.getProperty(obj, keyPropertys[k]));
				}
				result.put(flagKey.toString(), BeanUtils.getProperty(obj, valueProperty));
			}
		}
		return result;
	}

	

	/**
	 * @see 根据参数列得到的值作为Key 将List 转换为Map
	 * @param kucfxs
	 * @param propertys
	 * @return
	 * @throws IllegalAccessException
	 * @throws InvocationTargetException
	 * @throws NoSuchMethodException
	 */
	private Map<String,EmergencyModel> translateListToMap2(List<EmergencyModel> emergencyModels,String... propertys) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException
	{
		Map<String, EmergencyModel> result = new HashMap<String, EmergencyModel>();
		EmergencyModel emergencyModel = null;
		if(null != emergencyModels && emergencyModels.size() > 0 && null != propertys && propertys.length > 0)
		{
			for (int i=0,j=emergencyModels.size();i<j;i++) 
			{
				emergencyModel = emergencyModels.get(i);
				StringBuffer flagKey = new StringBuffer();
				for (int k = 0,p = propertys.length; k < p; k++)
				{
					flagKey.append(BeanUtils.getProperty(emergencyModel, propertys[k]));
				}
				result.put(flagKey.toString(), emergencyModel);
			}
		}
		return result;
	}
	
	
	/**
	 * @see 根据参数列得到的值作为Key 将List 转换为Map
	 * @param kucfxs
	 * @param propertys
	 * @return
	 * @throws IllegalAccessException
	 * @throws InvocationTargetException
	 * @throws NoSuchMethodException
	 */
	private Map<String,EmergencyModel> translateListToMap3(List<EmergencyModel> emergencyModels,String compareString,String... propertys) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException,Exception
	{
		Map<String, EmergencyModel> result = new HashMap<String, EmergencyModel>();
		EmergencyModel emergencyModel = null;
		EmergencyModel other = null;
		
		if(null != emergencyModels && emergencyModels.size() > 0 && null != propertys && propertys.length > 0)
		{
			for (int i=0,j=emergencyModels.size();i<j;i++) 
			{
				emergencyModel = emergencyModels.get(i);
				StringBuffer flagKey = new StringBuffer();
				for (int k = 0,p = propertys.length; k < p; k++)
				{
					flagKey.append(BeanUtils.getProperty(emergencyModel, propertys[k]));
				}
				other = result.get(flagKey.toString());
				if(null == other)
				{
					result.put(flagKey.toString(), emergencyModel);
				}
				else
				{
					if(StringUtils.isNotBlank(compareString))
					{
						try
						{
							double one = Double.valueOf(BeanUtils.getProperty(emergencyModel, compareString));
							double tow = Double.valueOf(BeanUtils.getProperty(other, compareString));
							if(one == tow)
							{
								double luck = Math.random();
								if(luck >= 0.5)
								{
									result.put(flagKey.toString(), emergencyModel);
								}
							}
							else if(one > tow)
							{
								result.put(flagKey.toString(), emergencyModel);
							}
						}
						catch (Exception e) 
						{
							throw e;
						}
						
					}
				}
			}
		}
		return result;
	}
	
	
	/**
	 * @see   model转换
	 * @param pandModels
	 * @return
	 */
	private List<EmergencyModel> translatePandToEmergency(List<PandModel> pandModels)
	{
		Map<String, EmergencyModel> flagMap = new HashMap<String, EmergencyModel>();
		List<EmergencyModel> emergencyModels = new ArrayList<EmergencyModel>();
		EmergencyModel emergencyModel ;
		for (PandModel pandModel : pandModels) 
		{
			emergencyModel = flagMap.get(pandModel.getUsercenter() + pandModel.getLingjbh() + pandModel.getXiaohd());
			if(null == emergencyModel)
			{
				flagMap.put(pandModel.getUsercenter() + pandModel.getLingjbh() + pandModel.getXiaohd(), getEmergencyModel(pandModel));
			}
			else
			{
				if(targetDateLaterOtherDate(formatStringToDate(pandModel.getPandtime()),formatStringToDate(emergencyModel.getCreate_time())))
				{
					flagMap.put(pandModel.getUsercenter() + pandModel.getLingjbh() + pandModel.getXiaohd(), getEmergencyModel(pandModel));
				}
			}
		}
		for(Iterator<EmergencyModel> it = flagMap.values().iterator();it.hasNext();)
		{
			emergencyModels.add(it.next());
		}
			
		return emergencyModels;
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
	
	
	private EmergencyModel getEmergencyModel(PandModel pandModel)
	{
		EmergencyModel emergencyModel = new EmergencyModel();
		emergencyModel.setUsercenter(pandModel.getUsercenter());
		emergencyModel.setLingjbh(pandModel.getLingjbh());
		emergencyModel.setXiaohd(pandModel.getXiaohd());
		emergencyModel.setChay(pandModel.getChay());
		emergencyModel.setZhuangt("0");
		if(null != emergencyModel.getChay())
		{
			if(emergencyModel.getChay().doubleValue() > 0)
			{
				//盘亏
				emergencyModel.setPandzt("0");
			}
			else if(emergencyModel.getChay().doubleValue() < 0)
			{
				//盘盈
				emergencyModel.setPandzt("1");
			}
			else
			{
				emergencyModel.setPandzt("2");
			}
		}
		emergencyModel.setXianbllkc(pandModel.getXianbllkc());
		emergencyModel.setPandsjsl(pandModel.getPandljsl());
		emergencyModel.setCreator(pandModel.getCreator());
		emergencyModel.setCreate_time(pandModel.getPandtime());
		emergencyModel.setEditor(pandModel.getCreator());
		emergencyModel.setEdit_time(pandModel.getPandtime());
		return emergencyModel;
	}

	/**
	 * @throws NoSuchMethodException 
	 * @throws InvocationTargetException 
	 * @throws IllegalAccessException 
	 * @see   保存盘点信息
	 */
	@Transactional
	public void savePandModel(List<PandModel> pandModels) throws TranslateListToMapException 
	{
		logger.info("盘点webservice调用保存盘点信息开始");
		if(null != pandModels)
		{
			List<EmergencyModel> emergencyModels = this.translatePandToEmergency(pandModels);
			//零件信息map
			Map<String, EmergencyModel> lingjxxMap = new HashMap<String, EmergencyModel>();
			//物流信息map
			Map<String, EmergencyModel> wulxxMap = new HashMap<String, EmergencyModel>();
			//供应商承运信息map
			Map<String, EmergencyModel> gongysAndChengysxxMap = new HashMap<String, EmergencyModel>();
			//消耗点信息map
			Map<String, EmergencyModel> xiaohdxxMap = new HashMap<String, EmergencyModel>();
			//零件供应商信息map
			Map<String, EmergencyModel> lingjgysxxMap = new HashMap<String, EmergencyModel>();
			//初始化参数
			//0011310: CD盘点修正，一个工作日只算一次 gswang 2015-04-13
			String anxjssjUL = "" , anxjssjUW = "" , anxjssjVD = "";
			final String  ANX_UW_DINGDH = "C1DDD0009";  //UW用户中心所属的按需订单
			final String  ANX_UL_DINGDH = "C1DDD0008";  //UL用户中心所属的按需订单
			final String  ANX_VD_DINGDH = "C1DDD0007";  //VD用户中心所属的按需订单
			final String  ANX_UW_USERCENTER = "UW";  //UW用户中心
			final String  ANX_UL_USERCENTER = "UL";  //UL用户中心
			final String  ANX_VD_USERCENTER = "VD";  //UL用户中心
			Map<String , Object> flagMap = null;
			Map<String, String> paramMap = new HashMap<String, String>();
			paramMap.put("dingdh", ANX_UW_DINGDH);
			paramMap.put("usercenter", ANX_UW_USERCENTER);
			// 按需上次计算时间
			anxjssjUW =  (String) baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).selectObject("xianbkc.queryCDscjssj",paramMap);
			paramMap.put("dingdh", ANX_UL_DINGDH);
			paramMap.put("usercenter", ANX_UL_USERCENTER);
			anxjssjUL = (String) baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).selectObject("xianbkc.queryCDscjssj",paramMap);
			
			paramMap.put("dingdh", ANX_VD_DINGDH);
			paramMap.put("usercenter", ANX_VD_USERCENTER);
			anxjssjVD = (String) baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).selectObject("xianbkc.queryCDscjssj",paramMap);
			
			for(PandModel pandModel : pandModels){
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
			try
			{
				lingjxxMap = this.translateListToMap2(baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("xianbkc.queryLingjxx"), "usercenter","lingjbh");
				wulxxMap = this.translateListToMap3(baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("xianbkc.queryWulljxx"), "gongysfe","usercenter","lingjbh");
				gongysAndChengysxxMap = this.translateListToMap2(baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("xianbkc.queryGongysChengysxx"), "usercenter","gongysbh");
				xiaohdxxMap = this.translateListToMap2(baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("xianbkc.queryXiaohdxx"), "usercenter","lingjbh","xiaohd");
				lingjgysxxMap = this.translateListToMap2(baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("xianbkc.queryLingjgysxx"), "usercenter","lingjbh","gongysbh");
				EmergencyModel copyEmergencyModel = null;
				for (EmergencyModel emergencyModel : emergencyModels) 
				{
					copyEmergencyModel = lingjxxMap.get(emergencyModel.getUsercenter()+emergencyModel.getLingjbh());
					if(null != copyEmergencyModel)
					{
						emergencyModel.setJihy(copyEmergencyModel.getJihy());
						emergencyModel.setLingjmc(copyEmergencyModel.getLingjmc());
					}
					copyEmergencyModel = wulxxMap.get(emergencyModel.getUsercenter()+emergencyModel.getLingjbh());
					if(null != copyEmergencyModel)
					{
						emergencyModel.setGongysbh(copyEmergencyModel.getGongysbh());
						emergencyModel.setChengysbh(copyEmergencyModel.getChengysbh());
						emergencyModel.setGongysfe(copyEmergencyModel.getGongysfe());
					}
					copyEmergencyModel = gongysAndChengysxxMap.get(emergencyModel.getUsercenter() + emergencyModel.getGongysbh());
					if(null != copyEmergencyModel) 
					{
						emergencyModel.setGongysmc(copyEmergencyModel.getGongysmc());
					}
					copyEmergencyModel = gongysAndChengysxxMap.get(emergencyModel.getUsercenter() + emergencyModel.getChengysbh());
					if(null != copyEmergencyModel)
					{
						emergencyModel.setChengysmc(copyEmergencyModel.getChengysmc());
					}
					copyEmergencyModel = xiaohdxxMap.get(emergencyModel.getUsercenter() + emergencyModel.getLingjbh() + emergencyModel.getXiaohd());
					if(null != copyEmergencyModel)
					{
						emergencyModel.setAnqkc(copyEmergencyModel.getAnqkc());
					}
					else
					{
						emergencyModel.setAnqkc(BigDecimal.ZERO);
					}
					copyEmergencyModel = lingjgysxxMap.get(emergencyModel.getUsercenter() + emergencyModel.getLingjbh() + emergencyModel.getGongysbh());
					if(null != copyEmergencyModel)
					{
						emergencyModel.setUarl(copyEmergencyModel.getUarl());
					}
					else
					{
						emergencyModel.setUarl(BigDecimal.ZERO);
					}
				}
			}
			catch (Exception e) 
			{
				e.printStackTrace();
				logger.error(e);
				throw new TranslateListToMapException();
			}
			
			//保存盘点信息
			baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).executeBatch("xianbkc.saveCDpandModel", pandModels);
			baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).executeBatch("xianbkc.saveEmergencyModel", emergencyModels);
		}
		logger.info("盘点webservice调用保存盘点信息结束");
	}
	
	
	
}
