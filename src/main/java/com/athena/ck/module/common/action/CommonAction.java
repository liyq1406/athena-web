package com.athena.ck.module.common.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;

import com.athena.authority.entity.LoginUser;
import com.athena.authority.entity.MenuDirectory;
import com.athena.authority.util.AuthorityUtils;
import com.athena.ck.entity.beihuo.Beihdtbyhl;
import com.athena.ck.entity.beihuo.Kuccx;
import com.athena.ck.entity.common.ChildWareHouse;
import com.athena.ck.entity.common.CommonEntity;
import com.athena.ck.entity.common.LIUSB;
import com.athena.ck.entity.common.Peislb;
import com.athena.ck.entity.common.Rongqc;
import com.athena.ck.entity.common.UserCenter;
import com.athena.ck.entity.common.WareHouse;
import com.athena.ck.entity.common.Wuld;
import com.athena.ck.entity.common.Xiehzt;
import com.athena.ck.entity.common.Xitcsdy;
import com.athena.ck.entity.common.Zhijz;
import com.athena.ck.entity.shouhuo.Lingjgys;
import com.athena.ck.entity.shouhuo.Shengcx;
import com.athena.ck.entity.yichang.Yic;
import com.athena.ck.module.common.service.CommonService;
import com.athena.ck.module.shouhuo.service.TongbshService;
import com.athena.ck.module.yaohl.action.YaohlsAction;
import com.athena.component.wtc.action.BaseWtcAction;
import com.toft.core3.container.annotation.Component;
import com.toft.core3.container.annotation.Inject;
import com.toft.core3.container.core.ComponentDefinition;

@Component(scope = ComponentDefinition.SCOPE_PROTOTYPE)
public class CommonAction extends BaseWtcAction {
	@Inject
	private CommonService commonService;
	@Inject
	private TongbshService tongbshService;
	
	protected static Logger logger = Logger.getLogger(YaohlsAction.class);	//定义日志方法 
	
	/**
	 * 页面菜单内容
	 * 
	 * @return
	 */
	public String menuHtmlBuilder() {
		// 获取用户信息
		int pageNum = Integer.parseInt(this.getParam("pageNum").trim());
		LoginUser loginUser = AuthorityUtils.getSecurityUser();
		String[] menuHtmls = (String[]) loginUser.getParams().get("menuHtmls");
		if (menuHtmls.length >= pageNum) {
			setResult("result", menuHtmls[pageNum - 1]);
		} else {
			setResult("result", menuHtmls.length);
		}
		return AJAX;
	}
	
	/**
	 * 获取指定pageId对应的链接地址
	 * 
	 * @return
	 */
	public String pageJump() {
		// 获取用户信息
		String pageId = this.getParam("pageId").trim();
		String cankbh = this.getParam("cangkbh").trim();
		String rongqcbh = this.getParam("rongqcbh").trim();
		LoginUser loginUser = AuthorityUtils.getSecurityUser();
		// 菜单权限
		MenuDirectory menuDirectory = new MenuDirectory();
		List<MenuDirectory> userMenus = (List<MenuDirectory>) loginUser
				.getParams().get("userMenus");
		for (MenuDirectory menu : userMenus) {
			if (menu.getDirCode().equals(pageId)) {
				menuDirectory = menu;
				break;
			}
		}
		// 仓库权限
		WareHouse wareHouse = new WareHouse();
		List<WareHouse> ckList = (List<WareHouse>) loginUser.getParams().get(
				"ckList");
		for (WareHouse item : ckList) {
			if (item.getCangkbh().equals(cankbh)) {
				wareHouse = item;
				break;
			}
		}
		// 容器场权限
		Rongqc rongqc = new Rongqc();
		List<Rongqc> rqcList = (List<Rongqc>) loginUser.getParams().get(
				"rqcList");
		for (Rongqc item : rqcList) {
			if (item.getRongqcbh().equals(rongqcbh)) {
				rongqc = item;
				break;
			}
		}
		// 拼装返回
		String strMenu = "dirCode:'" + menuDirectory.getDirCode()
				+ "',dirPath:'" + menuDirectory.getDirPath() + "'";
		String strWareHouse = "cangkbh:'" + wareHouse.getCangkbh()
				+ "',cangklx:'" + wareHouse.getCangklx() + "'";
		String strRongqc = "rongqcbh:'" + rongqc.getRongqcbh() + "',shiffk:'"
				+ rongqc.getShiffk() + "'";
		// 拼装数据
		CommonEntity commonEntity = new CommonEntity();
		commonEntity.setParameter("{" + strMenu + "," + strWareHouse + ","
				+ strRongqc + "}");
		if (menuDirectory.getDirCode() == null) {
			commonEntity.setResponse("C_NoPurview");
		} else {
			commonEntity.setResponse("0000");
			if ("101".equals(pageId) || "102".equals(pageId)) {
				Map map = new HashMap();
				map.put("caozzt", pageId);
				map.put("cangkbh", cankbh);
				Map wtcMap = this.callWtc("10103", map);
				commonEntity.setResponse(wtcMap.get("response") == null ? ""
						: wtcMap.get("response").toString());
				// 需要注意，respdesc中可能没有值，则wtcMap.get("respdesc")取值为null，tostring会出现空指针异常
				// 2012-11-21
				commonEntity.setRespdesc(wtcMap.get("respdesc") == null ? ""
						: wtcMap.get("respdesc").toString());
			}
		}
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;
	}

	/**
	 * 用户中心
	 * 
	 * @return
	 */
	public String userCenter() {
		List<UserCenter> userCenterList = commonService.selectUserCenter();
		// 按指定的格式取数据
		ArrayList aList = new ArrayList();
		for (int i = 0; i < userCenterList.size(); i++) {
			UserCenter userCenter = userCenterList.get(i);
			aList.add("{name:\"" + userCenter.getCentername() + "\",value:\""
					+ userCenter.getUsercenter() + "\"}");
		}
		// 拼Json串
		String sJson = JSONArray.fromObject(aList).toString();
		CommonEntity commonEntity = new CommonEntity();
		commonEntity.setParameter("{list:" + sJson + "}");
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;
	}

	/**
	 * 仓库
	 * 
	 * @return
	 */
	public String wareHouse() {
		// 获取session数据
		LoginUser loginUser = AuthorityUtils.getSecurityUser();
		List<WareHouse> ckList = (List<WareHouse>) loginUser.getParams().get(
				"ckList");
		// 按指定的格式取数据
		ArrayList aList = new ArrayList();
		for (int i = 0; i < ckList.size(); i++) {
			WareHouse wareHouse = ckList.get(i);
			aList.add("{name:\"" + wareHouse.getCangkbh() + "\",value:\""
					+ wareHouse.getCangkbh() + "\"}");
		}
		// 拼Json串
		String sJson = JSONArray.fromObject(aList).toString();
		CommonEntity commonEntity = new CommonEntity();
		commonEntity.setParameter("{list:" + sJson + "}");
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;
	}
	
	/**
	 * 子仓库
	 * 
	 * @return
	 */
	public String childWareHouse() {
		LoginUser loginUser = AuthorityUtils.getSecurityUser();
		//获取数据
		ChildWareHouse bean = new ChildWareHouse();
		bean.setUsercenter(loginUser.getUsercenter());
		bean.setCangkbh(this.getParam("cangkbh"));
		List<ChildWareHouse> list = commonService.selectChildWareHouse(bean);
		// 按指定的格式取数据
		ArrayList aList = new ArrayList();
		for (int i = 0; i < list.size(); i++) {
			ChildWareHouse childWareHouse = list.get(i);
			aList.add("{name:\"" + childWareHouse.getZickbh() + "\",value:\""
					+ childWareHouse.getZickbh() + "\"}");
		}
		// 拼Json串
		String sJson = JSONArray.fromObject(aList).toString();
		CommonEntity commonEntity = new CommonEntity();
		commonEntity.setParameter("{list:" + sJson + "}");
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;
	}

	/**
	 * 容器场
	 * 
	 * @return
	 */
	public String rongqc() {
		// 获取session数据
		LoginUser loginUser = AuthorityUtils.getSecurityUser();
		List<Rongqc> rqcList = (List<Rongqc>) loginUser.getParams().get(
				"rqcList");
		// 按指定的格式取数据
		ArrayList aList = new ArrayList();
		for (int i = 0; i < rqcList.size(); i++) {
			Rongqc rongqc = rqcList.get(i);
			aList.add("{name:\"" + rongqc.getRongqcbh() + "\",value:\""
					+ rongqc.getRongqcbh() + "\"}");
		}
		// 拼Json串
		String sJson = JSONArray.fromObject(aList).toString();
		CommonEntity commonEntity = new CommonEntity();
		commonEntity.setParameter("{list:" + sJson + "}");
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;
	}
	
	/*
	 * 获取流水表数据
	 */
	public String getLiusb(){
		LIUSB bean = new LIUSB();
		bean.setCaozm(this.getParam("caozm"));
		bean.setLingjbh(this.getParam("lingjbh"));
		bean.setUsercenter(this.getParam("usercenter"));
		//查询数据
		List<LIUSB> list = commonService.selectLiusb(bean);
		setResult("result", JSONObject.fromObject(list));
		return AJAX;
	}
	
	/**
	 * 容器场
	 * 
	 * @return
	 */
	public String getrongqc() {
		//temp 用于判定是哪个页面调用 temp=1 是636页面取值 temp=2 是603页面取值
		String temp = this.getParam("temp");
		// 获取session数据
		LoginUser loginUser = AuthorityUtils.getSecurityUser();
		@SuppressWarnings("unchecked")
		List<Rongqc> rqcList = (List<Rongqc>) loginUser.getParams().get(
				"rqcList");
		//获取记账区编号
		Map<String, String>  map = new HashMap<String,String>();
		String rqcbh=this.getParam("rongqcbh");
		map.put("rongqcbh",rqcbh);
		List<Rongqc> jzqbhList= commonService.selectjzqbh(map);	
		// 按指定的格式取数据
		ArrayList<String> aList = new ArrayList<String>();
		if(temp.equals("1")){
			for (int i = 0; i < rqcList.size(); i++) {
				Rongqc rongqc = rqcList.get(i);			
				if((rongqc.getJizqbh()== null ? ""
		        	:rongqc.getJizqbh() ).equals(jzqbhList.get(0).getJizqbh())){
						//判断过滤掉本身的容器厂编号
						if(!rqcbh.equals(rongqc.getRongqcbh())){
							aList.add("{name:\"" + rongqc.getRongqcbh() + "\",value:\""
									+ rongqc.getRongqcbh() + "\"}");
						}
					}					
			}
		}
          if(temp.equals("2")){	
        	  for(int i=0;i<rqcList.size();i++){
        		Rongqc rongqc=rqcList.get(i);  
				if("F".equals(rongqc.getShiffk()) && (rongqc.getJizqbh()== null ? ""
						:rongqc.getJizqbh() ).equals(jzqbhList.get(0).getJizqbh())){
					aList.add("{name:\"" + rongqc.getRongqcbh() + "\",value:\""
							+ rongqc.getRongqcbh() + "\"}");
				}
        	  }
		}
		
		// 拼Json串
		String sJson = JSONArray.fromObject(aList).toString();
		CommonEntity commonEntity = new CommonEntity();
		commonEntity.setParameter("{list:" + sJson + "}");
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;
	}
	
	/**
	 * 调入容器区 page 614
	 * 
	 * @return
	 */
	public String diaorurqq614() {
		//Map<String,String>  map = new HashMap<String,String>();
		// 获取session数据
		LoginUser loginUser = AuthorityUtils.getSecurityUser();
		Map  map =this.getParams();
		map.put("usercenter",loginUser.getUsercenter());
		List<Rongqc> rqcList =  commonService.selectDiaoRurqq614(map);
		// 按指定的格式取数据
		ArrayList<String> aList = new ArrayList<String>();
		for (int i = 0; i < rqcList.size(); i++) {
			Rongqc rongqc = rqcList.get(i);
			aList.add("{name:\"" + rongqc.getRongqcbh() + "\",value:\""
					+ rongqc.getRongqcbh() + "\"}");
		}
		// 拼Json串
		String sJson = JSONArray.fromObject(aList).toString();
		CommonEntity commonEntity = new CommonEntity();
		commonEntity.setParameter("{list:" + sJson + "}");
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;
	}
	
