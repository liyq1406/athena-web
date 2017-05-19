package com.athena.ck.module.anxorder.service;



import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.athena.authority.entity.LoginUser;
import com.athena.authority.util.AuthorityUtils;
import com.athena.ck.entity.anxorder.Caifjginfo;
import com.athena.ck.entity.anxorder.Xianbkc;
import com.athena.component.service.BaseService;
import com.athena.db.ConstantDbCode;
import com.toft.core3.container.annotation.Component;
import com.toft.core3.transaction.annotation.Transactional;


@Component
public class XbcangkpdService extends BaseService{
	//日志
	private final static Log log = LogFactory.getLog(XbcangkpdService.class);
	
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> xbpdxzQuery(Xianbkc bean, Map map)
	{
		Map<String, Object> mapRes = null;
		//查找C0上次计算时间
		String coscjssj = (String) baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).selectObject("xianbkc.queryC0scjssj");
		//如果C0上次时间没有对于盘点来说无意义
		if(StringUtils.isNotBlank(coscjssj))
		{
			mapRes = baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).selectPages("xianbkc.queryXianbkc", map, bean);
			if(null != mapRes)
			{
				List<Xianbkc> xianbkcs = (List<Xianbkc>) mapRes.get("rows");
				if(null != xianbkcs)
				{
					//将C0上次计算时间赋值与现实信息内，方便计算
					for (Xianbkc xianbkc : xianbkcs) 
					{
						xianbkc.setAnxscjssj(coscjssj);
					}
				}
			}
		}
		return mapRes;
	}
	
	//更新CK_xianbck表数据
	public  int  updatexianbkc(ArrayList<Xianbkc> params){
		//修改时间 
		for (int i = 0; i < params.size(); i++) {
			Xianbkc xianbkc = params.get(i); 
			double lingjsl=Double.parseDouble(xianbkc.getYuanljsl())-Double.parseDouble(xianbkc.getChay());
			xianbkc.setLingjsl(Double.toString(lingjsl));
		}
		return  baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).executeBatch("xianbkc.updatexianbkc", params);
		
	}
	//插入线边库存流水表
	public  int inertkcls(ArrayList<Xianbkc> params){
		//创建时间 
		for (int i = 0; i < params.size(); i++) {
			Xianbkc xianbkc = params.get(i); 
			LoginUser loginUser = AuthorityUtils.getSecurityUser();
			xianbkc.setCreator(loginUser.getUsername());
			xianbkc.setEditor(loginUser.getUsername());
		}
		return  baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).executeBatch("xianbkc.insertxianbkcls", params);

	}
	
	@SuppressWarnings("unchecked")
	public Map pdjsdxh(Map map){
		Map resultMap = new HashMap();
		List<Caifjginfo> listCaifjginfo	 = baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("xianbkc.queryCaifjginfo", map);
		if (listCaifjginfo == null || listCaifjginfo.size()<1){
			resultMap.put("lingjsl", "");
		} else {
			Caifjginfo caifjginfo = listCaifjginfo.get(0);
			//获取时间
			String kcDate = map.get("edit_time").toString();
			String xhDate = caifjginfo.getXiaohsj();
			//时间比较
			java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			java.util.Calendar c1= java.util.Calendar.getInstance();
			java.util.Calendar c2= java.util.Calendar.getInstance();
			try{
				c1.setTime(df.parse(kcDate));
				c2.setTime(df.parse(xhDate));
			} catch(java.text.ParseException e) {
				log.error(e.getMessage());
				resultMap.put("lingjsl", "");
				return resultMap;
			}
			//查询条件
			Map mapLsh = new HashMap();
			mapLsh.put("usercenter", caifjginfo.getUsercenter());
			mapLsh.put("lingjbh", caifjginfo.getLingjbh());
			mapLsh.put("chanx", caifjginfo.getChanx());
			mapLsh.put("xiaohd", caifjginfo.getXiaohd());
			if (c1.compareTo(c2) < 0){
				mapLsh.put("begin_time", kcDate);
				mapLsh.put("end_time", xhDate);
			} else {
				mapLsh.put("begin_time", xhDate);
				mapLsh.put("end_time", kcDate);
			}
			resultMap = (Map)baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).selectObject("xianbkc.getDaixhsl", mapLsh);
			if (c1.compareTo(c2) < 0){
				resultMap.put("LINGJSL", "-"+resultMap.get("LINGJSL"));
			}
		}
		return resultMap;
	}
	
	
	
	@Transactional
	public void execC0Xianbpd(ArrayList<Xianbkc> list) {
	   	 updatexianbkc(list);
		 inertkcls(list); 
	}
}
