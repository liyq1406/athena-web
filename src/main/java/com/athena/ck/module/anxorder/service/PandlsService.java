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

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

import com.athena.ck.entity.anxorder.AnxjssjSjerrException;
import com.athena.ck.entity.anxorder.NoAnxjssjException;
import com.athena.ck.entity.anxorder.Pand;
import com.athena.ck.entity.anxorder.PandModel;
import com.athena.ck.entity.anxorder.TranslateListToMapException;
import com.athena.component.service.BaseService;
import com.athena.db.ConstantDbCode;
import com.toft.core3.container.annotation.Component;
import com.toft.core3.support.PageableSupport;
import com.toft.core3.transaction.annotation.Transactional;


@SuppressWarnings("rawtypes")
@Component
public class PandlsService extends BaseService
{

	private Logger logger = Logger.getLogger(PandlsService.class);
	
	
	/**
	 * @see  检查流水号信息，并计算出关联数据进行赋值
	 */
	@SuppressWarnings("unchecked")
	public Map pdjs(Map paramMap, Pand pand)
	{
		if(null == pand)
			return null;
		String checkLsh = null;
		checkLsh = "xianbkc.checkC0Lsh";
		if(pand.equals(Pand.C0))
		{
		}
		else if(pand.equals(Pand.CD))
		{
			//checkLsh = "xianbkc.checkCDLsh";
		}
		else if(pand.equals(Pand.CS))
		{
			checkLsh = "xianbkc.checkCSLsh";
		}
		Map resultMap = new HashMap();
		StringBuffer error = new StringBuffer("您选取的数据中: ");
		StringBuffer errorSb = new StringBuffer();
		String usercenter = (String) paramMap.get("usercenter");
		String zhongzlxh = (String) paramMap.get("zhengclsh");
		String lingjbh = (String) paramMap.get("lingjbh");
		String xiaohd = (String) paramMap.get("xiaohd");
		String chanx = (String) paramMap.get("shengcxbh");
		String anxscjssj = (String) paramMap.get("anxscjssj");
		
		if(StringUtils.isBlank(usercenter))
		{
			errorSb.append("用户中心为空!");
		}
		if(StringUtils.isBlank(zhongzlxh))
		{
			errorSb.append("总装流水号为空!");
		}
		if(StringUtils.isBlank(lingjbh))
		{
			errorSb.append("零件编号为空!");
		}
		if(StringUtils.isBlank(xiaohd))
		{
			errorSb.append("消耗点为空!");
		}
		if(StringUtils.isBlank(chanx))
		{
			errorSb.append("产线为空!");
		}
		if(!pand.equals(Pand.CS))
		{
			if(StringUtils.isBlank(anxscjssj))
			{
				errorSb.append("C0上次计算时间为空!");
			}
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
			if(null != countLsh && countLsh > 0)
			{
				PandModel pandModel = this.js(paramMap, pand);
				if(null != pandModel)
				{
					resultMap.put("result", pandModel);
				}
				else
				{
					error.append("查询有误,请联系管理人员!");
					resultMap.put("message", error.toString());
				}
			}
			else
			{
				error.append("流水号不存在!");
				resultMap.put("message", error.toString());
			}
		}
		return resultMap;
	}

	/**
	 * @see   计算
	 * @param paramMap
	 * @param pand
	 * @return
	 */
	private PandModel js(Map paramMap , Pand pand)
	{
		PandModel pandModel = new PandModel();
		try
		{
			String pandtime = formatDateToString(new Date());
			paramMap.put("systime", pandtime);
			pandModel.setPandtime(pandtime);
			pandModel.setDaixh(this.jsDxh(paramMap, pand));
			pandModel.setChukl(this.jsChukl(paramMap, pand));
			pandModel.setYicdxh(this.jsYicdxh(paramMap, pand));
			pandModel.setDaijf(this.jsDaijf(paramMap, pand));
			pandModel.setXiaohl(this.jsXiaohl(paramMap, pand));
			pandModel.setYingyl(this.jsYingyl(paramMap, pand));
		} 
		catch (Exception e) 
		{
			pandModel = null;
		}
		return pandModel;
	}
	