	/**
	 * 容器盘点维护  page 624
	 * 
	 * @return
	 */
	public String flagJudge624() {
		// 获取session数据
		LoginUser loginUser = AuthorityUtils.getSecurityUser();
		String rongqcbh = this.getParam("rongqqbh");
		Map  map = new HashMap();
		map.put("usercenter",loginUser.getUsercenter());
		map.put("rongqcbh",rongqcbh);
		List<Rongqc> rqcList =  commonService.flagJudge624(map);
		// 1 表示通过查询条件可以获取数据 0 表示没有获取数据 
		ArrayList list = new ArrayList();
		if(rqcList.size()==0){
			list.add("{name:\"judge\",value:\"0\"}");
		}else{
			list.add("{name:\"judge\",value:\"1\"}");
		}

		// 拼Json串
		String sJson = JSONArray.fromObject(list).toString();
		CommonEntity commonEntity = new CommonEntity();
		commonEntity.setParameter(sJson);
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;
	}
	
	/**
	 *  调出容器区
	 * 
	 * @return
	 */
	public String rongqc2() {
		List<Rongqc> rqcList =  commonService.selectDiaoChurqq();
		// 按指定的格式取数据
		ArrayList<String> aList = new ArrayList<String>();
		for (int i = 0; i < rqcList.size(); i++) {
			Rongqc rongqc = rqcList.get(i);
			aList.add("{name:\"" + rongqc.getRongqcbh() + "\",value:\""
					+ rongqc.getRongqcbh() + "\"}");
		}
		// 拼Json串
		String sJson = JSONArray.fromObject(aList).toString();
		CommonEntity commonEntity = new CommonEntity();
		commonEntity.setParameter("{list:" + sJson + "}");
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;
	}
	
	/**
	 *  调出容器区 page 614
	 * 
	 * @return
	 */
	public String diaochurqq614() {
		List<Rongqc> rqcList =  commonService.selectDiaoChurqq614();
		// 按指定的格式取数据
		ArrayList<String> aList = new ArrayList<String>();
		for (int i = 0; i < rqcList.size(); i++) {
			Rongqc rongqc = rqcList.get(i);
			aList.add("{name:\"" + rongqc.getRongqcbh() + "\",value:\""
					+ rongqc.getRongqcbh() + "\"}");
		}
		// 拼Json串
		String sJson = JSONArray.fromObject(aList).toString();
		CommonEntity commonEntity = new CommonEntity();
		commonEntity.setParameter("{list:" + sJson + "}");
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;
	}
	
	/**
	 * 调入容器区
	 * 
	 * @return
	 */
	public String diaorurqq611() {
		// 获取session数据
		LoginUser loginUser = AuthorityUtils.getSecurityUser();
		Map  map = new HashMap();
		String rongqcbh = this.getParam("rongqcbh");
		map.put("usercenter",loginUser.getUsercenter());
		map.put("rongqcbh", rongqcbh);
		List<Rongqc> rqcList =  commonService.selectDiaoRurqq611(map);
		// 按指定的格式取数据
		ArrayList aList = new ArrayList();
		for (int i = 0; i < rqcList.size(); i++) {
			Rongqc rongqc = rqcList.get(i);
			aList.add("{name:\"" + rongqc.getRongqcbh() + "\",value:\""
					+ rongqc.getRongqcbh() + "\"}");
		}
		// 拼Json串
		String sJson = JSONArray.fromObject(aList).toString();
		CommonEntity commonEntity = new CommonEntity();
		commonEntity.setParameter("{list:" + sJson + "}");
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;
	}
	
	/**
	 * 根据盘点类型确定容器区的值 633
	 * 
	 * @return
	 */
	public String showRongqc633() {
//		// 获取session数据
//		LoginUser loginUser = AuthorityUtils.getSecurityUser();
//		Map  map = new HashMap();
//		String temp = this.getParam("temp");
//		map.put("usercenter",loginUser.getUsercenter());
//		map.put("temp", temp);
//		List<Rongqc> rqcList =  commonService.showRongqq633(map);
//		// 按指定的格式取数据
//		ArrayList aList = new ArrayList();
//		for (int i = 0; i < rqcList.size(); i++) {
//			Rongqc rongqc = rqcList.get(i);
//			aList.add("{name:\"" + rongqc.getRongqcbh() + "\",value:\""
//					+ rongqc.getRongqcbh() + "\"}");
//		}
//		// 拼Json串
//		String sJson = JSONArray.fromObject(aList).toString();
//		CommonEntity commonEntity = new CommonEntity();
//		commonEntity.setParameter("{list:" + sJson + "}");
//		JSONObject obj = JSONObject.fromObject(commonEntity);
//		setResult("result", obj);
//		return AJAX;
		//temp 用于判定是哪个页面调用 temp=1 是636页面取值 temp=2 是603页面取值
		String temp = this.getParam("temp");
		// 获取session数据
		LoginUser loginUser = AuthorityUtils.getSecurityUser();
		@SuppressWarnings("unchecked")
		List<Rongqc> rqcList = (List<Rongqc>) loginUser.getParams().get(
				"rqcList");
		@SuppressWarnings("unchecked")
		List<Rongqc> rqcList_J = (List<Rongqc>) loginUser.getParams().get(
		"rqcList_J");
		// 按指定的格式取数据
		ArrayList<String> aList = new ArrayList<String>();
		if(temp.equals("1")){
			for (int i = 0; i < rqcList_J.size(); i++) {
				Rongqc rongqc = rqcList_J.get(i);
				aList.add("{name:\"" + rongqc.getRongqcbh() + "\",value:\""
						+ rongqc.getRongqcbh() + "\"}");
			}
		}
		if(temp.equals("2")){
			for (int i = 0; i < rqcList.size(); i++) {
				Rongqc rongqc = rqcList.get(i);
				aList.add("{name:\"" + rongqc.getRongqcbh() + "\",value:\""
						+ rongqc.getRongqcbh() + "\"}");
			}
		}
		// 拼Json串
		String sJson = JSONArray.fromObject(aList).toString();
		CommonEntity commonEntity = new CommonEntity();
		commonEntity.setParameter("{list:" + sJson + "}");
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;
	}
	
	/**
	 * 返空区
	 * 
	 * @return
	 */
	public String fankongq() {
		// 获取session数据
		LoginUser loginUser = AuthorityUtils.getSecurityUser();
		Map  map = new HashMap();
		map.put("usercenter",loginUser.getUsercenter());
		List<Rongqc> rqcList =  commonService.selectFankongq(map);

		// 按指定的格式取数据
		ArrayList aList = new ArrayList();
		for (int i = 0; i < rqcList.size(); i++) {
			Rongqc rongqc = rqcList.get(i);
			aList.add("{name:\"" + rongqc.getRongqcbh() + "\",value:\""
					+ rongqc.getRongqcbh() + "\"}");
		}
		// 拼Json串
		String sJson = JSONArray.fromObject(aList).toString();
		CommonEntity commonEntity = new CommonEntity();
		commonEntity.setParameter("{list:" + sJson + "}");
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;
	}
	
	/**
	 * 返空区603
	 * 
	 * @return
	 */
	public String fankongq603() {
		// 获取session数据
		LoginUser loginUser = AuthorityUtils.getSecurityUser();
		Map map = this.getParams();
		map.put("usercenter",loginUser.getUsercenter());
		List<Rongqc> rqcList =  commonService.selectFankongq603(map);

		// 按指定的格式取数据
		ArrayList aList = new ArrayList();
		for (int i = 0; i < rqcList.size(); i++) {
			Rongqc rongqc = rqcList.get(i);
			aList.add("{name:\"" + rongqc.getRongqcbh() + "\",value:\""
					+ rongqc.getRongqcbh() + "\"}");
		}
		// 拼Json串
		String sJson = JSONArray.fromObject(aList).toString();
		CommonEntity commonEntity = new CommonEntity();
		commonEntity.setParameter("{list:" + sJson + "}");
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;
	}
	
	/**
	 * 根据返空区的值判断是否显示供应商承运商
	 * 
	 * @return
	 */
	public String judgeFlag() {
		// 获取session数据
		LoginUser loginUser = AuthorityUtils.getSecurityUser();
		String rongqcbh = this.getParam("rongqcbh");
		Map  map = new HashMap();
		map.put("usercenter",loginUser.getUsercenter());
		List<Rongqc> rqcList =  commonService.selectFankongq(map);

		// 按指定的格式取数据
		ArrayList aList = new ArrayList();
		for (int i = 0; i < rqcList.size(); i++) {
			Rongqc rongqc = rqcList.get(i);
			aList.add("{name:\"" + rongqc.getRongqcbh() + "\",value:\""
					+ rongqc.getRongqcbh() + "\"}");
		}
		// 拼Json串
		String sJson = JSONArray.fromObject(aList).toString();
		CommonEntity commonEntity = new CommonEntity();
		commonEntity.setParameter("{list:" + sJson + "}");
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;
	}
	
	/**
	 * 质检组
	 * 
	 * @return
	 */
	public String zhijz() {
		// 获取session数据
		LoginUser loginUser = AuthorityUtils.getSecurityUser();
		List<Zhijz> zjzList = (List<Zhijz>) loginUser.getParams().get(
				"zjzList");
		// 按指定的格式取数据
		ArrayList aList = new ArrayList();
		for (int i = 0; i < zjzList.size(); i++) {
			Zhijz zhijz = zjzList.get(i);
			if(null != zhijz.getZhijzbh()){
				aList.add("{name:\"" + zhijz.getZhijzbh() + "\",value:\""
						+ zhijz.getZhijzbh() + "\"}");
			 }
		}
		// 拼Json串
		String sJson = JSONArray.fromObject(aList).toString();
		CommonEntity commonEntity = new CommonEntity();
		commonEntity.setParameter("{list:" + sJson + "}");
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;
	}
	/**
	 * 退库类别
	 * 
	 * @return
	 */
	public String tuiklb() {
		ArrayList list = new ArrayList();
		list.add("{name:\"C_TUIKLB1\",value:\"1\"}");
		list.add("{name:\"C_TUIKLB2\",value:\"2\"}");
		// 拼Json串
		String sJson = JSONArray.fromObject(list).toString();
		CommonEntity commonEntity = new CommonEntity();
		commonEntity.setParameter("{list:" + sJson + "}");
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;
	}
	/**
	 * 退库类别
	 * 
	 * @return
	 */
	public String danjpdlx() {
		ArrayList list = new ArrayList();
		list.add("{name:\"C_20121201\",value:\"2\"}");
		list.add("{name:\"C_20121202\",value:\"1\"}");
		// 拼Json串
		String sJson = JSONArray.fromObject(list).toString();
		CommonEntity commonEntity = new CommonEntity();
		commonEntity.setParameter("{list:" + sJson + "}");
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;
	}
	
