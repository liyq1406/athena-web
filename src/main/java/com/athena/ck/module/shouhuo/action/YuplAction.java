package com.athena.ck.module.shouhuo.action;

import java.util.ArrayList;
import java.util.Map;

import com.athena.ck.entity.shouhuo.Chengpbz;
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
 * @date 2012-2-10上午11:13:21
 */
@Component(scope = ComponentDefinition.SCOPE_PROTOTYPE)
public class YuplAction extends BaseWtcAction {
	public UserInfo getUserInfo() {
		return (UserInfo) getSessionAttribute(ToftConst.Toft_SessionKey_UserData);
	}

	/**
	 * 149
	 * 
	 * @return String
	 */
	public String yuplljwhym() {
		return "select";
	}

	/**
	 * 14901
	 * 
	 * @return String
	 */
	public String yuplljwhCx() {
		String transcode = "14901";
		Map map = this.getParams();	
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	/**
	 * 14902
	 * 
	 * @return String
	 */
	public String yuplljwhXz() {
		String transcode = "14902";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 14902
	 * 
	 * @return String
	 */
	public String yuplljwhDel(@Param("list") ArrayList<Jusgzd> list) {
		String transcode = "14903";
		Map map = this.getParams();
		map.put("list",list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
}
