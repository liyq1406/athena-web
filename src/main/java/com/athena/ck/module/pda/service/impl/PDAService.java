package com.athena.ck.module.pda.service.impl;

import java.io.ByteArrayOutputStream;
import java.io.PrintStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import javax.jws.WebService;
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.cxf.transport.servlet.CXFNonSpringServlet;

import weblogic.wtc.gwt.TuxedoConnection;
import weblogic.wtc.jatmi.Reply;
import weblogic.wtc.jatmi.TPException;
import weblogic.wtc.jatmi.TPReplyException;
import weblogic.wtc.jatmi.TypedCArray;
import weblogic.wtc.jatmi.TypedString;
import com.athena.authority.entity.LoginUser;
import com.athena.authority.entity.MenuDirectory;
import com.athena.authority.entity.PltTrscode;
import com.athena.authority.service.MenuDirectoryService;
import com.athena.ck.common.CKUtil;
import com.athena.ck.entity.common.CommonEntity;
import com.athena.ck.entity.common.PDABaseCode;
import com.athena.ck.entity.common.PDALoginUser;
import com.athena.ck.entity.common.PDARongqc;//0010495
import com.athena.ck.entity.common.PDARongqbh;
import com.athena.ck.entity.common.Rongqc;
import com.athena.ck.entity.common.UserCenter;
import com.athena.ck.entity.common.WareHouse;
import com.athena.ck.entity.common.Xitcsdy;
import com.athena.ck.module.common.service.CommonService;
import com.athena.ck.module.pda.service.IPDAService;
import com.athena.component.utils.JsonUtils;
import com.athena.component.wtc.WtcConnUtils;
import com.athena.component.wtc.WtcResponse;
import com.athena.util.CommonUtil;
import com.athena.util.athenalog.SysLog;
import com.athena.util.athenalog.impl.UserOperLog;
import com.athena.util.cache.CacheManager;
import com.athena.util.exception.ServiceException;
import com.toft.core2.ToftException;
import com.toft.core3.container.annotation.Component;
import com.toft.core3.container.annotation.Inject;
import com.toft.core3.transaction.annotation.Transactional;
/**
 * <p>
 * Title:手持机系统使用Web服务
 * </p>
 * <p>
 * Description:定义手持机系统通用的web服务，仅调用WTC框架不做数据处理
 * </p>
 * <p>
 * Copyright: Copyright (c) 2011
 * </p>
 * <p>
 * Company: 软通动力
 * </p>
 * 
 * @author 陈川川
 * @E-mail ccchen@isoftstone.com
 * @version v1.0
 * @date 2011-12-30
 */

@Component

@WebService(
endpointInterface="com.athena.products.module.service.IPDAService",
serviceName = "pdaService")

public class PDAService extends CXFNonSpringServlet implements IPDAService  {
	@Inject 
	private MenuDirectoryService menuDirectoryService;
	@Inject
	private CommonService commonService;
	@Inject
	private PDALoginService pdaLoginService;
	@Inject
	private CacheManager cacheManager;	
	@Inject
	private UserOperLog userOperLog;
	//写日志
	private final static Log log = LogFactory.getLog(PDAService.class);
	