	/**
	 * 操作码类型
	 * 
	 * @return
	 */
	public String caozuomalx() {
		ArrayList list = new ArrayList();
		list.add("{name:\"C_R01\",value:\"R01\"}");
		list.add("{name:\"C_R01S\",value:\"R01S\"}");
		list.add("{name:\"C_R03\",value:\"R03\"}");
		list.add("{name:\"C_R08\",value:\"R08\"}");
		list.add("{name:\"C_R08S\",value:\"R08S\"}");
		list.add("{name:\"C_R10\",value:\"R10\"}");
		list.add("{name:\"C_R18\",value:\"R18\"}");
		list.add("{name:\"C_R18S\",value:\"R18S\"}");
		list.add("{name:\"C_R35\",value:\"R35\"}");
		list.add("{name:\"C_R36\",value:\"R36\"}");
		list.add("{name:\"C_R37\",value:\"R37\"}");
		list.add("{name:\"C_R38\",value:\"R38\"}");
		list.add("{name:\"C_R39\",value:\"R39\"}");
		list.add("{name:\"C_R53\",value:\"R53\"}");
		list.add("{name:\"C_R53S\",value:\"R53S\"}");
		list.add("{name:\"C_R70\",value:\"R70\"}");
		list.add("{name:\"C_R71\",value:\"R71\"}");
		list.add("{name:\"C_R72\",value:\"R72\"}");
		list.add("{name:\"C_R79\",value:\"R79\"}");
		list.add("{name:\"C_R81\",value:\"R81\"}");
		list.add("{name:\"C_R81S\",value:\"R81S\"}");
		list.add("{name:\"C_R82\",value:\"R82\"}");
		list.add("{name:\"C_R82S\",value:\"R82S\"}");
		list.add("{name:\"C_R83\",value:\"R83\"}");
		list.add("{name:\"C_R83S\",value:\"R83S\"}");
		list.add("{name:\"C_R84\",value:\"R84\"}");
		list.add("{name:\"C_R84S\",value:\"R84S\"}");
		list.add("{name:\"C_R85\",value:\"R85\"}");
		list.add("{name:\"C_R85S\",value:\"R85S\"}");
		list.add("{name:\"C_R86\",value:\"R86\"}");	
		list.add("{name:\"C_R86S\",value:\"R86S\"}");
		list.add("{name:\"C_R87\",value:\"R87\"}");
		list.add("{name:\"C_R87S\",value:\"R87S\"}");
		list.add("{name:\"C_R88\",value:\"R88\"}");
		list.add("{name:\"C_R88S\",value:\"R88S\"}");
		list.add("{name:\"C_R89\",value:\"R89\"}");
		list.add("{name:\"C_R89S\",value:\"R89S\"}");
		list.add("{name:\"C_R90\",value:\"R90\"}");
		list.add("{name:\"C_R90S\",value:\"R90S\"}");
		list.add("{name:\"C_R91\",value:\"R91\"}");
		list.add("{name:\"C_R91S\",value:\"R91S\"}");	
		list.add("{name:\"C_R92\",value:\"R92\"}");
		list.add("{name:\"C_R92S\",value:\"R92S\"}");			
		// 拼Json串
		String sJson = JSONArray.fromObject(list).toString();
		CommonEntity commonEntity = new CommonEntity();
		commonEntity.setParameter("{list:" + sJson + "}");
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;
	}
	
	/**
	 * 零件类型
	 * 
	 * @return
	 */
	public String lingjlx() {
		return getDdlDataByZidlx("LJLX");
	}

	/**
	 * 是或否
	 * 
	 * @return
	 */
	public String yesOrNo() {
		ArrayList list = new ArrayList();
		list.add("{name:\"Y\",value:\"1\"}");
		list.add("{name:\"N\",value:\"0\"}");
		// 拼Json串
		String sJson = JSONArray.fromObject(list).toString();
		CommonEntity commonEntity = new CommonEntity();
		commonEntity.setParameter("{list:" + sJson + "}");
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;
	}
	
	/**
	 * 异常类型
	 * @author 贺志国
	 * @date 2014-9-24
	 * @param C4_YCLX_2料废 ,C4_YCLX_12 料废/随废
	 * @return String 
	 */
	public String yiclxStr() {
		ArrayList list = new ArrayList();
		list.add("{name:\"C4_YCLX_2\",value:\"0\"}");
		//list.add("{name:\"C4_YCLX_12\",value:\"1\"}");
		// 拼Json串
		String sJson = JSONArray.fromObject(list).toString();
		CommonEntity commonEntity = new CommonEntity();
		commonEntity.setParameter("{list:" + sJson + "}");
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;
	}
	

	/**
	 * 生成状态
	 * 
	 * @return
	 */
	public String shengczt() {
		ArrayList list = new ArrayList();
		list.add("{name:\"C2_PDMXZT1\",value:\"1\"}");
		list.add("{name:\"C2_PDMXZT2\",value:\"2\"}");
		// 拼Json串
		String sJson = JSONArray.fromObject(list).toString();
		CommonEntity commonEntity = new CommonEntity();
		commonEntity.setParameter("{list:" + sJson + "}");
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;
	}

	/**
	 * 包装状态
	 * 
	 * @return
	 */
	public String baozzt() {
		ArrayList list = new ArrayList();
		//list.add("{name:\"C_USZT2\",value:\"2\"}");
		list.add("{name:\"C_USZT3\",value:\"3\"}");
		list.add("{name:\"C_USZT5\",value:\"5\"}");
		list.add("{name:\"C_USZT13\",value:\"13\"}");
		list.add("{name:\"C_USZT4\",value:\"4\"}");
		list.add("{name:\"C_USZT14\",value:\"14\"}");
		list.add("{name:\"C_USZT10\",value:\"10\"}");
		list.add("{name:\"C_USZT6\",value:\"6\"}");
		list.add("{name:\"C_USZT9\",value:\"9\"}");
		list.add("{name:\"C_USZT8\",value:\"8\"}");
		list.add("{name:\"C_USZT11\",value:\"11\"}");
		list.add("{name:\"C_USZT12\",value:\"12\"}");
		
		
		// 拼Json串
		String sJson = JSONArray.fromObject(list).toString();
		CommonEntity commonEntity = new CommonEntity();
		commonEntity.setParameter("{list:" + sJson + "}");
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;
	}

	/**
	 * 排序方式
	 * 
	 * @return
	 */
	public String paixfs() {
		ArrayList list = new ArrayList();
		list.add("{name:\"C1_LINGJBH\",value:\"lingjbh\"}");
		list.add("{name:\"C1_YAOHLH\",value:\"yaohlh\"}");
		list.add("{name:\"C1_PEISLB\",value:\"peislb\"}");
		list.add("{name:\"C1_ZHENGCLSH\",value:\"zhengclsh\"}");
		// 拼Json串
		String sJson = JSONArray.fromObject(list).toString();
		CommonEntity commonEntity = new CommonEntity();
		commonEntity.setParameter("{list:" + sJson + "}");
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;
	}

	/**
	 * 拒收原因
	 */
	public String jusyy() {
		return getDdlDataByZidlx("JSYY");
	}
	
	/**
	 * 纠纷原因
	 */
	public String jiufyy() {
		return getDdlDataByZidlx("JFYY");
	}

	
	/**
	 * 故障类型
	 * 
	 * @return
	 */
	public String guzlx() {
		return getDdlDataByZidlx("GZLX");
	}

	/**
	 * 状态
	 * 
	 * @return
	 */
	public String zhuangt() {
		ArrayList list = new ArrayList();
		list.add("{name:\"Y\",value:\"1\"}");
		list.add("{name:\"N\",value:\"0\"}");
		// 拼Json串
		String sJson = JSONArray.fromObject(list).toString();
		CommonEntity commonEntity = new CommonEntity();
		commonEntity.setParameter("{list:" + sJson + "}");
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;
	}

	/**
	 * 上线方式(KI、KP、RI、RP、SAS、PC、GV)
	 */
	public String shangxfs() {
		ArrayList list = new ArrayList();
		list.add("{name:\"KI\",value:\"KI\"}");
		list.add("{name:\"KP\",value:\"KP\"}");
		list.add("{name:\"RI\",value:\"RI\"}");
		list.add("{name:\"RP\",value:\"RP\"}");
		list.add("{name:\"SAS\",value:\"SAS\"}");
		list.add("{name:\"PC\",value:\"PC\"}");
		list.add("{name:\"GV\",value:\"GV\"}");
		// 拼Json串
		String sJson = JSONArray.fromObject(list).toString();
		CommonEntity commonEntity = new CommonEntity();
		commonEntity.setParameter("{list:" + sJson + "}");
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;
	}

	/**
	 * 内部供货模式
	 * 
	 * @return
	 */
	public String neibghms() {
		return getDdlDataByZidlx("NBMS");
	}

	/**
	 * 从字典表获取对应字典数据
	 * 
	 * @return
	 */
	private String getDdlDataByZidlx(String zidlx) {
		LoginUser loginUser = AuthorityUtils.getSecurityUser();
		Xitcsdy bean = new Xitcsdy();
		bean.setUsercenter(loginUser.getUsercenter());
		bean.setZidlx(zidlx);
		List<Xitcsdy> zdList = commonService.selectXitcsdy(bean);
		// 赋值
		ArrayList aList = new ArrayList();
		for (int i = 0; i < zdList.size(); i++) {
			Xitcsdy xitcsdy = zdList.get(i);
			aList.add("{name:\"" + xitcsdy.getZidmc() + "\",value:\""
					+ xitcsdy.getZidbm() + "\"}");
		}
		// 拼Json串
		String sJson = JSONArray.fromObject(aList).toString();
		CommonEntity commonEntity = new CommonEntity();
		commonEntity.setParameter("{list:" + sJson + "}");
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;
	}

	/**
	 * 查询配送类别
	 * 
	 * @return
	 */
	public String peislb() {
		List<Peislb> peislbList = commonService.selectPeislb();
		// 赋值
		ArrayList aList = new ArrayList();
		for (int i = 0; i < peislbList.size(); i++) {
			Peislb peislb = peislbList.get(i);
			if(peislb.getPeislx() !=null){
				if(peislb.getPeislxmc()!=null){
				aList.add("{name:\"" + peislb.getPeislxmc() +"-" + peislb.getPeislx()+ "\",value:\""
						+ peislb.getPeislx() + "\"}");
				}else{
					aList.add("{name:\"" + peislb.getPeislx() + "\",value:\""
							+ peislb.getPeislx() + "\"}");
				}
			}
		}
		// 拼Json串
		String sJson = JSONArray.fromObject(aList).toString();
		CommonEntity commonEntity = new CommonEntity();
		commonEntity.setParameter("{list:" + sJson + "}");
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;
	}

	/**
	 * 
	 */
	public String juszt() {
		ArrayList list = new ArrayList();
		list.add("{name:\"C1_JUSDZT1\",value:\"1\"}");
		list.add("{name:\"C1_JUSDZT2\",value:\"2\"}");
		list.add("{name:\"C1_JUSDZT3\",value:\"3\"}");
		// 拼Json串
		String sJson = JSONArray.fromObject(list).toString();
		CommonEntity commonEntity = new CommonEntity();
		commonEntity.setParameter("{list:" + sJson + "}");
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;
	}

	/**
	 * 打印状态
	 */
	public String dayzt() {
		ArrayList list = new ArrayList();
		list.add("{name:\"C_DAYZT0\",value:\"0\"}");
		list.add("{name:\"C_DAYZT1\",value:\"1\"}");
		// 拼Json串
		String sJson = JSONArray.fromObject(list).toString();
		CommonEntity commonEntity = new CommonEntity();
		commonEntity.setParameter("{list:" + sJson + "}");
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;
	}

	/**
	 * 备货单状态
	 */
	public String beihdzt() {
		ArrayList list = new ArrayList();
		list.add("{name:\"C_BEIHDZT0\",value:\"0\"}");
		list.add("{name:\"C_BEIHDZT1\",value:\"1\"}");
		list.add("{name:\"C_BEIHDZT2\",value:\"2\"}");
		list.add("{name:\"C_BEIHDZT3\",value:\"3\"}");
		list.add("{name:\"C_BEIHDZT4\",value:\"4\"}");
		// 拼Json串
		String sJson = JSONArray.fromObject(list).toString();
		CommonEntity commonEntity = new CommonEntity();
		commonEntity.setParameter("{list:" + sJson + "}");
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;
	}
	
