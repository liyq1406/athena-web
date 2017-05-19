package com.athena.ck.module.shouhuo.service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.athena.ck.entity.shouhuo.Daohtzd;
import com.athena.ck.entity.shouhuo.Uabq;
import com.athena.ck.entity.shouhuo.Usbq;
import com.athena.component.service.BaseService;
import com.athena.db.ConstantDbCode;
import com.toft.core3.container.annotation.Component;

@Component
public class JuanlService extends BaseService{
	// log4j日志初始化
	static Logger logger = Logger.getLogger(JuanlService.class); 


	public Daohtzd daohuosbdy_main(Map map){
		return (Daohtzd)baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).selectObject("shouhuo.daohuosbdy_main", map);
	}

	
	public List<Uabq> daohuosbdy_list1(Map map){
		return baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("shouhuo.daohuosbdy_list1", map);
	}
	
	
	public Daohtzd daohuoysdy_main(Map map){
		return (Daohtzd)baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).selectObject("shouhuo.daohuoysdy_main", map);
	}

	public List<Uabq> daohuoysdy_list1(Map map){
		return baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("shouhuo.daohuoysdy_list1", map);
	}
	
	public List<Uabq> daohuoysdy_list2(Map map){
		return baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("shouhuo.daohuoysdy_list2", map);
	}
	
	public List<Uabq> daohuoysdy_list3(Map map){
		return baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("shouhuo.daohuoysdy_list3", map);
	}
	
	public Usbq shuxlrdy_main(Map map){
		return (Usbq)baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).selectObject("shouhuo.shuxlrdy_main", map);
	}
	
	/**
	 *  打印增加次数
	 * 
	 * 
	public String rongqtgysdy_cs(Map map){
		try{
		baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).execute("rongqi.rongqtgysdy_cs",map);	
		}catch(Exception e){
			logger.error(e.getMessage());
			return "C_INSERTSB";
		}
		return "0000";				
	}
	*/
	
	
}