	/**
	 * 手持机系统登陆方法
	 * @date 2012-4-16
	 * @param bizJson 客户端业务请求json串
	 * @return String 返回客户端需求json字符串
	 * @throws ServiceException
	 */
	@Transactional
	public String doLogin(String bizJson) throws ServiceException{
		log.info("======doLogin start======");
		//获取数据
		JSONObject receveJSONObj = JSONObject.fromObject(bizJson);
		JSONObject paramJSONObj = receveJSONObj.getJSONObject("parameter");
		//将JSON对象转换成Bean
		String loginKey = receveJSONObj.getString("loginKey");
		PDALoginUser pdaLoginUser = (PDALoginUser)JSONObject.toBean(paramJSONObj, PDALoginUser.class);
		pdaLoginUser.setLoginkey(loginKey);
		//验证用户是否已经登录
		if (pdaLoginService.checkIsLogin(pdaLoginUser)){
			receveJSONObj.remove("response");
			receveJSONObj.put("response", "C_Login");
			log.info(receveJSONObj.toString());
			return getJSONObjectFormat(receveJSONObj).toString();
		}
		pdaLoginService.userLogin(pdaLoginUser);
		//获取值
		CommonEntity commonEntity = new CommonEntity();
		//获取当前登录用户
		LoginUser loginUser = pdaLoginService.PDAUserLogin(pdaLoginUser);
		//判断用户信息是否取得
	    if (loginUser != null){
	    	try{
	    		//为PDA赋值
				pdaLoginUser.setUsercenter(loginUser.getUsercenter());
				pdaLoginUser.setUsername(loginUser.getUsername());
				pdaLoginUser.setCaption(loginUser.getCaption());
				pdaLoginUser.setPassword(loginUser.getPassword());
				//设置用户权限
				String userRole = "";
				String username = loginUser.getUsername();
				String usercenter = loginUser.getUsercenter();
				if(username.equals("ROOT") || loginUser.getUcList().contains(usercenter)){ 
					//有授权用户中心
					MenuDirectory params = new MenuDirectory();
					params.setDirType(0L);
					params.setDirIsCK("2");  //只查询手持机权限菜单
					List<MenuDirectory> menus = menuDirectoryService.list(params);
					if (menus != null){
						for(MenuDirectory menu : menus){
							if(isSkipMenu(menu,loginUser.getMenuAndButtonsIds())){
								userRole += menu.getDirCode()+",";
							}
						}
						if (userRole.length()>0){
							userRole = userRole.substring(0, userRole.length()-1);
						}
					}
				}
				pdaLoginUser.setUserrole(userRole);  //用户权限
				//取最大的版本号
				String maxVersion = "0.0.0.1" ;
				if (loginUser.getAttrList() != null){
					if (loginUser.getAttrList().size() > 0){
						if (loginUser.getAttrList().get(0) != null){
							maxVersion =loginUser.getAttrList().get(0);
						}
					}
					for (String version : loginUser.getAttrList()) {
						//比较版本号
						if (version != null){
							if (!CompareVersion(maxVersion,version)){
								maxVersion = version;
								continue;
							}
						}
					}
				}
				pdaLoginUser.setVersion(maxVersion);                 //版本号
				//获取PostId
				String postId = loginUser.getPostAndRoleMap().get("CK_001");
				//通过postId查询对应的仓库数据
				WareHouse bean = new WareHouse();
				bean.setPost_Id(postId);
				bean.setUsercenter(loginUser.getUsercenter());
				List<WareHouse> ckList = commonService.selectWareHouse(bean);
				
				SimpleDateFormat sDateTimeFormat2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				//添加仓库信息
				if (ckList != null){
					for (WareHouse wareHouse : ckList) {
						PDABaseCode pdaBaseCode = new PDABaseCode();
						pdaBaseCode.setCode(wareHouse.getCangkbh());
						pdaBaseCode.setName(wareHouse.getCangkbh());
						pdaBaseCode.setType(wareHouse.getCangklx());
						//xss-12191
						pdaBaseCode.setLogindate(sDateTimeFormat2.format(new Date()));
						pdaLoginUser.getWarehouselist().add(pdaBaseCode);	
					}
				}
				
				/*0010495
				Rongqc bean2 = new Rongqc();
				
				String postId2 = loginUser.getPostAndRoleMap().get("CK_003");	
				
				bean2.setPost_Id(postId2);
				bean2.setUsercenter(loginUser.getUsercenter());
				
				List<Rongqc> resultList = commonService.PdaselectRongqc(bean2);
				List<PDARongqbh> rqcList = new ArrayList<PDARongqbh>();
				for(Rongqc item : resultList){
					   PDARongqbh pdarongqbh = new PDARongqbh();
					   pdarongqbh.setName(item.getRongqcbh());
					   pdarongqbh.setCode(item.getRongqcbh());		
					   pdaLoginUser.getContainerlist().add(pdarongqbh);
				}
				*/
				
				
				//设置返回消息
				commonEntity.setResponse(receveJSONObj.getString("response"));
				commonEntity.setRespdesc("");
	    	} catch (Exception e) {
				ByteArrayOutputStream bOut = new ByteArrayOutputStream();
				e.printStackTrace(new PrintStream(bOut));
				log.error(bOut.toString());
				//设置返回消息
				commonEntity.setResponse("C_LoginError");
				commonEntity.setRespdesc("");
			}
	    } else {
	    	commonEntity.setResponse("C_LoginError");
			commonEntity.setRespdesc("");
	    }
	    commonEntity.setParameter(pdaLoginUser);
		//获取服务器时间
		SimpleDateFormat sDateTimeFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		commonEntity.setTrsdate(sDateTimeFormat.format(new Date()));
		//将对象转换成JSON对象，用于返回
		JSONObject jSONObj = JSONObject.fromObject(commonEntity);
		log.info("======doLogin end======");
		log.info(jSONObj.toString());
		return getJSONObjectFormat(jSONObj).toString();
	}
	