	/**
	 * 容器入库返还 单据类型
	 * 
	 * @return
	 */
	public String danjuleix() {
		ArrayList list = new ArrayList();
		list.add("{name:\"C_000001\",value:\"2\"}");
		list.add("{name:\"C_000003\",value:\"3\"}");
		// 拼Json串
		String sJson = JSONArray.fromObject(list).toString();
		CommonEntity commonEntity = new CommonEntity();
		commonEntity.setParameter("{list:" + sJson + "}");
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;
	}
	
	/**
	 * 容器类型
	 * 
	 * @return
	 */
	public String rongqilx() {
		ArrayList list = new ArrayList();
		list.add("{name:\"C_063201\",value:\"1\"}");
		list.add("{name:\"C_063202\",value:\"2\"}");
		// 拼Json串
		String sJson = JSONArray.fromObject(list).toString();
		CommonEntity commonEntity = new CommonEntity();
		commonEntity.setParameter("{list:" + sJson + "}");
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;
	}

	/**
	 * 仓库间移库状态
	 */
	public String ckykzt() {
		ArrayList list = new ArrayList();
		list.add("{name:\"C_CKYKZT0\",value:\"0\"}");
		list.add("{name:\"C_CKYKZT1\",value:\"1\"}");
		list.add("{name:\"C_CKYKZT2\",value:\"2\"}");
		list.add("{name:\"C_CKYKZT3\",value:\"3\"}");
		// 拼Json串
		String sJson = JSONArray.fromObject(list).toString();
		CommonEntity commonEntity = new CommonEntity();
		commonEntity.setParameter("{list:" + sJson + "}");
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;
	}

	/**
	 * 卸货站台
	 */
	public String xiehzt() {
		Map map = this.getParams();
		LoginUser loginUser = AuthorityUtils.getSecurityUser();
		map.put("usercenter", loginUser.getUsercenter());
		List<Xiehzt> zdList  = commonService.selectXiehzt(map);
		// 赋值
		ArrayList aList = new ArrayList();
		for (int i = 0; i < zdList.size(); i++) {
			Xiehzt xiehzt = zdList.get(i);
			aList.add("{name:\"" + xiehzt.getXiehzt() + "\",value:\""
					+ xiehzt.getXiehzt() + "\"}");
		}
		// 拼Json串
		String sJson = JSONArray.fromObject(aList).toString();
		CommonEntity commonEntity = new CommonEntity();
		commonEntity.setParameter("{list:" + sJson + "}");
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;
	}

	/**
	 * 质检跟踪单状态
	 */
	public String zhijgzdzt() {
		ArrayList list = new ArrayList();
		list.add("{name:\"C_ZHIJZT_1\",value:\"1\"}");
		list.add("{name:\"C_ZHIJZT_2\",value:\"2\"}");
		list.add("{name:\"C_ZHIJZT_3\",value:\"3\"}");
		// 拼Json串
		String sJson = JSONArray.fromObject(list).toString();
		CommonEntity commonEntity = new CommonEntity();
		commonEntity.setParameter("{list:" + sJson + "}");
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;
	}

	/**
	 * 物理点
	 * 
	 * @return
	 */
	public String wulidian() {
		String leix=this.getParam("leix");
		Map map=new HashMap();
		if("A" .equals(leix)){
			map.put("leix", " and wuldlx = 'A'");
		}else if("E".equals(leix)){
			map.put("leix", " and wuldlx = 'E'");
		}else{
			map.put("leix", " and wuldlx in ( 'E','A')");
		}
		List<Wuld> wldList = commonService.selectWuld(map);
		// 赋值
		ArrayList aList = new ArrayList();
		for (int i = 0; i < wldList.size(); i++) {
			Wuld wuld = wldList.get(i);
			aList.add("{name:\"" + wuld.getWuldbh() + "\",value:\""
					+ wuld.getWuldbh() + "\"}");
		}
		// 拼Json串

		String sJson = JSONArray.fromObject(aList).toString();
		CommonEntity commonEntity = new CommonEntity();
		commonEntity.setParameter("{list:" + sJson + "}");
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;
	}

	/**
	 * 处理状态
	 * 
	 * @return
	 */
	public String chulzt() {
		ArrayList list = new ArrayList();
		list.add("{name:\"C_CLZTYCL\",value:\"1\"}");
		list.add("{name:\"C_CLZTWCL\",value:\"2\"}");
		list.add("{name:\"C_CLZTQX\",value:\"3\"}");
		// 拼Json串
		String sJson = JSONArray.fromObject(list).toString();
		CommonEntity commonEntity = new CommonEntity();
		commonEntity.setParameter("{list:" + sJson + "}");
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;
	}
	
	/**
	 * 容器报废申请单的状态
	 * 
	 * @return
	 */
	public String rongqbfsqdzt() {
		ArrayList list = new ArrayList();
		list.add("{name:\"C_BAOFZT1\",value:\"1\"}");
		list.add("{name:\"C_BAOFZT2\",value:\"2\"}");
		list.add("{name:\"C_BAOFZT4\",value:\"4\"}");
		// 拼Json串
		String sJson = JSONArray.fromObject(list).toString();
		CommonEntity commonEntity = new CommonEntity();
		commonEntity.setParameter("{list:" + sJson + "}");
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;
	}
	/**
	 * 责任主体
	 * 
	 * @return
	 */
	public String zerzt() {
		String flag = this.getParam("flag");
		ArrayList list = new ArrayList();
		if("0".equals(flag)){
			list.add("{name:\"C4_ZRZT_3\",value:\"3\"}");
			list.add("{name:\"C4_ZRZT_4\",value:\"4\"}");
			list.add("{name:\"C4_ZRZT_5\",value:\"5\"}");
		}else if("1".equals(flag)){
			list.add("{name:\"C4_ZRZT_1\",value:\"1\"}");
			list.add("{name:\"C4_ZRZT_2\",value:\"2\"}");
		}else{
			list.add("{name:\"C4_ZRZT_1\",value:\"1\"}");
			list.add("{name:\"C4_ZRZT_2\",value:\"2\"}");
			list.add("{name:\"C4_ZRZT_3\",value:\"3\"}");
			list.add("{name:\"C4_ZRZT_4\",value:\"4\"}");
			list.add("{name:\"C4_ZRZT_5\",value:\"5\"}");
		}
		// 拼Json串
		String sJson = JSONArray.fromObject(list).toString();
		CommonEntity commonEntity = new CommonEntity();
		commonEntity.setParameter("{list:" + sJson + "}");
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;
	}

	/**
	 * 单据类型
	 * 
	 * @return
	 */
	public String danjlx() {
		ArrayList list = new ArrayList();
		list.add("{name:\"C_DJLXBF\",value:\"2\"}");
		list.add("{name:\"C_DJLXWX\",value:\"4\"}");
		// 拼Json串
		String sJson = JSONArray.fromObject(list).toString();
		CommonEntity commonEntity = new CommonEntity();
		commonEntity.setParameter("{list:" + sJson + "}");
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;
	}
	/**
	 * 单据类型
	 * 
	 * @return String
	 */
	public String danjlxx() {
		ArrayList list = new ArrayList();
		list.add("{name:\"C_000002\",value:\"1\"}");
		list.add("{name:\"C_000001\",value:\"2\"}");
		list.add("{name:\"C_000003\",value:\"3\"}");
		// 拼Json串
		String sJson = JSONArray.fromObject(list).toString();
		CommonEntity commonEntity = new CommonEntity();
		commonEntity.setParameter("{list:" + sJson + "}");
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;
	}
	/**
	 * 异常类型
	 * 
	 * @return
	 */
	public String yichanglx() {
		ArrayList list = new ArrayList();
		list.add("{name:\"C_YCLXGF\",value:\"6\"}");
		list.add("{name:\"C_SUIF\",value:\"7\"}");
		list.add("{name:\"C_YCLXLF\",value:\"8\"}");
		// 拼Json串
		String sJson = JSONArray.fromObject(list).toString();
		CommonEntity commonEntity = new CommonEntity();
		commonEntity.setParameter("{list:" + sJson + "}");
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;
	}

	/**
	 * 调拨执行状态
	 * 2015-8-21 日张耀强确认，返修入库撤销下拉框取消
	 * @return
	 */
	public String diaobzxzt() {
		ArrayList list = new ArrayList();
		list.add("{name:\"C_DBZXZTWWC\",value:\"1\"}");
		list.add("{name:\"C_DBZXZTYWC\",value:\"2\"}");
		// 拼Json串
		String sJson = JSONArray.fromObject(list).toString();
		CommonEntity commonEntity = new CommonEntity();
		commonEntity.setParameter("{list:" + sJson + "}");
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;
	}
	
	/**
	 * 调拨类型
	 * 
	 * @return
	 */
	public String diaoblx() {
		ArrayList list = new ArrayList();
		list.add("{name:\"P614_201201\",value:\"1\"}");
		list.add("{name:\"P614_201202\",value:\"2\"}");
		// 拼Json串
		String sJson = JSONArray.fromObject(list).toString();
		CommonEntity commonEntity = new CommonEntity();
		commonEntity.setParameter("{list:" + sJson + "}");
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;
	}

	/**
	 * 质检类型
	 * 
	 * @return
	 */
	public String zhijlx() {
		ArrayList list = new ArrayList();
		list.add("{name:\"C4_ZJLX_1\",value:\"1\"}");
		list.add("{name:\"C4_ZJLX_2\",value:\"2\"}");
		list.add("{name:\"C4_ZJLX_3\",value:\"3\"}");
		// 拼Json串
		String sJson = JSONArray.fromObject(list).toString();
		CommonEntity commonEntity = new CommonEntity();
		commonEntity.setParameter("{list:" + sJson + "}");
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;
	}

	/**
	 * 接受返还类型
	 * 
	 * @return
	 */
	public String jiesfhlx() {
		ArrayList list = new ArrayList();
		list.add("{name:\"C_RQDJLX_1\",value:\"1\"}");
		list.add("{name:\"C_RQDJLX_2\",value:\"2\"}");
		list.add("{name:\"C_RQDJLX_3\",value:\"3\"}");
		list.add("{name:\"C_RQDJLX_4\",value:\"4\"}");
		list.add("{name:\"C_RQDJLX_5\",value:\"5\"}");
		list.add("{name:\"C_RQDJLX_6\",value:\"6\"}");
		// 拼Json串
		String sJson = JSONArray.fromObject(list).toString();
		CommonEntity commonEntity = new CommonEntity();
		commonEntity.setParameter("{list:" + sJson + "}");
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;
	}

	/**
	 * 该包装跟踪单查询（状态）
	 */
	public String gbzgzdzt() {
		ArrayList list = new ArrayList();
		list.add("{name:\"C_GBZGZD1\",value:\"1\"}");
		list.add("{name:\"C_GBZGZD2\",value:\"2\"}");
		// 拼Json串
		String sJson = JSONArray.fromObject(list).toString();
		CommonEntity commonEntity = new CommonEntity();
		commonEntity.setParameter("{list:" + sJson + "}");
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;
	}

	/**
	 * 质检处理状态
	 * 
	 * @return
	 */
	public String zhijchulzt() {
		ArrayList list = new ArrayList();
		list.add("{name:\"P403_ZT_1\",value:\"1\"}");
		list.add("{name:\"P403_ZT_2\",value:\"2\"}");
		list.add("{name:\"P403_ZT_3\",value:\"3\"}");
		list.add("{name:\"P403_ZT_4\",value:\"4\"}");
		list.add("{name:\"P403_ZT_5\",value:\"5\"}");
		// 拼Json串
		String sJson = JSONArray.fromObject(list).toString();
		CommonEntity commonEntity = new CommonEntity();
		commonEntity.setParameter("{list:" + sJson + "}");
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;
	}

	/**
	 * 外部供货模式
	 * 
	 * @return
	 */
	public String waibghms() {
		return getDdlDataByZidlx("WBMS");
	}

