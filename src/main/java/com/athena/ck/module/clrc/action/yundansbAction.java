package com.athena.ck.module.clrc.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;

import com.athena.authority.entity.LoginUser;
import com.athena.authority.util.AuthorityUtils;
import com.athena.ck.common.CKUtil;
import com.athena.ck.entity.clrc.KongChuc;
import com.athena.ck.entity.common.CommonEntity;
import com.athena.ck.entity.common.Rongqc;
import com.athena.ck.entity.common.Xiehzt;
import com.athena.ck.entity.rongqi.Kongq;
import com.athena.ck.entity.rongqi.Rongqdbd;
import com.athena.ck.entity.rongqi.Rongqdj;
import com.athena.ck.entity.rongqi.Rongqfh;
import com.athena.ck.entity.shouhuo.Daohtzd;
import com.athena.ck.entity.shouhuo.Lingjgys;
import com.athena.ck.entity.shouhuo.Uabq;
import com.athena.ck.module.clrc.service.ClrcService;
import com.athena.ck.module.common.service.CommonService;
import com.athena.ck.module.rongqi.action.RongqiAction;
import com.athena.component.wtc.action.BaseWtcAction;
import com.toft.core2.ToftConst;
import com.toft.core2.UserInfo;
import com.toft.core3.container.annotation.Component;
import com.toft.core3.container.annotation.Inject;
import com.toft.core3.container.core.ComponentDefinition;
import com.toft.mvc.annotaions.Param;

@Component(scope = ComponentDefinition.SCOPE_PROTOTYPE)
public class yundansbAction extends BaseWtcAction {
	@Inject
	private ClrcService clrcService;
	public UserInfo getUserInfo() {
		return (UserInfo) getSessionAttribute(ToftConst.Toft_SessionKey_UserData);
	}

	//log4j日志初始化
	private final Log log = LogFactory.getLog(yundansbAction.class); 
	
	/**
	 * 171	进入按运单申报页面
	 * @return
	 * String
	 */
	public String yundansbym(){
		return "select";
	}
		
