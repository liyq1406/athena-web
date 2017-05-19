package com.athena.ck.module.kunei.service;

import java.util.List;
import java.util.Map;

import com.athena.ck.entity.kunei.Pandrw;
import com.athena.component.service.BaseService;
import com.athena.db.ConstantDbCode;
import com.toft.core3.container.annotation.Component;


@Component
public class KunService extends BaseService{
	/**
	 * 查询盘点任务
	 */
	public List<Pandrw> selectPandrw(Map map){
		
		return (List<Pandrw>)baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("kunei.queryPandrw", map);
	}
	
	
	/*
	 * xss_0011694
	 * 
	 * */
	public List<String> jiufcjShijljbhck(Map map){ 
		return (List<String>)baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("kunei.queryShijckbh", map);
	}
	
	
}
