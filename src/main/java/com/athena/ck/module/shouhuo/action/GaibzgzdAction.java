package com.athena.ck.module.shouhuo.action;

import java.util.ArrayList;
import java.util.Map;

import com.athena.ck.common.CKUtil;
import com.athena.ck.entity.shouhuo.Gaibz;
import com.athena.ck.entity.shouhuo.Jusgzd;
import com.athena.component.wtc.action.BaseWtcAction;
import com.toft.core2.ToftConst;
import com.toft.core2.UserInfo;
import com.toft.core3.container.annotation.Component;
import com.toft.core3.container.core.ComponentDefinition;
import com.toft.mvc.annotaions.Param;

/**
 * <p>
 * Title:
 * </p>
 * <p>
 * Description:
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
 * @date 2012-2-10上午09:31:53
 */
@Component(scope = ComponentDefinition.SCOPE_PROTOTYPE)
public class GaibzgzdAction extends BaseWtcAction {
	public UserInfo getUserInfo() {
		return (UserInfo) getSessionAttribute(ToftConst.Toft_SessionKey_UserData);
	}

	/**
	 * 145
	 * 
	 * @return String
	 */
	public String gaibzgzdcxym() {
		return "select";
	}
	
	/**
	 * 119
	 * 
	 * @return String
	 */
	public String rukgbzym() {
		return "select";
	}
	
	/**
	 * 11901
	 * 
	 * @return String
	 */
	public String rukgbzCx() {
		String transcode = "11901";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	
	/**
	 * 11902
	 * 
	 * @return String
	 */
	public String rukgbzQr(@Param("list") ArrayList<Gaibz> list) {
		String transcode = "11902";
		Map map = this.getParams();
		map.put("list",list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}

	/**
	 * 14501
	 * 
	 * @return String
	 */
	public String gaibzgzdCx() {
		String transcode = "14501";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
}
