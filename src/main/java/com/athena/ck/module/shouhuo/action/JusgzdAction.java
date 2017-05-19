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
 * Title:拒收跟踪单Action
 * </p>
 * <p>
 * Description:定义拒收跟踪单相关页面动作处理
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
 * @date 2011-12-28上午09:50:58
 */
@Component(scope=ComponentDefinition.SCOPE_PROTOTYPE)
public class JusgzdAction extends BaseWtcAction {
	public UserInfo getUserInfo() {
		return (UserInfo) getSessionAttribute(ToftConst.Toft_SessionKey_UserData);
	}
	
	/**
	 * 进入拒收跟踪单新增页面
	 * @return
	 * String
	 */
	public String jusgzdxzym(){
		return "select";
	}
	
	/**
	 * 进入拒收跟踪单查询页面
	 * @return
	 * String
	 */
	public String jusgzdcxym(){
		return "select";
	}
	
	/**
	 * 进入拒收跟踪单取消页面
	 * @return
	 * String
	 */
	public String jusgzdqxym(){
		return "select";
	}
	
	/**
	 * 根据拒收跟踪单收货
	 * @return
	 * String
	 */
	public String genjjsgzdshym(){
		return "select";
	}
	
	/**
	 * 拒收跟踪单新增
	 * @param bean
	 * @return
	 * String
	 */
	public String jusgzdXz() {
		String transcode = "10401";
		Map map = this.getParams();
		map.put("uags", this.getParam("uags"));
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	/**
	 * 拒收跟踪单查询
	 * @param bean
	 * @return
	 * String
	 */
	public String jusgzdCx() {
		String transcode = "10501";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	/**
	 * 拒收跟踪单明细
	 * @param bean
	 * @return
	 * String
	 */
	public String jusgzdInfo() {
		String transcode = "10502";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 跳转到10501页面
	 */
	public String tiaozjugzd() {
		JSONObject obj = JSONObject.fromObject(this.getParam("putvalue"));
		setRequestAttribute("result", obj);
		return "select";
	}

	/**
	 * 拒收跟踪单取消
	 * @return
	 * String
	 */
	public String jusgzdQx() {
		String transcode = "10601";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	/**
	 * 根据拒收跟踪单收货查询
	 * @return
	 * String
	 */
	public String genjjsgzdshCx() {
		String transcode = "15101";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	/**
	 * 根据拒收跟踪单收货添加页面
	 * 15101ym
	 * @return String
	 */
	public String genjjsgzdshTj(){
		setRequestAttribute("result", this.getParam("putvalue"));
		return "select";
	}
	/**
	 * 根据拒收跟踪单收货(通过条件查询拒收跟踪单)
	 *15102
	 * @return
	 * String
	 */
	public String queryjsgZd(@Param("list") ArrayList<Jusgzd> list) {
		String transcode = "15102";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	/**
	 * 根据拒收跟踪单收货(拒收跟踪单改变状态并添加相应UA到BL单)
	 * 15103
	 * @return
	 * String
	 */
	public String jsgzdtjdBl(@Param("list") ArrayList<Jusgzd> list) {
		String transcode = "15103";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	/**
	 * 根据拒收跟踪单收货(删除BL下选中的UA，并将拒收跟踪单状态返回)
	 * 15104
	 * @return
	 * String
	 */
	public String scbljsgZd(@Param("list") ArrayList<Jusgzd> list) {
		String transcode = "15104";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	/**
	 * 根据拒收跟踪单收货(拒收跟踪单收货确认)
	 * 15105
	 * @return
	 * String
	 */
	public String jsgzdqrSh() {
		String transcode = "15105";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 根据拒收跟踪单收货（初始化进入查询）
	 * 15106
	 */
	public String jsgzdInit(){
		String transcode = "15106";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));	
		return AJAX;
	}
	
	/**
	 * 178	卷料根据拒收跟踪单收货   V4_022
	 * @return
	 * String
	 */
	public String juanljsgzdsh(){
		return "select";
	}
	/**
	 * P17801	卷料根据拒收跟踪单收货明细   V4_022
	 */
	public String juanljsgzdshmx() {
		JSONObject obj = JSONObject.fromObject(this.getParam("putvalue"));
		setRequestAttribute("result", obj);
		return "select";
	}
	/**
	 * 17801	卷料根据拒收跟踪单收货明细确认   V4_022
	 */
	public String juanljsgzdshqr() {
		String transcode = "17801";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));	
		return AJAX;
	}
	
}
