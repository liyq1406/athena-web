package com.athena.ck.module.shouhuo.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import com.athena.ck.entity.shouhuo.Daohtzd;
import com.athena.component.wtc.action.BaseWtcAction;
import com.toft.core2.ToftConst;
import com.toft.core2.UserInfo;
import com.toft.core3.container.annotation.Component;
import com.toft.core3.container.core.ComponentDefinition;
import com.toft.mvc.annotaions.Param;
@Component(scope=ComponentDefinition.SCOPE_PROTOTYPE)
public class TestAction extends BaseWtcAction {
	public UserInfo getUserInfo() {
		return (UserInfo) getSessionAttribute(ToftConst.Toft_SessionKey_UserData);
	}
	
	public String test(){
		return "select";
	}
	
	//uth=1&list[0]=uah:11#bzxh:b00001#ljsl:30&list[1]=uah:22#bzxh:b00001#ljsl:30
	public String transTest(@Param String str) {
		String transcode = this.getParam("transcode");
		Map param = this.getParams();
		Iterator itr = param.keySet().iterator();
		
		Map map = new HashMap();
		Map<String,String> mapL;
		ArrayList listM = new ArrayList();
		String[] ss0,ss1,ss2,ss3;
		String key;
		while(itr.hasNext()){
			key = itr.next().toString();			
			if(key.indexOf("list[")>=0){
				ss1 =param.get(key).toString().split("#");
				mapL = new HashMap<String,String>();
				listM.add(mapL);
				for(int j=0;j<ss1.length;j++){
					ss2 = ss1[j].split(":");
					mapL.put(ss2[0], ss2[1]);					
				}				
			}else{
				map.put(key, param.get(key));
			}
		}
		if(listM.size()>0){
			map.put("list", listM);
		}
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	public String myTest(@Param("list") ArrayList<Daohtzd> list) {
		String transcode = "10101";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
}