	/**
	 * 外部模式和内部模式
	 */
	public String waibandneibghms() {
		String zhuangt=this.getParam("zhuangt");
		LoginUser loginUser = AuthorityUtils.getSecurityUser();
		Xitcsdy bean = new Xitcsdy();
		bean.setUsercenter(loginUser.getUsercenter());
	   if("1".equals(zhuangt)){	
		// 外部模式
		bean.setZidlx("WBMS");
	   }else if("2".equals(zhuangt)){
		// 内部模式
			bean.setZidlx("NBMS");
	   }
	   List<Xitcsdy> msList = commonService.selectXitcsdy(bean);
	   ArrayList aList = new ArrayList();
		for (int i = 0; i < msList.size(); i++) {
			Xitcsdy xitcsdy = msList.get(i);
			aList.add("{name:\"" + xitcsdy.getZidmc() + "\",value:\""
					+ xitcsdy.getZidbm() + "\"}");
		   }
		// 拼Json串
		String sJson = JSONArray.fromObject(aList).toString();
		CommonEntity commonEntity = new CommonEntity();
		commonEntity.setParameter("{list:" + sJson + "}");
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;
	}

	/**
	 * 要货令状态
	 * 
	 * @return
	 */
	public String yaohlzt() {
		//根据客户要求 对于153外部要货令状态中（C_YAOHL_05 ，C_YAOHL_08，C_YAOHLWB_03）不显示
		String zhuangt=this.getParam("zhuangt");
		String pageid=this.getParam("pageid");
		ArrayList list = new ArrayList();
		
		   list.add("{name:\"C_YAOHL_00\",value:\"00\"}");
		   list.add("{name:\"C_YAOHL_01\",value:\"01\"}");
		if(!"153".equals(pageid)){//此3种状态在153页面不显示
		   list.add("{name:\"C_YAOHL_05\",value:\"05\"}");
		   list.add("{name:\"C_YAOHL_08\",value:\"08\"}");
		   //因客户要求Mantis(0006980)2013-5-13更改
		   list.add("{name:\"C_YAOHL_07\",value:\"07\"}"); 
		}
		// list.add("{name:\"C_YAOHL_09\",value:\"09\"}"); 20121207取消未表达的状态
	   if("1".equals(zhuangt)){	//外部要货令状态时
		   list.add("{name:\"C_YAOHLWB_02\",value:\"02\"}");
	   //if(!"153".equals(pageid)){//此3种状态在153页面不显示
		   //因客户要求Mantis(0006894)2013-4-22更改
	       list.add("{name:\"C_YAOHLWB_03\",value:\"03\"}");
	   //}
	     }else if("2".equals(zhuangt)){  //内部要货令状态时
	    	list.add("{name:\"C_YAOHLNB_02\",value:\"02\"}");
	    	list.add("{name:\"C_YAOHLNB_03\",value:\"03\"}");
		 	list.add("{name:\"C_YAOHLNB_04\",value:\"04\"}"); 
			list.add("{name:\"C_YAOHLNB_66\",value:\"66\"}"); 
	      
	     }
		// 拼Json串
		String sJson = JSONArray.fromObject(list).toString();
		CommonEntity commonEntity = new CommonEntity();
		commonEntity.setParameter("{list:" + sJson + "}");
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;
	}

	/**
	 * 拒收跟踪单状态
	 * 
	 * @return
	 */
	public String jusgzdzt() {
		ArrayList list = new ArrayList();
		list.add("{name:\"C_JSGZDZT0\",value:\"0\"}");
		list.add("{name:\"C_JSGZDZT1\",value:\"1\"}");
		list.add("{name:\"C_JSGZDZT2\",value:\"2\"}");
		list.add("{name:\"C_JSGZDZT4\",value:\"4\"}");
		list.add("{name:\"C_JSGZDZT3\",value:\"3\"}");
		// 拼Json串
		String sJson = JSONArray.fromObject(list).toString();
		CommonEntity commonEntity = new CommonEntity();
		commonEntity.setParameter("{list:" + sJson + "}");
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;
	}
	/**
	 * 通过零件编号及用户中心获取供应商
	 */
    public  String  lingjGys(){
    	Map map = this.getParams();
		LoginUser loginUser = AuthorityUtils.getSecurityUser();
		map.put("usercenter",loginUser.getUsercenter());
		List<Lingjgys>  gys= commonService.selectGongys(map);
		ArrayList list = new ArrayList();
		for(int i=0;i<gys.size();i++){
			Lingjgys lg=gys.get(i);
			if(lg.getGongysdm() !=null){
			list.add("{name:'"+lg.getGongysdm()+"',value:'"+lg.getGongysdm()+"'}");
			}
		}
		// 拼Json串
		String sJson = JSONArray.fromObject(list).toString();
		CommonEntity commonEntity = new CommonEntity();
		commonEntity.setParameter("{list:" + sJson + "}");
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;
    	
    }
    /**
     * 通过零件编号及用户中心获取配送类别
     */
    public  String  lingjPeislb(){
    	Map map = this.getParams();
		LoginUser loginUser = AuthorityUtils.getSecurityUser();
		map.put("usercenter",loginUser.getUsercenter());
		List<Peislb>  peislb= commonService.selectPeislb(map);
		ArrayList list = new ArrayList();
			for(int i=0;i<peislb.size();i++){
				Peislb p=peislb.get(i);
				if(p.getPeislx()!=null){
					list.add("{name:'"+p.getPeislx()+"',value:'"+p.getPeislx()+"'}");
				}
		}
		// 拼Json串
		String sJson = JSONArray.fromObject(list).toString();
		CommonEntity commonEntity = new CommonEntity();
		commonEntity.setParameter("{list:" + sJson + "}");
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;
    	
    }
    /**
     * 产线
     */
    public  String chanx(){
    	Map map = this.getParams();
		LoginUser loginUser = AuthorityUtils.getSecurityUser();
		map.put("usercenter",loginUser.getUsercenter());
		List<Shengcx>  chanx= commonService.selectChanx(map);
		ArrayList list = new ArrayList();
		for(int i=0;i<chanx.size();i++){
			Shengcx  c=chanx.get(i);
			if(c.getChanx() !=null){
			list.add("{name:'"+c.getChanx()+"',value:'"+c.getChanx()+"'}");
			}
		}
		// 拼Json串
		String sJson = JSONArray.fromObject(list).toString();
		CommonEntity commonEntity = new CommonEntity();
		commonEntity.setParameter("{list:" + sJson + "}");
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;
    }
    
    /**
	 * 盘点方式
	 * 
	 * @return
	 */
	public String pandfs() {
		ArrayList list = new ArrayList();
		list.add("{name:\"C2_PDFS1\",value:\"1\"}");
		list.add("{name:\"C2_PDFS2\",value:\"2\"}");
		// 拼Json串
		String sJson = JSONArray.fromObject(list).toString();
		CommonEntity commonEntity = new CommonEntity();
		commonEntity.setParameter("{list:" + sJson + "}");
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;
	}
	/**
	 * 卸货站台
	 */
	public String zickxhzt() {
		LoginUser loginUser = AuthorityUtils.getSecurityUser();
		Map map=new HashMap();
		map.put("usercenter",loginUser.getUsercenter() );
		map.put("cangkbh", this.getParam("cangkbh"));
		List<Xiehzt> zdList = commonService.selectZickxhzt(map);
		// 赋值
		ArrayList aList = new ArrayList();
		for (int i = 0; i < zdList.size(); i++) {
			Xiehzt xiehzt = zdList.get(i);
			if(xiehzt.getXiehzt() !=null){
				aList.add("{name:\"" + xiehzt.getXiehzt() + "\",value:\""
					+ xiehzt.getXiehzt() + "\"}");
			}
		}
		// 拼Json串
		String sJson = JSONArray.fromObject(aList).toString();
		CommonEntity commonEntity = new CommonEntity();
		commonEntity.setParameter("{list:" + sJson + "}");
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;
	}
	/**
	 * 要货令类型
	 */
	public  String  yaohllx(){
		ArrayList list = new ArrayList();
		list.add("{name:\"C_WBYAOHL\",value:\"1\"}");
		list.add("{name:\"C_NBYAOHL\",value:\"2\"}");
		// 拼Json串
		String sJson = JSONArray.fromObject(list).toString();
		CommonEntity commonEntity = new CommonEntity();
		commonEntity.setParameter("{list:" + sJson + "}");
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;
		
	}
	/**
	 * 发货通知单状态查询
	 */
	public  String fahtzdzt(){
		ArrayList list = new ArrayList();
		list.add("{name:\"C_DAOHZT_0\",value:\"0\"}");
		list.add("{name:\"C_DAOHZT_1\",value:\"1\"}");
		list.add("{name:\"C_DAOHZT_2\",value:\"2\"}");
		list.add("{name:\"C_DAOHZT_3\",value:\"3\"}");
		list.add("{name:\"C_DAOHZT_4\",value:\"4\"}");
		list.add("{name:\"C_DAOHZT_5\",value:\"5\"}");
		list.add("{name:\"C_DAOHZT_6\",value:\"6\"}");
		list.add("{name:\"C_DAOHZT_7\",value:\"7\"}");
		list.add("{name:\"C_DAOHZT_8\",value:\"8\"}");
		list.add("{name:\"C_DAOHZT_21\",value:\"21\"}");
		// 拼Json串
		String sJson = JSONArray.fromObject(list).toString();
		CommonEntity commonEntity = new CommonEntity();
		commonEntity.setParameter("{list:" + sJson + "}");
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;
		
		
	}
	/**
	 * 147通过配送类别查询产线
	 * @return
	 */
	 public  String Peislxchanx(){
    	Map map = this.getParams();
		LoginUser loginUser = AuthorityUtils.getSecurityUser();
		map.put("usercenter",loginUser.getUsercenter());
		List<Shengcx>  chanx= commonService.selectPeislxcx(map);
		//ArrayList list = new ArrayList();
		CommonEntity commonEntity = new CommonEntity();
		JSONObject a=new JSONObject();
		for(int i=0;i<chanx.size();i++){
			Shengcx  c=chanx.get(i);
			if(c.getChanx() !=null){
				commonEntity.setResponse("0001");
				a.put("chanx", c.getChanx());
				commonEntity.setParameter(a.toString());
			// list.add("{name:'"+c.getChanx()+"',value:'"+c.getChanx()+"'}");
			}else{
				commonEntity.setResponse("C_1403");
			}
		}
		// 拼Json串
		//String sJson = JSONArray.fromObject(list).toString();
		//commonEntity.setParameter("{list:" + sJson + "}");
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;
    }
	 /**
	  * 备货单类型
	  * 20121207 删除04,08 两种多余的备货单类型
	  * 
	  */
	 public  String beihdlx(){
		ArrayList list = new ArrayList();
		list.add("{name:\"C_BEIHDLX_RI\",value:\"RI\"}");
		list.add("{name:\"C_BEIHDLX_RP\",value:\"RP\"}");
		list.add("{name:\"C_BEIHDLX_KI\",value:\"KI\"}");
		list.add("{name:\"C_BEIHDLX_KP\",value:\"KP\"}");
		list.add("{name:\"C_BEIHDLX_CD\",value:\"CD\"}");
		list.add("{name:\"C_BEIHDLX_C0\",value:\"C0\"}");
		list.add("{name:\"C_BEIHDLX_CS\",value:\"CS\"}");
		list.add("{name:\"C_BEIHDLX_M1\",value:\"M1\"}");
		list.add("{name:\"C_BEIHDLX_MD\",value:\"MD\"}");
		list.add("{name:\"C_BEIHDLX_02\",value:\"02\"}");
		list.add("{name:\"C_BEIHDLX_03\",value:\"03\"}");
		//list.add("{name:\"C_BEIHDLX_04\",value:\"04\"}");
		list.add("{name:\"C_BEIHDLX_05\",value:\"05\"}");
		list.add("{name:\"C_BEIHDLX_06\",value:\"06\"}");
		list.add("{name:\"C_BEIHDLX_07\",value:\"07\"}");
		list.add("{name:\"C_BEIHDLX_CP\",value:\"CP\"}");
		//list.add("{name:\"C_BEIHDLX_08\",value:\"08\"}");
		// 拼Json串
		String sJson = JSONArray.fromObject(list).toString();
		CommonEntity commonEntity = new CommonEntity();
		commonEntity.setParameter("{list:" + sJson + "}");
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;
	}
	 /**
	  * 备货单类型
	  */
	 public  String daoclx(){
		ArrayList list = new ArrayList();
		list.add("{name:\"Text\",value:\"0\"}");
		list.add("{name:\"Excel\",value:\"1\"}");
		// 拼Json串
		String sJson = JSONArray.fromObject(list).toString();
		CommonEntity commonEntity = new CommonEntity();
		commonEntity.setParameter("{list:" + sJson + "}");
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;
	 }
	 /**
		 * 342排序方式
		 * 
		 * @return
		 */
		public String paixfs2() {
			ArrayList list = new ArrayList();
			list.add("{name:\"C3_ZHUANGTSX\",value:\"zhuangtsx\"}");
			list.add("{name:\"C3_LINGJBH\",value:\"lingjbh\"}");
			list.add("{name:\"C3_RUKRQ\",value:\"rukrq\"}");
			list.add("{name:\"C3_KUWBH\",value:\"kuwbh\"}");
			// 拼Json串
			String sJson = JSONArray.fromObject(list).toString();
			CommonEntity commonEntity = new CommonEntity();
			commonEntity.setParameter("{list:" + sJson + "}");
			JSONObject obj = JSONObject.fromObject(commonEntity);
			setResult("result", obj);
			return AJAX;
		}
	/**
	 * 511集装箱状态
	 */
		public String jizxzt() {
			ArrayList list = new ArrayList();
			list.add("{name:\"C_JZXZT0\",value:\"0\"}");
			list.add("{name:\"C_JZXZT1\",value:\"1\"}");
			list.add("{name:\"C_JZXZT2\",value:\"2\"}");
			list.add("{name:\"C_JZXZT3\",value:\"3\"}");
			// 拼Json串
			String sJson = JSONArray.fromObject(list).toString();
			CommonEntity commonEntity = new CommonEntity();
			commonEntity.setParameter("{list:" + sJson + "}");
			JSONObject obj = JSONObject.fromObject(commonEntity);
			setResult("result", obj);
			return AJAX;
		}
		
