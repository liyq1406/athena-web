package com.athena.ck.module.yaohl.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.athena.ck.entity.yaohl.Yaohls;
import com.athena.component.service.BaseService;
import com.athena.db.ConstantDbCode;
import com.toft.core3.Pageable;
import com.toft.core3.container.annotation.Component;

/**
 * CD/MD上线全程跟踪
 * @author 贺志国
 * @E-mail zghe@isoftstone.com
 * @version v1.0
 * @date 2014-10-31
 */
@Component
public class YaohlsService extends BaseService<Yaohls> {

	/**
	 * 分页查询 CD
	 * @author 贺志国
	 * @date 2014-10-31
	 * @param page
	 * @param params
	 * @return
	 */
	public Map<String, Object> selectYaohlOfcd(Pageable page, Map<String, String> params) {
		return baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CK).selectPages("yaohls.queryYaohlOfcd", params, page);
	}
	
	
	/**
	 * 分页查询 MD
	 * @author 贺志国
	 * @date 2014-10-31
	 * @param page
	 * @param params
	 * @return
	 */
	public Map<String, Object> selectYaohlOfmd(Pageable page, Map<String, String> params) {
		return baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CK).selectPages("yaohls.queryYaohlOfmd", params, page);
	}
	
	/**
	 * 查询数据条数
	 * @author 王国首
	 * @date 2014-11-06
	 * @param params
	 * @return
	 */
	public int selectYaohlOfcdmdCount(Map<String, String> params) {
		return (Integer) baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CK).selectObject(params.get("sql"), params);
	}
	
	/**
	 * 查询数据下载
	 * @author 王国首
	 * @date 2014-11-06
	 * @param params
	 * @return
	 */
	public Map<String, Object> selectYaohlOfcdmdDown(Map<String, String> params) {
		Map<String, Object> ls = new HashMap<String, Object>();
		List<Yaohls> bean = baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CK).select(params.get("sql"), params);
		HashMap<String,String> qiandYaohlhzt = new HashMap<String,String>();
		qiandYaohlhzt.put("00", "已交付");
		qiandYaohlhzt.put("01", "表达");
		qiandYaohlhzt.put("02", "在途");
		qiandYaohlhzt.put("03", "等待交付");
		qiandYaohlhzt.put("04", "延迟交付");
		qiandYaohlhzt.put("05", "已终止");
		qiandYaohlhzt.put("06", "未发送");
		qiandYaohlhzt.put("08", "冻结");
		qiandYaohlhzt.put("09", "创建");
		
		HashMap<String,String> qiandDdzt = new HashMap<String,String>();
		qiandDdzt.put("0", "延迟");
		qiandDdzt.put("1", "提前");
		qiandDdzt.put("2", "正常");
		for(Yaohls yaohlBean : bean){
			if(yaohlBean.getQiandYaohlhzt()!=null && !"".equals(yaohlBean.getQiandYaohlhzt()) && qiandYaohlhzt.get(yaohlBean.getQiandYaohlhzt())!= null){
				yaohlBean.setQiandYaohlhzt(qiandYaohlhzt.get(yaohlBean.getQiandYaohlhzt()));
			}
			if(yaohlBean.getHoudYaohlhzt()!=null && !"".equals(yaohlBean.getHoudYaohlhzt()) && qiandYaohlhzt.get(yaohlBean.getHoudYaohlhzt())!= null){
				yaohlBean.setHoudYaohlhzt(qiandYaohlhzt.get(yaohlBean.getHoudYaohlhzt()));
			}
			if(yaohlBean.getQiandDdzt()!=null && !"".equals(yaohlBean.getQiandDdzt()) && qiandDdzt.get(yaohlBean.getQiandDdzt())!= null){
				yaohlBean.setQiandDdzt(qiandDdzt.get(yaohlBean.getQiandDdzt()));
			}
		}
		ls.put("list", bean);
		return ls;
	}
}
