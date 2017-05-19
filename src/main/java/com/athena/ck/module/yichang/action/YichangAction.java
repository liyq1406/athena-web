package com.athena.ck.module.yichang.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;

import com.athena.authority.entity.LoginUser;
import com.athena.authority.util.AuthorityUtils;
import com.athena.ck.common.CKUtil;
import com.athena.ck.entity.common.CommonEntity;
import com.athena.ck.entity.yichang.Yic;
import com.athena.ck.entity.yichang.Yichang;
import com.athena.ck.entity.yichang.Zerzt;
import com.athena.ck.entity.yichang.Zhijbgd;
import com.athena.ck.entity.yichang.Zhijqd;
import com.athena.ck.module.common.service.CommonService;
import com.athena.ck.module.yichang.service.YichangService;
import com.athena.component.wtc.action.BaseWtcAction;
import com.athena.excore.template.DownLoadServices;
import com.athena.excore.template.export.ExportConstants;
import com.toft.core2.ToftConst;
import com.toft.core2.UserInfo;
import com.toft.core3.container.annotation.Component;
import com.toft.core3.container.annotation.Inject;
import com.toft.core3.container.core.ComponentDefinition;
import com.toft.mvc.annotaions.Param;
import com.toft.mvc.dispacher.ActionContext;

/**
 * <p>
 * Title:库内Action
 * </p>
 * <p>
 * Description:定义异常不合格相关页面动作处理
 * </p>
 * <p>
 * Copyright: Copyright (c) 2011
 * </p>
 * <p>
 * Company: 软通动力
 * </p>
 * 
 * @author 聂柳
 * @version v1.0
 * @date 2012-3-8
 */
@Component(scope = ComponentDefinition.SCOPE_PROTOTYPE)
public class YichangAction extends BaseWtcAction{
	
	public UserInfo getUserInfo(){
		return (UserInfo) getSessionAttribute(ToftConst.Toft_SessionKey_UserData);
	}
	
	@Inject
	private YichangService yichangService;
	@Inject
	private DownLoadServices  downloadServices = null;

	/**
	 * 401 异常消耗申报页面
	 * @return
	 * String
	 */
	public String yichangYm(){
		return "select";
	}
	