	/**
	 * 手持机系统退出登陆方法
	 * @date 2012-4-16
	 * @param bizJson 客户端业务请求json串
	 * @return String 返回客户端需求json字符串
	 * @throws ServiceException
	 */
	@Transactional
	public String doLoginOut(String bizJson) throws ServiceException{
		//获取数据
		JSONObject receveJSONObj = JSONObject.fromObject(bizJson);
		JSONObject paramJSONObj = receveJSONObj.getJSONObject("parameter");
		//将JSON对象转换成Bean
		String loginKey = receveJSONObj.getString("loginKey");
		PDALoginUser pdaLoginUser = (PDALoginUser)JSONObject.toBean(paramJSONObj, PDALoginUser.class); 
		pdaLoginUser.setLoginkey(loginKey);
		//获取数据
		CommonEntity commonEntity = new CommonEntity();
		//判断用户是否能够登陆系统
	    LoginUser loginUser = pdaLoginService.PDAUserLogin(pdaLoginUser);
		//判断用户信息是否取得
    	if (loginUser != null){
    		try{
    			//设置用户权限
				String userRole = "";
				String username = loginUser.getUsername();
				String usercenter = loginUser.getUsercenter();
				if(username.equals("ROOT") || loginUser.getUcList().contains(usercenter)){ 
					//有授权用户中心
					MenuDirectory params = new MenuDirectory();
					params.setDirType(0L);
					params.setDirIsCK("2");  //只查询手持机权限菜单
					List<MenuDirectory> menus = menuDirectoryService.list(params);
					if (menus != null){
						for(MenuDirectory menu : menus){
							if(isSkipMenu(menu,loginUser.getMenuAndButtonsIds())){
								userRole += menu.getDirCode()+",";
							}
						}
						if (userRole.length()>0){
							userRole = userRole.substring(0, userRole.length()-1);
						}
					}
				}
				pdaLoginUser.setUserrole(userRole);  //用户权限
				//退出时清除登录记录
				pdaLoginService.userLoginOut(pdaLoginUser);
				//设置操作成功消息
				commonEntity.setResponse(receveJSONObj.getString("response"));
				commonEntity.setRespdesc("");
    		} catch (Exception e) {
    			ByteArrayOutputStream bOut = new ByteArrayOutputStream();
				e.printStackTrace(new PrintStream(bOut));
				log.error(bOut.toString());
				//设置返回消息
				commonEntity.setResponse("C_LoginError");
				commonEntity.setRespdesc("");
    		}
    	} else {
    		commonEntity.setResponse("C_LoginError");
			commonEntity.setRespdesc("");
    	}
    	commonEntity.setParameter(pdaLoginUser);
		//获取服务器时间
		SimpleDateFormat sDateTimeFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		commonEntity.setTrsdate(sDateTimeFormat.format(new Date()));
		//将对象转换成JSON对象，用于返回
		JSONObject jSONObj = JSONObject.fromObject(commonEntity);
		log.info(jSONObj.toString());
		return getJSONObjectFormat(jSONObj).toString();
	}
	
