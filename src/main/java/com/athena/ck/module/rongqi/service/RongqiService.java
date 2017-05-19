package com.athena.ck.module.rongqi.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.athena.ck.entity.rongqi.RongQiPring_634;
import com.athena.ck.entity.rongqi.Rongqdbd;
import com.athena.ck.entity.rongqi.Rongqdj;
import com.athena.ck.entity.rongqi.Rongqfh;
import com.athena.ck.entity.rongqi.Rongqjs;
import com.athena.ck.entity.rongqi.Rongqwx;
import com.athena.ck.entity.rongqi.Rongqzwls;
import com.athena.ck.entity.rongqi.Rongqzz_l;
import com.athena.ck.entity.rongqi.rongqzdjgd;
import com.athena.component.service.BaseService;
import com.athena.db.ConstantDbCode;
import com.toft.core3.container.annotation.Component;
import com.toft.core3.transaction.annotation.Transactional;

@Component
public class RongqiService extends BaseService{
	// log4j日志初始化
	static Logger logger = Logger.getLogger(RongqiService.class); 
	
	/**
	 * 根据接收单号查询容器接收单
	 */
	public List<Rongqjs> getRongqjsd(Map map){
		 return  baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("rongqi.queryRongqjsd", map);
	}
	
	/**
	 *  根据接收单号查询容器接收单 _ 634
	 */
	public List<RongQiPring_634> getRongqjsd_634(Map map){
		 return  baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("rongqi.queryRongqjsd_634", map);
	}
	
	/**
	 * 根据返还单号查询容器返还单
	 */
	public List<Rongqjs> getRongqfhd(String jsfhdh){
		 return  baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("rongqi.queryRongqfhd", jsfhdh);
	}
	
	/**
	 * 根据维修单号查询容器维修单
	 */
	public List<Rongqwx> getRongqwxd(Map map){
		 return  baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("rongqi.queryRongqwxd", map);
	}
	
	/**
	 * 根据单据编号查询容器报废申请单
	 */
	public List<Rongqdj> getRongqbfsqd(Map map){
		 return  baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("rongqi.queryRongqbfsqd", map);
	}
	

	/**
	 * 容器调拨单打印
	 */
	public List<Rongqdbd> printrongqidiaobo(Map map){
		return baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("rongqi.printrongqidiaobo", map);
	}
	/**
	 * 637 容器出库单打印
	 */
	public List<Rongqdbd> print_63701(Map map){
		return baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("rongqi.print_63701", map);
	}
	/**
	 * 容器盘点指导单
	 */
	public List<rongqzdjgd> selectpandzdxls(Map map){
		 return  baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("rongqi.querypandzdxls", map);
	}
	/**
	 * 容器盘点结果单
	 */
	public List<rongqzdjgd> selectpandjgxls(Map map){
		 return  baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("rongqi.querypandjgxls", map);
	}
	
	/**
	 * 64206  容器出库单打印
	 * 主区域
	 */
	public List<Rongqfh> rongqtgysdy_00(Map map){
		return baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("rongqi.rongqtgysdy_00", map);
	}
	
	/**
	 * 64206  容器出库单打印
	 * 列表1
	 */
	public List<RongQiPring_634> rongqtgysdy_01(Map map){
		return baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("rongqi.rongqtgysdy_01", map);
	}
	