	/**
	 * 40101 异常消耗申报通过UC号查询
	 * @return 
	 */
	public String yichangUCx(){
		String transcode = "40101";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	/**
	 * 40111  根据用户中心、供应商编号、零件编号查询ckx_lingjgys标识
	 * @author 贺志国
	 * @date 2014-9-19
	 * @return String 标识biaos
	 */
	public String yichangBiaosOfGys(){
		Map<String,String> map=this.getParams();
		LoginUser loginUser = AuthorityUtils.getSecurityUser();
		map.put("usercenter", loginUser.getUsercenter());
		List<Map<String,String>> list = yichangService.selectGysBiaos(map);
		setResult("result", list);
		return  AJAX;
	}
	

	/**
	 * 40104异常消耗查询申报点 
	 * 
	 * @return 
	 */
	public String yichangshendb(){
		Map map=this.getParams();
		LoginUser loginUser = AuthorityUtils.getSecurityUser();
		map.put("usercenter", loginUser.getUsercenter());
		List<Yic> userCenterList = yichangService.selectshenbd(map);
		// 按指定的格式取数据
		ArrayList aList = new ArrayList();
		for (int i = 0; i < userCenterList.size(); i++) {
			Yic userCenter = userCenterList.get(i);
			aList.add("{name:\"" + userCenter.getShengbd() + "\",value:\""
					+ userCenter.getShengbd() + "\"}");
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
	 * 40103异常消耗申报新增异常消耗单数据
	 * @return 
	 */
	public String yichangINSERTx(){
		String transcode = "40103";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	
	/**
	 * 433 异常消耗申报页面
	 * @author 贺志国
	 * @date 2014-9-18
	 * @return String
	 */
	public String yichangMainPage(){
		return "select";
	}

	/**
	 * 43303异常消耗申报新增异常消耗单数据
	 * @author 贺志国
	 * @date 2014-9-19
	 * @return String
	 */
	public String yichangINSERTxhd(){
		String transcode = "43303";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	
	
	/**
	 * 402 异常消耗申报取消页面
	 * @return
	 * String
	 */
	public String yichangquxiaoYm(){
		return "select";
	}
	
	/**
	 * 40201异常消耗申报取消查询
	 * @return 
	 */
	public String yichangselectx(){
		String transcode = "40201";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	
	/**
	 * 40202异常消耗申报取消
	 * @return 
	 */
	public String yichangquxx(){
		String transcode = "40202";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	/**
	 * 403 异常消耗申报查询页面
	 * @return
	 * String
	 */
	public String yichangsreachYm(){
		return "select";
	}
	
	/**
	 * 40301异常消耗申报取消
	 * @return 
	 */
	public String yichangsrechx(){
		String transcode = "40301";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	
	/**
	 * 40302异常消耗申报明细
	 * @return 
	 */
	public String yichangmingxi(){
		String transcode = "40302";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	
	public String tiaozycxh(){
		JSONObject obj = JSONObject.fromObject(this.getParam("putvalue"));
		setRequestAttribute("result", obj);
		return "select";
	}
	
	/**
	 * 404 异常消耗质检维护页面
	 * @return
	 * String
	 */
	public String yichangzhijwhYm(){
		return "select";
	}
	
	/**
	 * 40401异常消耗质检维护查询
	 * @return 
	 */
	public String yichangzhijwhsrechx(){
		String transcode = "40401";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	/**
	 * 40402异常消耗质检维护新增
	 * @return 
	 */
	public String yichangzhijwhinsertx(){
		String transcode = "40402";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 40403异常消耗质检维护随废新增
	 * @return 
	 */
	public String yichangsuifinsertx(){
		String transcode = "40403";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 40404异常消耗质检维护回车回显
	 * @return 
	 */
	public String yichanghuichxx(){
		String transcode = "40404";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 40405异常消耗质检维护删除
	 * @return 
	 */
	public String yichanghuichdelete(@Param("list") ArrayList<Yic> list) {
		String transcode = "40405";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	

	
	
	
	/**
	 * 405 异常消耗质检结果取消页面
	 * @return
	 * String
	 */
	public String yichangquxYm(){
		return "select";
	}
	
	/**
	 * 40501异常消耗质检结果取消查询
	 * @return 
	 */
	public String yichangquxsrechx(){
		String transcode = "40501";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	/**
	 * 40502异常消耗质检结果取消
	 * @return 
	 */
	public String yichangquxinsertx(){
		String transcode = "40502";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	
	
	
	/**
	 * 406 异常消耗质检结果修改页面
	 * @return
	 * String
	 */
	public String yichangupdateYm(){
		return "select";
	}
	
	/**
	 * 40601异常消耗质检结果修改查询
	 * @return 
	 */
	public String yichangupdatesrechx(){
		String transcode = "40601";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	/**
	 * 40602异常消耗质检结果增加随废
	 * @return 
	 */
	public String yichangupdateliebx(){
		String transcode = "40602";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 40603异常消耗质检结果修改文本框
	 * @return 
	 */
	public String yichangupdatewenbkx(){
		String transcode = "40603";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 40604异常消耗质检维护删除
	 * @return 
	 */
	public String yichangupdateuch(){
		String transcode = "40604";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 40605异常消耗质检维护删除
	 * @return 
	 */
	public String yichangupdatedelete(@Param("list") ArrayList<Yic> list) {
		String transcode = "40605";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	
	
	
	
	/**
	 * 407 不合格品返修查询页面
	 * @return
	 * String
	 */
	public String buhgpfxcx(){
		return "select";
	}
	
	/**
	 * 40701不合格品返修查询查询
	 * @return 
	 */
	public String buhgpfxcxsearch(){
		String transcode = "40701";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	/**
	 * 40702不合格品返修查询查看
	 * @return 
	 */
	public String buhgpfxcxinfo(){
		String transcode = "40702";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	public String buhgpdxrkchakan(){
		JSONObject obj = JSONObject.fromObject(this.getParam("putvalue"));
		setRequestAttribute("result", obj);
		return "select";
	}
	

	/**
	 * 436不合格品返修入库撤销查询页面
	 * @return
	 * String
	 */
	public String buhgpfxrkcxcx(){
		return "select";
	}
	
	/**
	 * 43601不合格品返修入库撤销查询查询
	 * @return 
	 */
	public String buhgpfxrkcxsearch(){
		String transcode = "43601";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	/**
	 * 43602不合格品返修入库撤销查询查看
	 * @return 
	 */
	public String buhgpfxrkcxinfo(){
		String transcode = "43602";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	public String buhgpfxrkcxchakan(){
		JSONObject obj = JSONObject.fromObject(this.getParam("putvalue"));
		setRequestAttribute("result", obj);
		return "select";
	}
	
	
	/**
	 * 408 质检库内质检打印清单页面
	 * @return
	 * String
	 */
	public String yichangzhijYm(){
		return "select";
	}
	/**
	 * 40801质检库内质检打印清单查询
	 * @return 
	 */
	public String yichangzhijsrechx(){
		String transcode = "40801";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	/**
	 * 40802质检库内质检打印清单打印
	 * @return 
	 */
	public String yichangzhijdayinx(@Param("list") ArrayList<Yic> list) {
		String transcode = "40802";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	/**
	 * 40805质检清单打印
	 * @return 
	 */
	public String zhijqdPrint(){
		Map map = this.getParams();
		//查询质检清单
		List<Zhijqd> list = yichangService.selectZhijqd(map);
		//转换成Json
		JSONArray jsonArray = new JSONArray();
		if (list.size() > 0){
			long xuh = 1;
			String strZHIJQDH = "";
			JSONObject jsonObj = new JSONObject();
			for(int i=0; i<list.size(); i++){
				if (!list.get(i).getZhijqdh().equals(strZHIJQDH)){
					jsonObj = new JSONObject();
					//添加主表数据
					jsonObj.put("barcode",list.get(i).getZhijqdh());
					jsonObj.put("ZHIJQDH",list.get(i).getZhijqdh());
					jsonObj.put("ZHIJZ",list.get(i).getZhijz());
					jsonObj.put("CANGKBH",list.get(i).getCangkbh());
					//jsonObj.put("ZICKBH",list.get(0).getZickbh());
					jsonObj.put("DAYRQ",list.get(i).getDayrq());
					jsonObj.put("DAYSJ",list.get(i).getDaysj());
					//添加明细列表数据
					jsonObj.put("XUH",new JSONArray());
					jsonObj.put("ELH",new JSONArray());
					jsonObj.put("PICH",new JSONArray());
					jsonObj.put("BLH",new JSONArray());
					jsonObj.put("USH",new JSONArray());
					jsonObj.put("LINGJBH",new JSONArray());
					jsonObj.put("LINGJMC",new JSONArray());
					jsonObj.put("LINGJSL",new JSONArray());
					jsonObj.put("GONGYSDM",new JSONArray());
					jsonObj.put("GONGYSMC",new JSONArray());
					jsonObj.put("ZICKBH",new JSONArray());
					jsonObj.put("KUWBH",new JSONArray());
					jsonObj.put("HEGSL",new JSONArray());
					jsonObj.put("BUHGSL",new JSONArray());
					//存放数据
					strZHIJQDH = list.get(i).getZhijqdh();
					xuh = 1;
				} 
				//添加明细列表数据
				((JSONArray)jsonObj.get("XUH")).add(xuh);
				((JSONArray)jsonObj.get("ELH")).add(list.get(i).getElh());
				((JSONArray)jsonObj.get("PICH")).add(list.get(i).getPich());
				((JSONArray)jsonObj.get("BLH")).add(list.get(i).getBlh());
				((JSONArray)jsonObj.get("USH")).add(list.get(i).getUsh());
				((JSONArray)jsonObj.get("LINGJBH")).add(list.get(i).getLingjbh());
				((JSONArray)jsonObj.get("LINGJMC")).add(list.get(i).getLingjmc());
				((JSONArray)jsonObj.get("LINGJSL")).add(list.get(i).getLingjsl());
				((JSONArray)jsonObj.get("GONGYSDM")).add(list.get(i).getGongysdm());
				((JSONArray)jsonObj.get("GONGYSMC")).add(list.get(i).getGongysmc());
				((JSONArray)jsonObj.get("ZICKBH")).add(list.get(i).getZickbh());
				((JSONArray)jsonObj.get("KUWBH")).add(list.get(i).getKuwbh());
				((JSONArray)jsonObj.get("HEGSL")).add("");
				((JSONArray)jsonObj.get("BUHGSL")).add("");
				xuh++ ;
				//存放最终数据
				if(list.size() == (i+1) || !list.get(i+1).getZhijqdh().equals(strZHIJQDH)){
					jsonArray.add(jsonObj);
				}
			}
		}
		//System.out.println(jsonArray.toString());
		setResult("result", jsonArray);
		return AJAX;
	}
	
	/*
	 * 质检清单导出
	 */
	public String zhijqdExport(){
		//拼装查询条件
		Map map = this.getParams();
		map.put("usercenter", AuthorityUtils.getSecurityUser().getUsercenter());
		map.put("zhijqdh", "'"+ map.get("zhijqdh").toString().trim() +"'" );
		//查询质检清单
		List<Zhijqd> list = yichangService.selectZhijqd(map);
		//转换数据格式
		List<Map<String, Object>> listMap = new ArrayList<Map<String,Object>>();
		for (Zhijqd item : list) {
			Map<String,Object> mapData = new HashMap<String, Object>();
			mapData.put("zhijqdh",item.getZhijqdh());
			mapData.put("cangkbh",item.getCangkbh()+item.getZickbh());
			mapData.put("ush",item.getUsh());
			mapData.put("lingjbh",item.getLingjbh());
			mapData.put("lingjmc",item.getLingjmc());
			mapData.put("lingjsl",item.getLingjsl());
			mapData.put("elh",item.getElh());
			mapData.put("zhijlx",CKUtil.getBundleValue("C4_ZJLX_"+item.getZhijlx(), null));
			mapData.put("blh",item.getBlh());
			mapData.put("pich",item.getPich());
			mapData.put("zhijz",item.getZhijz());
			mapData.put("zhijy",item.getZhijy());
			mapData.put("gongysdm",item.getGongysdm());
			mapData.put("gongysmc",item.getGongysmc());
			listMap.add(mapData);
		}
		//数据源
		Map<String, Object> dataSource = new HashMap<String, Object>();
		dataSource.put("date", CKUtil.getSysDate());
		String colunm[] = {"质检单","仓库号","US号","零件编号","零件名称","零件数量","EL号","质检单类型","交货单号","批次号","质检组","质检员","供应商编号","供应商名称"};
		dataSource.put("colunm", colunm);
		dataSource.put("list", listMap);
		//拿到response对象
		HttpServletResponse response = ActionContext.getActionContext().getResponse() ;
		//设置下载 (0为文本，1为Excel)
		if (map.get("daoclx").toString().equals("0")){  
			downloadServices.downloadFile("Zhijqd.ftl", dataSource, response, "质检零件", ExportConstants.FILE_TXT, false);
		} else {
			downloadServices.downloadFile("ZhijqdXls.ftl", dataSource, response, "质检零件", ExportConstants.FILE_XLS, false);
		}
		//返回类型一定要是download类型的
		return "downLoad";
	}
	
	
	/**
	 * 409 质检挑检返修打印清单页面
	 * @return
	 * String
	 */
	public String yichangtiaojYm(){
		return "select";
	}
	/**
	 * 40901质检挑检返修打印清单查询
	 * @return 
	 */
	public String yichangtiaojsrechx(){
		String transcode = "40901";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	/**
	 * 40902质检挑检返修打印清单确认
	 * @return 
	 */
	public String yichangtiaojdayinx(@Param("list") ArrayList<Yic> list) {
		String transcode = "40902";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	/**
	 * 40903质检挑检返修打印清单打印
	 * @return 
	 */
	public String yichangtiaojquerx(){
		String transcode = "40903";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}

	
	
	/**
	 * 410 质检正常零件进行库内质检页面
	 * @return
	 * String
	 */
	public String yichanglingjYm(){
		return "select";
	}
	/**
	 * 41001质检正常零件进行库内质检查询
	 * @return 
	 */
	public String yichanglingjsrechx(){
		String transcode = "41001";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	/**
	 * 41002质检正常零件进行库内质检确认
	 * @return 
	 */
	public String yichanglingjdayinx(@Param("list") ArrayList<Yic> list) {
		String transcode = "41002";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 41003质检正常零件进行库内质检打印
	 * @return 
	 */
	public String yichanglingjquerx(){
		String transcode = "41003";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	
	
	/**
	 * 411 质检数据查询页面
	 * @return
	 * String
	 */
	public String zhijsjcx(){
		return "select";
	}
	/**
	 * 41101  质检数据查询详细页面
	 * @return
	 * String
	 */
	public String zhijxiangxi(){
		JSONObject obj = JSONObject.fromObject(this.getParam("putvalue"));
		setRequestAttribute("result", obj);
		return "select";
	}
	/**
	 * 41102  　质检技术报告清单详细页面
	 * @return
	 * String
	 */
	public String zhijjsbgqd(){
		JSONObject obj = JSONObject.fromObject(this.getParam("putvalue"));
		setRequestAttribute("result", obj);
		return "select";
	}
	/**
	 * 41101质检数据查询
	 * @return 
	 */
	public String zhijsjcxsearch(){
		String transcode = "41101";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	/**
	 * 41102质检数据查询修改
	 * @return 
	 */
	public String zhijsjcxupate(){
		String transcode = "41102";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 41103质检数据查询确定
	 * @return 
	 */
	public String zhijsjcxok(){
		String transcode = "41103";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 41104质检数据查询打印
	 * @return 
	 */
	public String zhijsjcxprint(){
		String transcode = "41104";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 41105质检数据查询删除
	 * @return 
	 */
	public String zhijsjcxdelete(@Param("list") ArrayList<Yic> list){
		String transcode = "41105";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 41106质检数据查询删除
	 * @return 
	 */
	public String zhijsjcxdeleteym(@Param("list") ArrayList<Yic> list){
		String transcode = "41106";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 41107质检数据查询结束
	 * @return 
	 */
	public String zhijsjcxover(@Param("list") ArrayList<Yic> list){
		String transcode = "41107";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	/**
	 * 41108质检报告单打印
	 * @return 
	 */
	public String zhijbgdPrint(){
		Map map = this.getParams();
		//查询质检报告单
		List<Zhijbgd> list = yichangService.selectZhijbgd(map);
		//转换成Json
		JSONArray jsonArray = new JSONArray();
		if (list.size() > 0){
			for(int i=0; i<list.size(); i++){
				JSONObject jsonObj = new JSONObject();
				jsonObj.put("barcode",list.get(i).getZhijjjbgdh());
				jsonObj.put("ZHIJJJBGDH",list.get(i).getZhijjjbgdh());
				jsonObj.put("CANGKBH",list.get(i).getCangkbh());
				jsonObj.put("ZICKBH",list.get(i).getZickbh());
				jsonObj.put("ZHIJQDH",list.get(i).getZhijqdh());
				jsonObj.put("ELH",list.get(i).getElh());
				jsonObj.put("LINGJBH",list.get(i).getLingjbh());
				jsonObj.put("LINGJMC",list.get(i).getLingjmc());
				jsonObj.put("LINGJSL",list.get(i).getLingjsl());
				jsonObj.put("ZHIJSL",list.get(i).getZhijsl());
				jsonObj.put("GONGYSDM",list.get(i).getGongysdm());
				jsonObj.put("GONGYSMC",list.get(i).getGongysmc());
				jsonObj.put("PICH",list.get(i).getPich());
				jsonObj.put("SHIXQ",list.get(i).getShixq());
				jsonObj.put("HEGSL",list.get(i).getHegsl());
				jsonObj.put("BUHGSL",list.get(i).getBuhgsl());
				String zerzt=list.get(i).getZherzt();
				String zerzt1="";
				if(zerzt!=null){
					Map<String, String> paramMap = new HashMap<String, String>();
					paramMap.put("zhijqdh", jsonObj.getString("ZHIJQDH"));
					paramMap.put("elh", jsonObj.getString("ELH"));
					paramMap.put("zerzt", zerzt);
					List<Zhijbgd> list1 = yichangService.selectZrztmc(paramMap);
					if(list1.size() > 0){
						zerzt1 = list1.get(0).getZrztmc();
					}
				}
				jsonObj.put("ZHERZT",zerzt1);
				jsonObj.put("ZERZTDM",list.get(i).getZerztdm());
				jsonObj.put("YUANY",list.get(i).getYuany());
				LoginUser loginUser = AuthorityUtils.getSecurityUser();
				jsonObj.put("ZHIJY", loginUser.getUsername());
				jsonObj.put("ZHIJZ",list.get(i).getZhijz());
				jsonObj.put("ZHIDH",list.get(i).getZhidh());
				jsonObj.put("PANDSJ",list.get(i).getPandsj());
				jsonArray.add(jsonObj.toString());
			}
		}
		//System.out.println(jsonArray.toString());
		setResult("result", jsonArray);
		return AJAX;
	}
	
	
	/**
	 * 412 质检技术报告查询页面
	 * @return
	 * String
	 */
	public String zhijjsbg(){
		return "select";
	}
	/**
	 * 41201质检技术报告查询查询
	 * @return 
	 */
	public String zhijjsbgsrech(){
		String transcode = "41201";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	/**
	 * 41202质检技术报告查询查看
	 * @return 
	 */
	public String zhijjsbglook(){
		String transcode = "41202";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 4120202质检技术报告查询详细页面
	 * @return
	 * String
	 */
	public String zhijjsbgxx(){
		JSONObject obj = JSONObject.fromObject(this.getParam("putvalue"));
		setRequestAttribute("result", obj);
		return "select";
	}
	
	
	
	
	
	/**
	 * 413 质检技术报告单修改页面
	 * @return
	 * String
	 */
	public String zhijjsbgdupdate(){
		return "select";
	}
	/**
	 * 41301质检技术报告单修改查询
	 * @return 
	 */
	public String zhijjsbgdupdatesrech(){
		String transcode = "41301";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	/**
	 * 41302质检技术报告单修改
	 * @return 
	 */
	public String zhijjsbgdu(){
		String transcode = "41302";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 41303质检技术报告单确定
	 * @return 
	 */
	public String zhijjsbgdupdateok(){
		String transcode = "41302";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	
	
	/**
	 * 414 不合格品入库页面
	 * @return
	 * String
	 */
	public String buhgprk(){
		return "select";
	}
	/**
	 * 41401不合格品入库查询
	 * @return 
	 */
	public String buhgprksrech(){
		String transcode = "41401";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	/**
	 * 41402不合格品入库确认
	 * @return 
	 */
	public String buhgprkok(@Param("list") ArrayList<Yichang> list){
		String transcode = "41402";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 41403不合格品入库打印
	 * @return 
	 */
	public String buhgprkprint(){
		String transcode = "41403";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	
	
	
	
	/**
	 * 415 不合格品入库撤销页面
	 * @return
	 * String
	 */
	public String buhgprkcx(){
		return "select";
	}
	/**
	 * 41501不合格品入库撤销查询
	 * @return 
	 */
	public String buhgprkcxsrech(){
		String transcode = "41501";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	/**
	 * 41502不合格品入库撤销
	 * @return 
	 */
	public String buhgprkcxok(@Param("list") ArrayList<Yic> list){
		String transcode = "41502";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	/**
	 * 416 不合格品返修页面
	 * @return
	 * String
	 */
	public String buhgpfx(){
		return "select";
	}
	/**
	 * 41601不合格品退供应商查询
	 * @return 
	 */
	public String buhgpfxsreach(){
		String transcode = "41601";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	/**
	 * 41601不合格品退供应商确认
	 * @return 
	 */
	public String buhgpfxok(@Param("list") ArrayList<Yichang> list){
		String transcode = "41602";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 41603不合格品退供应商确认
	 * @return 
	 */
	public String buhgpfxprint(){
		String transcode = "41603";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 41604不合格品退供应商确认
	 * @return 
	 */
	public String buhgpfxinclue(){
		String transcode = "41604";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	
	/**
	 * 417 不合格品退供应商页面
	 * @return
	 * String
	 */
	public String buhgptgys(){
		return "select";
	}
	/**
	 * 41701不合格品退供应商查询
	 * @return 
	 */
	public String buhgptgyssreach(){
		String transcode = "41701";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	/**
	 * 41702不合格品退供应商修改
	 * @return 
	 */
	public String buhgptgysupdate(@Param("list") ArrayList<Yichang> list){
		String transcode = "41702";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 41703不合格品退供应商确认
	 * @return 
	 */
	public String buhgptgysprint(){
		String transcode = "41703";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 41704不合格品退供应商确认
	 * @return 
	 */
	public String buhgptgysinclue(){
		String transcode = "41704";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	
	/**
	 * 418 不合格品退供应商撤销页面
	 * @return
	 * String
	 */
	public String buhgptgyscx(){
		return "select";
	}
	/**
	 * 41801不合格品退供应商撤销查询
	 * @return 
	 */
	public String buhgptgyscxsreach(){
		String transcode = "41801";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	/**
	 * 41802不合格品退供应商撤销
	 * @return 
	 */
	public String buhgptgyscxcx(@Param("list") ArrayList<Yic> list){
		String transcode = "41802";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	/**
	 * 41803不合格品退供应商明细
	 * @return 
	 */
	public String buhgspmx(@Param("list") ArrayList<Yic> list){
		String transcode = "41803";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 跳转到41803页面
	 */
	public String tiaozmx() {
		JSONObject obj = JSONObject.fromObject(this.getParam("putvalue"));
		setRequestAttribute("result", obj);
		return "select";
	}
	
	
	/**
	 * 419 不合格品返修入库页面
	 * @return
	 * String
	 */
	public String buhgpdxrk(){
		return "select";
	}
	/**
	 * 41901不合格品返修入库查询
	 * @return 
	 */
	public String buhgpdxrksreach(){
		String transcode = "41901";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	/**
	 * 41902不合格品返修入库 修改
	 * @return 
	 */
	public String buhgpdxrktz(@Param("list") ArrayList<Yic> list){
		String transcode = "41902";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	public String buhgpdxrkupdate(){
		JSONObject obj = JSONObject.fromObject(this.getParam("putvalue"));
		setRequestAttribute("result", obj);
		return "select";
	}
	/**
	 * 41903不合格品返修入库打印
	 * @return 
	 */
	public String buhgpdxrkprint(){
		String transcode = "41903";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	/**
	 * 41903不合格品返修入库打印
	 * @return 
	 */
	public String buhgpdxrkprintt(){
		String transcode = "41904";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 41905不合格品返修入库打印
	 * @return 
	 */
	public String buhgpdxrktzz(){
		String transcode = "41905";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 41905不合格品返修入库跳转到原页面
	 * @return 
	 */
	public String buhgpdxrkytz(){
		JSONObject obj = JSONObject.fromObject(this.getParam("putvalue"));
		setRequestAttribute("result", obj);
		return "select";
	}

	
	
	
	
	/**
	 * 420 不合格品销毁清单页面
	 * @return
	 * String
	 */
	public String buhgpxhqd(){
		return "select";
	}
	/**
	 * 42001不合格品返修入库查询
	 * @return 
	 */
	public String buhgpxhqdsreach(){
		String transcode = "42001";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	/**
	 * 42002不合格品返修入库 修改
	 * @return 
	 */
	public String buhgpxhqdupdate(@Param("list") ArrayList<Yic> list){
		String transcode = "42002";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 42003不合格品返修入库打印
	 * @return 
	 */
	public String buhgpxhqdprint(){
		String transcode = "42003";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 42004不合格品返修入库回车
	 * @return 
	 */
	public String buhgpxhqdhc(){
		String transcode = "42004";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	
	
	
	
	
	/**
	 * 421 不合格品销毁清单查询修改页面
	 * @return
	 * String
	 */
	public String buhgpxhqdcxxg(){
		return "select";
	}
	/**
	 * 42101不合格品销毁清单查询修改查询
	 * @return 
	 */
	public String buhgpxhqdcxxgsreach(){
		String transcode = "42101";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	/**
	 * 42102不合格品销毁清单查询修改删除
	 * @return 
	 */
	public String buhgpxhqdcxxgdelete(@Param("list") ArrayList<Yic> list){
		String transcode = "42102";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 42103不合格品销毁清单查询修改
	 * @return 
	 */
	public String buhgpxhqdcxxgupdate(){
		String transcode = "42103";
		Map map = this.getParams();
	 	setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	
	
	/**
	 * 422 不合格品销毁清单撤销页面
	 * @return
	 * String
	 */
	public String buhgpxhqdcx(){
		return "select";
	}
	/**
	 * 42201不合格品销毁清单撤销查询
	 * @return 
	 */
	public String buhgpxhqdcxsreach(){
		String transcode = "42201";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	/**
	 * 42202不合格品销毁清单撤销 撤销
	 * @return 
	 */
	public String buhgpxhqdcxdelete(){
		String transcode = "42202";
		Map map = this.getParams();
	 	setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	
	
	
	/**
	 * 423 不合格品销毁确认页面
	 * @return
	 * String
	 */
	public String buhgpxhqr(){
		return "select";
	}
	/**
	 * 42301不合格品销毁确认查询
	 * @return 
	 */
	public String buhgpxhqrsreach(){
		String transcode = "42301";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	/**
	 * 42302不合格品销毁确认确认
	 * @return 
	 */
	public String buhgpxhqrok(){
		String transcode = "42302";
		Map map = this.getParams();
	 	setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 42303不合格品销毁确认修改
	 * @return 
	 */
	public String buhgpxhqrupdate(){
		String transcode = "42303";
		Map map = this.getParams();
	 	setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 42304不合格品销毁确认修改
	 * @return 
	 */
	public String buhgpxhqrprint(){
		String transcode = "42304";
		Map map = this.getParams();
	 	setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	
	
	/**
	 * 424 不合格品销毁确认撤消页面
	 * @return
	 * String
	 */
	public String buhgpxhqrcx(){
		return "select";
	}
	/**
	 * 42401不合格品销毁确认撤消查询
	 * @return 
	 */
	public String buhgpxhqrcxsreach(){
		String transcode = "42401";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	/**
	 * 42402不合格品销毁确认撤消撤销
	 * @return 
	 */
	public String buhgpxhqrcxdelete(){
		String transcode = "42402";
		Map map = this.getParams();
	 	setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 425 正常质检零件解冻页面
	 * @return
	 * String
	 */
	public String chengptcx(){
		return "select";
	}
	/**
	 * 42501正常质检零件解冻查询
	 * @return 
	 */
	public String chengptcxsrechx(){
		String transcode = "42501";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	/**
	 * 42502正常质检零件解冻
	 * @return 
	 */
	public String chengptcxxx(@Param("list") ArrayList<Yic> list) {
		String transcode = "42502";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	
	/**
	 * 426 正常质检零件解冻页面
	 * @return
	 * String
	 */
	public String yichangjiedYm(){
		return "select";
	}
	/**
	 * 42601正常质检零件解冻查询
	 * @return 
	 */
	public String yichangjiedsrechx(){
		String transcode = "42601";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	/**
	 * 42602正常质检零件解冻
	 * @return 
	 */
	public String yichangjieddayinx(@Param("list") ArrayList<Yic> list) {
		String transcode = "42602";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 427 不合格品属性管理撤销 
	 * @return
	 * String
	 */
	public String buhgpsxglcx(){
		return "select";
	}
	/**
	 * 42701 不合格品属性管理撤销查询 
	 * @return 
	 */
	public String buhgpsxglcxsearch(){
		String transcode = "42701";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	
	/**
	 * 42702 不合格品属性管理撤销查询 
	 * @return 
	 */
	public String buhgpsxglcxchex(){
		String transcode = "42702";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 428 不合格成品质检判断撤销
	 * @return
	 * String
	 */
	public String buhgcpzjpdcx(){
		return "select";
	}
	
	/**
	 * 429 不合格品未入不合品库查询页面
	 * @return
	 * String
	 */
	public String buhgpwrbhpk(){
		return "select";
	}
	/**
	 * 42901不合格品未入不合品库查询
	 * @return 
	 */
	public String buhgpwrbhpksrech(){
		String transcode = "42901";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	
	
	
	
	/**
	 * 430 不合格品属性管理页面
	 * @return
	 * String
	 */
	public String buhgpsxgl(){
		return "select";
	}
	/**
	 * 43001不合格品属性管理查询
	 * @return 
	 */
	public String buhgpsxglsearch(){
		String transcode = "43001";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	/**
	 * 43002不合格品属性管理修改 
	 * @return 
	 */
	public String buhgpsxglupdate(){
		String transcode = "43002";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 43003不合格品属性管理
	 * @return 
	 */
	public String buhgpsxgltj(@Param("list") ArrayList<Yic> list) {
		String transcode = "43003";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	
	
	/**
	 * 431 不合格成品质检判断页面
	 * @return
	 * String
	 */
	public String buhgpzjpd(){
		return "select";
	}
	/**
	 * 43101不合格成品质检判断查询
	 * @return 
	 */
	public String buhgpzjpdsearch(){
		String transcode = "43101";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	/**
	 * 43102不合格成品质检判断修改 
	 * @return 
	 */
	public String buhgpzjpdupdate(){
		String transcode = "43102";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 43103不合格品属性管理
	 * @return 
	 */
	public String buhgpzjpdtj(@Param("list") ArrayList<Yic> list) {
		String transcode = "43103";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	
	
	
	/**
	 * 432 质检清单的查询页面
	 * @return
	 * String
	 */
	public String zhijqdcx(){
		return "select";
	}
	/**
	 * 43201不合格成品质检判断查询
	 * @return 
	 */
	public String zhijqdcxsearch(){
		String transcode = "43201";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	/**
	 * 43202质检清单的查询详细页面 
	 * @return 
	 */
	public String zhijqdcxxx(){
		String transcode = "43202";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	/**
	 * 434  huxy_11462
	 * @return 
	 */
	public String kunljzczj(){
		return "select";
	}
	public String zhijljxhsel(){
		String transcode = "43401";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	public String zhijljxhqr(@Param("list") ArrayList<Yic> list){
		String transcode = "43402";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	/**
	 * 435  huxy_11467
	 * @return 
	 */
	public String buhgpfxrkcx(){
		return "select";
	}
	
	public String buhgpfxrkcxSel(){
		String transcode = "43501";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	public String buhgpfxrkcxQr(@Param("list") ArrayList<Yic> list){
		String transcode = "43502";
		Map map = this.getParams();
		//huxy_11467
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	public String zhijqdcxxiangxi(){
		JSONObject obj = JSONObject.fromObject(this.getParam("putvalue"));
		setRequestAttribute("result", obj);
		return "select";
	}
	/**
	 * 查询责任主体代码
	 */
	public  String   queryZrzt(){
	  ArrayList list = new ArrayList();
	  Map  map = this.getParams();
	  LoginUser loginUser = AuthorityUtils.getSecurityUser();
	  map.put("usercenter", loginUser.getUsercenter());
	  String zerztdm = (String) map.get("zerztdm");
	  String zerzt = (String) map.get("zerzt");
	  String flag = (String) map.get("flag");
	  if(null != zerzt || !"".equals(zerzt)){
		  if(null != flag && !"".equals(flag)){
				list.add("{name:\"" + flag + "\",value:\""+ flag + "\"}");  
			}
			List<Zerzt> zdList  = yichangService.querZerzt(map);
			// 赋值
			for (int i = 0; i < zdList.size(); i++) {
				Zerzt zrzt = zdList.get(i);
				list.add("{name:\"" +zrzt.getZrztdm() + "\",value:\""
						+ zrzt.getZrztdm() + "\"}");
			} 
	  }else {
		list.add("{name:\"" + zerztdm + "\",value:\""+ zerztdm + "\"}");  
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
	 * 查询责任主体名称
	 */
	public String queryZerztmc(){
		 Map  map = this.getParams();
		 LoginUser loginUser = AuthorityUtils.getSecurityUser();
		 map.put("usercenter", loginUser.getUsercenter());
		 List<Zerzt> list  = yichangService.querZerzt(map);
		 String strResponse;
			String zerztmc="";
			if(list.size()==0 || null== list.get(0).getZrztmc()){
				strResponse = "C_ZRZTMCCW";
			}else{
				strResponse = "0001";
				zerztmc=list.get(0).getZrztmc();
			}
			//String jsonList = JSONSerializer.toJSON(list).toString();
			CommonEntity commonEntity=new CommonEntity();
			commonEntity.setParameter("{zerztmc:\""+zerztmc+"\"}");
			commonEntity.setResponse(strResponse);
			JSONObject obj = JSONObject.fromObject(commonEntity);
			setResult("result", obj);
			  return  AJAX;	 
		
	}
}