	/**
	 * 手持机系统获取基础数据
	 * @date 2012-4-16
	 * @param bizJson 客户端业务请求json串
	 * @return String 返回客户端需求json字符串
	 * @throws ServiceException
	 */
	@Transactional
	public String getBaseCode(String bizJson)throws ServiceException{
		//获取数据
		JSONObject receveJSONObj = JSONObject.fromObject(bizJson);
		PDABaseCode baseCode = (PDABaseCode)JSONObject.toBean(receveJSONObj, PDABaseCode.class);
		//定义变量
		List<PDABaseCode> pdaBaseCodeList = new ArrayList<PDABaseCode>();
		try {
			if (baseCode.getType().equals("YHZX")){
				//获取用户中心数据
				List<UserCenter> userCenterList = commonService.selectUserCenter();
				if (userCenterList != null){
					for (UserCenter userCenter : userCenterList) {
						PDABaseCode pdaBaseCode = new PDABaseCode();
						pdaBaseCode.setCode(userCenter.getUsercenter());
						pdaBaseCode.setName(userCenter.getCentername());
						
						//0012191
						//获取服务器时间
						SimpleDateFormat sDateTimeFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");												
						pdaBaseCode.setLogindate(sDateTimeFormat.format(new Date()));
						
						pdaBaseCodeList.add(pdaBaseCode);
					}
				}
			} else {
				//查询基础数据
				Xitcsdy bean = new Xitcsdy();
				bean.setUsercenter(baseCode.getUsercenter());
				bean.setZidlx(baseCode.getType());
				List<Xitcsdy> zdList = commonService.selectXitcsdy(bean);
				//添加基础数据信息
				if (zdList != null){
					for (Xitcsdy xitcsdy : zdList) {
						PDABaseCode pdaBaseCode = new PDABaseCode();
						pdaBaseCode.setCode(xitcsdy.getZidbm());
						pdaBaseCode.setName(xitcsdy.getZidmc());
						pdaBaseCode.setType(xitcsdy.getZidlx());
						
						//0012191
						//获取服务器时间
						SimpleDateFormat sDateTimeFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");												
						pdaBaseCode.setLogindate(sDateTimeFormat.format(new Date()));
						
						pdaBaseCodeList.add(pdaBaseCode);
					}
				}
			}
		} catch (Exception e) {
			ByteArrayOutputStream bOut = new ByteArrayOutputStream();
			e.printStackTrace(new PrintStream(bOut));
			log.error(bOut.toString());
		}
		//将Json对象转换成字符串，用于传输
	    return JSONSerializer.toJSON(pdaBaseCodeList).toString();
	}
	
