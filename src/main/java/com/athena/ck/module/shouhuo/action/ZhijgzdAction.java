package com.athena.ck.module.shouhuo.action;

import java.util.Map;

import com.athena.component.wtc.action.BaseWtcAction;
import com.toft.core2.ToftConst;
import com.toft.core2.UserInfo;
import com.toft.core3.container.annotation.Component;
import com.toft.core3.container.core.ComponentDefinition;

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
 * @date 2012-2-9下午04:00:41
 */
@Component(scope = ComponentDefinition.SCOPE_PROTOTYPE)
public class ZhijgzdAction extends BaseWtcAction {
	public UserInfo getUserInfo() {
		return (UserInfo) getSessionAttribute(ToftConst.Toft_SessionKey_UserData);
	}
	

	/**
	 * 144	质检跟踪单查询页面
	 * @return
	 * String
	 */
	public String zhijgzdcxym(){
		return "select";
	}
	
	/**
	 * 14401	质检跟踪单查询
	 * @return
	 * String
	 */
	public String zhijgzdCx(){
		String transcode = "14401";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
		} 
	
}
