package com.athena.ck.module.shenbao.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import oracle.sql.DATE;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.athena.authority.entity.LoginUser;
import com.athena.authority.util.AuthorityUtils;
import com.athena.ck.common.CKUtil;
import com.athena.ck.entity.shenbao.Jizxgl;
import com.athena.ck.entity.yichang.Zhijbgd;
import com.athena.ck.module.shenbao.service.ShenbService;
import com.athena.ck.module.yichang.service.YichangService;
import com.athena.component.wtc.action.BaseWtcAction;
import com.toft.core2.ToftConst;
import com.toft.core2.UserInfo;
import com.toft.core3.container.annotation.Component;
import com.toft.core3.container.annotation.Inject;
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
 * @author 夏晖
 * @version v1.0
 * @date 2012-2-27下午03:16:48
 */
@Component(scope = ComponentDefinition.SCOPE_PROTOTYPE)
public class ShenbAction extends BaseWtcAction {
	public UserInfo getUserInfo() {
		return (UserInfo) getSessionAttribute(ToftConst.Toft_SessionKey_UserData);
	}
	
	@Inject
	private ShenbService shenbService;
	
   //集装箱申报
	/**
	 * 501 重箱申报
	 * @return String
	 */
	public String zhongxsbym() {
		return "select";
	}

	/**
	 * 50101重箱申报
	 * @return String
	 */
	public String zhongxsb() {
		String transcode="50101";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}

	/**
	 * 502 空箱申报页面
	 * @return String
	 */
	public String kongxsbym() {
		return "select";
	}

	/**
	 * 50201空箱申报
	 * @return String
	 */
	public String kongxsb() {
		String transcode = "50201";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}

