package com.athena.ck.module.shouhuo.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.athena.authority.entity.LoginUser;
import com.athena.authority.util.AuthorityUtils;
import com.athena.ck.common.CKUtil;

import com.athena.ck.entity.common.CommonEntity;

import com.athena.ck.entity.shouhuo.Daohtzd;
import com.athena.ck.entity.shouhuo.Uabq;
import com.athena.ck.entity.shouhuo.Usbq;
import com.athena.ck.module.shouhuo.service.JuanlService;
import com.athena.component.wtc.WtcResponse;
import com.athena.component.wtc.action.BaseWtcAction;
import com.athena.excore.template.DownLoadServices;
import com.athena.excore.template.export.ExportConstants;
import com.athena.util.CommonUtil;
import com.toft.core2.ToftConst;
import com.toft.core2.UserInfo;
import com.toft.core3.container.annotation.Component;
import com.toft.core3.container.annotation.Inject;
import com.toft.core3.container.core.ComponentDefinition;
import com.toft.core3.transaction.annotation.Transactional;
import com.toft.mvc.annotaions.Param;
import com.toft.mvc.dispacher.ActionContext;

/**
 * <p>
 * Title:卷料Action
 * </p>
 * <p>
 * <p>
 * Company: 软通动力
 * </p>
 * xss
 * @date 2016-8-16
 */
@Component(scope = ComponentDefinition.SCOPE_PROTOTYPE)
public class JuanlAction extends BaseWtcAction {
	
	public UserInfo getUserInfo(){
		return (UserInfo) getSessionAttribute(ToftConst.Toft_SessionKey_UserData);
	}
	
	//log4j日志初始化
	private final Log log = LogFactory.getLog(JuanlAction.class); 

