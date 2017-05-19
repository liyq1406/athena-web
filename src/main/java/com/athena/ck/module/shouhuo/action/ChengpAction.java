package com.athena.ck.module.shouhuo.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import net.sf.json.JSONObject;
import com.athena.authority.entity.LoginUser;
import com.athena.authority.util.AuthorityUtils;
import com.athena.ck.common.CKUtil;
import com.athena.ck.entity.common.CommonEntity;
import com.athena.ck.entity.shouhuo.Chengpbz;
import com.athena.ck.entity.shouhuo.Shengcx;
import com.athena.ck.module.common.service.CommonService;
import com.athena.ck.module.shouhuo.service.TongbshService;
import com.athena.component.wtc.action.BaseWtcAction;
import com.toft.core2.ToftConst;
import com.toft.core2.UserInfo;
import com.toft.core3.container.annotation.Component;
import com.toft.core3.container.annotation.Inject;
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
 * @date 2012-2-10下午03:16:48
 */
@Component(scope=ComponentDefinition.SCOPE_PROTOTYPE)
public class ChengpAction extends BaseWtcAction {
	@Inject
	private CommonService cs;
	@Inject
	private TongbshService tb;
	public UserInfo getUserInfo() {
		return (UserInfo) getSessionAttribute(ToftConst.Toft_SessionKey_UserData);
	}

	
	/**
	 * 115	成品唯一标签页面
	 * @return
	 * String
	 */
	public String chengpwybqym(){
		return "select";
	}
	
	/**
	 * 116	成品唯一标签页面
	 * @return
	 * String
	 */
	public String chengpplbqym(){
		return "select";
	}
	
	/**
	 * 138	成品唯一标签页面
	 * @return
	 * String
	 */
	public String chengprkym(){
		return "select";
	}
	
	/**
	 * 148	成品库内改包装页面
	 * @return
	 * String
	 */
	public String chengpkngbzym(){
		return "select";
	}
	