	/**
	 * 503 返箱申报页面
	 * @return String
	 */
	public String fanxsbym() {
	   return "select";
	}
	/**
	 * 50301 返箱申报
	 * @return String
	 */
	public  String fanxsb(){
		String transcode = "50301";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	/**
	 * 50305 返箱申报打印
	 * @return String
	 */
	public  String fanxsbPrint(){
		Map map = this.getParams();
		//查询质检报告单
		List<Jizxgl> list = shenbService.selectJizxgl(map);
		//转换成Json
		JSONArray jsonArray = new JSONArray();
		if (list.size() > 0){
			for(int i=0; i<list.size(); i++){
				JSONObject jsonObj = new JSONObject();
				jsonObj.put("barcode",list.get(i).getFanxdh());
				jsonObj.put("FANXDH",list.get(i).getFanxdh());
				jsonObj.put("JIZXH",list.get(i).getJizxh());
				jsonObj.put("ZHUANGT",list.get(i).getZhuangtxx());
				jsonObj.put("WULD",list.get(i).getWuld());
				jsonObj.put("KACH",list.get(i).getKach());
				jsonObj.put("FANXYDH",list.get(i).getFanxydh());
				jsonObj.put("FANXR",list.get(i).getFanxr());
				jsonObj.put("YONGHM",AuthorityUtils.getSecurityUser().getUsername());
				jsonObj.put("DAYSJ", CKUtil.getSysDate());
				jsonArray.add(jsonObj.toString());
			}
		}
		//System.out.println(jsonArray.toString());
		setResult("result", jsonArray);
		return AJAX;
	}
	
	
	/**
	 * 504 重箱纠纷页面
	 * @return String
	 */
	public String zhongxjfym() {
	   return "select";
	}
	/**
	 * 50401 重箱纠纷
	 * @return String
	 */
	public String zhongxjf() {
		String transcode = "50401";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 505 重箱申报取消页面
	 * @return String
	 */
	public String zhongxsbqxym() {
	   return "select";
	}
	/**
	 * 50501 重箱申报取消
	 * @return String
	 */
	public String zhongxsbqx() {
		String transcode = "50501";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 506 重箱申报查询页面
	 * @return String
	 */
	public String zhongxsbcxym() {
	   return "select";
	}
	/**
	 * 50601 重箱申报查询
	 * @return String
	 */
	public String zhongxsbcx() {
		String transcode = "50601";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 507空箱申报取消页面
	 * @return String
	 */
	public String kongxsbqxym() {
	   return "select";
	}
	/**
	 * 50701 重箱申报查询
	 * @return String
	 */
	public String kongxsbqx() {
		String transcode = "50701";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 508返箱申报单查询页面
	 * @return String
	 */
	public String fanxsbdcxym() {
	   return "select";
	}
	/**
	 * 50801返箱申报单查询
	 * @return String
	 */
	public String fanxsbdcx() {
		String transcode = "50801";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 509返箱申报取消页面
	 * @return String
	 */
	public String fanxsbqxym() {
	   return "select";
	}
	/**
	 * 50901 返箱申报取消
	 * @return String
	 */
	public String fanxsbqx() {
		String transcode = "50901";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 510空箱申报查询页面
	 * @return String
	 */
	public String kongxsbcxym() {
	   return "select";
	}
	/**
	 * 51001空箱申报查询
	 * @return String
	 */
	public String kongxsbcx() {
		String transcode = "51001";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 511集装箱查询页面
	 * @return String
	 */
	public String jizxcxym() {
	   return "select";
	}
	/**
	 * 51101 集装箱查询
	 * @return String
	 */
	public String jizxcx() {
		String transcode = "51101";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	/**
	 * 51105 集装箱打印
	 * @return String
	 */
	public  String jizxPrint(){
		//定义标识如果flag为1代表查询带有时间查询ck_jizxlsb 否则为0查询ck_jizxgl
		String flag = "0";
		Map map = this.getParams();
		String queryWhere = "";
		    if(!map.get("qissj").toString().isEmpty()||!map.get("zhongzsj").toString().isEmpty())
		    {
		    	queryWhere+=" and to_date(to_char( t1.shenbsj,'YYYY-MM-dd'),'YYYY-MM-dd') >=to_date('"+ map.get("qissj").toString() +"','YYYY-MM-dd') " +
		    			"and to_date( to_char( t1.shenbsj,'YYYY-MM-dd'),'YYYY-MM-dd') <=to_date('"+ map.get("zhongzsj").toString() +"','YYYY-MM-dd')";
				flag = "1";
		        if(!map.get("wulid").toString().isEmpty())
		        {
		    		queryWhere+=" and t1.shenbd ='"+ map.get("wulid").toString() +"'";
		        }
		        if(!map.get("qswulid").toString().isEmpty())
		        {
		    		queryWhere+=" and t1.shenbd >='"+ map.get("qswulid").toString() +"'";
		        }
		        if(!map.get("zzwulid").toString().isEmpty())
		        {
		    		queryWhere+=" and t1.shenbd <='"+ map.get("zzwulid").toString() +"'";
		        }

		        if(!map.get("jizxh").toString().isEmpty())
		        {
		        	queryWhere+=" and t1.jizxh ='"+ map.get("jizxh").toString() +"'";
		        }

		        if(!map.get("zhuangt").toString().isEmpty())
		        {
		        	queryWhere+=" and t1.zhuangt ='"+ map.get("zhuangt").toString() +"'";
		        }
		        queryWhere+=" order by t1.shenbsj desc " ;
		    }
		    else
		    {
		    	queryWhere+=" and nvl(t1.shifjfz , '0')='0' ";

		        if(!map.get("zhuangt").toString().isEmpty())
		        {
		        	queryWhere+=" and t1.zhuangt ='"+ map.get("zhuangt").toString() +"'";

		        	if("1".equals( map.get("zhuangt").toString()))
		        	{
		        		if(!map.get("wulid").toString().isEmpty())
		        		{
		        			queryWhere+=" and t1.wuld ='"+ map.get("wulid").toString() +"'";
		                
		        		}
		                if(!map.get("qswulid").toString().isEmpty())
				        {
				    		queryWhere+=" and t1.wuld >='"+ map.get("qswulid").toString() +"'";
				        }
		                
		                if(!map.get("zzwulid").toString().isEmpty())
				        {
				    		queryWhere+=" and t1.wuld <='"+ map.get("zzwulid").toString() +"'";
				        }
		             
		        	}
		        	else
		        	{
		        		if(!map.get("wulid").toString().isEmpty())
		        		{
		        			queryWhere+=" and t1.kongqxq ='"+ map.get("wulid").toString() +"'";
		        		}
		                if(!map.get("qswulid").toString().isEmpty())
		                {
		                	queryWhere+=" and t1.kongqxq >='"+ map.get("qswulid").toString() +"'";
		                }
		                if(!map.get("zzwulid").toString().isEmpty())
				        {
				    		queryWhere+=" and t1.kongqxq  <='"+ map.get("zzwulid").toString() +"'";
				        }
		        	}
		        }
		        else
		        {
		    		if(!map.get("wulid").toString().isEmpty())
		    		{
		    			queryWhere+=" and t1.kongqxq ='"+ map.get("wulid").toString() +"' or t1.wuld= '"+ map.get("wulid").toString()+"'";
		    		}
		            if(!map.get("qswulid").toString().isEmpty())
		            {
		            	queryWhere+=" and t1.kongqxq >='"+ map.get("qswulid").toString() +"'or t1.wuld >= '"+ map.get("wulid").toString()+"'";
		            	
		            }
		            if(!map.get("zzwulid").toString().isEmpty())
		            {
		            	queryWhere+=" and t1.kongqxq >='"+ map.get("zzwulid").toString() +"'or t1.wuld >= '"+ map.get("zzwulid").toString()+"'";
		            	
		            }
		        }

		        if(!map.get("jizxh").toString().isEmpty())
		        {
		        	queryWhere+=" and nvl(t1.jiufjzxh,t1.jizxh) ='"+ map.get("jizxh").toString() +"'";
		        }
		        if("1".equals( map.get("zhuangt").toString()))
		        	queryWhere+=" order by  t1.zhongxsbsj ";
		        else if("2".equals( map.get("zhuangt").toString()))
		        	queryWhere+=" order by  t1.kongxsbsj " ;
		        else if("3".equals( map.get("zhuangt").toString()))
		        	queryWhere+="  order by t1.fanxsbsj ";
		        else
		        	queryWhere+=" order by  EDIT_TIME " ;
		    }

		map.put("queryWhere", queryWhere);
		//查询质检报告单
		List<Jizxgl> list =new ArrayList<Jizxgl>();
		if("1".equals(flag)){
			list = shenbService.selectJizxlsb(map);
			
		}else{
			list = shenbService.queryJizxgl(map);
		}
		
		//转换成Json
		JSONArray jsonArray = new JSONArray();
		if (list.size() > 0){
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("XUH",new JSONArray());
			jsonObj.put("JIZXH",new JSONArray());
			jsonObj.put("ZHUANGT",new JSONArray());
			jsonObj.put("DAOXSJ",new JSONArray());
			jsonObj.put("WULD",new JSONArray());
			for(int i=0; i<list.size(); i++){
				//添加明细列表数据
				((JSONArray)jsonObj.get("XUH")).add(i+1);
				((JSONArray)jsonObj.get("JIZXH")).add(list.get(i).getJizxh());
				((JSONArray)jsonObj.get("ZHUANGT")).add(list.get(i).getZhuangtxx());
				((JSONArray)jsonObj.get("DAOXSJ")).add(list.get(i).getDaoxsj());
				((JSONArray)jsonObj.get("WULD")).add(list.get(i).getWuld());
			}
			jsonArray.add(jsonObj);
		}
		//System.out.println(jsonArray.toString());
		setResult("result", jsonArray);
		return AJAX;
	}
}