		/**
		 * 60303 容器供应商代码得到容器供应商名称
		 * @return 
		 */
		public String kongrqgongysmc() {
			Map map=this.getParams();
			LoginUser loginUser = AuthorityUtils.getSecurityUser();
			map.put("usercenter", loginUser.getUsercenter());
			List<Yic> list = commonService.selectgongysmcc(map);
			String strResponse;
			String gongysmc="";
			if(list.size()==0)
			{
				strResponse = "C_GONGYSMCCW";
				
			}else{
				strResponse = "0001";
				gongysmc=list.get(0).getGongysmc();
			}
			String jsonList = JSONSerializer.toJSON(list).toString();
			CommonEntity commonEntity=new CommonEntity();
			commonEntity.setParameter("{list:"+jsonList+",gongysmc:\""+gongysmc+"\"}");
			commonEntity.setResponse(strResponse);
			JSONObject obj = JSONObject.fromObject(commonEntity);
			setResult("result", obj);
			  return  AJAX;
		}
		
		/**
		 * 60304 容器供应商代码得到容器供应商名称
		 * @return 
		 */
		public String kongrqwulsmc() {
			Map map=this.getParams();
			LoginUser loginUser = AuthorityUtils.getSecurityUser();
			map.put("usercenter", loginUser.getUsercenter());
			List<Yic> list = commonService.searchgongysmc(map);
			String strResponse;
			String chengysmc="";
			if(list.size()==0)
			{
				strResponse = "C_CHENGYSMCCW";
				
			}else{
				strResponse = "0001";
				chengysmc=list.get(0).getChengysmc();
			}
			//String jsonList = JSONSerializer.toJSON(list).toString();
			CommonEntity commonEntity=new CommonEntity();
			commonEntity.setParameter("{ chengysmc:\""+chengysmc+"\"}");
			commonEntity.setResponse(strResponse);
			JSONObject obj = JSONObject.fromObject(commonEntity);
			setResult("result", obj);
			  return  AJAX;
		}
		
	    /**
	     * 承运商代码
	     */
	    public  String xzchengysdm(){
	    	Map map = this.getParams();
			LoginUser loginUser = AuthorityUtils.getSecurityUser();
			map.put("usercenter",loginUser.getUsercenter());
			List<Yic>  chengysdm= commonService.searchchengysdm(map);
				ArrayList list = new ArrayList();
				for(int i=0;i<chengysdm.size();i++){
					Yic  c=chengysdm.get(i);
					list.add("{name:'"+c.getChengysdm()+"',value:'"+c.getChengysdm()+"'}");
				}
				// 拼Json串
				String sJson = JSONArray.fromObject(list).toString();
				CommonEntity commonEntity = new CommonEntity();
				commonEntity.setParameter("{list:" + sJson + "}");
				JSONObject obj = JSONObject.fromObject(commonEntity);
				setResult("result", obj);
			
			return AJAX;
	    }
	    
		/**
		 * 40104异常消耗申报通过零件编号查询
		 * @return 
		 */
		public String yichanglingjgongys(){
			Map map=this.getParams();
			LoginUser loginUser = AuthorityUtils.getSecurityUser();
			map.put("usercenter", loginUser.getUsercenter());
			List<Yic> userCenterList = commonService.selectlingjgongys(map);
			// 按指定的格式取数据
			ArrayList aList = new ArrayList();
			for (int i = 0; i < userCenterList.size(); i++) {
				Yic userCenter = userCenterList.get(i);
				aList.add("{name:\"" + userCenter.getGongysdm() + "\",value:\""
						+ userCenter.getGongysdm() + "\"}");
			}
			// 拼Json串
			String sJson = JSONArray.fromObject(aList).toString();
			CommonEntity commonEntity = new CommonEntity();
			commonEntity.setParameter("{list:" + sJson + "}");
			JSONObject obj = JSONObject.fromObject(commonEntity);
			setResult("result", obj);
			return AJAX;
		}
		
		/**
		 * 40104异常消耗申报通过零件编号查询
		 * @return 
		 */
		public String yichangLINGJbhx(){
			Map map=this.getParams();
			LoginUser loginUser = AuthorityUtils.getSecurityUser();
			map.put("usercenter", loginUser.getUsercenter());
			List<Yic> list = commonService.selectlingjmc(map);
			String strResponse;
			String lingjmc="";
			String danw="";
			if(list.size()==0)
			{
				strResponse = "C_LINGJMCCW";
				
			}else{
				strResponse = "0001";
				lingjmc=list.get(0).getLingjmc();
				danw=list.get(0).getDanw();
			}
			String jsonList = JSONSerializer.toJSON(list).toString();
			CommonEntity commonEntity=new CommonEntity();
			commonEntity.setParameter("{list:"+jsonList+",lingjmc:\""+lingjmc+"\",danw:\""+danw+"\"}");
			commonEntity.setResponse(strResponse);
			JSONObject obj = JSONObject.fromObject(commonEntity);
			setResult("result", obj);
			  return  AJAX;	 
		}
		
		/**
		 * 40105异常消耗申报通过供应商编号查询
		 * @return 
		 */
		public String yichangGONGYSbhx(){
			Map map=this.getParams();
			LoginUser loginUser = AuthorityUtils.getSecurityUser();
			map.put("usercenter", loginUser.getUsercenter());
			  List<Yic> list = commonService.selectgongysmcc(map);
				String strResponse;
				String gongysmc="";
				if(list.size()==0)
				{
					strResponse = "C_GONGYSMCCW";
					
				}else{
					strResponse = "0001";
					if(null==list.get(0).getGongysmc()){
						
					}else{
						gongysmc=list.get(0).getGongysmc();
					}
					
				}
				//String jsonList = JSONSerializer.toJSON(list).toString();
				CommonEntity commonEntity=new CommonEntity();
				commonEntity.setParameter("{gongysmc:\""+gongysmc+"\"}");
				commonEntity.setResponse(strResponse);
				JSONObject obj = JSONObject.fromObject(commonEntity);
				setResult("result", obj);
			  return  AJAX;
		}
		/**
		 * 40106异常消耗申报通过供应商编号查询
		 * @return 
		 */
		public String yichangshenbd(){
			Map map=this.getParams();
			LoginUser loginUser = AuthorityUtils.getSecurityUser();
			map.put("usercenter", loginUser.getUsercenter());
			  List<Yic> list = commonService.selectchengysmc(map);
				String strResponse;
				String chengysdm="";
				String chengysmc="";
				if(list.size()==0)
				{
					strResponse = "C_GONGLINGSHENCW";
					
				}else{
					strResponse = "0001";
					chengysdm=list.get(0).getChengysdm();
					chengysmc=list.get(0).getChengysmc();
				}
				String jsonList = JSONSerializer.toJSON(list).toString();
				CommonEntity commonEntity=new CommonEntity();
				commonEntity.setParameter("{chengysdm:\""+chengysdm+"\",chengysmc:\""+chengysmc+"\"}");
				commonEntity.setResponse(strResponse);
				JSONObject obj = JSONObject.fromObject(commonEntity);
				setResult("result", obj);
			  return  AJAX;
		}
		
		
		
		/**
		 * 12501  print
		 * @return 
		 */
		public String budgnprintmor(){
			Map map=this.getParams();
			LoginUser loginUser = AuthorityUtils.getSecurityUser();
			map.put("usercenter", loginUser.getUsercenter());
			String strResponse = commonService.selectbuda(map);

			CommonEntity commonEntity=new CommonEntity();
			commonEntity.setResponse(strResponse);
			JSONObject obj = JSONObject.fromObject(commonEntity);
			setResult("result", obj);
			return  AJAX;
		}
		/**
		 * 125补打功能
		 * @return 
		 */
		public String budgnprint(){
			String transcode = "D0101";
			Map map = this.getParams();
			setResult("result", this.callWtc(transcode, map));
			return AJAX;
		}
		
		/**
		 * 质检非成品仓库
		 * 
		 * @return
		 */
		public String wareHouseck() {
			Map map=this.getParams();
			String buhgpk=map.get("buhgpk").toString();
			String buhgpk2=map.get("buhgpk2").toString();
			// 获取session数据
			LoginUser loginUser = AuthorityUtils.getSecurityUser();
			List<WareHouse> ckList = (List<WareHouse>) loginUser.getParams().get(
					"ckList");
			//获取零件编号对应的仓库集合 hzg 2014.10.14
			List<String> ljckList = new ArrayList<String>();
			HashMap hashmap=new HashMap();
			if(!buhgpk2.equals("0")){
				if(buhgpk2.equals("426")){
					buhgpk="cangklx not in ( '2','4')";
				}else{
					buhgpk="cangklx in ("+ "'"+buhgpk+"','"+buhgpk2+"')";
				}
			}else{
				buhgpk="cangklx in ("+ "'"+buhgpk+"')";
			}
			hashmap.put("buhgpk", buhgpk);
			// 按指定的格式取数据
			ArrayList aList = new ArrayList();
			for (int i = 0; i < ckList.size(); i++) {
				WareHouse wareHouse = ckList.get(i);
				hashmap.put("cangkbh", wareHouse.getCangkbh());
				hashmap.put("usercenter", loginUser.getUsercenter());
				String cangkbh=commonService.selectcangkbh(hashmap);
				if(cangkbh!=null){
					aList.add("{name:\"" + cangkbh + "\",value:\""
							+ cangkbh + "\"}");
				}
			}
			// 拼Json串
			String sJson = JSONArray.fromObject(aList).toString();
			CommonEntity commonEntity = new CommonEntity();
			commonEntity.setParameter("{list:" + sJson + "}");
			JSONObject obj = JSONObject.fromObject(commonEntity);
			setResult("result", obj);
			return AJAX;
		}
		
