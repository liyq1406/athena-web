package com.athena.ck.module.shouhuo.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;

import com.athena.authority.entity.LoginUser;
import com.athena.authority.util.AuthorityUtils;
import com.athena.ck.common.CKUtil;
import com.athena.ck.entity.common.CommonEntity;
import com.athena.ck.entity.common.Xiehzt;
import com.athena.ck.entity.shouhuo.Daohtzd;
import com.athena.ck.entity.shouhuo.Lingjgys;
import com.athena.ck.entity.shouhuo.Uabq;
import com.athena.ck.module.common.service.CommonService;
import com.athena.component.wtc.action.BaseWtcAction;
import com.toft.core2.ToftConst;
import com.toft.core2.UserInfo;
import com.toft.core3.container.annotation.Component;
import com.toft.core3.container.annotation.Inject;
import com.toft.core3.container.core.ComponentDefinition;
import com.toft.mvc.annotaions.Param;

/**
 * <p>
 * Title:到货申报Action
 * </p>
 * <p>
 * Description:定义到货通申报相关页面动作处理
 * </p>
 * <p>
 * Copyright: Copyright (c) 2011
 * </p>
 * <p>
 * Company: 软通动力
 * </p>
 * 
 * @author 林笛
 * @version v1.0
 * @date 2011-12-26
 */
@Component(scope = ComponentDefinition.SCOPE_PROTOTYPE)
public class DaohsbAction extends BaseWtcAction {
	@Inject
	private  CommonService cs;
	public UserInfo getUserInfo() {
		return (UserInfo) getSessionAttribute(ToftConst.Toft_SessionKey_UserData);
	}

	/**
	 * 101	进入到货申报页面
	 * @return
	 * String
	 */
	public String daohsbym(){
		return "select";
	}
	
	/**
	 * 102	进入到货信息录入页面
	 * @return
	 * String
	 */
	public String daohxxlrym() {
		return "select";
	}
	
	/**
	 * 126	进入到货信息录入查询页面
	 * @return
	 * String
	 */
	public String daohxxlrcxym() {
		return "select";
	}
	