	/**
	 * 64206  容器出库单打印
	 * 列表2
	 */
	public List<RongQiPring_634> rongqtgysdy_02(Map map){
		return baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("rongqi.rongqtgysdy_02", map);
	}
	
	
	/**
	 * 64206 查询今天内的序号
	 * 
	 * */
	public Integer rongqtgysdy_xuh (Map map){
		return (Integer) baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).selectObject("rongqi.rongqtgysdy_xuh",map);	
	}
	
	
	/**
	 * 642-643  打印增加次数
	 * 
	 * */
	public String rongqtgysdy_cs(Map map){
		try{
		baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).execute("rongqi.rongqtgysdy_cs",map);	
		}catch(Exception e){
			logger.error(e.getMessage());
			return "C_INSERTSB";
		}
		return "0000";				
	}
	
	

	
	/**
	 * 644  通过返还单号查询返还单的用户中心
	 * 11891
	 * */
	public String getUsercenterByFanhdh (String fanhdh){
		return  (String) baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).selectObject("rongqi.getUsercenterByFanhdh",fanhdh);	
	}
	/**
	 * 644  批量插入容器帐务流水
	 * 11891
	 * */
	public String insertZwls(List<Rongqzwls> zwls) {
		baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).executeBatch("rongqi.savezwls",zwls);
		return "success";
	}
	/**
	 * 644   插入容器总帐和帐务流水
	 * 11891
	 * */
	@Transactional
	public String insertZZ(List<Rongqzwls> zwls) {
		// TODO Auto-generated method stub
		String wuld_jzq = new String();
		String diaorwld_jzq = new String();
		Map<String,String> map = new HashMap<String,String>();
		Map<String,String> map1 = new HashMap<String,String>();
		
		map.put("usercenter", zwls.get(0).getUsercenter());
		map1.put("usercenter", zwls.get(0).getUsercenter());
		
		map.put("wuld", zwls.get(0).getWuld());
		map1.put("wuld", zwls.get(0).getDiaorwld());
		
		try{
			wuld_jzq = (String) baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).selectObject("rongqi.getJizq",map);
			diaorwld_jzq = (String) baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).selectObject("rongqi.getJizq",map1);	
		}catch(Exception e)
		{
			logger.error(e.getMessage());
			return "C_RQZZ_07";
		}
		if(wuld_jzq == null || diaorwld_jzq == null )
		{
			logger.error("物理点记账区"+wuld_jzq+"和调入物理点记账区"+wuld_jzq+"为空");
			return "C_644_009";
		}
		if(wuld_jzq.equals(diaorwld_jzq))
		{
			logger.error("物理点记账区"+wuld_jzq+"和调入物理点记账区"+wuld_jzq+"相同");
			return "C_644_008";
		}
		//判断调入记账区是否欠返还记账区足够的容器
		/*Map<String,String> map2 = new HashMap<String,String>();
		map2.put("wuld_jzq", wuld_jzq);
		map2.put("diaorwld_jzq", diaorwld_jzq);
		map2.put("usercenter",  zwls.getUsercenter());
		map2.put("rongqxh",  zwls.getRongqxh());
		map2.put("rongqsl",  Integer.toString(zwls.getRongqsl()));
		
		int count = 0;
		
		try{
			count = (Integer) baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).selectObject("rongqi.shifkjs",map2);
			if(count <= 0)
			{
				logger.error("没有足够的容器"+map2.get("rongqxh"));
				return "C_RQWBLR_1";
			}
		}catch(Exception e)
		{
			logger.error(e.getMessage());
			return "C_RQWBLR_4";
		}
		*/
		String response=new String();
		for(int i=0;i<zwls.size();i++)
		{
			response = insertZS(zwls.get(i),wuld_jzq,diaorwld_jzq);
			if(!response.equals("0000"))
			{
				return response;
			}
		}
		
		return "0000";
}

/*
 * 单条帐务流水信息插入
 */
