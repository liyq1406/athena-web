package com.athena.ck.module.shouhuo.action;

import java.util.ArrayList;
import java.util.Map;

import net.sf.json.JSONObject;

import com.athena.ck.common.CKUtil;
import com.athena.ck.entity.shouhuo.Jusgzd;
import com.athena.component.wtc.action.BaseWtcAction;
import com.toft.core2.ToftConst;
import com.toft.core2.UserInfo;
import com.toft.core3.container.annotation.Component;
import com.toft.core3.container.core.ComponentDefinition;
import com.toft.mvc.annotaions.Param;

/**
 * <p>
 * Title: 拒收单Action
 * </p>
 * <p>
 * Description:定义拒收单相关页面动作处理
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
 * @date 2012-1-4上午09:34:23
 */
@Component(scope = ComponentDefinition.SCOPE_PROTOTYPE)
public class JusdAction extends BaseWtcAction {
	public UserInfo getUserInfo() {
		return (UserInfo) getSessionAttribute(ToftConst.Toft_SessionKey_UserData);
	}

	/**
	 * 进入拒收单新增页面
	 * 107
	 * @return String
	 */
	public String jusdxzym() {
		return "select";
	}

	/**
	 * 进入拒收单查询页面
	 * 108
	 * @return String
	 */
	public String jusdcxym() {
		return "select";
	}

	/**
	 * 进入拒收单删除页面
	 * 109
	 * @return String
	 */
	public String jusdscym() {
		return "select";
	}

	/**
	 * 进入拒收单取消页面
	 * 110
	 * @return String
	 */
	public String jusdqxym() {
		return "select";
	}

	/**
	 * 进入拒收单修改页面
	 * 111
	 * @return String
	 */
	public String jusdxgym() {
		return "select";
	}

	/**
	 * 进入拒收单打印页面
	 * 112
	 * @return String
	 */
	public String jusddyym() {
		return "select";
	}

	/**
	 * 进入拒收单执行确认页面
	 * 113
	 * @return String
	 */
	public String jusdzxqrym() {
		return "select";
	}
	
	/**
	 * 拒收跟踪单查询 
	 * 10701
	 * @return String
	 */
	public String jusgzdCx(){
		String transcode = "10701";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	
	/**
	 * 拒收单生成 
	 * 10702
	 * @return String
	 */
	public String jusdShengCheng(@Param("list") ArrayList<Jusgzd> list){
		String transcode = "10702";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	
	/**
	 * 拒收单打印
	 * 10703
	 * @return String
	 */
	public String jusdDaYing(@Param("list") ArrayList<Jusgzd> list){
		String transcode = "10703";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	/**
	 * 拒收单查询 
	 * 10801
	 * @return String
	 */
	public String jusdCx(){
		String transcode = "10801";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	/**
	 * 拒收单删除
	 * 10901
	 * @return String
	 */
	public String jusdSc(){
		String transcode = "10901";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	/**
	 * 拒收单取消
	 * 11001
	 * @return String
	 */
	public String jusdQx(){
		String transcode = "11001";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	/**
	 * 拒收单修改查询
	 * 11101
	 * @return String
	 */
	public String jusdxgCx(){
		String transcode = "11101";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	/**
	 * 拒收单修改新增查询页面
	 * 11102ym
	 * @return String
	 */
	public String jusdxgxzcxym(){
		JSONObject obj = JSONObject.fromObject(this.getParam("putvalue"));
		setRequestAttribute("result", obj);
		return "select";
	}
	
	/**
	 * 拒收单修改新增查询
	 * 11102
	 * @return String
	 */
	public String jusdxgxzCx(){
		String transcode = "11102";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	
	/**
	 * 拒收单修改新增确定
	 * 11103
	 * @return String
	 */
	public String jusdxgxzQd(@Param("list") ArrayList<Jusgzd> list){
		String transcode = "11103";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	
	/**
	 * 拒收单修改删除拒收跟踪单
	 * 11104
	 * @return String
	 */
	public String jusdxgscjsgZd(@Param("list") ArrayList<Jusgzd> list){
		String transcode = "11104";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	
	/**
	 * 拒收单修改打印拒收单
	 * 11105
	 * @return String
	 */
	public String jusdxgdyjSd(){
		String transcode = "11105";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	/**
	 * 拒收单查询承运商代码和名称
	 * 11201
	 * @return String
	 */
	public String jusdcxcysdmhMc(){
		String transcode = "11201";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	
	/**
	 * 拒收单打印
	 * 11202
	 * @return String
	 */
	public String jusdDy(){
		String transcode = "11202";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	/**
	 * 拒收单执行确认动作
	 * 11301
	 * @return String
	 */
	public String jusdzxQr(){
		String transcode = "11301";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	
}
