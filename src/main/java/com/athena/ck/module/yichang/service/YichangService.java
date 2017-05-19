package com.athena.ck.module.yichang.service;

import java.util.List;
import java.util.Map;

import com.athena.ck.entity.yichang.Yic;
import com.athena.ck.entity.yichang.Zerzt;
import com.athena.ck.entity.yichang.Zhijbgd;
import com.athena.ck.entity.yichang.Zhijqd;
import com.athena.component.service.BaseService;
import com.athena.db.ConstantDbCode;
import com.toft.core3.container.annotation.Component;

@Component
public class YichangService extends BaseService{
	/**
	 * 查询质检报告单
	 */
	public List<Zhijbgd> selectZhijbgd(Map map){
		return (List<Zhijbgd>)baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("yichang.queryZhijbgd", map);
	}
	

	public List<Zhijbgd> selectZrztmc(Map<String, String> paramMap)
	 {
		if(paramMap.get("zerzt").equals("1") || paramMap.get("zerzt").equals("2")){
			return (List<Zhijbgd>)baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("yichang.queryZrztmc2", paramMap);
		}else{
			return (List<Zhijbgd>)baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("yichang.queryZrztmc", paramMap);
		}
	}
	
	
	/**
	 * 查询质检清单
	 */
	public List<Zhijqd> selectZhijqd(Map map){
		return (List<Zhijqd>)baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("yichang.queryZhijqd", map);
	}
	
	/**
	 * 406 查询责任主体
	 */
	public List<Zerzt> querZerzt(Map map){
		return  (List<Zerzt>)baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("yichang.zerzt",map);
	}
	


	
	/**
	 * 查询申报点
	 *
	 */
	public List<Yic> selectshenbd(Map map){
		return (List<Yic>)baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("yichang.queryshenbd", map);
	}
	
	/**
	 * 查询零件仓库供应商标识
	 * @author 贺志国
	 * @date 2014-9-19
	 * @param map 用户中心、供应商编号、零件编号
	 * @return List<Map<String,String>>
	 */
	public List<Map<String,String>> selectGysBiaos(Map map){
		return  baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("yichang.queryBiaosOfLjck", map);
	}

	

}
