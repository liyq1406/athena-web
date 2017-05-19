package com.athena.jk.module.service;

import java.util.Map;

import com.athena.component.service.BaseService;
import com.athena.db.ConstantDbCode;
import com.athena.jk.entity.In_zidb;
import com.athena.util.exception.ServiceException;
import com.toft.core3.Pageable;
import com.toft.core3.container.annotation.Component;

/**
 * 
 * @author 贺志国
 * @E-mail zghe@isoftstone.com
 * @version v1.0
 * @date 2013-3-20
 */
@Component
public class In_zidbService extends BaseService<In_zidb> {
	/**
	 * 接口字典表查询
	 * @author 贺志国
	 * @date 2012-10-25
	 * @param page 分页显示
	 * @param param 查询参数
	 * @return Map<String,Object>
	 */
	public Map<String,Object> selectInzidb(Pageable page,Map<String,String> param) throws ServiceException{
		return baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_INTERFACE).selectPages("jk.queryIn_zidb",param,page);
	}
	
	
	/**
	 * 返回sqlmap-xxx.xml配置文件中的namespace属性名
	 */
	@Override
	protected String getNamespace(){
		return "jiekou";
	}
}