	/**
	 * @see   计算盈余量
	 * @param paramMap
	 * @param pand
	 * @return
	 */
	private BigDecimal jsYingyl(Map paramMap, Pand pand) 
	{
		if(null == pand)
			return null;
		String queryYingyl = "xianbkc.queryDefaultYingyl";
		BigDecimal yingyl = BigDecimal.ZERO;
		if(pand.equals(Pand.C0))
		{
			return yingyl;
		}
		else if(pand.equals(Pand.CD))
		{
			return yingyl;
		}
		if(StringUtils.isNotBlank(queryYingyl))
		{
			yingyl = (BigDecimal)baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).selectObject(queryYingyl, paramMap);
			if(null == yingyl)
			{
				yingyl = BigDecimal.ZERO;
			}
		}
		return  yingyl ;
	}

	/**
	 * @see   计算消耗量
	 * @param paramMap
	 * @param pand
	 * @return
	 */
	private BigDecimal jsXiaohl(Map paramMap, Pand pand) 
	{
		if(null == pand)
			return null;
		String queryXiaohl = "xianbkc.queryDefaultXiaohl";
		//查询小火车编号
		//String queryXiaohcbh = "xianbkc.queryXiaohcbh";
		//查询小火车模板表内序号
		String queryMaxlsh = "xianbkc.queryMaxlsh";
		//String queryMaxlshChay = "xianbkc.queryMaxlshChay";
		//查询手输
		String queryTargetlsh = "xianbkc.queryTargetlsh";
		//List<String> queryMaxlshs = new ArrayList<String>();
		//List<String> queryMaxlshChays = new ArrayList<String>();
		BigDecimal xiaohl = BigDecimal.ZERO;
		BigDecimal maxLsh = BigDecimal.ZERO;
		BigDecimal targetLsh = BigDecimal.ZERO;
		if(pand.equals(Pand.C0))
		{
			return xiaohl;
		}
		else if(pand.equals(Pand.CD))
		{
			return xiaohl;
		}
		//查询手动输入的整车流水号所对应的序号
		queryTargetlsh = (String)baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).selectObject(queryTargetlsh, paramMap);
		if(StringUtils.isBlank(queryTargetlsh))
		{
			return xiaohl;
		}
		targetLsh = new BigDecimal(queryTargetlsh);
		queryMaxlsh = (String)baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).selectObject(queryMaxlsh, paramMap);
		if(StringUtils.isBlank(queryMaxlsh))
		{
			return xiaohl;
		}
		maxLsh = new BigDecimal(queryMaxlsh);
		
		
		//查看小火车编号
		/*queryXiaohcbh = (String)baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).selectObject(queryXiaohcbh, paramMap);
		if(StringUtils.isBlank(queryXiaohcbh))
		{
			return xiaohl;
		}
		paramMap.put("xiaohcbh", queryXiaohcbh);
		//查询消耗点已备货的当前流水序号
		queryMaxlshs = baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select(queryMaxlsh, paramMap);
		if(null == queryMaxlshs || queryMaxlshs.size() == 0 || StringUtils.isBlank(queryMaxlshs.get(0)))
		{
			return xiaohl;
		}
		//查询消耗点已备货的当前流水序号所对应的小火车差异量
		paramMap.put("zhengcxh", queryMaxlshs.get(0));
		queryMaxlshChays = baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select(queryMaxlshChay, paramMap);
		if(null == queryMaxlshChays || queryMaxlshChays.size() == 0 || StringUtils.isBlank(queryMaxlshChays.get(0)))
		{
			return xiaohl;
		}
		//查询零件,消耗点已备货的当前流水序号      maxLsh + chayi - 1
		maxLsh = new BigDecimal(queryMaxlshs.get(0));
		maxLsh = maxLsh.add(new BigDecimal(queryMaxlshChays.get(0)));*/
		
		
		
		if(null != maxLsh && null != targetLsh)
		{
			//如果手动输入小于或等于maxLsh
			if(maxLsh.longValue() < targetLsh.longValue())
			{
				paramMap.put("targetLsh", maxLsh.longValue());
				paramMap.put("maxLsh", targetLsh.longValue());
				//取负
				xiaohl = BigDecimal.ZERO.subtract((BigDecimal) baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).selectObject(queryXiaohl, paramMap));
			}
			else if(maxLsh.longValue() > targetLsh.longValue())
			{
				paramMap.put("targetLsh", targetLsh.longValue());
				paramMap.put("maxLsh", maxLsh.longValue());
				//取正
				xiaohl = (BigDecimal) baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).selectObject(queryXiaohl, paramMap);
			}
		}
		if(xiaohl == null)
		{
			xiaohl = BigDecimal.ZERO;
		}
		return xiaohl;
	}

	/**
	 * @see   计算待交付
	 * @param paramMap
	 * @param pand
	 * @return
	 */
	private BigDecimal jsDaijf(Map paramMap, Pand pand)
	{
		if(null == pand)
			return null;
		String queryDaijf = "xianbkc.queryDefaultDaijf";
		String queryDaijf2 = "xianbkc.queryDefaultDaijf2";
		BigDecimal daijf = BigDecimal.ZERO;
		BigDecimal daijf2 = BigDecimal.ZERO;
		if(pand.equals(Pand.C0))
		{
			return daijf;
		}
		else if(pand.equals(Pand.CD))
		{
			return daijf;
		}
		if(StringUtils.isNotBlank(queryDaijf))
		{
			///wuyichao   2014-06-26  CS模式盘点取带交付需加上ck_yaohlbdjf_l表中的数据
			daijf = (BigDecimal)baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).selectObject(queryDaijf, paramMap);	
			daijf2 = (BigDecimal)baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).selectObject(queryDaijf2, paramMap);	
			if(null == daijf)
			{
				daijf = BigDecimal.ZERO;
			}
			if(null == daijf2)
			{
				daijf2 = BigDecimal.ZERO;
			}
			daijf = daijf.add(daijf2);
		}
		return daijf;
	}

	/**
	 * @see   计算异常待消耗
	 * @param paramMap
	 * @param pand
	 * @return
	 */
	private BigDecimal jsYicdxh(Map paramMap , Pand pand)
	{
		if(null == pand)
			return null;
		String queryYicdxh = "xianbkc.queryDefaultYicdxh";
		BigDecimal yicdxh = BigDecimal.ZERO;
		if(pand.equals(Pand.C0))
		{
			
		}
		else if(pand.equals(Pand.CD))
		{
			
		}
		else if(pand.equals(Pand.CS))
		{
			//0011310: CD盘点修正，一个工作日只算一次 gswang 2015-04-13
			queryYicdxh = "xianbkc.queryDefaultYicdxhCS";
			yicdxh = (BigDecimal)baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).selectObject(queryYicdxh, paramMap);
			if(null == yicdxh){
				yicdxh = BigDecimal.ZERO;
			}
			return yicdxh;
		}
		if(StringUtils.isNotBlank(queryYicdxh))
		{
			yicdxh = (BigDecimal)baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).selectObject(queryYicdxh, paramMap);	
		}
		if(null == yicdxh)
		{
			yicdxh = BigDecimal.ZERO;
		}
		return yicdxh;
	}
	
	/**
	 * @see   计算出库量
	 * @param paramMap
	 * @param pand
	 * @return
	 */
	private BigDecimal jsChukl(Map paramMap , Pand pand)
	{
		if(null == pand)
			return null;
		String queryChukl = "xianbkc.queryDefaultChukl";
		BigDecimal chukl = BigDecimal.ZERO;
		if(pand.equals(Pand.C0))
		{
			
		}
		else if(pand.equals(Pand.CD))
		{
			
		}
		else if(pand.equals(Pand.CS))
		{
			return chukl;
		}
		if(StringUtils.isNotBlank(queryChukl))
		{
			chukl = (BigDecimal)baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).selectObject(queryChukl, paramMap);	
		}
		if(null == chukl)
		{
			chukl = BigDecimal.ZERO;
		}
		return chukl;
	}
	
	
	
	
	/**
	 * @see   计算待消耗
	 * @param paramMap
	 * @param pand
	 * @return
	 * @throws Exception 
	 */
	@SuppressWarnings({ "unused", "unchecked" })
	private BigDecimal jsDxh(Map paramMap , Pand pand) throws Exception
	{
		if(null == pand)
			return null;
		String queryXhsj = null;
		String queryDxhslByPlus = null; //正号
		String queryDxhslByMinus = null; //负号
		String xhsj = null;   //消耗时间
		String anxjssj = (String) paramMap.get("anxscjssj");
		BigDecimal dxh = BigDecimal.ZERO;
		queryXhsj = "xianbkc.queryC0Xhsj";  //查询消耗时间
		queryDxhslByPlus = "xianbkc.queryC0DxhslByPlus"; //查询取正待消耗
		queryDxhslByMinus = "xianbkc.queryC0DxhslByMinus"; //查询取负待消耗
		if(pand.equals(Pand.C0))
		{
		}
		else if(pand.equals(Pand.CD))
		{
			//queryXhsj = "xianbkc.queryCDXhsj";  //查询消耗时间
			//queryDxhslByPlus = "xianbkc.queryCDDxhslByPlus"; //查询取正待消耗
			//queryDxhslByMinus = "xianbkc.queryCDDxhslByMinus"; //查询取负待消耗
		}
		else if(pand.equals(Pand.CS))
		{
			return dxh;
		}
		if(StringUtils.isNotBlank(queryXhsj))
		{
			//得到消耗时间
			List<String> xiaohsjList = baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select(queryXhsj, paramMap);
			//取得消耗时间
			if(null != xiaohsjList && xiaohsjList.size() > 0)
			{
				xhsj = xiaohsjList.get(0);
			}
			if(StringUtils.isNotBlank(xhsj))
			{
				//待消耗取负数
				if(!checkLaterOtherTime(anxjssj,xhsj))
				{
					if(StringUtils.isNotBlank(queryDxhslByMinus))
					{
						dxh = BigDecimal.ZERO.subtract((BigDecimal)baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).selectObject(queryDxhslByMinus, paramMap));
					}
				}
				//待消耗取正数
				else
				{
					if(StringUtils.isNotBlank(queryDxhslByPlus))
					{
						dxh = (BigDecimal)baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).selectObject(queryDxhslByPlus, paramMap);
					}
				}
			}
		}
		if(null == dxh)
		{
			dxh = BigDecimal.ZERO;
		}
		return dxh;
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
	
	
	private String formatDateToString(Date date)
	{
		if (null == date)
			return null;
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String strDate = formatter.format(date);
		return strDate;
	}

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
		List<PandModel> pandMdelByC0 = new ArrayList<PandModel>();
		List<PandModel> pandMdelByCD = new ArrayList<PandModel>();
		List<PandModel> pandMdelByCS = new ArrayList<PandModel>();
		List<PandModel> pandMdelAll = new ArrayList<PandModel>();
		//检查参数
		if(checkPdqueryParam(params))
		{
			map.put("message", "零件编号与消耗点编号必填一项!");
		}
		else
		{
			//查询消耗点信息
			map = baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).selectPages("xianbkc.queryPandinfo", params, pageBean);
			if(null != map)
			{
				//查询盘点信息
				List<PandModel> pandMdels = (List<PandModel>) map.get("rows");
				if(null != pandMdels && pandMdels.size() > 0)
				{
					//区分C0 CD模式
					for (PandModel pandModel : pandMdels)
					{
						String mos = pandModel.getMos();
						if(StringUtils.isNotBlank(mos))
						{
							if(mos.equalsIgnoreCase("C0"))
							{
								pandMdelByC0.add(pandModel);
							}
							else if(mos.equalsIgnoreCase("CD"))
							{
								pandMdelByCD.add(pandModel);
							}
							else if(mos.equalsIgnoreCase("CS"))
							{
								pandMdelByCS.add(pandModel);
							}
						}
					}
					//初始盘点数据
					if(pandMdelByC0.size() > 0)
					{
						//初始C0盘点数据
						try 
						{
							pandMdelByC0 = this.queryC0Pandmodel(pandMdelByC0);
						} 
						catch (Exception e) 
						{
							pandMdelByC0 = null;
							errorSb.append("初始化盘点数据出错,原因为List转换Map时有误!");
							logger.error(errorSb.toString());
							e.printStackTrace();
						}
					}
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
							logger.error(errorSb.toString());
						}
						catch (NoAnxjssjException e)
						{
							pandMdelByCD = null;
							errorSb.append("调用wevservice时,查询CDMD按需上次计算时间有误,请联系管理员!");
							logger.error(errorSb.toString());
						}
						catch (Exception e) 
						{
							pandMdelByCD = null;
							errorSb.append("调用wevservice时出现错误,情况可能为(网络中断等..),请联系管理员!");
							logger.error(e);
							e.printStackTrace();
						}
					}
					if(pandMdelByCS.size() > 0)
					{
						//初始化CS数据
						for (PandModel cs : pandMdelByCS) 
						{
							cs.setXianbllkc(BigDecimal.ZERO);
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
					if(null != pandMdelByC0 && pandMdelByC0.size() > 0)
					{
						pandMdelAll.addAll(pandMdelByC0);
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
	
	/**
	 * @see   init 盘点数据
	 * @param c0List
	 * @return
	 * @throws NoSuchMethodException 
	 * @throws InvocationTargetException 
	 * @throws IllegalAccessException 
	 */
	public List<PandModel> queryC0Pandmodel(List<PandModel> c0List) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException
	{
		if(null != c0List && c0List.size() > 0)
		{
			//查找C0上次计算时间
			String coscjssj = (String) baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).selectObject("xianbkc.queryC0scjssj");
			//如果C0上次时间没有对于盘点来说无意义
			if(StringUtils.isNotBlank(coscjssj))
			{
				Map<String , Object> flagMap = null;
				//查找线边理论库存
				List flagList =  baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("xianbkc.queryXianbkc");
				if(null != flagList && flagList.size() > 0)
				{
					//集合转换
					flagMap = translateListToMap(flagList, "lingjsl", "usercenter","lingjbh","xiaohd");
				}
				//如果有线边理论库存进行赋值，反之初始化为0
				for (PandModel pandModel : c0List)
				{
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
					pandModel.setAnxscjssj(coscjssj);
				}
			}
		}
		return c0List;
	}
	
	/**
	 * @throws Exception 
	 * @see   init 盘点数据
	 * @param c0List
	 * @return
	 * @throws  
	 */
	public List<PandModel> queryCDPandmodel(List<PandModel> cdList) throws Exception 
	{
		PandWebserviceUtil pandWebserviceUtil = new PandWebserviceUtil();
		return pandWebserviceUtil.initPandModel(cdList);
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
	 * @see   保存盘点信息,并且给与客户反馈信息
	 * @param pandModels
	 * @return
	 */
	public Map pdsave(List<PandModel> pandModels , String creator)
	{
		//init 变量
		Map<String, Object> map = new HashMap<String, Object>();
		StringBuffer errorSb = new StringBuffer();
		List<PandModel> pandMdelByC0 = new ArrayList<PandModel>();
		List<PandModel> pandMdelByCD = new ArrayList<PandModel>();
		List<PandModel> pandMdelByCS = new ArrayList<PandModel>();
		int index = 1;
		if(null != pandModels)
		{
			for (PandModel pandModel : pandModels) 
			{
				if(checkPandModel(pandModel))
				{
					//初始化盘点人和盘点时间
					pandModel.setCreator(creator);
					pandModel.setCreate_time(formatDateToString(new Date()));
					String mos = pandModel.getMos();
					if(StringUtils.isNotBlank(mos))
					{
						if(mos.equalsIgnoreCase("C0"))
						{
							pandMdelByC0.add(pandModel);
						}
						else if(mos.equalsIgnoreCase("CD"))
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
				//saveC0盘点数据
				if(pandMdelByC0.size() > 0)
				{
					try
					{
						pdsaveByC0PandModel(pandMdelByC0);
					}
					catch (Exception e)
					{
						errorSb.append("C0盘点数据插入批处理出错!");
						logger.error(e);
						e.printStackTrace();
					}
				}
				if(pandMdelByCD.size() > 0)
				{
					try 
					{
						pdsaveByCDPandModel(pandMdelByCD);
					} 
					catch (TranslateListToMapException e) 
					{
						errorSb.append("调用Webservice时转换数据有误!");
						logger.error(e);
						e.printStackTrace();
					}
					catch (AnxjssjSjerrException e) 
					{
						//0011310: CD盘点修正，一个工作日只算一次 gswang 2015-04-13
						errorSb.append("按需已重新计算，请重新盘点!");
						logger.error(e);
						e.printStackTrace();
					}
					catch (Exception e) 
					{
						errorSb.append("CD盘点数据插入批处理出错!");
						logger.error(e);
						e.printStackTrace();
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

	private void pdsaveByCSPandModel(List<PandModel> pandModels) throws Exception 
	{
		pandModels = translatePandModel(pandModels);
		baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).executeBatch("xianbkc.saveCSpandModel", pandModels);
	}

	/**
	 * @see   保存C0盘点数据
	 * @param pandModels
	 * @throws Exception 
	 */
	@Transactional
	private void pdsaveByC0PandModel(List<PandModel> pandModels) throws Exception 
	{
		 pandModels = translatePandModel(pandModels);
		 baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).executeBatch("xianbkc.saveC0pandModel", pandModels);
	}
	
	
	private List<PandModel> translatePandModel(List<PandModel> pandModels) throws Exception
	{
		Map<String, PandModel> flagMap = new HashMap<String, PandModel>();
		PandModel flagPandModel = null;
		for (PandModel pandModel : pandModels) 
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
		pandModels = new ArrayList<PandModel>();
		for(Iterator<PandModel> it = flagMap.values().iterator();it.hasNext();)
		{
			pandModels.add(it.next());
		}
		return pandModels;
	}
	
	/**
	 * @see   保存CD盘点数据
	 * @param pandModels
	 * @throws Exception 
	 */
	private void pdsaveByCDPandModel(List<PandModel> pandModels) throws Exception
	{
		PandWebserviceUtil pandWebserviceUtil = new PandWebserviceUtil();
		pandWebserviceUtil.savePandModel(pandModels);
	}


	/**
	 * @see   验证盘点信息是否完整
	 * @param pandModel
	 * @return
	 */
	private boolean checkPandModel(PandModel pandModel) 
	{
		boolean flagResult = true;
		if(null == pandModel)
		{
			flagResult = false;
		}
		else
		{
			if(null == pandModel.getDaixh() || null == pandModel.getChukl() ||
			null == pandModel.getYicdxh()  || StringUtils.isBlank(pandModel.getPandtime()) ||	
			null == pandModel.getDaijf() || null == pandModel.getXiaohl() || null == pandModel.getYingyl() ||
			StringUtils.isBlank(pandModel.getUsercenter()) || StringUtils.isBlank(pandModel.getXiaohd()) ||
			StringUtils.isBlank(pandModel.getLingjbh()) || null == pandModel.getXianbllkc() ||
			 null == pandModel.getChay() ||
			null == pandModel.getPandljsl() || StringUtils.isBlank(pandModel.getZhengclsh()) ||
			StringUtils.isBlank(pandModel.getShengcxbh()) || StringUtils.isBlank(pandModel.getMos())
			)
			{
				flagResult = false;
			}
			if((!pandModel.getMos().equalsIgnoreCase("CS") && StringUtils.isBlank(pandModel.getAnxscjssj())))
			{
				flagResult = false;
			}
		}
		return flagResult;
	}
}