		/**
		 * 成品仓库
		 * 
		 * @return
		 */
		public String wareHousecpck() {
			Map map=this.getParams();
			// 获取session数据
			LoginUser loginUser = AuthorityUtils.getSecurityUser();
			List<WareHouse> ckList = (List<WareHouse>) loginUser.getParams().get(
					"ckList");
			//获取零件编号对应的仓库集合 hzg 2014.10.14
			List<String> ljckList = new ArrayList<String>();
			HashMap hashmap=new HashMap();
		    String buhgpk="cangklx = '3' ";
			hashmap.put("buhgpk", buhgpk);
			// 按指定的格式取数据
			ArrayList aList = new ArrayList();
			for (int i = 0; i < ckList.size(); i++) {
				WareHouse wareHouse = ckList.get(i);
				hashmap.put("cangkbh", wareHouse.getCangkbh());
				hashmap.put("usercenter", loginUser.getUsercenter());
				String cangkbh=commonService.selectcangkbh(hashmap);
				if(cangkbh!=null){
					aList.add("{name:\"" + cangkbh + "\",value:\""
							+ cangkbh + "\"}");
				}
			}
			// 拼Json串
			String sJson = JSONArray.fromObject(aList).toString();
			CommonEntity commonEntity = new CommonEntity();
			commonEntity.setParameter("{list:" + sJson + "}");
			JSONObject obj = JSONObject.fromObject(commonEntity);
			setResult("result", obj);
			return AJAX;
		}	
		
		/**
		 * V4_022 卷料库
		 * 
		 * @return
		 */
		public String wareHousejlck() {
			Map map=this.getParams();
			// 获取session数据
			LoginUser loginUser = AuthorityUtils.getSecurityUser();
			List<WareHouse> ckList = (List<WareHouse>) loginUser.getParams().get(
					"ckList");
			//获取零件编号对应的仓库集合 hzg 2014.10.14
			List<String> ljckList = new ArrayList<String>();
			HashMap hashmap=new HashMap();
		    String buhgpk="cangklx = '5' ";
			hashmap.put("buhgpk", buhgpk);
			// 按指定的格式取数据
			ArrayList aList = new ArrayList();
			for (int i = 0; i < ckList.size(); i++) {
				WareHouse wareHouse = ckList.get(i);
				hashmap.put("cangkbh", wareHouse.getCangkbh());
				hashmap.put("usercenter", loginUser.getUsercenter());
				String cangkbh=commonService.selectcangkbh(hashmap);
				if(cangkbh!=null){
					aList.add("{name:\"" + cangkbh + "\",value:\""
							+ cangkbh + "\"}");
				}
			}
			// 拼Json串
			String sJson = JSONArray.fromObject(aList).toString();
			CommonEntity commonEntity = new CommonEntity();
			commonEntity.setParameter("{list:" + sJson + "}");
			JSONObject obj = JSONObject.fromObject(commonEntity);
			setResult("result", obj);
			return AJAX;
		}
		
		
		/**
		 * 返修入库合格品仓库
		 * hzg 2014.10.14
		 * mantis:0010613 非不合格品库和成品不合格品库的都可以入库
		 * @return
		 */
		public String wareHouseLjck() {
			Map map=this.getParams();
			String lingjbh = map.get("lingjbh").toString();
			// 获取session数据
			LoginUser loginUser = AuthorityUtils.getSecurityUser();
			List<WareHouse> ckList = (List<WareHouse>) loginUser.getParams().get("ckList");
			//获取零件编号对应的仓库集合 hzg 2014.10.14
			List<String> ljckList = new ArrayList<String>();
			ljckList = getCangkbhOfLjck(lingjbh,loginUser.getUsercenter());
			HashMap hashmap=new HashMap();
			String buhgpk="cangklx not in ('2','4')";
			hashmap.put("buhgpk", buhgpk);
			// 按指定的格式取数据
			ArrayList aList = new ArrayList();
			for (int i = 0; i < ckList.size(); i++) {
				WareHouse wareHouse = ckList.get(i);
				hashmap.put("cangkbh", wareHouse.getCangkbh());
				hashmap.put("usercenter", loginUser.getUsercenter());
				String cangkbh=commonService.selectcangkbh(hashmap);
				if(cangkbh!=null&&ljckList.contains(cangkbh)){
					aList.add("{name:\"" + cangkbh + "\",value:\""+ cangkbh + "\"}");
				}
			}
			// 拼Json串
			String sJson = JSONArray.fromObject(aList).toString();
			CommonEntity commonEntity = new CommonEntity();
			commonEntity.setParameter("{list:" + sJson + "}");
			JSONObject obj = JSONObject.fromObject(commonEntity);
			setResult("result", obj);
			return AJAX;
		}
		
		
		/**
		 * 
		 * @author 贺志国
		 * @date 2014-10-14
		 * @param lingjbh 零件编号
		 * @param usercenter 用户中心
		 * @return 仓库编号集合
		 */
		public List<String> getCangkbhOfLjck(String lingjbh,String usercenter){
			Map<String,String> params = new HashMap<String,String>();
			params.put("lingjbh", lingjbh);
			params.put("usercenter", usercenter);
			return commonService.queryCangkbhOfLjck(params);
		}
		
		/**
		 * 40104异常消耗申报通过零件编号查询
		 * @return 
		 */
		public String selectucrl(){
			Map map=this.getParams();
			LoginUser loginUser = AuthorityUtils.getSecurityUser();
			map.put("usercenter", loginUser.getUsercenter());
			List<Kuccx> list = commonService.selectucrl(map);
			String strResponse;
			String baozrl="";
			if(list.size()==0)
			{
				strResponse = "C_LINGJMCCW";
				
			}else{
				strResponse = "0001";
				baozrl=list.get(0).getBaozrl();
			}
			String jsonList = JSONSerializer.toJSON(list).toString();
			CommonEntity commonEntity=new CommonEntity();
			commonEntity.setParameter("{list:"+jsonList+",baozrl:\""+baozrl+"\"}");
			commonEntity.setResponse(strResponse);
			JSONObject obj = JSONObject.fromObject(commonEntity);
			setResult("result", obj);
			  return  AJAX;
		}
		/**
		 * 40104异常消耗申报通过零件编号查询
		 * @return 
		 */
		public String selectuaucgs(){
			Map map=this.getParams();
			LoginUser loginUser = AuthorityUtils.getSecurityUser();
			map.put("usercenter", loginUser.getUsercenter());
			List<Kuccx> list = commonService.selectuaucgs(map);
			String strResponse;
			String baozrl="";
			if(list.size()==0)
			{
				strResponse = "C_LINGJMCCW";
				
			}else{
				strResponse = "0001";
				baozrl=list.get(0).getBaozrl();
			}
			String jsonList = JSONSerializer.toJSON(list).toString();
			CommonEntity commonEntity=new CommonEntity();
			commonEntity.setParameter("{list:"+jsonList+",baozrl:\""+baozrl+"\"}");
			commonEntity.setResponse(strResponse);
			JSONObject obj = JSONObject.fromObject(commonEntity);
			setResult("result", obj);
			  return  AJAX;
		}
		
		/**
		 * 查询失效期管理及批次号管理相关信息
		 */
		public   String     selectPcsxq(){
			Map map=this.getParams();
			LoginUser loginUser = AuthorityUtils.getSecurityUser();
			map.put("usercenter", loginUser.getUsercenter());
			List<Lingjgys> list = commonService.selectpcsxq(map);
			String strResponse = "0001";
			String  shifsxgl  = "0";
		    String  shifyzpch = "0";
			if(list.size()!=0)
			{
			  shifsxgl   =	list.get(0).getShifsxgl();
			  shifyzpch  =list.get(0).getShifyzpch();
			}
			String jsonList = JSONSerializer.toJSON(list).toString();
			CommonEntity commonEntity=new CommonEntity();
			JSONObject a=new JSONObject();
			commonEntity.setParameter("{ shifsxgl:\""+shifsxgl+"\",shifyzpch:\""+shifyzpch+"\"}");
			commonEntity.setResponse(strResponse);
			JSONObject obj = JSONObject.fromObject(commonEntity);
			setResult("result", obj);
		     return AJAX;	
		}
		/**
		 * 状态属性
		 * 
		 * @return
		 */
		public String zhuangtsx() {
			ArrayList list = new ArrayList();
			list.add("{name:\"C_USZTSX_1\",value:\"1\"}");
			list.add("{name:\"C_USZTSX_2\",value:\"2\"}");
			list.add("{name:\"C_USZTSX_3\",value:\"3\"}");
			list.add("{name:\"C_USZTSX_4\",value:\"4\"}");
			list.add("{name:\"C_USZTSX_5\",value:\"5\"}");
			list.add("{name:\"C_USZTSX_6\",value:\"6\"}");
			list.add("{name:\"C_USZTSX_7\",value:\"7\"}");
			list.add("{name:\"C_USZTSX_8\",value:\"8\"}");
			list.add("{name:\"C_USZTSX_9\",value:\"9\"}");
			list.add("{name:\"C_USZTSX_10\",value:\"10\"}");
			list.add("{name:\"C_USZTSX_11\",value:\"11\"}");
			// 拼Json串
			String sJson = JSONArray.fromObject(list).toString();
			CommonEntity commonEntity = new CommonEntity();
			commonEntity.setParameter("{list:" + sJson + "}");
			JSONObject obj = JSONObject.fromObject(commonEntity);
			setResult("result", obj);
			return AJAX;
		}
		
		/**
		 * 标签状态
		 * @author 贺志国
		 * @date 2014-10-16
		 * @return JSON 标签状态下拉列表框
		 */
		public String zhuangtbq() {
			ArrayList list = new ArrayList();
			list.add("{name:\"C_CPZTBQ0\",value:\"0\"}");
			list.add("{name:\"C_CPZTBQ1\",value:\"1\"}");
			// 拼Json串
			String sJson = JSONArray.fromObject(list).toString();
			CommonEntity commonEntity = new CommonEntity();
			commonEntity.setParameter("{list:" + sJson + "}");
			JSONObject obj = JSONObject.fromObject(commonEntity);
			setResult("result", obj);
			return AJAX;
		}
		