	/**
	 * 手持机系统业务通用WTC方法
	 * @date 2011-12-30
	 * @param bizJson 客户端业务请求json串
	 * @return 返回客户端需求json字符串
	 * @throws ServiceException
	 */
	@Transactional
	public String callWTC(String bizJson) throws ServiceException{
		long beginManageTime = System.currentTimeMillis();
		JSONObject jSONObj = JSONObject.fromObject(bizJson);
		//判断用户时候已经登录
		String loginKey = jSONObj.getString("loginKey");
		PDALoginUser pdaLoginUser = new PDALoginUser();
		pdaLoginUser.setLoginkey(loginKey);
		if (pdaLoginService.checkIsLogin(pdaLoginUser)){
			jSONObj.remove("response");
			jSONObj.remove("respdesc");
			jSONObj.put("response", "C_NoLogin");
			log.info(jSONObj.toString());
			return getJSONObjectFormat(jSONObj).toString();
		}
		//请求服务
		String transCode = jSONObj.getString("trscode");
		//2013-1-14   ==========START
		String sUC = jSONObj.getString("trans_bran_code");
		//获取平台参数
		PltTrscode pltTrscode = new PltTrscode();
		pltTrscode.setTrstype("0");
		pltTrscode.setUsercenter(sUC);
		pltTrscode.setTrscode(transCode);
		pltTrscode.setService("PASPLT");
		pltTrscode.setTrsname("默认代理服务");
		//获取对象
		List<PltTrscode> cachelist = (List<PltTrscode>) cacheManager.getCacheInfo("queryPltTrscode").getCacheValue();
		for(PltTrscode trs : cachelist){
			if (pltTrscode.getUsercenter().equals(trs.getUsercenter()) && pltTrscode.getTrscode().equals(trs.getTrscode())){
				pltTrscode.setService(trs.getService());
				pltTrscode.setTrsname(trs.getTrsname());
				pltTrscode.setTrstype(trs.getTrstype());
				break;
			}
		}
		//2013-1-22   ====与手持请求冲突======BEGIN
		//jSONObj.put("trans_type", pltTrscode.getTrstype());
		//2013-1-22   ==========END
		String jsonStr = jSONObj.toString();
		/*Trscode trs = StartListener.getTrscode(transCode);
		String service = trs.getService();
		String trsname = trs.getTrsname();*/
		//2013-1-14   ==========END
		WtcResponse wtcResponse = null;
		try {
			log.info("(start)请求交易码：" + pltTrscode.getTrscode() + "-----请求JSON：" + jsonStr );
			
			//--------
			TypedString josnData = null;
			TypedCArray reqCA = null;
			
			if("0".equals(pltTrscode.getTrstype())){
				josnData = new TypedString(jsonStr);			
			}else{
		    	byte[] inbt = jsonStr.getBytes();
		    	reqCA = new TypedCArray();
				reqCA.carray = inbt;
				reqCA.sendSize = inbt.length;
		    }			
			
			long beginCallWTCTime = System.currentTimeMillis();
			//请求WTC服务   -- 编号
			josnData  = new TypedString(jsonStr);
			TuxedoConnection conn = WtcConnUtils.getConn();
			Reply reply = null;
			String replyJson = "";
			//请求WTC服务   -- 编号
			if("0".equals(pltTrscode.getTrstype())){
				log.info("请求交易码：" + pltTrscode.getTrscode() + "-----请求service：" + pltTrscode.getService() + "(TypedString)：" );
				reply = conn.tpcall(pltTrscode.getService(), josnData, 0); //timeout时间
				replyJson = reply.getReplyBuffer().toString();
				log.info("WTC请求【"+pltTrscode.getTrsname()+"】成功(TypedString)");
			}else{
				log.info("请求交易码：" + pltTrscode.getTrscode() + "-----请求service：" + pltTrscode.getService() + "(TypedCArray)："  );
				reply = conn.tpcall(pltTrscode.getService(), reqCA, 0);
				replyJson = new String(((TypedCArray)reply.getReplyBuffer()).carray).trim();
				log.info("WTC请求【"+pltTrscode.getTrsname()+"】成功(TypedCArray)");
			}
		    //String replyJson = reply.getReplyBuffer().toString();
			log.debug("WTC请求【"+pltTrscode.getTrsname()+"】成功");
			Long endCallWTCTime = System.currentTimeMillis();
			Long wtcCallTime = endCallWTCTime - beginCallWTCTime;
			log.info("请求交易码：" + transCode + "-----请求service：" + pltTrscode.getService() + "-----WTC调用时长：" + wtcCallTime);
			//数据转换
			try {
				wtcResponse = new WtcResponse(JsonUtils.jsonStrToMap(replyJson));
				conn.tpterm();
			} catch (ToftException e) {
				wtcResponse = new WtcResponse(new HashMap<String,Object>());
				wtcResponse.put("hasError", true);
				wtcResponse.put("errorMessage", e.getMessage());
			}
			wtcResponse.put("wtcCallTime", wtcCallTime);
			jSONObj = JSONObject.fromObject(wtcResponse);
			/*删除列表数据
			if (jSONObj.containsKey("parameter")){
				if(jSONObj.getJSONObject("parameter").containsKey("list")){
					jSONObj.getJSONObject("parameter").remove("list");
				}
			}
			*/
		} catch (TPReplyException e) {
			ByteArrayOutputStream bOut = new ByteArrayOutputStream();
			e.printStackTrace(new PrintStream(bOut));
			log.error(bOut.toString());
			//设置返回值
			jSONObj.remove("response");
			jSONObj.put("response", "C_NoReply");
			//throw new WtcException("WTC请求【"+trsname+"】没有响应:"+e.getMessage());
		} catch (TPException e) {
			ByteArrayOutputStream bOut = new ByteArrayOutputStream();
			e.printStackTrace(new PrintStream(bOut));
			log.error(bOut.toString());
			//设置返回值
			jSONObj.remove("response");
			jSONObj.put("response", "C_TXD_"+ e.gettperrno());
			//throw new WtcException("WTC连接【"+trsname+"】发生异常:"+e.getMessage());
		} catch (Error e) {
			ByteArrayOutputStream bOut = new ByteArrayOutputStream();
			e.printStackTrace(new PrintStream(bOut));
			log.error(bOut.toString());
			//设置返回值
			jSONObj.remove("response");
			jSONObj.put("response", "C_ConnError");
			//throw new WtcException("WTC连接【"+trsname+"】发生异常:"+e.getMessage());
		}
		//请求响应时间
		Long endManageTime = System.currentTimeMillis();
		Long manageCallTime = endManageTime - beginManageTime;
		log.info("请求交易码：" + transCode + "-----请求service：" + pltTrscode.getService() + "-----manage调用时长：" + manageCallTime);
		//写数据库日志
		SysLog sysLog = new SysLog();
		sysLog.setUsercenter(userOperLog.nulltoKong(pltTrscode.getUsercenter()));
		sysLog.setOperators(userOperLog.nulltoKong(wtcResponse.get("oper_no").toString()));
		sysLog.setOperators_ip(userOperLog.nulltoKong(loginKey));
		sysLog.setTrans_url("PDA--"+userOperLog.nulltoKong(pltTrscode.getTrscode()));	
		sysLog.setTrans_desc(userOperLog.nulltoKong(pltTrscode.getTrsname())+userOperLog.nulltoKong(pltTrscode.getTrscode()));		//title
		sysLog.setModule_name(userOperLog.nulltoKong(CommonUtil.MODULE_CANGK));		//module
		sysLog.setTrans_content(userOperLog.nulltoKong(pltTrscode.getTrsname()));	//contents
		String sResponse = wtcResponse.get("response").toString();
		if (sResponse.equals("0000") || sResponse.equals("C_1403")) {
			userOperLog.addCorrectPDA(sysLog);
		} else {
			sysLog.setCclass(pltTrscode.getService());
			sysLog.setCexception(sResponse);
			userOperLog.addErrorPDA(sysLog);
		}
		//添加服务器时间
		SimpleDateFormat sDateTimeFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		jSONObj.remove("trsdate");
		jSONObj.put("trsdate", sDateTimeFormat.format(new Date()));
		return getJSONObjectFormat(jSONObj).toString();
	}
	