	/**
	 * 127	进入到货信息录入查询页面
	 * @return
	 * String
	 */
	public String daohxxlrsqym() {
		return "select";
	}
	
	
	/**
	 * 10101	到货申报查询
	 * 
	 * @return
	 */
	public String daohsbCx() {
		String transcode = "10101";
		Map map = this.getParams();
		
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	
	/**
	 * 10102	 到货单打印
	 * @param bean 到货通知单
	 * @return
	 */
	public String daohdDy(@Param("list") ArrayList<Daohtzd> list) {
		String transcode = "10102";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	/**
	 * 10201   到货信息录入BL号查询
	 * @return
	 * 
	 */
	public String daohxxlrblhCx(){
		
		String transcode = "10201";
		Map map = this.getParams();
		
		setResult("result",CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	
	/**
	 * 10202   到货信息录入要货令查询
	 * @return
	 * 
	 */
	public String daohxxyhlCx(){
		String transcode = "10202";
		Map map = this.getParams();
		
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	
	/**
	 * 10203   到货信息录入
	 * @return
	 * 
	 */
	public String daohxxLr(){
		String transcode = "10203";
		Map map = this.getParams();
		
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	
	/**
	 * 10204   到货信息录入删除
	 * @return
	 * 
	 */
	public String daohxxlrXc(@Param("list") ArrayList<Uabq> list){
		String transcode = "10204";
		Map map = this.getParams();
		List listTemp = new ArrayList();
		for(int i=0;i<list.size();i++){
			Map m = new HashMap();
			m.put("uah",list.get(i).getUah());
			listTemp.add(m);
		}
		map.put("list", listTemp);
		setResult("result",CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	
	/**
	 * 10205   到货信息录入结束
	 * @return
	 * 
	 */
	public String daohxxlrJs(){
		String transcode = "10205";
		Map map = this.getParams();		
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 10208 通过零件查询卸货站台
	 */
	public  String   selectXieh(){
		Map map = this.getParams();
		LoginUser loginUser = AuthorityUtils.getSecurityUser();
		map.put("usercenter",loginUser.getUsercenter());
		Xiehzt xiehzt = cs.selectXhztgys(map);
		List list = cs.selectGongys(map);
		String strResponse;
		String strXiehzt="";
		/*if(xiehzt == null || list == null || list.size() == 0){
			if (list==null){
				list = new ArrayList<Lingjgys>();
			}
			strResponse = "C1_WUCLJ";
		}else{
			strXiehzt = xiehzt.getXiehztbh();
			strResponse = "0001";
		}*/
		if(null == list || list.size() == 0){
			list = new ArrayList<Lingjgys>();
			strResponse = "C1_WUCLJ";
		}else if(null == xiehzt || xiehzt.getXiehztbh() == null){
			strResponse = "C1_XHZTBF";
		}else{
			strXiehzt = xiehzt.getXiehztbh();
			strResponse = "0001";
		}
		String jsonList = JSONSerializer.toJSON(list).toString();
		CommonEntity commonEntity=new CommonEntity();
		commonEntity.setParameter("{list:"+jsonList+",xiehzt:\""+strXiehzt+"\"}");
		commonEntity.setResponse(strResponse);
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;
	}
	/**
	 * 10206通过供应商零件编号查询当前的零件yanssl
	 */
	public String selectYanssl() {
		String transcode = "10206";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	/**
	 * 10209通过零件供应商查询UA、UC型号是否存在
	 */
	public String selectLJGYSucxh(){
		Map map = this.getParams();
		LoginUser loginUser = AuthorityUtils.getSecurityUser();
		map.put("usercenter",loginUser.getUsercenter());
		CommonEntity commonEntity=new CommonEntity();
		commonEntity.setResponse(cs.selectuaucxh(map));
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;
	}
	/**
	 * 10211查询序列号作为BLH
	 */
	public String selectBLH(){
		CommonEntity commonEntity=new CommonEntity();
		String str=cs.selectBLH();
		if(str == null){
			commonEntity.setResponse("C_1403");
		}else{
			commonEntity.setResponse("0001");
			 commonEntity.setParameter("{BLH:\""+str+"\"}");
		}
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;
	}
	
	/**
	 * 12601	到货信息录入查询
	 * @return
	 */
	public String daohxxlrCx() {
		String transcode = "12601";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 12602	到货信息录入初始化查询
	 * @return
	 */
	public String initdaohxxlr(){
		String transcode = "12602";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	/**
	 * 12701	到货信息录入删除
	 * 
	 * @return
	 */
	public String daohdlrSc() {
		String transcode = "12701";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	/**
	 * 12702	到货信息录入根据UT号查询
	 * 
	 * @return
	 */
	public String daohdCxForUth() {
		String transcode = "12702";
        Map  map =this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	/**
	 * 12703	到货信息录入根据UL号查询
	 * 
	 * @return
	 */
	public String daohdCxForUlh() {
		String transcode = "12703";
		 Map  map =this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	/**
	 * 12704	到货信息录入根据EL号查询
	 * 
	 * @return
	 */
	public String daohdCxForElh() {
		String transcode = "12704";
		 Map  map =this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 160 移库跟踪单收货 
	 */
	public  String  yikgzdsh(){
		return "select";
	}
	/**
	 * 16001 通过移库跟踪单收货查询
	 */
	public  String    yikgzdshCx(){
		String transcode = "16001";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	/**
	 * 16002	 移库跟踪单打印

	 * @return
	 */
	public String yikgzdDy(@Param("list") ArrayList<Daohtzd> list) {
		String transcode = "16002";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	/**
	 * 175	进入卷料申报页面 V4_022
	 * @return
	 * String
	 */
	public String juanlkdhsb(){
		return "select";
	}
	
	/**
	 * 17501	进入卷料申报页面 V4_022
	 * @return
	 * String
	 */
	public String juanlkdhsbcx(@Param("list") ArrayList<Daohtzd> list){
		String transcode = "17501";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	/**
	 * 176	进入卷料到货信息录入  V4_022
	 * @return
	 * String
	 */
	public String juanldhxxlr(){
		return "select";
	}
	
	/**
	 * 17601	卷料到货结束录入   V4_022
	 * @return
	 * String
	 */
	public String juanldhjslr(){
		String transcode = "17601";
		Map map = this.getParams();		
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}	
}