		/*
		 * 容器移库状态
		 */
		public String rongqykzt(){
			ArrayList list = new ArrayList();
			list.add("{name:\"C6_RQyk_1\",value:\"1\"}");
			list.add("{name:\"C6_RQyk_2\",value:\"2\"}");
			list.add("{name:\"C6_RQyk_3\",value:\"3\"}");
			// 拼Json串
			String sJson = JSONArray.fromObject(list).toString();
			CommonEntity commonEntity = new CommonEntity();
			commonEntity.setParameter("{list:" + sJson + "}");
			JSONObject obj = JSONObject.fromObject(commonEntity);
			setResult("result", obj);
			return AJAX;
		}
		/*
		 * 扫包装状态
		 */
		public String beihdbs(){
			ArrayList list = new ArrayList();
			list.add("{name:\"C_SAOMZT_0\",value:\"0\"}");
			list.add("{name:\"C_SAOMZT_1\",value:\"2\"}");
			// 拼Json串
			String sJson = JSONArray.fromObject(list).toString();
			CommonEntity commonEntity = new CommonEntity();
			commonEntity.setParameter("{list:" + sJson + "}");
			JSONObject obj = JSONObject.fromObject(commonEntity);
			setResult("result", obj);
			return AJAX;
		}
		/**
		 * 故障类型167
		 */
		public String gzlx167(){
			ArrayList list = new ArrayList();
			list.add("{name:\"C_GZLX_A\",value:\"A\"}");
			list.add("{name:\"C_GZLX_B\",value:\"B\"}");
			list.add("{name:\"C_GZLX_C\",value:\"C\"}");
			list.add("{name:\"C_GZLX_D\",value:\"D\"}");
			list.add("{name:\"C_GZLX_E\",value:\"E\"}");
			// 拼Json串
			String sJson = JSONArray.fromObject(list).toString();
			CommonEntity commonEntity = new CommonEntity();
			commonEntity.setParameter("{list:" + sJson + "}");
			JSONObject obj = JSONObject.fromObject(commonEntity);
			setResult("result", obj);
			return AJAX;
		}
		/**
		 * 处理标识 356
		 */
		public  String chulbs(){
			ArrayList list = new ArrayList();
			list.add("{name:\"C_CLZTYCL\",value:\"1\"}");
			list.add("{name:\"C_CLZTWCL\",value:\"0\"}");
			// 拼Json串
			String sJson = JSONArray.fromObject(list).toString();
			CommonEntity commonEntity = new CommonEntity();
			commonEntity.setParameter("{list:" + sJson + "}");
			JSONObject obj = JSONObject.fromObject(commonEntity);
			setResult("result", obj);
			return AJAX;
		}
		/**
		 * 150 配送类别
		 * @return 
		 * 
		 * @return
		 */
		public String pieslb150() {
			Map map = this.getParams();
			LoginUser loginUser = AuthorityUtils.getSecurityUser();
			map.put("usercenter", loginUser.getUsercenter());
			List<Peislb> list=tongbshService.selectLjpslb(map);
			CommonEntity commonEntity = new CommonEntity();
			ArrayList<String> aList = new ArrayList<String>();
			if(list.size()!=0){
				// 按指定的格式取数据
				for (int i = 0; i < list.size(); i++) {
					Peislb peislb = list.get(i);
					aList.add("{name:\"" + peislb.getPeislx() + "\",value:\""
							+ peislb.getPeislx() + "\"}");
				}
				// 拼Json串
			}
			String sJson = JSONArray.fromObject(aList).toString();
			commonEntity.setParameter("{list:" + sJson + "}");
			JSONObject obj = JSONObject.fromObject(commonEntity);
			setResult("result", obj);
			return AJAX;
		}

		/*
		 * 410添加状态属性7与8
		 * 
		 */
		public  String  zhuangtsx410(){
			ArrayList list = new ArrayList();
			list.add("{name:\"7\",value:\"7\"}");
			list.add("{name:\"8\",value:\"8\"}");
			// 拼Json串
			String sJson = JSONArray.fromObject(list).toString();
			CommonEntity commonEntity = new CommonEntity();
			commonEntity.setParameter("{list:" + sJson + "}");
			JSONObject obj = JSONObject.fromObject(commonEntity);
			setResult("result", obj);
			return AJAX;
		}
		/**
		 * 346  添加筛选下拉框
		 */
		public  String  shaixuan(){
			ArrayList list = new ArrayList();
			list.add("{name:\"C_BIAODSJ\",value:\"1\"}");
			list.add("{name:\"C_ZUIWSJ\",value:\"2\"}");
			// 拼Json串
			String sJson = JSONArray.fromObject(list).toString();
			CommonEntity commonEntity = new CommonEntity();
			commonEntity.setParameter("{list:" + sJson + "}");
			JSONObject obj = JSONObject.fromObject(commonEntity);
			setResult("result", obj);
			return AJAX;
		}
		/**
		 * 入库类型下拉框
		 */
		public  String  ruklx(){
			ArrayList list = new ArrayList();
			list.add("{name:\"C_RUKLX1\",value:\"1\"}");
			list.add("{name:\"C_RUKLX2\",value:\"2\"}");
			list.add("{name:\"C_RUKLX3\",value:\"3\"}");
			list.add("{name:\"C_RUKLX4\",value:\"4\"}");
			list.add("{name:\"C_RUKLX5\",value:\"5\"}");
			list.add("{name:\"C_RUKLX6\",value:\"6\"}");
			list.add("{name:\"C_RUKLX7\",value:\"7\"}");
			// 拼Json串
			String sJson = JSONArray.fromObject(list).toString();
			CommonEntity commonEntity = new CommonEntity();
			commonEntity.setParameter("{list:" + sJson + "}");
			JSONObject obj = JSONObject.fromObject(commonEntity);
			setResult("result", obj);
			return AJAX;
		}
		/**
		 * 质检类型
		 */
		public String  zhijzl(){
			ArrayList list = new ArrayList();
			list.add("{name:\"C_GONGF\",value:\"0\"}");
			list.add("{name:\"C_LIAOF\",value:\"1\"}");
			// 拼Json串
			String sJson = JSONArray.fromObject(list).toString();
			CommonEntity commonEntity = new CommonEntity();
			commonEntity.setParameter("{list:" + sJson + "}");
			JSONObject obj = JSONObject.fromObject(commonEntity);
			setResult("result", obj);
			return AJAX;
		}
	    /**
	     * 358 备货方式
	     */
		public String beihfs(){
			ArrayList list = new ArrayList();
			list.add("{name:\"C_BHFS_0\",value:\"0\"}");
			list.add("{name:\"C_BHFS_1\",value:\"1\"}");
			// 拼Json串
			String sJson = JSONArray.fromObject(list).toString();
			CommonEntity commonEntity = new CommonEntity();
			commonEntity.setParameter("{list:" + sJson + "}");
			JSONObject obj = JSONObject.fromObject(commonEntity);
			setResult("result", obj);
			return AJAX;
		}
		
		/**
		 * 129状态
		 * 
		 * @return
		 */
		public String yszhuangt() {
			ArrayList list = new ArrayList();
			list.add("{name:\"P129_0105\",value:\"1\"}");
			list.add("{name:\"P129_0106\",value:\"0\"}");
			// 拼Json串
			String sJson = JSONArray.fromObject(list).toString();
			CommonEntity commonEntity = new CommonEntity();
			commonEntity.setParameter("{list:" + sJson + "}");
			JSONObject obj = JSONObject.fromObject(commonEntity);
			setResult("result", obj);
			return AJAX;
		}
		
		/**
		 * 按需延误查询模式(361)
		 */
		public String axywmosh() {
			ArrayList list = new ArrayList();
			list.add("{name:\"CD\",value:\"CD\"}");
			list.add("{name:\"MD\",value:\"MD\"}");
			list.add("{name:\"CS\",value:\"CS\"}");
			// 拼Json串
			String sJson = JSONArray.fromObject(list).toString();
			CommonEntity commonEntity = new CommonEntity();
			commonEntity.setParameter("{list:" + sJson + "}");
			JSONObject obj = JSONObject.fromObject(commonEntity);
			setResult("result", obj);
			return AJAX;
		}
		
		/**
		 * 查询实际零件名称
		 * @return 
		 */
		public String querySjljmc(){
			Map map=this.getParams();
			LoginUser loginUser = AuthorityUtils.getSecurityUser();
			map.put("usercenter", loginUser.getUsercenter());
			
			CommonEntity commonEntity = new CommonEntity();
			String suifljmc=commonService.querySjljmc(map);
			
			if(suifljmc == null){
				commonEntity.setResponse("C_1403");
			}else{
				commonEntity.setResponse("0001");
				commonEntity.setParameter("{suifljmc:\""+suifljmc+"\"}");
			}
			JSONObject obj = JSONObject.fromObject(commonEntity);
			setResult("result", obj);
			return AJAX;	
		}
		
		
	/**
	 * 原因
	 * 0010509
	 */
	public String getYuanYin() {
		LoginUser loginUser = AuthorityUtils.getSecurityUser();
		Xitcsdy bean = new Xitcsdy();
		bean.setUsercenter(loginUser.getUsercenter());
		bean.setZidlx("BFLX");
		List<Xitcsdy> zdList = commonService.selectXitcsdy(bean);
		// 赋值
		ArrayList aList = new ArrayList();
		for (int i = 0; i < zdList.size(); i++) {
			Xitcsdy xitcsdy = zdList.get(i);
			/*
			aList.add("{name:\"" + xitcsdy.getZidmc() + "\",value:\""
					+ xitcsdy.getZidbm() + "\"}");
			*/
			aList.add("{name:\"" + xitcsdy.getZidmc() + "\",value:\""
					+ xitcsdy.getZidmc() + "\"}");
		}
		// 拼Json串
		String sJson = JSONArray.fromObject(aList).toString();
		CommonEntity commonEntity = new CommonEntity();
		commonEntity.setParameter("{list:" + sJson + "}");
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;
		
	}
	
	/**
	 * 容器包裹查询修改 -单据状态
	 * 0010495
	 */
	public String rongqbglx(){
		ArrayList list = new ArrayList();
		list.add("{name:\"C_P641_00\",value:\"9\"}");
		list.add("{name:\"C_P641_01\",value:\"0\"}");
		list.add("{name:\"C_P641_02\",value:\"1\"}");
		list.add("{name:\"C_P641_03\",value:\"2\"}");
		list.add("{name:\"C_P641_04\",value:\"3\"}");
		
		// 拼Json串
		String sJson = JSONArray.fromObject(list).toString();
		CommonEntity commonEntity = new CommonEntity();
		commonEntity.setParameter("{list:" + sJson + "}");
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;		
	}
	
	/**
	 * 容器退供应商（包）查询撤销 -单据状态
	 * 0010495
	 */
	public String rongqbglx2(){
		ArrayList list = new ArrayList();
		//list.add("{name:\"C_P641_00\",value:\"9\"}");
		list.add("{name:\"C_P641_01\",value:\"0\"}");
		//list.add("{name:\"C_P641_02\",value:\"1\"}");
		list.add("{name:\"C_P641_03\",value:\"2\"}");
		list.add("{name:\"C_P641_04\",value:\"3\"}");
		list.add("{name:\"C_P641_05\",value:\"5\"}");
		// 拼Json串
		String sJson = JSONArray.fromObject(list).toString();
		CommonEntity commonEntity = new CommonEntity();
		commonEntity.setParameter("{list:" + sJson + "}");
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;		
	}
	
	/**
	 * 空车出厂查询撤销 -单据状态
	 * 
	 */
	public String kongcclx(){
		ArrayList list = new ArrayList();
		list.add("{name:\"C_ZHIJZT_1\",value:\"2\"}");
		list.add("{name:\"C_P641_04\",value:\"3\"}");
		// 拼Json串
		String sJson = JSONArray.fromObject(list).toString();
		CommonEntity commonEntity = new CommonEntity();
		commonEntity.setParameter("{list:" + sJson + "}");
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;		
	}

	/**
	 * EL删除流水查询164 -删除类别
	 * 0010438
	 */
	public String shanclb(){
		ArrayList list = new ArrayList();
		list.add("{name:\"P164_01\",value:\"1\"}");
		list.add("{name:\"P164_02\",value:\"2\"}");
		// 拼Json串
		String sJson = JSONArray.fromObject(list).toString();
		CommonEntity commonEntity = new CommonEntity();
		commonEntity.setParameter("{list:" + sJson + "}");
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;		
	}
	
	
	/**
	 * 320 根据客户列表给出选择框
	 * 0011463
	 */
	public String getKeh(){
		String kehlist = this.getParam("kehlist");
		logger.info("kehlist--->"+kehlist);
		ArrayList list = new ArrayList();
		int i=0;
		String[] s = kehlist.split(",");
		for(i=0;i<s.length;i++)
		{
			//(name:"L45EK",value:"L45EK")
			list.add("{name:\""+s[i]+"\","+"value:\""+s[i]+"\"}");
		}
		// 拼Json串
		String sJson = JSONArray.fromObject(list).toString();
		CommonEntity commonEntity = new CommonEntity();
		commonEntity.setParameter("{list:" + sJson + "}");
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;		
	}		
		
}
