package com.athena.ck.module.shouhuo.service;

import java.util.List;
import java.util.Map;

import com.athena.ck.entity.common.Peislb;
import com.athena.ck.entity.shouhuo.Lingjuagx;
import com.athena.ck.entity.shouhuo.Tongbyhl;
import com.athena.ck.entity.shouhuo.Tongbysd;
import com.athena.ck.entity.shouhuo.Tongbysdmx;
import com.athena.component.service.BaseService;
import com.athena.db.ConstantDbCode;
import com.toft.core3.container.annotation.Component;

@Component
public class TongbshService  extends BaseService{
	/**
	 * 查询同步验收单数据
	 */
	public Tongbysd selectTongbysd(Map map){
		//同步验收单
		Tongbysd tongbysd = new Tongbysd();
		//查询包装信息
		tongbysd.setListbzxx((List<Tongbysdmx>)baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("shouhuo.queryTongbysdBzxx", map));
		//零件汇总信息
		tongbysd.setListljhzxx((List<Lingjuagx>)baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("shouhuo.queryTongbysdLjhzxx", map));
		//差异信息
		tongbysd.setListcyxx((List<Lingjuagx>)baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("shouhuo.queryTongbysdCyxx", map));
		if (tongbysd.getListbzxx().size() > 0){
			tongbysd.setUsercenter(tongbysd.getListbzxx().get(0).getUsercenter());
			tongbysd.setUth(tongbysd.getListbzxx().get(0).getUth());
			tongbysd.setChengysdm(tongbysd.getListbzxx().get(0).getChengysdm());
			tongbysd.setChengysmc(tongbysd.getListbzxx().get(0).getChengysmc());
		}
		return tongbysd;
	}
	/**
	 * 查询零件序列号数据
	 */
	public  String  selectLingjxlh(Map map){
		return (String) baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).selectObject("common.queryLingjxlh",map);
		
	}
	/**
	 * 判断零件序列号是否存在在成品包装
	 */
	public  String  selectChengpbz(Map map){
		return (String) baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).selectObject("common.queryChengpbz",map);
	}
	/**
	 * 153 导出查询要货令相关信息 
	 * 当要货令状态为00查询ck_lingjuagx及ck_yaohl和ck_uabq表信息
	 * 当要货令状态不为00时查询ck_tongbjpd及ck_yaohl表信息
	 */
	public List<Tongbyhl> selectbaozdykxx(Map map){			
		 return baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("shouhuo.queryTbbzdyk", map);
	}     
	/**
	 * 补货申报通过零件查询配送类别
	 */
	public  List<Peislb> selectLjpslb(Map map){
		return baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("common.150Peislb",map);
	}
	/**
	 *补货申报查询客户
	 */
	public  String  selectKeh(Map map){
	return  (String) baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).selectObject("shouhuo.150keh",map);
	}
}
