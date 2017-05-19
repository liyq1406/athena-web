package com.athena.ck.module.shouhuo.action;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import net.sf.json.JSONObject;


import com.athena.authority.entity.LoginUser;
import com.athena.authority.util.AuthorityUtils;
import com.athena.ck.common.CKUtil;
import com.athena.ck.entity.common.CommonEntity;
import com.athena.ck.entity.shouhuo.Daohtzd;
import com.athena.ck.entity.shouhuo.Daohxxlrxg;
import com.athena.ck.entity.shouhuo.Tongbyhl;
import com.athena.ck.entity.shouhuo.Tongbysdmx;
import com.athena.ck.entity.shouhuo.Uabq;
import com.athena.ck.module.common.service.CommonService;
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
 * @date 2012-2-7上午09:18:40
 */
@Component(scope = ComponentDefinition.SCOPE_PROTOTYPE)
public class DaohtzdAction extends BaseWtcAction {
	@Inject
	private  CommonService cs;
	public UserInfo getUserInfo() {
		return (UserInfo) getSessionAttribute(ToftConst.Toft_SessionKey_UserData);
	}

	/**
	 * 103      到货通知单验收查询页面
	 * @return
	 * String
	 */
	public String daohtzdyscxym(){
		return "select";
	}
	
	/**
	 * 142      验收单查询
	 * @return
	 * String
	 */
	public String yansdcxym(){
		return "select";
	}
	
