package com.athena.ck.module.beihuo.service;

import java.util.List;
import java.util.Map;

import com.athena.ck.entity.beihuo.Beihdtbyhl;
import com.athena.ck.entity.beihuo.Beihdtbyhlmx;
import com.athena.ck.entity.beihuo.Chuklscx;
import com.athena.ck.entity.beihuo.Kuccx;
import com.athena.ck.entity.beihuo.Saokcx;
import com.athena.ck.entity.shouhuo.Tongbyhl;
import com.athena.component.service.BaseService;
import com.athena.db.ConstantDbCode;
import com.toft.core3.container.annotation.Component;

@Component
public class BeihckService extends BaseService{
	
	/**
	 * 根据备货单号查询同步要货令
	 */
	public List<Beihdtbyhl> getTongbyhl(String beihdh){
		 return  baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("beihuo.queryTongbyhl", beihdh);
	}
	
	/**
	 * 根据要货令号查询同步要货令明细
	 */
	public List<Beihdtbyhlmx> getTongbyhlmx(String yaohlh){
		 return  baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("beihuo.queryTongbyhlmx", yaohlh);
	}
	
	/**
	 * 根据条件获取扫卡查询导出数据
	 */
	public List<Saokcx> selectSaokcx(Map map){
		 return  baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("beihuo.querySaokcx", map);
	}
	
	/**
	 * 根据条件获取库存查询导出数据
	 */
	public List<Kuccx> selectKuccx(Map map){
		 return  baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("beihuo.queryKuccx", map);
	}
	
	/**
	 * 根据条件获取出库流水查询导出数据
	 */
	public List<Chuklscx> selectChuklscx(Map map){
		 return  baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("beihuo.queryChuklscx", map);
	}
	
	
	/**
	 * 查询flag是否存在
	 */
	public Integer  chukqrcmsDyfhtz4_5(Map map){
		return (Integer) baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).selectObject("beihuo.chukqrcmsDyfhtz4_5",map);
	}
	
	
	/**
	 * 查询flag是否存在
	 */
	public Integer  chukqrcmsDyfhtz4_9(Map map){
		return (Integer) baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).selectObject("beihuo.chukqrcmsDyfhtz4_9",map);
	}
	
	
	
//	
//	/**
//	 * 获取字典表分类数据集
//	 */
//	public List<Xitcsdy> selectXitcsdy(Xitcsdy bean){
//		 return  baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("common.queryXitcsdy", bean);
//	}
//	
//	/**
//	 * 获取用户中心数据集
//	 */
//	public List<Peislb> selectPeislb(){
//		 return  baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("common.queryPeislb");
//	}
//	
//	/**
//	 * 获取用户中心数据集
//	 */
//	public List<UserCenter> selectUserCenter(){
//		 return  baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("common.queryUserCenter");
//	}
//	
//	/**
//	 * 查询包装型号是否存在
//	 */
//	public boolean checkbzxh(Map map) {
//		Chengpbz cp = (Chengpbz) baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).selectObject("common.queryBaozxh", map);
//		if (cp == null) {
//			return false;
//		} else {
//			return true;
//		}
//	}
//	/**
//	 * 查询仓库编号下的所有卸货站台信息
//	 */
//	public  List<Xiehzt> selectXiehzt(Xiehzt xiehzt){
//		return   baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("common.queryXiehzt",xiehzt);
//	}
	/**
	 * 查询 承运商代码
	 */
	public  List<Tongbyhl>  chengysdmcx(Map map){
		return baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("beihuo.queryChengysdm",map);
	}
}
