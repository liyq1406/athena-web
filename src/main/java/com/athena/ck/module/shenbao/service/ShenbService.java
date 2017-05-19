package com.athena.ck.module.shenbao.service;

import java.util.List;
import java.util.Map;

import com.athena.ck.common.CKUtil;
import com.athena.ck.entity.shenbao.Jizxgl;
import com.athena.component.service.BaseService;
import com.athena.db.ConstantDbCode;
import com.toft.core3.container.annotation.Component;

@Component
public class ShenbService  extends BaseService{
	/**
	 * 查询质检报告单
	 */
	public List<Jizxgl> selectJizxgl(Map map){
		List<Jizxgl> list = (List<Jizxgl>)baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("shenbao.queryJizxgl", map);
		for(Jizxgl jizxgl : list){
			 if ("0".equals(jizxgl.getZhuangt())){
				jizxgl.setZhuangtxx(CKUtil.getBundleValue("C_JZXZT0",null));
			}else if ("1".equals(jizxgl.getZhuangt())){
				jizxgl.setZhuangtxx(CKUtil.getBundleValue("C_JZXZT1",null));
			} else if ("2".equals(jizxgl.getZhuangt())){
				jizxgl.setZhuangtxx(CKUtil.getBundleValue("C_JZXZT2",null));
			} else if ("3".equals(jizxgl.getZhuangt())){
				jizxgl.setZhuangtxx(CKUtil.getBundleValue("C_JZXZT3",null));
			}
		}
		return list;
	}
	/**511打印
	 * 查询集装箱流水表  0013017
	 */
	public List<Jizxgl>selectJizxlsb (Map map){
		List<Jizxgl> list = (List<Jizxgl>)baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("shenbao.queryJizxlsb", map);
		for(Jizxgl jizxgl : list){
			if ("0".equals(jizxgl.getZhuangt())){
				jizxgl.setZhuangtxx(CKUtil.getBundleValue("C_JZXZT0",null));
			}else if ("1".equals(jizxgl.getZhuangt())){
				jizxgl.setZhuangtxx(CKUtil.getBundleValue("C_JZXZT1",null));
			} else if ("2".equals(jizxgl.getZhuangt())){
				jizxgl.setZhuangtxx(CKUtil.getBundleValue("C_JZXZT2",null));
			} else if ("3".equals(jizxgl.getZhuangt())){
				jizxgl.setZhuangtxx(CKUtil.getBundleValue("C_JZXZT3",null));
			}else if ("4".equals(jizxgl.getZhuangt())){
				jizxgl.setZhuangtxx(CKUtil.getBundleValue("C_JZXZT4",null));
			}else if ("5".equals(jizxgl.getZhuangt())){
				jizxgl.setZhuangtxx(CKUtil.getBundleValue("C_JZXZT5",null));
			}else if ("6".equals(jizxgl.getZhuangt())){
				jizxgl.setZhuangtxx(CKUtil.getBundleValue("C_JZXZT6",null));
			}
		}
		return list;
	}
	/**511打印
	 * 查询集装箱管理表
	 */
	public List<Jizxgl> queryJizxgl(Map map){
		List<Jizxgl> list = (List<Jizxgl>)baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("shenbao.queryJizxgl2", map);
		for(Jizxgl jizxgl : list){
			if ("0".equals(jizxgl.getZhuangt())){
				jizxgl.setZhuangtxx(CKUtil.getBundleValue("C_JZXZT0",null));
			}else if ("1".equals(jizxgl.getZhuangt())){
				jizxgl.setZhuangtxx(CKUtil.getBundleValue("C_JZXZT1",null));
			} else if ("2".equals(jizxgl.getZhuangt())){
				jizxgl.setZhuangtxx(CKUtil.getBundleValue("C_JZXZT2",null));
			} else if ("3".equals(jizxgl.getZhuangt())){
				jizxgl.setZhuangtxx(CKUtil.getBundleValue("C_JZXZT3",null));
			}
		}
		return list;
	}
}
