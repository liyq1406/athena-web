package com.athena.ck.module.shouhuo.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONObject;

import com.athena.authority.entity.LoginUser;
import com.athena.authority.util.AuthorityUtils;
import com.athena.ck.common.CKUtil;
import com.athena.ck.entity.shouhuo.Daohtzd;
import com.athena.ck.entity.shouhuo.Daohtzd_139;
import com.athena.ck.entity.shouhuo.Uabq;
import com.athena.component.wtc.WtcRequest;
import com.athena.component.wtc.action.BaseWtcAction;
import com.toft.core2.ToftConst;
import com.toft.core2.UserInfo;
import com.toft.core3.container.annotation.Component;
import com.toft.core3.container.core.ComponentDefinition;
import com.toft.mvc.annotaions.Param;

/**
 * <p>
 * Title:发货通知Action
 * </p>
 * <p>
 * Description:定义到发货通知相关页面动作处理
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
 * @date 2012-1-16
 */
@Component(scope = ComponentDefinition.SCOPE_PROTOTYPE)
public class FahtzAction extends BaseWtcAction {

	public UserInfo getUserInfo() {
		return (UserInfo) getSessionAttribute(ToftConst.Toft_SessionKey_UserData);
	}
	LoginUser loginUser = AuthorityUtils.getSecurityUser();
    String cklist = (String) loginUser.getParams().get("cklist");
	/**
	 * 139
	 * 
	 * @return String
	 */
	public String fahtzcxym() {
		return "select";
	}

	/**
	 * 140
	 * 
	 * @return String
	 */
	public String fahtzgzym() {
		return "select";
	}

	/**
	 * 141
	 * 
	 * @return String
	 */
	public String fahtzscym() {
		return "select";
	}

	/**
	 * 13901 到货申报查询
	 * 
	 * @return String
	 */
	public String fahtzCx() {
		String transcode = "13901";
		Map map = this.getParams();
		if("0".equals(map.get("flag")) ){
			map.put("cklist", cklist);
		}
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	/**
	 * 13902 到货申报查询打印
	 * 0011460/0011522
	 * @return String
	 */
	public String fahtzdy(@Param("list") ArrayList<Daohtzd_139> list) {
		String transcode = "13902";
		Map map = this.getParams();
        map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	

	/**
	 * 14001 发货通知纠正查询
	 * 
	 * @return String
	 */
	public String fahtzgzCx() {
		String transcode = "14001";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}

	/**
	 * 14002 发货通知纠正查询
	 * 
	 * @return String
	 */
	public String fahtzgzXg(@Param("list") ArrayList<Uabq> list) {
		String transcode = "14002";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}

	/**
	 * 14101 发货通知删除
	 * 
	 * @return String
	 */
	public String fahtzgzSc(@Param("list") ArrayList<Daohtzd> list) {
		String transcode = "14101";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result",this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 14102 发货通知查询
	 * 
	 * @return String
	 */
	public String fahtzgzCc() {
		String transcode = "14102";
		Map map = this.getParams();
		setResult("result",  CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
}