	/**
	 * 143      验收单查询
	 * @return
	 * String
	 */
	public String yansdscym(){
		return "select";
	}
	
	
	/**
	 * 10301      到货通知单验收查询
	 * @return
	 * String
	 */
	public String daohtzdysCx(){
		String transcode = "10301";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	
	/**
	 * 10302      到货通知单验收查询
	 * @return
	 * String
	 */
	public String daohtzdys(){
		String transcode = "10302";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	/**
	 * 10302      到货通知单验收查询页面
	 * @return
	 * String
	 */
	public String daohtzdysym(){
		JSONObject obj = JSONObject.fromObject(this.getParam("putvalue"));
		setRequestAttribute("result", obj);
		return "select";
	}
	/**
	 * 10303      到货通知单验收信息修改查询
	 * @return
	 * String
	 */
	public String daohtzdysxxcx(){
		String transcode = "10303";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}

	/**
	 * 到货通知单验收修改页面
	 */
	public String daohtzdysxgym(){
		JSONObject obj = JSONObject.fromObject(this.getParam("putvalue"));
		setRequestAttribute("result", obj);
		return "select";
	}
	/**
	 * 到货通知单拒收页面
	 */
	public String daohtzdjsym(){
		JSONObject obj = JSONObject.fromObject(this.getParam("putvalue"));
		setRequestAttribute("result", obj);
		return "select";
	}
	/**
	 * 10305      到货通知单验收修改提交
	 * @return
	 * String
	 */
	public String daohtzdysxg(@Param Uabq uabq){
		String transcode = "10305";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	/**
	 * 10304      到货通知单验收拒收确认
	 * @return
	 * String
	 */
	public String daohtzdymjsqr(){
		String transcode = "10304";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	
	/**
	 * 10306      到货通知单确认
	 * @return
	 * String
	 */
	public String daohtzdQr(){
		String transcode = "10306";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	
	/**
	 * 10307      到货通知单验收打印
	 * @return
	 * String
	 */
	public String daohtzdysDy(){
		String transcode = "10307";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 10308 查询零件名称
	 */
	public   String  selectLingjmc(){
		Map<String,String> map = this.getParams();
		LoginUser loginUser = AuthorityUtils.getSecurityUser();
		map.put("usercenter", loginUser.getUsercenter());
		Tongbyhl bean=(Tongbyhl)cs.selectLingjmc(map);
		CommonEntity commonEntity = new CommonEntity();
		if(bean==null){
			commonEntity.setResponse("C_1403");
		    commonEntity.setParameter("{currentPage:\"1\"}");
		}else{
			commonEntity.setResponse("0001");
			 commonEntity.setParameter("{lingjmc:\""+bean.getLingjmc()+"\"}");
		}
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;
	
	}
	
	/**
	 * 10309查询供应商名称
	 */
	public   String  selectGongysmc(){
		Map<String,String> map = this.getParams();
		LoginUser loginUser = AuthorityUtils.getSecurityUser();
		map.put("usercenter", loginUser.getUsercenter());
		Tongbyhl bean=(Tongbyhl)cs.selectGongysmc(map);
		CommonEntity commonEntity = new CommonEntity();
		JSONObject a=new JSONObject();
		if(bean==null){
			commonEntity.setResponse("C_1403");
			a.put("currentPage", "1");
		    commonEntity.setParameter(a.toString());
		}else{
			commonEntity.setResponse("0001");
			a.put("gongysmc", bean.getGongysmc());
			commonEntity.setParameter(a.toString());
		}
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;

	}
	/**
	 * 104    EL验收查询页面
	 */
	public String elyscxym(){
		return "select";
	}
	/**
	 * 10401    EL验收查询
	 * @return
	 */
	public String elyscx(){
		String transcode = "10401";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	/**
	 * 10402    EL验收/打印
	 * @return
	 */
	public String elysdy(){
		String transcode = "10402";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 14201     验收单查询
	 * @return
	 * String
	 */
	public String yansdCx(){
		String transcode = "14201";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	/**
	 * 14202     验收单明细查询页面
	 * @return
	 * String
	 */
	public String yansdmxYm(){
		JSONObject obj = JSONObject.fromObject(this.getParam("putvalue"));
		setRequestAttribute("result", obj);
		return "select";
	}
	
	/**
	 * 14202     验收单明细查询页面
	 * @return
	 * String
	 */
	public String yansdmxCx(){
		String transcode = "14202";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	/**
	 * 14301     BL验收单查询
	 * @return
	 * String
	 */
	public String yansdSc(){
		String transcode = "14301";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 14302     EL验收单查询
	 * @return
	 * String
	 */
	public String elyansdSc(){
		String transcode = "14302";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 163    单位纠正页面
	 */
	public String danwjzym(){
		return "select";
	}
	/**
	 * 16301    单位纠正查询
	 * @return
	 */
	public String danwjzcx(){
		String transcode = "16301";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	/**
	 * 16302    单位纠正
	 * @return
	 */
	public String danwjz(@Param("list") ArrayList<Daohtzd> list){
		String transcode = "16302";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 164    EL删除查询页面
	 */
	public String ellscxym(){
		return "select";
	}
	/**
	 * 16401    EL删除查询
	 * @return
	 */
	public String ellscx(){
		String transcode = "16401";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 165 按订货单收货页面
	 */
	public String  dhdshym(){
		return "select";
	}
	/**
	 * 165 按订货单收货查询
	 */
	public String  dhdshcx(){
		String transcode = "16501";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	/**
	 * 165校验UA型号与UC型号是否在参考系中存在
	 * 
	 * 
	 */
	 public  String  checkbaozxh(){
		  Map map=this.getParams();
		  String str1="0001";
		  String str2="0001";
			CommonEntity commonEntity = new CommonEntity();
            if(null != map.get("ucxh") && !"".equals(map.get("ucxh"))){
            	Map map1=new HashMap();
            	map1.put("xinbzxh", map.get("ucxh"));
            	str1=cs.checkbzxh(map1);
            	
            }
            if(null !=map.get("bzxh") && !"".equals(map.get("bzxh"))){
            	Map map2=new HashMap();
            	map2.put("xinbzxh", map.get("bzxh"));
            	str2=cs.checkbzxh(map2);
            }
            if(!"".equals(str1)){
              if(str1.equals("0001") && str2.equals("0001")){
            	  commonEntity.setResponse("0001");
              }else{
            	  commonEntity.setResponse("C_UAUCBF");
              }
            }else{
            	if(str2.equals("0001")){
            		commonEntity.setResponse("0001");
            	}else{
            		commonEntity.setResponse("C_UAUCBF");
            	}
            	
            }
			JSONObject obj = JSONObject.fromObject(commonEntity);
			setResult("result", obj);
			return AJAX;
		  
	  }
	/**
	 * 165 按订货单收货申报
	 */
	public String  dhdshsb(){
		String transcode = "16502";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * R1验收单删除页面
	 */
	public String r1ysdscym(){
		return "select";
	}
	/**
	 * 验收单删除
	 */
	public String  r1ysdsc(){
		String transcode = "16601";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * R1EL验收单删除
	 */
	public String  r1elysdsc(){
		String transcode = "16602";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 167预处理故障数据删除页面
	 */
	public String yclgzsjscym(){
		return "select";
	}
	/**
	 * 16701预处理故障数据查询
	 */
	public String  yclgzsjcx(){
		String transcode = "16701";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 167预处理故障数据删除
	 */
	public String  yclgzsjsc(@Param("list") ArrayList<Tongbysdmx> list){
		String transcode = "16702";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 168在建要货令查询页面
	 */
	public String ztyhlcxym(){
		return "select";
	}
	/**
	 * 16801在途要货令查询
	 */
	public String  ztyhlcx(){
		String transcode = "16801";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 169补打UA卡
	 */
	public String buduakym(){
		return "select";
	}
	/**
	 * 16901补打UA卡查询
	 */
	public String  buduakcx(){
		String transcode = "16901";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 16902补打UA卡打印
	 */
	public String  buduakdy(@Param("list") ArrayList<Daohxxlrxg> list){
		String transcode = "16902";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	
	/**
	 * 16402打印
	 * 0010438
	 */
	public String  ellscxdy(@Param("list") ArrayList<Daohxxlrxg> list){
		String transcode = "16402";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	
	/**
	 * 17701	进入卷料到货验收   V4_022
	 * @return
	 * String
	 */
	public String juanldhys(){
		return "select";
	}
	/**
	 * 17702	进入卷料到货验收   V4_022
	 * @return
	 * String
	 */
	public String juanldhys1(){
		JSONObject obj = JSONObject.fromObject(this.getParam("putvalue"));
		setRequestAttribute("result", obj);
		return "select";
	}
	/**
	 * 17703	进入卷料到货验收   V4_022
	 * @return
	 * String
	 */
	public String juanldhys2(){
		JSONObject obj = JSONObject.fromObject(this.getParam("putvalue"));
		setRequestAttribute("result", obj);
		return "select";
	}
	/**
	 * 17704	进入卷料到货验收   V4_022
	 * @return
	 * String
	 */
	public String juanldhys3(){
		JSONObject obj = JSONObject.fromObject(this.getParam("putvalue"));
		setRequestAttribute("result", obj);
		return "select";
	}	
	/**
	 * 17701	进入卷料到货验收   V4_022
	 * @return
	 * String
	 */
	public String juanldhys4(){
		String transcode = "17701";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;		
	}	
	
	
	/**
	 * 179	进入卷料属性来录入查询   V4_022
	 * @return
	 * String
	 */
	public String juanlsxjr(){
		return "select";
	}
	/**
	 * 17901	卷料属性来录入查询   V4_022
	 * @return
	 * String
	 */
	public String juanlsxcx(){
		String transcode = "17901";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;	
	}
	
	/**
	 * 17902	卷料属性来录入  V4_022
	 * @return
	 * String
	 */
	public String juanlsxlr(){
		String transcode = "17902";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;	
	}
	
	/**
	 * 180	进入卷料卷料库存查询   V4_022
	 * @return
	 * String
	 */
	public String juanlkcjr(){
		return "select";
	}
	
	/**
	 * 18001	进入卷料卷料库存查询   V4_022
	 * @return
	 * String
	 */
	public String juanlkccx(){
		String transcode = "18001";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;	
	}
}

