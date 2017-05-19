package com.athena.ck.module.clrc.service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.athena.ck.entity.rongqi.Rongqfh;
import com.athena.component.service.BaseService;
import com.athena.db.ConstantDbCode;
import com.toft.core3.container.annotation.Component;

@Component
public class ClrcService extends BaseService{
	// log4j日志初始化
	static Logger logger = Logger.getLogger(ClrcService.class); 
	
	/**
	 * 172 空车出厂确认
	 */
	public String kongccqr(Map map){
				try{
					int i = (Integer) baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).selectObject("clrc.kongccsfdy",map);		
					if(i>0){
						return "C_172_02";
					}
					
					/* 只能打一次
					int j = (Integer)baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).selectObject("clrc.rongqtgyssfdy",map);		
					if(j>0){
						return "C_172_03";
					}
				    */
					
					
					/* 621互斥 作废
					int k = (Integer)baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).selectObject("clrc.rongqtjmydy",map);		
					if(k>0){
						return "C_172_03";	
					}
					*/
					
					/* 621互斥 作废*/
					int m = (Integer)baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).selectObject("clrc.rongfhpd",map);		
					if(m>0){
						return "C_172_03";	
					}
					
					
					baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).execute("clrc.insertRongqdj",map);				
				}catch(Exception e){
					logger.error(e.getMessage());
					return "C_INSERTSB";
				}
		return "0000";		
	}
	
	/**
	 * 172 空车出厂打印
	 */
	public List<Rongqfh> kongccdy(Map map){
			return baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("clrc.print_172", map);
	}
	

	/**
	 * 17401	空车出厂查询
	 * @return
	 * String
	 */
	
	public List<Rongqfh> kongcccchax(Map map){
		 return  baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("clrc.kongcccchax", map);
	}
	
	/**
	 * 17402  空车出厂撤销
	 */
	public String kongcccchex(Map map){
				try{
					baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).execute("clrc.kongcccchex",map);				
				}catch(Exception e){
					logger.error(e.getMessage());
					return "C_INSERTSB";
				}
		return "0000";		
	}	
	
	
	/**
	 * 174  空车出厂补打
	 */
	
	public List<Rongqfh> kongccbd(Map map){
			return baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("clrc.print_174", map);
		
	}
	
	/**
	 * 17403  空车出厂补打计数
	 * 0011242
	 */
	public String kongcccjs(Map map){
				try{
					baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).execute("clrc.kongcccjs",map);				
				}catch(Exception e){
					logger.error(e.getMessage());
					return "C_INSERTSB";
				}
		return "0000";		
	}	
	
	
}