	/**
	 * 11501     成品唯一标签查询
	 * @return
	 * String
	 */
	public String chengpwybqCx(){
		String transcode = "11501";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	/**
	 * 11502     成品唯一标签打印
	 * @return
	 * String
	 */
	public String chengpwybqDy(@Param("list") ArrayList<Chengpbz> list){
		String transcode = "11502";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 11505 校验序列号是否存在
	 * @return
	 */
	public String selectLingjxlh(){
		
		Map map = this.getParams();
		LoginUser loginUser = AuthorityUtils.getSecurityUser();
		map.put("usercenter", loginUser.getUsercenter());
		String str=tb.selectLingjxlh(map);
		String str1=tb.selectChengpbz(map);//判断零件序列号是否重复0011259
		CommonEntity commonEntity = new CommonEntity();
		
		if(str==null || str.equals("")){
			commonEntity.setResponse("C_XLHYW");	
		}else if(str1 !=null){
			commonEntity.setResponse("C_XLHCF");
		}else{
			//modified by xss for 0010670
			String ljxh =""; //13位序列号
			String code =""; //最后一位检查码
			ljxh = map.get("lingjxlh").toString();		
			code = map.get("code").toString();

			System.out.println("!!!!!!!!!!!!!"+ljxh);
					
			for (int i = 0; i <ljxh.length(); i++) {
				char tmp =ljxh.charAt(i);
				switch(tmp){
						case  'A':
							      ljxh = ljxh.replace("A","10");
							      break;
							      
						case  'B':
							      ljxh = ljxh.replace("B","11");
							      break;	
							      
						case  'C':
								 ljxh = ljxh.replace("C","12");
							      break;
							      
						case  'D':
							      ljxh = ljxh.replace("D","13");
							      break;
							      
						case  'E':
							     ljxh = ljxh.replace("E","14");
							      break;
							      
						case  'F':
							      ljxh = ljxh.replace("F","15");
							      break;
							      
						case  'G' :
							      ljxh = ljxh.replace("G","16");
							      break;
							      
						case  'H' :
							      ljxh = ljxh.replace("H","17");
							      break;
							      
						case  'J' :
							      ljxh = ljxh.replace("J","18");
							      break;
							      
						case  'K' :
							      ljxh = ljxh.replace("K","19");
							      break;
							      
						case  'L' :
							      ljxh = ljxh.replace("L","20");
							      break;	      	
							      
						case  'M' :
							      ljxh = ljxh.replace("M","21");
							      break;
				      
						case  'N' :
							      ljxh =  ljxh.replace("N","22");
							      break;
					  
					    case  'P' :
					    	      ljxh =  ljxh.replace("P","23");
							      break;
							      
						case  'Q' :
							      ljxh = ljxh.replace("Q","24");
							      break;
							      
						case  'R' :
							      ljxh =  ljxh.replace("R","25");
							      break;						      
							      
						case  'S' :
							      ljxh = ljxh.replace("S","26");
							      break;
							      
						case  'T' :
							      ljxh =  ljxh.replace("T","27");
							      break;
							      
						case  'U' :
							      ljxh = ljxh.replace("U","28");
							      break;
							      
						case  'V' :
							      ljxh = ljxh.replace("V","29");
							      break;
							      
						case  'W' :
							      ljxh =  ljxh.replace("W","30");
							      break;	      
							      
						case  'X' :
							      ljxh =  ljxh.replace("X","31");
							      break;
							      
						case  'Y' :
							      ljxh =  ljxh.replace("Y","32");
							      break;
							      
						case  'Z' :
							      ljxh =  ljxh.replace("Z","33");
							      break;		
							      
						default :
						        break; 	      						      				      				      			
					}
			}
			
			//System.out.println("!!!!!"+ljxh);		
			//System.out.println("!!!!!code"+code);		
			//System.out.println("!!!!!ljxh"+ljxh);
			
			
			//转换/取余数
			long ljxh_long ;
			
			ljxh_long =(new Long(ljxh));
			
			//System.out.println("!!!!!ljxh_long"+ljxh_long);
			
			
			int ys = (int) (ljxh_long%24);
			
			//System.out.println("!!!!!ys"+ys);
			
			//余数换算
			String tmp2="";
			switch(ys){
			case  0:
				      tmp2 = "A";
				      break;
				      
			case  1:
				      tmp2 = "B";
				      break;	
				      
			case  2:
					  tmp2 = "C";
				      break;
				      
			case  3:
					  tmp2 = "D";
				      break;
				      
			case  4:
					  tmp2 = "E";
				      break;
				      
			case  5:
				      tmp2 = "F";
				      break;
				      
			case  6:
				      tmp2 = "G";
				      break;
				      
			case  7:
				      tmp2 = "H";
				      break;
				      
			case  8:
				      tmp2 = "J";
				      break;
				      
			case  9:
				      tmp2 = "K";
				      break;
				      
			case  10:
				      tmp2 = "L";
				      break;	      	
				      
			case  11:
				      tmp2 = "M";
				      break;
	      
			case  12:
				      tmp2 = "N";
				      break;
		  
		    case  13:
		    	      tmp2 = "P";
				      break;
				      
			case  14:
				      tmp2 = "Q";
				      break;
				      
			case  15:
				      tmp2 = "R";
				      break;
		      
			case  16:
				      tmp2 = "S";
				      break;
				      
			case  17:
				      tmp2 = "T";
				      break;
				      
			case  18:
				      tmp2 = "U";
				      break;
				      
			case  19:
				      tmp2 = "V";
				      break;
				      
			case  20:
				      tmp2 = "W";
				      break;	      
				      
			case  21:
				      tmp2 = "X";
				      break;
				      
			case  22:
				      tmp2 = "Y";
				      break;
				      
			case  23:
				      tmp2 = "Z";
				      break;		
				      
			default :
			        break; 	      						      				      				      			
		}
			
			if(tmp2.equals(code)){
				commonEntity.setResponse("0001");				
			}else{
				commonEntity.setResponse("ljxlh_invalid");	
			}			
			
		}
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;
	
	}
	/**
	 * 11508查询产线列表是否存在
	 * @return
	 */
	public  String  selectCxlb(){
		Map map = this.getParams();
		LoginUser loginUser = AuthorityUtils.getSecurityUser();
		map.put("usercenter",loginUser.getUsercenter());
		List<Shengcx>  chanx= cs.selectChanx(map);
		CommonEntity commonEntity = new CommonEntity();
		if(chanx.size() == 0){
		  commonEntity.setResponse("C_8888");
		}else{
			commonEntity.setResponse("0001");	
		}
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;
	}
	/*
	 * 14801 成品库内改包装 查询
	 * @return  String  
	 */
   public  String chengpkngbzcx(){
	   String transcode = "14801";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
	   return  AJAX;
   }
   /*
	 * 14802 成品库内改包装 
	 * @return  String  
	 */
  public  String chengpkngbz(@Param("list") ArrayList<Chengpbz> list){
	   String transcode = "14802";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result",this.callWtc(transcode, map));
	   return  AJAX;
  }
  /*
   * 判断包装型号是否存在
   */
  public  String  checkbaozxh(){
	  Map map=this.getParams();
		CommonEntity commonEntity = new CommonEntity();
		commonEntity.setResponse(cs.checkbzxh(map));
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;
	  
  }
	/**
	 * 13801	成品入库
	 * @return
	 * String
	 */
	public String chengpRk(){
		String transcode = "13801";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	} 
	
	/**
	 * 11601	成品批量标签查询
	 * @return
	 * String
	 */
	public String chengpplbqCx(){
		String transcode = "11601";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	} 
	/**
	 * 11602	成品批量标签打印
	 * @return
	 * String
	 */
	public String chengpplbqDy(){
		String transcode = "11602";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	} 
	/**
	 * 170   成品唯一标签删除页面
	 * @return
	 * String
	 */
	public String cpwybqscym(){
		return "select";
	}
	
	/**
	 * 17001     成品唯一标签删除查询
	 * @return
	 * String
	 */
	public String cpwybqsccx(){
		String transcode = "17001";
		Map map = this.getParams();
		
		String ush = map.get("ush").toString();
		String lingjxlh = map.get("lingjxlh").toString();
		
		if("".equals(ush) && "".equals(lingjxlh) ){
			setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		}else{
			map.remove("qissj");  
			map.remove("zhongzsj");  
			/*
			map.put("qissj", "");
			map.put("zhongzsj", "");
			*/
			setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		}	
		
		return AJAX;
	}
	/**
	 * 17002     成品唯一标签删除确认
	 * @return
	 * String
	 */
	public String cpwybqscqr(@Param("list") ArrayList<Chengpbz> list){
		String transcode = "17002";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 17003     成品唯一标签删除查看
	 * @return
	 * String
	 */
	public String cpwybqscck(){
		String transcode = "17003";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 成品唯一标签删除查看页面
	 */
	public String cpwybqscckym() {
		JSONObject obj = JSONObject.fromObject(this.getParam("putvalue"));
		setRequestAttribute("result", obj);
		return "select";
	}
	/**
	 * 17004     成品唯一标签删除过期标签
	 * @return
	 * String
	 */
	public String cpwybqscgqbq(){
		String transcode = "17004";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
}