	/*
	 * 将编码国籍化后的Json串
	 */
	private JSONObject getJSONObjectFormat(JSONObject objJSON){
		String objResponse = null,objRespdesc = null;
		if (objJSON.containsKey("response")){
			objResponse = objJSON.getString("response");
		}
		if (objJSON.containsKey("respdesc")){
			objRespdesc = objJSON.getString("respdesc");
		}
		if (objResponse != null)
		{
			objJSON.remove("respdesc");
			if (objResponse.equals("0000") && objRespdesc != null){
				String respdesc = CKUtil.getBundleValue(objRespdesc,null);
				if (respdesc != null && !respdesc.equals("")){
					objJSON.put("respdesc",  respdesc);
				} else {
					objJSON.put("respdesc",  objRespdesc);
				}
			} else {
				//设置返回值
				objJSON.put("respdesc",  CKUtil.getBundleValue(objResponse,objRespdesc));
			}
		}
		log.info("getJSONObjectFormat return json ：" + objJSON.toString());
		return objJSON;
	}
	
	/**
	 * 手持机系统业务通用WTC方法
	 * @date 2011-12-30
	 * @param bizJson 客户端业务请求json串
	 * @return 返回客户端需求json字符串
	 * @throws ServiceException
	 */
	@SuppressWarnings("unused")
	private boolean CompareVersion(String UpdateVersion, String SystemVersion)
    {
        String[] UpdateVerList = UpdateVersion.split(".");
        String[] SystemVerList = SystemVersion.split(".");
        for (int i = 0; i < UpdateVerList.length; i++)
        {
            int UpdateValue = Integer.parseInt(UpdateVerList[i]);
            int SystemValue = Integer.parseInt(SystemVerList[i]);
            if (UpdateValue > SystemValue)
            {
                return true;
            }
            else if (UpdateValue < SystemValue)
            {
                return false;
            }
        }
        return false;
    }
	