	/**
	 * 17101	按运单号申报查询
	 * 
	 * @return
	 */
	public String daohsbCx() {
		String transcode = "17101";
		Map map = this.getParams();
		
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	
	//17102 打印到货通知单
	public String daohsbDy(@Param("list") ArrayList<KongChuc> list) {		
		//0011365
		String transcode = "17102";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	
	/**
	 * 173	进入按运单验收查询页面
	 * @return
	 * String
	 */
	public String yundancxym(){
		return "select";
	}
	
	
	/**
	 * 17301	按运单号验收查询
	 * 
	 * @return
	 */
	public String daohysCx() {
		String transcode = "17301";
		Map map = this.getParams();
		
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	
	/**
	 * 17302 	按卡车号验收
	 * 
	 * @return
	 */
	public String daohys() {
		String transcode = "17302";
		Map map = this.getParams();		
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	
	/**
	 * 17304 	操作到货单
	 * 
	 * @return
	 */
	public String daohtzdys(@Param("list") ArrayList<KongChuc> list){
		//String transcode = "17304";		
		String transcode = "10302";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	
	
	/**
	 * 17302      按运单号验收查询页面
	 * @return
	 * String
	 */
	public String daohtzdysym(){
		JSONObject obj = JSONObject.fromObject(this.getParam("putvalue"));
		setRequestAttribute("result", obj);
		return "select";
	}
	
	/**
	 * 17303	到货通知单验收修改页面
	 */
	public String daohtzdysxgym(){
		JSONObject obj = JSONObject.fromObject(this.getParam("putvalue"));
		setRequestAttribute("result", obj);
		return "select";
	}
	
	/**
	 * 按运单号验收拒收页面
	 */
	public String daohtzdjsym(){
		JSONObject obj = JSONObject.fromObject(this.getParam("putvalue"));
		setRequestAttribute("result", obj);
		return "select";
	}
	
	
	/**
	 * 172	进入空车出厂页面
	 * @return
	 * String
	 */
	public String kongcheccym(){
		return "select";
	}
	
	/**
	 * 17201	进入空车出厂打印页面
	 * @return
	 * String
	 */
	public String printRongQ(){
		return "select";
	}
	
	
	/**
	 * 17201  空车出厂确认
	 * @return 
	 */
	public String kongccqr(){
		Map map=this.getParams();
		
		String kach=this.getParam("huoch");
		String ccsy=this.getParam("ccsy");
		
		LoginUser loginUser = AuthorityUtils.getSecurityUser();
		map.put("usercenter", loginUser.getUsercenter());
		map.put("creator", loginUser.getUsername());
		map.put("kach", kach);
		map.put("ccsy", ccsy);
		
		String strResponse = clrcService.kongccqr(map);

		CommonEntity commonEntity=new CommonEntity();
		commonEntity.setResponse(strResponse);
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return  AJAX;
	}
		
	
	/**
	 * 172	空车出厂 打印
	 * 
	 */
	public String kongccdy(){
		Map<String,String> map= this.getParams();
		
		LoginUser loginUser = AuthorityUtils.getSecurityUser();
		map.put("usercenter", loginUser.getUsercenter());
		map.put("creator",loginUser.getUsername());
		
		return AJAX;
	}
	

	
	
	public String print_172(){
		//查询该卡车号信息
		Map<String,String> map= this.getParams();

		LoginUser loginUser = AuthorityUtils.getSecurityUser();
		map.put("usercenter", loginUser.getUsercenter());
		map.put("creator",loginUser.getUsername());
				
		List<Rongqfh> list = clrcService.kongccdy(map);
		Map<String,String> rs  = new HashMap<String,String>();
		
		Map<String, Object> result=new HashMap<String, Object>();
		
		// 创建Json对象
		JSONArray jsonArray = new JSONArray();
		if (list.size() > 0){
			JSONObject jsonBody = new JSONObject();
			Rongqfh beanHead = list.get(0);
			jsonBody.put("danjbh",beanHead.getFanhdh());
			jsonBody.put("laiy",beanHead.getYuanyin());
			jsonBody.put("tch",beanHead.getTch());
			jsonBody.put("cjrq",beanHead.getRiq());
			jsonBody.put("cjsj",beanHead.getShij());
			
			result.put("danjbh", beanHead.getFanhdh());
			result.put("laiy", beanHead.getYuanyin());
			result.put("tch", beanHead.getTch());
			result.put("cjrq", beanHead.getRiq());
			result.put("cjsj", beanHead.getShij());
			result.put("response", "0000");

			//jsonArray.add(jsonBody);
		}
		
		CommonEntity commonEntity=new CommonEntity();
		commonEntity.setResponse("0000");
		JSONObject obj = JSONObject.fromObject(commonEntity);
		//setResult("result", rs);
		
		setRequestAttribute("result", result);
		return "select";
	}
	
	/**
	 * 174	进入空车出厂查询撤销页面
	 * @return
	 * String
	 */
	public String kongccccxym(){
		return "select";
	}
	
	
	
	
	/*		
	public String kongcccchax(){
			// 获取session数据
			LoginUser loginUser = AuthorityUtils.getSecurityUser();
			Map  map = new HashMap();
			
			String huoch=this.getParam("huoch");
			String zhuangt=this.getParam("zhuangt");
			
			map.put("usercenter",loginUser.getUsercenter());
			map.put("huoch", huoch);
			map.put("zhuangt", zhuangt);
			
			List<KongChuc> rqcList =  clrcService.kongcccchax(map);
			
			ArrayList aList = new ArrayList();
			for (int i = 0; i < rqcList.size(); i++) {
				KongChuc kongChuc = rqcList.get(i);
				
				String zt_temp = kongChuc.getZhuangt();
				
				String zt="";
				
				if(zt_temp.equals("1")){
					zt="C_ZHIJZT_1";
				}

				if(zt_temp.equals("4")){
					zt="C_P641_04";
				}
				
				aList.add("{danjbh:\"" + kongChuc.getDanjbh() + "\",huoch:\""
						+kongChuc.getTch() + "\",zhuangt:\""+zt+"\",creator:\""+kongChuc.getCreator()+"\",create_time:\""+kongChuc.getCreate_time()+"\"}");
			}
			
			String sJson = JSONArray.fromObject(aList).toString();
			CommonEntity commonEntity = new CommonEntity();
			commonEntity.setResponse("0000");
			commonEntity.setParameter("{list:" + sJson + "}");
			JSONObject obj = JSONObject.fromObject(commonEntity);
			setResult("result", obj);
			return AJAX;
		}	
	*/
	
	
	/**
	 * 17401	空车出厂撤销查询
	 * 
	 * @return
	 */
	public String kongcccchax() {
		String transcode = "17401";
		Map map = this.getParams();
		
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	
	/**
	 * 17402	空车出厂撤销
	 * 
	 * @return
	 */
	public String kongcccchex(@Param("list") ArrayList<Rongqfh> list) {
		String transcode = "17402";
		Map map = this.getParams();
		map.put("list", list);		
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	
	
	

	/*	public String kongcccchex(){
	
		Map map=this.getParams();
		
		String kach=this.getParam("huoch");
		String danjbh=this.getParam("danjbh");
						
		LoginUser loginUser = AuthorityUtils.getSecurityUser();
		map.put("usercenter", loginUser.getUsercenter());
		map.put("danjbh", danjbh);
		
		String strResponse = clrcService.kongcccchex(map);

		CommonEntity commonEntity=new CommonEntity();
		commonEntity.setResponse(strResponse);
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return  AJAX;
	}
	*/
	
	
	
	/**
	 * P17401   空车出厂补打
	 * @return 
	 * 0011242	
	 */
	public String print_174(){
		//查询该卡车号信息
		Map<String,String> map= this.getParams();

		String rongqfhdh=this.getParam("rongqfhdh");
		
		LoginUser loginUser = AuthorityUtils.getSecurityUser();
		map.put("usercenter", loginUser.getUsercenter());
		map.put("rongqfhdh",rongqfhdh);
				
		List<Rongqfh> list = clrcService.kongccbd(map);
		Map<String,String> rs  = new HashMap<String,String>();
		
		Map<String, Object> result=new HashMap<String, Object>();
		
		// 创建Json对象
		JSONArray jsonArray = new JSONArray();
		if (list.size() > 0){
			JSONObject jsonBody = new JSONObject();
			Rongqfh beanHead = list.get(0);
			jsonBody.put("rongqfhdh",beanHead.getRongqfhdh());
			jsonBody.put("laiy",beanHead.getYuanyin());
			jsonBody.put("tch",beanHead.getTch());
			jsonBody.put("cjrq",beanHead.getRiq());
			jsonBody.put("cjsj",beanHead.getShij());
			
			if(beanHead.getCishu()==null){
				jsonBody.put("cishu",0);	
				result.put("cishu", 0);
			}else{
				jsonBody.put("cishu",beanHead.getCishu());
				result.put("cishu", beanHead.getCishu());
			}						
			
			result.put("rongqfhdh", beanHead.getRongqfhdh());
			result.put("laiy", beanHead.getYuanyin());
			result.put("tch", beanHead.getTch());
			result.put("cjrq", beanHead.getRiq());
			result.put("cjsj", beanHead.getShij());
			
			
			result.put("response", "0000");

			//jsonArray.add(jsonBody);
		}
		
		CommonEntity commonEntity=new CommonEntity();
		commonEntity.setResponse("0000");
		JSONObject obj = JSONObject.fromObject(commonEntity);
		//setResult("result", rs);
		
		setRequestAttribute("result", result);
		return "select";
	}
	
	/**
	 * 17403  空车出厂补打计数
	 * @return 
	 */
	public String kongcccjs(){
		Map<String,String> map= this.getParams();

		String rongqfhdh=this.getParam("rongqfhdh");
		String cishu=this.getParam("cishu");
		
		
		LoginUser loginUser = AuthorityUtils.getSecurityUser();
		map.put("usercenter", loginUser.getUsercenter());
		map.put("rongqfhdh",rongqfhdh);
		map.put("cishu",cishu);
		
		String strResponse = clrcService.kongcccjs(map);

		CommonEntity commonEntity=new CommonEntity();
		commonEntity.setResponse(strResponse);
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return  AJAX;
	}
	
			
}