public String insertZS(Rongqzwls zwls,String wuld_jzq,String diaorwld_jzq ) {
	
	logger.info("单条容器帐务流水信息插入 用户中心 "+zwls.getUsercenter()+"容器型号 "+zwls.getRongqxh()+"容器数量"+zwls.getRongqsl()+"物理点"+zwls.getWuld());
	try{
		baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).execute("rongqi.savezwls_s",zwls);
	}catch(Exception e)
	{
		logger.error(e.getMessage());
		return "C_RQWBLR_4";
	}
	logger.info("第一笔内部账 用户中心 "+zwls.getUsercenter()+"容器型号 "+zwls.getRongqxh()+"容器数量-"+zwls.getRongqsl()+"物理点"+zwls.getWuld()+"承运商"+"000000");
	//第一个账，内部账 17428683	UX	RQL01	1 	000000	000000	00081	-12		2016-1-4 10:31:15	
	Rongqzz_l bean1 = new Rongqzz_l();
	bean1.setUsercenter(zwls.getUsercenter());
	String liush = new String();
	try{
		liush = (String) baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).selectObject("rongqi.getLiush");		
	}catch(Exception e){
		logger.error(e.getMessage());
		return "C_RQZZ_10";
	}
	bean1.setLiush(liush);
	bean1.setJzlx("1");
	bean1.setWuld(zwls.getWuld());
	bean1.setChengys("000000");
	bean1.setGongysdm("000000");
	bean1.setRongqlb(zwls.getRongqxh());
	bean1.setRongqsl(0-zwls.getRongqsl());
	bean1.setEdit_time(zwls.getCreate_time());
	
	try{
		baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).execute("rongqi.savezz_l",bean1);
	}catch(Exception e)
	{
		logger.error(e.getMessage());
		return "C_RQZZ_11";
	}
	logger.info("第二笔外部账 用户中心 "+zwls.getUsercenter()+"容器型号 "+zwls.getRongqxh()+"容器数量-"+zwls.getRongqsl()+"物理点"+wuld_jzq+"承运商"+diaorwld_jzq);
	//第二个账，外部账 17428684	UX	JZUWH3	2 	XYJZQ1	XYJZQ1	00081	-12		2016-1-4 10:31:15	
	Rongqzz_l bean2 = new Rongqzz_l();
	bean2.setUsercenter(zwls.getUsercenter());
	String liush2 = new String();
	try{
		liush2 = (String) baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).selectObject("rongqi.getLiush");		
	}catch(Exception e){
		logger.error(e.getMessage());
		return "C_RQZZ_10";
	}
	bean2.setLiush(liush2);
	bean2.setJzlx("2");
	bean2.setWuld(wuld_jzq);
	bean2.setChengys(diaorwld_jzq);
	bean2.setGongysdm(diaorwld_jzq);
	bean2.setRongqlb(zwls.getRongqxh());
	bean2.setRongqsl(0-zwls.getRongqsl());
	bean2.setEdit_time(zwls.getCreate_time());
	
	try{
		baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).execute("rongqi.savezz_l",bean2);
	}catch(Exception e)
	{
		logger.error(e.getMessage());
		return "C_RQZZ_11";
	}
	
	logger.info("第三笔外部账 用户中心 "+zwls.getUsercenter()+"容器型号 "+zwls.getRongqxh()+"容器数量"+zwls.getRongqsl()+"物理点"+diaorwld_jzq+"承运商"+wuld_jzq);
	//第三个账，外部账	17428686	UX	XYJZQ1	2 	JZUWH3	JZUWH3	00081	12		2016-1-4 10:31:15		
	Rongqzz_l bean3 = new Rongqzz_l();
	bean3.setUsercenter(zwls.getUsercenter());
	String liush3 = new String();
	try{
		liush3 = (String) baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).selectObject("rongqi.getLiush");		
	}catch(Exception e){
		logger.error(e.getMessage());
		return "C_RQZZ_10";
	}
	bean3.setLiush(liush3);
	bean3.setJzlx("2");
	bean3.setWuld(diaorwld_jzq);
	bean3.setChengys(wuld_jzq);
	bean3.setGongysdm(wuld_jzq);
	bean3.setRongqlb(zwls.getRongqxh());
	bean3.setRongqsl(zwls.getRongqsl());
	bean3.setEdit_time(zwls.getCreate_time());
	
	try{
		baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).execute("rongqi.savezz_l",bean3);
	}catch(Exception e)
	{
		logger.error(e.getMessage());
		return "C_RQZZ_11";
	}
	logger.info("第三笔内部账 用户中心 "+zwls.getUsercenter()+"容器型号 "+zwls.getRongqxh()+"容器数量"+zwls.getRongqsl()+"物理点"+zwls.getDiaorwld()+"承运商"+"000000");
	//第四个账，内部账17428685	UX	ZCKRQC	1 	000000	000000	00081	12		2016-1-4 10:31:15			
	Rongqzz_l bean4 = new Rongqzz_l();
	bean4.setUsercenter(zwls.getUsercenter());
	String liush4 = new String();
	try{
		liush4 = (String) baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).selectObject("rongqi.getLiush");		
	}catch(Exception e){
		logger.error(e.getMessage());
		return "C_RQZZ_10";
	}
	bean4.setLiush(liush4);
	bean4.setJzlx("1");
	bean4.setWuld(zwls.getDiaorwld());
	bean4.setChengys("000000");
	bean4.setGongysdm("000000");
	bean4.setRongqlb(zwls.getRongqxh());
	bean4.setRongqsl(zwls.getRongqsl());
	bean4.setEdit_time(zwls.getCreate_time());
	
	try{
		baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).execute("rongqi.savezz_l",bean4);
	}catch(Exception e)
	{
		logger.error(e.getMessage());
		return "C_RQZZ_11";
	}

	return "0000";
	}
}