	/**
	 * 跳过的菜单规则
	 * 	1：不带URL的菜单
	 *  2：不在用户分配的菜单内的
	 * @param menu
	 * @param menuAndButtonsIds
	 * @return
	 */
	private boolean isSkipMenu(MenuDirectory menu, Set<String> menuAndButtonsIds) {
		//Code为空或存在权限
		if(!menuAndButtonsIds.contains(menu.getId())){
			return false;
		}
		return true;
	}
	
	/**
	 * 手持机获取容器厂方法
	 * @date 2015-5-18
	 * @param bizJson 客户端业务请求json串
	 * @return String 返回客户端需求json字符串
	 * @throws ServiceException
	 * 0010495
	 */
	@Transactional
	public String getRongqc(String bizJson) throws ServiceException{
		//获取数据
		JSONObject receveJSONObj = JSONObject.fromObject(bizJson);
		JSONObject paramJSONObj = receveJSONObj.getJSONObject("parameter");
		//将JSON对象转换成Bean
		String loginKey = receveJSONObj.getString("loginKey");
		
		PDARongqc pdaRongqc = (PDARongqc)JSONObject.toBean(paramJSONObj, PDARongqc.class);
		
		pdaRongqc.setLoginkey(loginKey);
		
		//获取数据
		CommonEntity commonEntity = new CommonEntity();
		//判断用户是否能够登陆系统
	    LoginUser loginUser = pdaLoginService.PDAUserLogin2(pdaRongqc);
		//判断用户信息是否取得
    	if (loginUser != null){
    		try{
				Rongqc bean2 = new Rongqc();
				
				String postId2 = loginUser.getPostAndRoleMap().get("CK_003");	
				
				bean2.setPost_Id(postId2);
				bean2.setUsercenter(loginUser.getUsercenter());
				
				List<Rongqc> resultList = commonService.PdaselectRongqc(bean2);
				//List<PDARongqbh> rqcList = new ArrayList<PDARongqbh>();
				for(Rongqc item : resultList){
					   PDARongqbh pdarongqbh = new PDARongqbh();
					   pdarongqbh.setName(item.getRongqcbh());
					   pdarongqbh.setCode(item.getRongqcbh());		
					   pdaRongqc.getContainerlist().add(pdarongqbh);			   
					   
				}
				//设置操作成功消息
				commonEntity.setResponse(receveJSONObj.getString("response"));
				commonEntity.setRespdesc("");
    		} catch (Exception e) {
    			ByteArrayOutputStream bOut = new ByteArrayOutputStream();
				e.printStackTrace(new PrintStream(bOut));
				log.error(bOut.toString());
				//设置返回消息
				commonEntity.setResponse("C_LoginError");
				commonEntity.setRespdesc("");
    		}
    	} else {
    		commonEntity.setResponse("C_LoginError");
			commonEntity.setRespdesc("");
    	}
    	commonEntity.setParameter(pdaRongqc);
		//获取服务器时间
		SimpleDateFormat sDateTimeFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		commonEntity.setTrsdate(sDateTimeFormat.format(new Date()));
		//将对象转换成JSON对象，用于返回
		JSONObject jSONObj = JSONObject.fromObject(commonEntity);
		log.info(jSONObj.toString());
		return getJSONObjectFormat(jSONObj).toString();
	}
	
}
