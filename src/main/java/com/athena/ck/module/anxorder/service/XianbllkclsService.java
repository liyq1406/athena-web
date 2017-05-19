package com.athena.ck.module.anxorder.service;

import java.util.List;
import java.util.Map;

import com.athena.component.service.BaseService;
import com.athena.db.ConstantDbCode;
import com.athena.xqjs.module.common.CommonFun;
import com.toft.core3.container.annotation.Component;
import com.toft.core3.support.PageableSupport;

/**
 * @see    C0盘点历史
 * @author wuyichao
 *
 */
@Component
@SuppressWarnings("rawtypes")
public class XianbllkclsService extends BaseService
{

	/**
	 * @see   返回按照param参数查询的盘点历史数据
	 * @param kucjscsb
	 * @param params
	 * @return
	 */
	public Object queryPandls(PageableSupport pageBean, Map<String, String> params) 
	{
		String queryStr = "xianbkc.queryPandlsByC0";
		if("C0".equalsIgnoreCase(params.get("mos")))
		{
			
		}
		else if("CS".equalsIgnoreCase(params.get("mos")))
		{
			queryStr = "xianbkc.queryPandlsByCS";
		}
		if(!"exportXls".equals(params.get("exportXls")))
		{
			return baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).selectPages(queryStr, params , pageBean);
		}
		else
		{
			List list = baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select(queryStr,params);
			if( null != list )
			{
				if(list.size() > 5000)
					return "<script>alert(\"导出数量不能大于5000!请做调整\");window.close();</script>";
				else
					return CommonFun.listToMap(list);
			}
			return list;
		}
	}

	
}