	@Inject
	private JuanlService juanlService;


	
	/**
	 * 175  到货申报打印
	 * @return
	 */
	public String dhsbdy() {
		String strResponse;
		Map<String,String> map =this.getParams();
		
		String uth = this.getParam("uth");
		String cangkbh = this.getParam("cangkbh");	 
		String usercenter = this.getParam("usercenter");	 
		
		map.put("uth",uth);
		map.put("cangkbh",cangkbh);
		map.put("usercenter",usercenter);
		
		//主区域
		Daohtzd main = juanlService.daohuosbdy_main(map);
		
		//列表1
		List<Uabq> list1 = juanlService.daohuosbdy_list1(map);
				
		Map<String, Object> result=new HashMap<String, Object>();
		
		if(null == main ){ 
			strResponse = "C_1403";
			result.put("response", strResponse);
			setRequestAttribute("result", result);
			return "select";			
		}else{
			strResponse = "0001";
		}
		
		int pagesize = 0;
		int page = 0;
		
		if (main !=null){ 
			result.put("response", strResponse);
			
			result.put("creator", main.getCreator());
			result.put("sysdate", CKUtil.getSysDate() );
			
			result.put("uth", main.getUth());
			result.put("yuth", main.getYuth() ); 
			
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
			java.util.Date date=new java.util.Date();  
			
			String utscsj="";
			String blscsj="";
			
			if(main.getUtscsj()!=null ){
				utscsj=sdf.format(main.getUtscsj());
			}
			if(main.getBlscsj()!=null ){
				blscsj=sdf.format(main.getBlscsj()); 
			} 
			result.put("utscsj", utscsj);
			result.put("blscsj", blscsj);
			
			result.put("blh", main.getBlh());
			result.put("yblh", main.getYblh());
			result.put("ysblh",main.getYsblh());
			
			result.put("cangkbh", main.getCangkbh());
			result.put("xiehzt", main.getXiehzt());
			result.put("tch", main.getTch());
			
			result.put("chengysdm", main.getChengysdm());		
			
			result.put("pagesize", pagesize);	 
			
			page = list1.size() % 29 ==0 ?list1.size() / 29 :  list1.size()/29 + 1;
			result.put("page",page);	
		} 
				
		result.put("list1", list1);
		
		setRequestAttribute("result", result);
		return "select";
	}
	
	
	/**
	 * 177  到货验收打印
	 * @return
	 */
	public String dhysdy() {
		String strResponse;
		Map<String,String> map =this.getParams();
		
		String blh = this.getParam("blh");	
		String cangkbh = this.getParam("cangkbh");
		String usercenter = this.getParam("usercenter");	 
		
		map.put( "blh" , blh );
		map.put( "cangkbh" , cangkbh );
		map.put( "usercenter" , usercenter);
		
		//主区域
		Daohtzd main = juanlService.daohuoysdy_main(map);
		
		map.put( "uth", main.getUth() );
		
		//列表1
		List<Uabq> list1 = juanlService.daohuoysdy_list1(map);
		
		//ua列表
		List<Uabq> list2 = juanlService.daohuoysdy_list2(map); 

		//uc列表
		List<Uabq> list3 = juanlService.daohuoysdy_list3(map);
		
		Map<String, Object> result=new HashMap<String, Object>();
		
		if(null == main ){ 
			strResponse = "C_1403";
			result.put("response", strResponse);
			setRequestAttribute("result", result);
			return "select";			
		}else{
			strResponse = "0001";
		}
		
		int pagesize = 0;
		int page = 0;
		
		if (main !=null){ 
			result.put("response", strResponse);
			
			result.put("creator", main.getCreator());
			result.put("sysdate", CKUtil.getSysDate() );
			
			result.put("uth", main.getUth());
			
			result.put("blh", main.getBlh());
			
			result.put("cangkbh", main.getCangkbh());
			result.put("xiehzt", main.getXiehzt());
			result.put("tch", main.getTch());
			
			result.put("chengysdm", main.getChengysdm());	
			result.put("chengysmc", main.getChengysmc());	
				
			result.put("pagesize", pagesize);	 
			
			page = ( list1.size()+list3.size() ) % 50 ==0 ?( list1.size()+list3.size() ) / 50 : ( list1.size()+list3.size() )/50 + 1;
		
			result.put("page",page);	
		} 
				
		result.put("list1", list1);
		result.put("list2", list2);
		result.put("list3", list3);
		
		setRequestAttribute("result", result);
		return "select";
	}
	
	
	/**
	 * 179  属性录入打印
	 * @return
	 */
	public String shuxlrdy() {
		String strResponse;
		Map<String,String> map =this.getParams();
		
		String ush = this.getParam("ush");	
		String cangkbh = this.getParam("cangkbh");
		String usercenter = this.getParam("usercenter");	 
		
		map.put( "ush" , ush );
		map.put( "cangkbh" , cangkbh );
		map.put( "usercenter" , usercenter);
		
		
		//主区域
		Usbq main = juanlService.shuxlrdy_main(map);
		
		map.put( "uth", main.getUth() );
		
		
		Map<String, Object> result=new HashMap<String, Object>();
		
		if(null == main ){ 
			strResponse = "C_1403";
			result.put("response", strResponse);
			setRequestAttribute("result", result);
			return "select";			
		}else{
			strResponse = "0001";
		}
		
		int pagesize = 0;
		int page = 0;
		
		if (main !=null){ 
			result.put("response", strResponse);
			 
			result.put("sysdate", CKUtil.getSysDate() );
			
			result.put("uth", main.getUth()); 
			result.put("blh", main.getBlh()); 
			result.put("ush", ush);

			result.put("xiaohcbh", main.getXiaohcbh());
			
			if(main.getTangc()==null){
				result.put("tangc", 0);	
			}else{ 
				result.put("tangc", main.getTangc());
			}
			
			result.put("xiangd", main.getXiangd());
			
			result.put("cangkbh", main.getCangkbh()); 
			result.put("kuwbh", main.getKuwbh()); 
			result.put("xianbck", main.getXianbck());  
			result.put("xianbckkw", main.getXianbckkw());  
			
			result.put("pich", main.getPich()); 
			result.put("gongysdm", main.getGongysdm());	
			result.put("gongysmc", main.getGongysmc());	
			
			result.put("juanh", main.getJuanh()); 
			result.put("ggph", main.getGgph()); 
			
			result.put("rukrq", main.getRukrq());	
			result.put("usxh", main.getUsxh());	
			result.put("usrl", main.getUsrl());	
			result.put("lingjsl", main.getLingjsl());
			result.put("lingjbh", main.getLingjbh());
			result.put("lingjmc", main.getLingjmc());
			
			result.put("elh", main.getElh());	
			
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
			java.util.Date date=new java.util.Date();  
			
			String shixrq="";
			
			if(main.getShixrq()==null){
				result.put("shixrq", " ");	
			}else{ 
				shixrq = sdf.format(main.getShixrq());
				result.put("shixrq", shixrq);	
			}
			
			result.put("yaohlh", main.getYaohlh());	
			result.put("yuanbqbh", main.getYuanbqbh());	 
						
			if(main.getGongzr()!=null ){
				result.put("gongzr",main.getGongzr());	
			}else{
				result.put("gongzr"," ");	
			}
			
			result.put("xiaohd", main.getXiaohd());	
			
			page = 1;
					
			result.put("pagesize", pagesize);	 
			result.put("page",page);
			
		} 
		
		setRequestAttribute("result", result);
		return "select";
	}
	
	
}
