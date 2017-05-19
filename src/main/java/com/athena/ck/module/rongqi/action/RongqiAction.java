package com.athena.ck.module.rongqi.action;

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

import com.athena.ck.entity.rongqi.Kongq;
import com.athena.ck.entity.rongqi.RongQiPring_634;
import com.athena.ck.entity.rongqi.Rongqfh;
import com.athena.ck.entity.rongqi.Rongqdbd;
import com.athena.ck.entity.rongqi.Rongqdj;
import com.athena.ck.entity.rongqi.Rongqjs;
import com.athena.ck.entity.rongqi.Rongqwx;
import com.athena.ck.entity.rongqi.Rongqixh;
import com.athena.ck.entity.rongqi.Rongqzwls;
import com.athena.ck.entity.rongqi.rongqzdjgd;
import com.athena.ck.module.rongqi.service.RongqiService;
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
 * Title:库内Action
 * </p>
 * <p>
 * Description:定义库内相关页面动作处理
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
 * @date 2012-3-6
 */
@Component(scope = ComponentDefinition.SCOPE_PROTOTYPE)
public class RongqiAction extends BaseWtcAction {
	
	public UserInfo getUserInfo(){
		return (UserInfo) getSessionAttribute(ToftConst.Toft_SessionKey_UserData);
	}
	
	//log4j日志初始化
	private final Log log = LogFactory.getLog(RongqiAction.class); 
	/**
	 * 注入BeihckService
	 */
	@Inject
	private RongqiService rongqiService;
	
	/**
	 * 注入downloadsevices
	 */
	@Inject
	private DownLoadServices downloadServices = null;
	
	/**
	 * 601 投入容器入库页面
	 * @return
	 * String
	 */
	public String rongqiYm(){
		return "select";
	}
	
	/**
	 * 60101 投入容器入库新增提交
	 * @return 
	 */
	public String rongqirkTj() {
		String transcode = "60101";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	/**
	 * 60102投入容器入库列表
	 * @return 
	 */
	public String rongqirklb(@Param("list") ArrayList<Kongq> list) {
		String transcode = "60102";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 60103 投入容器入库新增分页
	 * @return 
	 */
	public String rongqirkTjfy() {
		String transcode = "60103";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 60103 投入容器入库新增分页
	 * @return 
	 */
	public String rongqiDAYFW() {
		String transcode = "60104";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 60104 容器接收单打印
	 * @return
	 */
	public String rongqjsdDy() {
		Map<String,String> map = this.getParams();
		//接收返回单号
		//String jsfhdh = map.get("jsfhdh");
		printRongqjsd(map);
		return AJAX;
	}
	/**
	 * 打印容器接收单601
	 */
	private void printRongqjsd(Map map) {
		String danjlx=(String) map.get("danjlx");
		if(danjlx.equals("1")){
			// 根据接收单号查询容器接收单
			List<Rongqjs> list = rongqiService.getRongqjsd(map);
			//System.out.println(list.size());
			// 创建Json对象
			JSONArray jsonArray = new JSONArray();
			JSONObject jsonBody = new JSONObject();
			if (list.size() > 0){
				Rongqjs beanHead = list.get(0);
				//条形码
				jsonBody.put("barcode",beanHead.getJsfhdh());
				//单号
				jsonBody.put("DANH",beanHead.getJsfhdh());
				String datetime = beanHead.getEdit_time();
				String riq = beanHead.getJiesrq().split(" ")[0];
				String shij = beanHead.getJiesrq().split(" ")[1];
				if (datetime != null){
					String[] times = datetime.split(" ");
					if (times.length == 2){
						riq = times[0];
						shij = times[1];
					}
				}
				//日期
				jsonBody.put("RIQ",riq);
				//时间
				jsonBody.put("SHIJ",shij);
				//来源
				jsonBody.put("LAIY",beanHead.getZaiy());
				//车号
				jsonBody.put("CHEH",beanHead.getTch());
				//送货人
				jsonBody.put("SONGHR", beanHead.getSonghr());

				JSONArray jsArrayXuh = new JSONArray();
				JSONArray jsArrayRongqbm = new JSONArray();
				JSONArray jsArrayJiessl = new JSONArray();
				JSONArray jsArrayRongqye = new JSONArray();
				JSONArray jsArrayZhaiy = new JSONArray();
				// 容器接收单明细
				for (int i = 0; i < list.size(); i++) {
					Rongqjs beanBody = list.get(i);
					jsArrayXuh.add(i+1);
					jsArrayRongqbm.add(beanBody.getRongqxh());
					jsArrayJiessl.add(beanBody.getRongqsl());
					jsArrayRongqye.add(beanBody.getRongqye());
					jsArrayZhaiy.add("投入容器入库");
				}
				//序号
				jsonBody.put("XUH", jsArrayXuh);
				//容器编码
				jsonBody.put("RONGQBM", jsArrayRongqbm);
				//接收数量
				jsonBody.put("JIESSL", jsArrayJiessl);
				//容器余额
				jsonBody.put("RONGQYE", jsArrayRongqye);
				//摘要
				jsonBody.put("ZHAIY", jsArrayZhaiy);
				jsonArray.add(jsonBody);
			}
			String json = jsonArray.toString();
			log.info(json);
			//System.out.println(json);
			setResult("result", jsonArray);	
		}
		if(danjlx.equals("2")){
			// 根据接收单号查询容器接收单
			List<Rongqjs> list = rongqiService.getRongqjsd(map);
			//System.out.println(list.size());
			// 创建Json对象
			JSONArray jsonArray = new JSONArray();
			JSONObject jsonBody = new JSONObject();
			if (list.size() > 0){
				Rongqjs beanHead = list.get(0);
				//条形码
				jsonBody.put("barcode",beanHead.getJsfhdh());
				//单号
				jsonBody.put("DANH",beanHead.getJsfhdh());
				String datetime = beanHead.getEdit_time();
				String riq = beanHead.getJiesrq().split(" ")[0];
				String shij = beanHead.getJiesrq().split(" ")[1];
				if (datetime != null){
					String[] times = datetime.split(" ");
					if (times.length == 2){
						riq = times[0];
						shij = times[1];
					}
				}
				//日期
				jsonBody.put("RIQ",riq);
				//时间
				jsonBody.put("SHIJ",shij);
				//来源
				jsonBody.put("LAIY",beanHead.getZaiy());
				//车号
				jsonBody.put("CHEH",beanHead.getTch());
			
				JSONArray jsArrayXuh = new JSONArray();
				JSONArray jsArrayRongqbm = new JSONArray();
				JSONArray jsArrayJiessl = new JSONArray();
				JSONArray jsArrayRongqye = new JSONArray();
				JSONArray jsArrayZhaiy = new JSONArray();
				// 容器接收单明细
				for (int i = 0; i < list.size(); i++) {
					Rongqjs beanBody = list.get(i);
					jsArrayXuh.add(i+1);
					jsArrayRongqbm.add(beanBody.getRongqxh());
					jsArrayJiessl.add(beanBody.getRongqsl());
					jsArrayRongqye.add(beanBody.getRongqye());
					jsArrayZhaiy.add("容器返还");
				}
				//序号
				jsonBody.put("XUH", jsArrayXuh);
				//容器编码
				jsonBody.put("RONGQBM", jsArrayRongqbm);
				//接收数量
				jsonBody.put("JIESSL", jsArrayJiessl);
				//容器余额
				jsonBody.put("RONGQYE", jsArrayRongqye);
				//摘要
				jsonBody.put("ZHAIY", jsArrayZhaiy);
				jsonArray.add(jsonBody);
			}
			String json = jsonArray.toString();
			log.info(json);
			//System.out.println(json);
			setResult("result", jsonArray);	
		}
		if(danjlx.equals("3")){
			// 根据接收单号查询容器接收单
			List<Rongqjs> list = rongqiService.getRongqjsd(map);
			//System.out.println(list.size());
			// 创建Json对象
			JSONArray jsonArray = new JSONArray();
			JSONObject jsonBody = new JSONObject();
			if (list.size() > 0){
				Rongqjs beanHead = list.get(0);
				//条形码
				jsonBody.put("barcode",beanHead.getJsfhdh());
				//单号
				jsonBody.put("DANH",beanHead.getJsfhdh());
				String datetime = beanHead.getEdit_time();
				String riq = beanHead.getJiesrq().split(" ")[0];
				String shij = beanHead.getJiesrq().split(" ")[1];
				if (datetime != null){
					String[] times = datetime.split(" ");
					if (times.length == 2){
						riq = times[0];
						shij = times[1];
					}
				}
				//日期
				jsonBody.put("RIQ",riq);
				//时间
				jsonBody.put("SHIJ",shij);
				//来源
				jsonBody.put("LAIY",beanHead.getZaiy());
				//车号
				jsonBody.put("CHEH",beanHead.getTch());
			
				JSONArray jsArrayXuh = new JSONArray();
				JSONArray jsArrayRongqbm = new JSONArray();
				JSONArray jsArrayJiessl = new JSONArray();
				JSONArray jsArrayRongqye = new JSONArray();
				JSONArray jsArrayZhaiy = new JSONArray();
				// 容器接收单明细
				for (int i = 0; i < list.size(); i++) {
					Rongqjs beanBody = list.get(i);
					jsArrayXuh.add(i+1);
					jsArrayRongqbm.add(beanBody.getRongqxh());
					jsArrayJiessl.add(beanBody.getRongqsl());
					jsArrayRongqye.add(beanBody.getRongqye());
					jsArrayZhaiy.add("供应商容器接收");
				}
				//序号
				jsonBody.put("XUH", jsArrayXuh);
				//容器编码
				jsonBody.put("RONGQBM", jsArrayRongqbm);
				//接收数量
				jsonBody.put("JIESSL", jsArrayJiessl);
				//容器余额
				jsonBody.put("RONGQYE", jsArrayRongqye);
				//摘要
				jsonBody.put("ZHAIY", jsArrayZhaiy);
				jsonArray.add(jsonBody);
			}
			String json = jsonArray.toString();
			log.info(json);
			//System.out.println(json);
			setResult("result", jsonArray);	
		}		

	}
	
	
	
	/**
	 * 602 容器入库撤销页面
	 * @return
	 * String
	 */
	public String rongqrkcx(){
		return "select";
	}
	/**
	 * 60201 容器入库撤销查询
	 * @return 
	 */
	public String rongqrkcxsearch() {
		String transcode = "60201";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	/**
	 * 60202 容器入库撤销查看
	 * @return 
	 */
	public String rongqrkcxinfo() {
		String transcode = "60202";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 60203 容器入库撤销撤销
	 * @return 
	 */
	public String rongqrkcxchex(@Param("list") ArrayList<Kongq> list) {
		String transcode = "60203";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 60201容器入库撤销详细页面
	 * @return
	 * String
	 */
	public String rongqrkcxxx(){
		JSONObject obj = JSONObject.fromObject(this.getParam("putvalue"));
		setRequestAttribute("result", obj);
		return "select";
	}
	
	
	
	
	/**
	 * 603 空容器申报页面
	 * @return
	 * String
	 */
	public String kongrqsb(){
		return "select";
	}
	/**
	 * 60301 空容器申报确认
	 * @return 
	 */
	public String kongrqsbok() {
		String transcode = "60301";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 60302 容器入库撤销打印
	 * @return 
	 */
	public String kongrqsbprint() {
		String transcode = "60302";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 60302 容器入库撤销打印
	 * @return 
	 */
	public String kongrqsbdelete(@Param("list") ArrayList<Kongq> list) {
		String transcode = "60303";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	
	/**
	 * 60401 空容器申报dayin
	 * @return 
	 */
	public String kongrqsbxgprint() {
		String transcode = "60304";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}


	/**
	 * 604 空容器申报修改页面
	 * @return
	 * String
	 */
	public String kongrqsbxg(){
		return "select";
	}
	/**
	 * 60401 空容器申报修改查询
	 * @return 
	 */
	public String kongrqsbxgsearch() {
		String transcode = "60401";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 60402 空容器申报修改
	 * @return 
	 */
	public String kongrqsbxgupdate() {
		String transcode = "60402";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 60403 空容器申报修改删除
	 * @return 
	 */
	public String kongrqsbxgdelete(@Param("list") ArrayList<Kongq> list) {
		String transcode = "60403";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	/**
	 * 60604 空容器报废申报查询
	 * @return
	 */
	public String rongqbfsqcx() {
		String transcode = "60604";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 60401空容器申报撤销详细页面
	 * @return
	 * String
	 */
	public String kongrqsbxgxxx(){
		JSONObject obj = JSONObject.fromObject(this.getParam("putvalue"));
		setRequestAttribute("result", obj);
		return "select";
	}
	
	
	/**
	 * 605空容器申报撤销页面
	 * @return
	 * String
	 */
	public String kongrqsbcx(){
		return "select";
	}
	/**
	 * 60501 空容器申报撤销查询
	 * @return 
	 */
	public String kongrqsbcxsearch() {
		String transcode = "60501";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	/**
	 * 60502 空容器申报撤销查看
	 * @return 
	 */
	public String kongrqsbcxinfo() {
		String transcode = "60502";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 60503 空容器申报撤销
	 * @return 
	 */
	public String kongrqsbcxchex(@Param("list") ArrayList<Kongq> list) {
		String transcode = "60503";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 60501空容器申报撤销详细页面
	 * @return
	 * String
	 */
	public String kongrqsbcxxx(){
		JSONObject obj = JSONObject.fromObject(this.getParam("putvalue"));
		setRequestAttribute("result", obj);
		return "select";
	}
	
	
	
	/**
	 * 606容器报废申请页面
	 * @return
	 * String
	 */
	public String rongqbfsq(){
		return "select";
	}
	/**
	 * 60601 容器报废申请确认
	 * @return 
	 */
	public String rongqbfsqok() {
		String transcode = "60601";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 60602 容器报废申请删除
	 * @return 
	 */
	public String rongqbfsqdelete(@Param("list") ArrayList<Kongq> list) {
		String transcode = "60602";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 60603 容器报废申请打印
	 * @return 
	 */
	public String rongqbfsqprint() {
		String transcode = "60603";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	
	
	/**
	 * 607报废容器查询修改页面
	 * @return
	 * String
	 */
	public String baofrqcxxg(){
		return "select";
	}
	/**
	 * 60701 报废容器查询修改查询
	 * @return 
	 */
	public String baofrqcxxgsearch() {
		String transcode = "60701";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 60702 报废容器查询修改
	 * @return 
	 */
	public String baofrqcxxgupdate() {
		String transcode = "60702";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 60703报废容器查询修改删除
	 * @return 
	 */
	public String baofrqcxxgdelete(@Param("list") ArrayList<Kongq> list) {
		String transcode = "60703";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 60704报废容器查询修改详细页面
	 * @return
	 * String
	 */
	public String baofrqcxxgxx(){
		JSONObject obj = JSONObject.fromObject(this.getParam("putvalue"));
		setRequestAttribute("result", obj);
		return "select";
	}
	
	
	
	/**
	 * 608报废容器撤销页面
	 * @return
	 * String
	 */
	public String baofrqcx(){
		return "select";
	}
	/**
	 * 60801 报废容器撤销查询
	 * @return 
	 */
	public String baofrqcxsearch() {
		String transcode = "60801";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	/**
	 * 60802 报废容器撤销查看
	 * @return 
	 */
	public String baofrqcxinfo() {
		String transcode = "60802";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 60803 报废容器撤销
	 * @return 
	 */
	public String baofrqcxchex(@Param("list") ArrayList<Kongq> list) {
		String transcode = "60803";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 60801报废容器撤销详细页面
	 * @return
	 * String
	 */
	public String baofrqcxxx(){
		JSONObject obj = JSONObject.fromObject(this.getParam("putvalue"));
		setRequestAttribute("result", obj);
		return "select";
	}
	
	
	
	/**
	 * 609容器报废确认页面
	 * @return
	 * String
	 */
	public String rqbfqr(){
		return "select";
	}
	/**
	 * 60901 容器报废确认
	 * @return 
	 */
	public String rqbfqrok() {
		String transcode = "60901";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 60902 容器报废确认
	 * @return 
	 */
	public String rqbfqrokfy() {
		String transcode = "60902";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 60902 容器报废确认
	 * @return 
	 */
	public String rqbfqrsearch() {
		String transcode = "60701";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 60902 容器报废确认
	 * @return 
	 */
	public String rqbfqrupdate() {
		String transcode = "60702";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	
	
	/**
	 * 610容器报废确认撤销页面
	 * @return
	 * String
	 */
	public String rqbfqrcx(){
		return "select";
	}
	/**
	 * 61001 容器报废确认撤销
	 * @return 
	 */
	public String rqbfqrcxcx() {
		String transcode = "61001";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 61002 容器报废确认撤销
	 * @return 
	 */
	public String rqbfqrcxcxfy() {
		String transcode = "61002";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	
	
	/**
	 * 611容器调拨申请页面
	 * @return
	 * String
	 */
	public String rqtbsq(){
		return "select";
	}
	/**
	 * 61101 容器调拨申请确认
	 * @return 
	 */
	public String rqtbsqok() {
		String transcode = "61101";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 61102容器调拨申请修改
	 * @return 
	 */
	public String rqtbsqupdate() {
		String transcode = "61102";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 61102容器调拨申请修改
	 * @return 
	 */
	public String rqtbsqprint() {
		String transcode = "61103";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 637 容器移库单打印
	 * 
	 */
	public String print_637(){
		Map<String,String> map= this.getParams();
		print_63701(map);
		return AJAX;
	}
	private void print_63701(Map map){
		// 根据维修单号查询容器维修单
		List<Rongqdbd> list = rongqiService.print_63701(map);
		// 创建Json对象
		JSONArray jsonArray = new JSONArray();
		if (list.size() > 0){
			JSONObject jsonBody = new JSONObject();
			Rongqdbd beanHead = list.get(0);
			//单号
			jsonBody.put("DIAOBDH",beanHead.getDiaobdh());
			jsonBody.put("barcode",beanHead.getDiaobdh());
			//日期
			jsonBody.put("RIQ",beanHead.getDiaobsj());
			//申请人
			jsonBody.put("SHENQR",beanHead.getShengqr());
			//用户名
			jsonBody.put("CREATOR",beanHead.getCreator());
			//调出单位
			jsonBody.put("DIAOCDW",beanHead.getDiaocdw());
			//调入单位
			jsonBody.put("DIAORDW",beanHead.getDiaordw());
			
			JSONArray jsArrayXuh = new JSONArray();
			JSONArray jsArrayRiq = new JSONArray();
			JSONArray jsArrayShij = new JSONArray();
			JSONArray jsArrayRongqlx = new JSONArray();
			JSONArray jsArrayRongqsl = new JSONArray();
			JSONArray jsArrayshenqr = new JSONArray();
			JSONArray jsArrayzhaiy = new JSONArray();
			// 单据明细
			for (int i = 0; i < list.size(); i++) {
				Rongqdbd beanBody = list.get(i);
				jsArrayXuh.add(i+1);
				jsArrayRiq.add(beanBody.getRongqbh());
				jsArrayShij.add(beanBody.getShenqsl());
				jsArrayRongqlx.add(beanBody.getGongys());
				jsArrayRongqsl.add(beanBody.getWuls());
				//jsArrayshenqr.add(beanBody.getShengqr());
				jsArrayzhaiy.add(beanBody.getZhaiy());
			}
			//序号
			jsonBody.put("XUH", jsArrayXuh);
			//容器编号
			jsonBody.put("RONGQBH", jsArrayRiq);
			//申请数量
			jsonBody.put("SHENQSL", jsArrayShij);
			//供应商
			jsonBody.put("GONGYS", jsArrayRongqlx);
			//物流商
			jsonBody.put("WULS", jsArrayRongqsl);
			//申请人
			//jsonBody.put("SHENQR", jsArrayshenqr);
			//摘要
			jsonBody.put("ZHAIY", jsArrayzhaiy);
			jsonArray.add(jsonBody);
		}
		String json = jsonArray.toString();
		log.info(json);
		setResult("result", jsonArray);
	}
	
	/**
	 * 63002 容器报废申请单打印
	 * @return
	 */
	public String rongqidiaobo() {
		Map map = this.getParams();
		if(map.get("danjlxxx")!=null){
			String mapValue=map.get("diaobdh").toString();
			map.put("diaobdh", mapValue+"S");
		}		
		printrongqidiaobo(map);
		return AJAX;
	}
	
	
	private void printrongqidiaobo(Map map) {
		
		// 根据维修单号查询容器维修单
		List<Rongqdbd> list = rongqiService.printrongqidiaobo(map);
		//System.out.println(list.size());
		// 创建Json对象
		JSONArray jsonArray = new JSONArray();
		if (list.size() > 0){
			JSONObject jsonBody = new JSONObject();
			Rongqdbd beanHead = list.get(0);
			//单号
			jsonBody.put("DIAOBDH",beanHead.getDiaobdh());
			jsonBody.put("barcode",beanHead.getDiaobdh());
			//日期
			jsonBody.put("RIQ",beanHead.getDiaobsj());
			//申请人
			jsonBody.put("SHENQR",beanHead.getShengqr());
			//调出单位
			jsonBody.put("DIAOCDW",beanHead.getDiaocdw());
			//调入单位
			jsonBody.put("DIAORDW",beanHead.getDiaordw());
		
			JSONArray jsArrayXuh = new JSONArray();
			JSONArray jsArrayRiq = new JSONArray();
			JSONArray jsArrayShij = new JSONArray();
			JSONArray jsArrayRongqlx = new JSONArray();
			JSONArray jsArrayRongqsl = new JSONArray();
			JSONArray jsArrayshenqr = new JSONArray();
			JSONArray jsArrayzhaiy = new JSONArray();
			// 单据明细
			for (int i = 0; i < list.size(); i++) {
				Rongqdbd beanBody = list.get(i);
				jsArrayXuh.add(i+1);
				jsArrayRiq.add(beanBody.getRongqbh());
				jsArrayShij.add(beanBody.getShenqsl());
				jsArrayRongqlx.add(beanBody.getGongys());
				jsArrayRongqsl.add(beanBody.getWuls());
				//jsArrayshenqr.add(beanBody.getShengqr());
				jsArrayzhaiy.add(beanBody.getZhaiy());
			}
			//序号
			jsonBody.put("XUH", jsArrayXuh);
			//容器编号
			jsonBody.put("RONGQBH", jsArrayRiq);
			//申请数量
			jsonBody.put("SHENQSL", jsArrayShij);
			//供应商
			jsonBody.put("GONGYS", jsArrayRongqlx);
			//物流商
			jsonBody.put("WULS", jsArrayRongqsl);
			//申请人
			//jsonBody.put("SHENQR", jsArrayshenqr);
			//摘要
			jsonBody.put("ZHAIY", jsArrayzhaiy);
			jsonArray.add(jsonBody);
		}
		String json = jsonArray.toString();
		log.info(json);
		//System.out.println(json);
		setResult("result", jsonArray);
	}
	
	
	
	/**
	 * 612容器调拨申请查询修改页面
	 * @return
	 * String
	 */
	public String rqtbsqcxxg(){
		return "select";
	}
	/**
	 * 61201 容器调拨申请查询修改查询
	 * @return 
	 */
	public String rqtbsqcxxgsearch() {
		String transcode = "61201";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	/**
	 * 61202容器调拨申请查询修改
	 * @return 
	 */
	public String rqtbsqcxxgupdate() {
		String transcode = "61202";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 61203容器调拨申请查询修改删除
	 * @return 
	 */
	public String rqtbsqcxxgdelete(@Param("list") ArrayList<Kongq> list) {
		String transcode = "61203";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 612 查看详细页面
	 * @return
	 */
	public String detail_6120101(){
		JSONObject obj = JSONObject.fromObject(this.getParam("putvalue"));
		setRequestAttribute("result", obj);
		return "select";
	}	
	
	
	/**
	 * 614容器调拨入库页面
	 * @return
	 * String
	 */
	public String rqtbrk(){
		return "select";
	}
	/**
	 * 61401 容器调拨入库查询
	 * @return 
	 */
	public String rqtbrksearch() {
		String transcode = "61401";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	/**
	 * 61402容器调拨入库修改
	 * @return 
	 */
	public String rqtbrkupdate() {
		String transcode = "61402";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	
	/**
	 * 61403容器出库入库修改
	 * @return 
	 */
	public String rqtbckrk() {
		String transcode = "61403";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	/**
	 * 61403容器出库入库类型
	 * @return 
	 */
	public String rongqixh(@Param("list") ArrayList<Rongqixh> list) {
		String transcode = "61403";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}	
	/**
	 * 61405容器调拨入库查询
	 * @return 
	 */
	public String rongqicx() {
		String transcode = "61405";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 617容器调拨执行清单查询页面
	 * @return
	 * String
	 */
	public String rqtbzxqdcx(){
		return "select";
	}
	/**
	 * 61701 容器调拨执行清单查询
	 * @return 
	 */
	public String rqtbzxqdcxsearch() {
		String transcode = "61701";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	/**
	 * 61702容器调拨执行清单查询查看
	 * @return 
	 */
	public String rqtbzxqdcxinfoo() {
		String transcode = "61702";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	public String rqtbzxqdcxinfo(){
		JSONObject obj = JSONObject.fromObject(this.getParam("putvalue"));
		setRequestAttribute("result", obj);
		return "select";
	}
	/**
	 * 61703容器调拨执行清单查询撤销
	 * @return 
	 */
	public String rqtbzxqdcxchex(@Param("list") ArrayList<Kongq> list) {
		String transcode = "61703";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	
	
	
	/**
	 * 618容器调拨执行汇总查询页面
	 * @return
	 * String
	 */
	public String rqtbzxhzcx(){
		return "select";
	}
	/**
	 * 61801 容器调拨执行汇总查询查询
	 * @return 
	 */
	public String rqtbzxhzcxsearch() {
		String transcode = "61801";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	
	
	
	/**
	 * 619容器维修申请页面
	 * @return
	 * String
	 */
	public String rqwxsq(){
		return "select";
	}
	/**
	 * 61901容器维修申请确认
	 * @return 
	 */
	public String rqwxsqok() {
		String transcode = "61901";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 61902 容器维修申请打印
	 * @return 
	 */
	public String rqwxsqprint() {
		String transcode = "61902";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 61903 容器维修申请删除
	 *
	 * @return 
	 */
	public String rqwxsqcxdelete(@Param("list") ArrayList<Kongq> list) {
		String transcode = "61903";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 61902 容器维修申请打印
	 * @return 
	 */
	public String rqwxsqprintxx() {
		String transcode = "61904";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	
	/**
	 * 620容器维修申请撤销页面
	 * @return	
	 * String
	 */
	public String rqwxsqcx(){
		return "select";
	}
	/**
	 * 62001容器维修申请撤销查询
	 * @return 
	 */
	public String rqwxsqcxsearch() {
		String transcode = "62001";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	/**
	 * 62002 容器维修申请撤销查看
	 * @return 
	 */
	public String rqwxsqcxinfo() {
		String transcode = "62002";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	public String rqwxsqcxxxx() {
		JSONObject obj = JSONObject.fromObject(this.getParam("putvalue"));
		setRequestAttribute("result", obj);
		return SELECT;
	}
	/**
	 * 62003 容器维修申请撤销
	 * @return 
	 */
	public String rqwxsqcxchex(@Param("list") ArrayList<Kongq> list) {
		String transcode = "62003";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	
	
	
	
	/**
	 * 621容器退供应商页面
	 * @return	
	 * String
	 */
	public String rongqtgys(){
		return "select";
	}
	/**
	 * 62101容器退供应商确认
	 * @return 
	 */
	public String rongqtgysok() {
		String transcode = "62101";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 62102 容器退供应商删除
	 * @return 
	 */
	public String rongqtgysdelete(@Param("list") ArrayList<Kongq> list) {
		String transcode = "62102";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 62103 容器退供应商
	 * @return 
	 */
	public String rongqtgysbzd() {
		String transcode = "62103";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 62104 容器退供应商确认退供应商
	 * @return 
	 */
	public String rongqtgysoktuigys() {
		String transcode = "62104";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	/**
	 * 62105 容器返还单打印
	 * @return
	 */
	public String rongqfhdDy() {
		Map<String,String> map = this.getParams();
		//接收返回单号
		String jsfhdh = map.get("jsfhdh");
		printRongqfhd(jsfhdh);
		return AJAX;
	}
	
	/**
	 * 打印容器返还单621
	 */
	private void printRongqfhd(String jsfhdh) {
		
		// 根据返还单号查询容器接收单
		List<Rongqjs> list = rongqiService.getRongqfhd(jsfhdh);
		//System.out.println(list.size());
		// 创建Json对象
		JSONArray jsonArray = new JSONArray();
		if (list.size() > 0){
			JSONObject jsonBody = new JSONObject();
			Rongqjs beanHead = list.get(0);
			//条形码
			jsonBody.put("barcode",beanHead.getJsfhdh());
			//单号
			jsonBody.put("DANH",beanHead.getJsfhdh());
			jsonBody.put("CHENYS",beanHead.getChengys());
			String datetime = beanHead.getEdit_time();
			String riq = "";
			String shij = "";
			if (datetime != null){
				String[] times = datetime.split(" ");
				if (times.length == 2){
					riq = times[0];
					shij = times[1];
				}
			}
			//日期
			jsonBody.put("RIQ",riq);
			//时间
			jsonBody.put("SHIJ",shij);
			//去向
			jsonBody.put("QUX",beanHead.getGongysdm());
			//卡车号
			jsonBody.put("KACH",beanHead.getTch());
		
			JSONArray jsArrayXuh = new JSONArray();
			JSONArray jsArrayRongqbh = new JSONArray();
			JSONArray jsArrayFanhsl = new JSONArray();
			JSONArray jsArrayRongqye = new JSONArray();
			JSONArray jsArrayZhaiy = new JSONArray();
			// 单据明细
			for (int i = 0; i < list.size(); i++) {
				Rongqjs beanBody = list.get(i);
				jsArrayXuh.add(i+1);
				jsArrayRongqbh.add(beanBody.getRongqxh());
				jsArrayFanhsl.add(beanBody.getRongqsl());
				jsArrayRongqye.add(beanBody.getRongqye());
				jsArrayZhaiy.add("返还");
			}
			//序号
			jsonBody.put("XUH", jsArrayXuh);
			//容器编号
			jsonBody.put("RONGQBH", jsArrayRongqbh);
			//返还数量
			jsonBody.put("FANHSL", jsArrayFanhsl);
			//容器余额
			jsonBody.put("RONGQYE", jsArrayRongqye);
			//摘要
			jsonBody.put("ZHAIY", jsArrayZhaiy);
			jsonArray.add(jsonBody);
		}
		String json = jsonArray.toString();
		log.info(json);
		//System.out.println(json);
		setResult("result", jsonArray);
	}
	/**
	 * 62106 容器返还单打印
	 * @return
	 */
	/*public String rqfhdDy() {
		Map<String,String> map =this.getParams();
		//接收返回单号
		String jsfhdh = map.get("jsfhdh");
		// 根据返还单号查询容器接收单
		List<Rongqjs> list = rongqiService.getRongqfhd(jsfhdh);
		String strResponse;
		Map<String, Object> result=new HashMap<String, Object>();
 		if(null == list || list.size() == 0){
			//list = new ArrayList<Rongqjs>();
			strResponse = "C_1403";
		}else{
			strResponse = "0001";
		}
		String riq = "";
		String shij = "";
		String danh = "";
		int pagesize = 0;
		int page = 0;
		if (list.size() > 0){
			Rongqjs beanHead = list.get(0);
			//单号
			 danh = beanHead.getJsfhdh();
			String datetime = beanHead.getEdit_time();
		
			if (datetime != null){
				String[] times = datetime.split(" ");
				if (times.length == 2){
					riq = times[0];
					shij = times[1];
				}
			}
         pagesize = list.size();
         page = list.size() % 8 ==0 ?list.size() / 8 : list.size()/8 + 1;
     	 result.put("gongysdm", list.get(0).getGongysdm());
		 result.put("chengysdm", list.get(0).getChengys());
		 result.put("tch", list.get(0).getTch());
		 result.put("riq", riq);
		 result.put("shij", shij);
		 result.put("danh",danh);
		 result.put("page",page);
		 result.put("pagesize", pagesize);
		 result.put("list", list);
		}
		result.put("response", strResponse);
		setRequestAttribute("result", result);
		return "select";
	}*/
	public String rqfhdDy() {
		String transcode = "62205";
		Map<String,String> map = this.getParams();
		Map<String, Object> result=new HashMap<String, Object>();
		JSONObject obj = JSONObject.fromObject(this.callWtc(transcode, map).get("parameter"));
		//List <Rongqjs> list= (List<Rongqjs>)JSONArray.toList(obj.getJSONArray("list"), Rongqjs.class) ;
		List <Rongqjs> list = (List<Rongqjs>) JSONArray.toCollection(obj.getJSONArray("list"), Rongqjs.class);
		int pagesize = list.size();
        int page = list.size() % 8 ==0 ?list.size() / 8 : list.size()/8 + 1;
		 result.put("tch",obj.get("tch"));
		 result.put("gongysdm",obj.get("chengysdm"));
		 result.put("chengysdm",obj.get("chengysdm"));
		 result.put("danh", obj.get("danjbh"));
		 result.put("list", list);
		 result.put("page", page);
		 result.put("pagesize", pagesize);
		 String datetime = (String) obj.get("jiaofsj");
		 if (datetime != null){
				String[] times = datetime.split(" ");
				if (times.length == 2){
					 result.put("riq", times[0]);
					 result.put("shij", times[1]); 
				}
			}
	    setRequestAttribute("result", result);
		return "select";
	}
	/**
	 * 622容器退供应商查询修改页面
	 * @return	
	 * String
	 */
	public String rongqtgyscxxg(){
		return "select";
	}
	/**
	 * 62201容器退供应商查询
	 * @return 
	 */
	public String rongqtgyscxxgsearch() {
		String transcode = "62201";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	/**
	 * 62202 容器退供应商查询修改
	 * @return 
	 */
	public String rongqtgyscxxgupdate() {
		String transcode = "62202";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 62203 容器退供应商查询删除
	 * @return 
	 */
	public String rongqtgyscxxgdelete(@Param("list") ArrayList<Kongq> list) {
		String transcode = "62203";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	
	/**
	 * 62204 容器退供应商查询确认
	 * @return 
	 */
	public String rongqtgyscxqr() {
		String transcode = "62204";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	/**
	 * 6220101 容器退供应商详情查看页面
	 * @return
	 */
	public String rongqtgyscxxglookup() {
		JSONObject obj = JSONObject.fromObject(this.getParam("putvalue"));
		setRequestAttribute("result", obj);
		return SELECT;
	}
	
	/**
	 * 623容器退供应商撤销页面
	 * @return	
	 * String
	 */
	public String  rongqtgyscx(){
		return "select";
	}
	/**
	 * 62301容器退供应商撤销查询
	 * @return 
	 */
	public String rongqtgyscxsearch() {
		String transcode = "62301";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	/**
	 * 62302 容器退供应商撤销查看
	 * @return 
	 */
	public String rongqtgyscxinfo() {
		String transcode = "62302";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 62303 容器退供应商撤销
	 * @return 
	 */
	public String rongqtgyscxchex(@Param("list") ArrayList<Kongq> list) {
		String transcode = "62303";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 6230101 容器维修详情查看页面
	 * @return
	 */
	public String rongqtgyscxxx() {
		JSONObject obj = JSONObject.fromObject(this.getParam("putvalue"));
		setRequestAttribute("result", obj);
		return SELECT;
	}
	
	
	
	
	
	
	/**
	 * 624容器盘点申报页面
	 * @return	
	 * String
	 */
	public String  rongqpdsb(){
		return "select";
	}
	/**
	 * 62401容器盘点申报查询
	 * @return 
	 */
	public String rongqpdsbsearch() {
		String transcode = "62401";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	/**
	 * 62402 容器盘点申报
	 * @return 
	 */
	public String rongqpdsbadd() {
		String transcode = "62402";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 62403 容器盘点申报
	 * @return 
	 */
	public String rongqpdsbupdate() {
		String transcode = "62403";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 62404 容器盘点申报
	 * @return 
	 */
	public String rongqpdsbwucy() {
		String transcode = "62404";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 62405 容器盘点申报
	 * @return 
	 */
	public String rongqpdsbycy() {
		String transcode = "62405";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 62406 容器盘点申报
	 * @return 
	 */
	public String rongqpdupdate() {
		String transcode = "62406";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 62409容器盘点补打
	 * @return
	 */
	public String rongqpdbd(){
		Map map = this.getParams();
		LoginUser loginUser = AuthorityUtils.getSecurityUser();
		map.put("usercenter",loginUser.getUsercenter());
		List<rongqzdjgd> list1 = rongqiService.selectpandzdxls(map);
		List<rongqzdjgd> list2= rongqiService.selectpandjgxls(map);
		String strResponse = "" ;
		String flag="";
       if(null != list1 && list1.size()!=0 ){
			strResponse = "0000";
			flag = "02";
		}else if(null != list2 && list2.size()!=0 ){
			strResponse = "0000";
			flag = "04";
		}else{
			strResponse = "C6_23PD08";
		}
		CommonEntity commonEntity=new CommonEntity();
		commonEntity.setParameter("{flag:\""+flag+"\"}");
		commonEntity.setResponse(strResponse);
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;
	}
	
	/**
	 * 62406容器盘点申报页面导出
	 * @return 
	 */
	public String rongqpdsbdaoc() {
		Map map = this.getParams();
		LoginUser loginUser = AuthorityUtils.getSecurityUser();
		map.put("usercenter",loginUser.getUsercenter());
		// 库存查询数据
		List<rongqzdjgd> list = rongqiService.selectpandzdxls(map);
		// 转换数据格式
		List<Map<String, Object>> listMap = new ArrayList<Map<String, Object>>();
		Map<String, Object> mapData = new HashMap<String, Object>();
		mapData.put("pandbh", CKUtil.setValue("盘点编号", 20));
		mapData.put("shij", CKUtil.setValue("时间", 20));
		mapData.put("wuld", CKUtil.setValue("物理点", 10));
		mapData.put("caozy", CKUtil.setValue("操作员", 10));
		mapData.put("rongqxh", CKUtil.setValue("容器型号", 5));
		mapData.put("gongysdm", CKUtil.setValue("供应商", 10));
		mapData.put("chengysdm",CKUtil.setValue("承运商", 10));
		mapData.put("rongqsl", CKUtil.setValue("容器数量", 9));
		listMap.add(mapData);
		for (rongqzdjgd entity : list) {
            mapData = new HashMap<String, Object>();
			mapData.put("pandbh", CKUtil.setValue(entity.getPandbh(), 20));
			mapData.put("shij", CKUtil.setValue(entity.getShij(), 20));
			mapData.put("wuld", CKUtil.setValue(entity.getWuld(), 10));
			mapData.put("caozy", CKUtil.setValue(entity.getCaozy(), 10));
			mapData.put("rongqxh", CKUtil.setValue(entity.getRongqxh(), 5));
			mapData.put("gongysdm", CKUtil.setValue(entity.getGongysdm(), 10));
			mapData.put("chengysdm", CKUtil.setValue(entity.getChengysdm(), 10));
			mapData.put("rongqsl", CKUtil.setValue(entity.getRongqsl(), 9));
			listMap.add(mapData);
		}
		Map<String, Object> dataSource = new HashMap<String, Object>();
		// 导出查询结果
		dataSource.put("list", listMap);

		// 拿到response对象
		HttpServletResponse response = ActionContext.getActionContext()
				.getResponse();
		downloadServices.downloadFile("RongqpdzddXls.ftl", dataSource, response,
				"盘点查询", ExportConstants.FILE_XLS, false);
		return "downLoad";
	}
	
	
	
	/**
	 * 62406容器盘点申报页面导出
	 * @return 
	 */
	public String rongqpdjgcyb() {
		Map map = this.getParams();
		LoginUser loginUser = AuthorityUtils.getSecurityUser();
		map.put("usercenter",loginUser.getUsercenter());
		// 库存查询数据
		List<rongqzdjgd> list = rongqiService.selectpandjgxls(map);
		// 转换数据格式
		List<Map<String, Object>> listMap = new ArrayList<Map<String, Object>>();
		Map<String, Object> mapData = new HashMap<String, Object>();
		mapData.put("pandbh", CKUtil.setValue("盘点编号", 20));
		mapData.put("shij", CKUtil.setValue("时间", 20));
		mapData.put("wuld", CKUtil.setValue("物理点", 10));
		mapData.put("caozy", CKUtil.setValue("操作员", 10));
		mapData.put("rongqxh", CKUtil.setValue("容器型号", 5));
		mapData.put("gongysdm", CKUtil.setValue("供应商", 10));
		mapData.put("wuls",CKUtil.setValue("物流商", 10));
		mapData.put("pandqsl", CKUtil.setValue("盘点前数量", 9));
		mapData.put("pandhsl", CKUtil.setValue("盘点后数量", 9));
		mapData.put("pandcy", CKUtil.setValue("盘点差异", 9));
		listMap.add(mapData);
		for (rongqzdjgd entity : list) {
            mapData = new HashMap<String, Object>();
			mapData.put("pandbh", CKUtil.setValue(entity.getPandbh(), 20));
			mapData.put("shij", CKUtil.setValue(entity.getShij(), 20));
			mapData.put("wuld", CKUtil.setValue(entity.getWuld(), 10));
			mapData.put("caozy", CKUtil.setValue(entity.getCaozy(), 10));
			mapData.put("rongqxh", CKUtil.setValue(entity.getRongqxh(), 5));
			mapData.put("gongysdm", CKUtil.setValue(entity.getGongysdm(), 10));
			mapData.put("wuls", CKUtil.setValue(entity.getWuls(), 10));
			mapData.put("pandqsl", CKUtil.setValue(entity.getPandqsl(), 9));
			mapData.put("pandhsl", CKUtil.setValue(entity.getPandhsl(), 9));
			mapData.put("pandcy", CKUtil.setValue(entity.getPandcy(), 9));
			listMap.add(mapData);
		}
		Map<String, Object> dataSource = new HashMap<String, Object>();
		// 导出查询结果
		dataSource.put("list", listMap);

		// 拿到response对象
		HttpServletResponse response = ActionContext.getActionContext()
				.getResponse();
		downloadServices.downloadFile("RongqpdjgdXls.ftl", dataSource, response,
				"盘点查询", ExportConstants.FILE_XLS, false);
		return "downLoad";
	}
	
	
	
	
	
	/**
	 * 625容器调拨执行结束页面
	 * @return	
	 * String
	 */
	public String  rongqdbzxjs(){
		return "select";
	}
	/**
	 * 62501容器调拨执行结束查询
	 * @return 
	 */
	public String rongqdbzxjssearch() {
		String transcode = "62501";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	/**
	 * 62502 容器调拨执行结束结束
	 * @return 
	 */
	public String rongqdbzxjsjies() {
		String transcode = "62502";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 62503 容器调拨执行结束
	 * @return 
	 */
	public String rongqdbzxjsdbjs(@Param("list") ArrayList<Kongq> list) {
		String transcode = "62503";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	
	
	
	
	/**
	 * 626容器流水帐明细查询页面
	 * @return	
	 * String
	 */
	public String  rongqlszmxcx(){
		return "select";
	}
	/**
	 * 62601容器流水帐明细查询
	 * @return 
	 */
	public String rongqlszmxcxsearch() {
		String transcode = "62601";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	
	
	
	
	
	/**
	 * 627容器流水帐汇总查询页面
	 * @return	
	 * String
	 */
	public String  rongqlszhzcx(){
		return "select";
	}
	/**
	 * 62701容器流水帐汇总查询查询
	 * @return 
	 */
	public String rongqlszhzcxsearch() {
		String transcode = "62701";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	
	
	
	
	
	/**
	 * 628创建容器流水帐页面
	 * @return	
	 * String
	 */
	public String  chuangjrqlsz(){
		return "select";
	}
	/**
	 * 62801创建容器流水帐确认
	 * @return 
	 */
	public String chuangjrqlszok() {
		String transcode = "62801";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 62802 创建容器流水帐删除
	 * @return 
	 */
	public String chuangjrqlszdelete(@Param("list") ArrayList<Kongq> list) {
		String transcode = "62802";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 62803 创建容器流水帐
	 * @return 
	 */
	public String chuangjrqlszxx() {
		String transcode = "62803";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	
	
	
	
	/*629 容器维修查询*/
	/**
	 * 629 容器维修查询页面
	 * @return
	 * String
	 */
	public String rongqwxcxYm(){
		return SELECT;
	}
	
	/**
	 * 62901 容器维修查询页面查询
	 * @return
	 */
	public String rongqwxcxCx() {
		String transcode = "62901";
		Map<String,String> map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	
	/**
	 * 62902 容器维修查询页面查看
	 * @return
	 */
	public String rongqwxcxCk() {
		String transcode = "62902";
		Map<String,String> map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	/**
	 * P62901 容器维修详情查看页面
	 * @return
	 */
	public String rongqwxxqckYm() {
		JSONObject obj = JSONObject.fromObject(this.getParam("putvalue"));
		setRequestAttribute("result", obj);
		return SELECT;
	}
	
	/**
	 * 62903 容器维修单打印
	 * @return
	 */
	public String rongqwxdDy() {
		Map map = this.getParams();
		printRongqwxd(map);
		return AJAX;
	}
	
	private void printRongqwxd(Map map) {
		
		// 根据维修单号查询容器维修单
		List<Rongqwx> list = rongqiService.getRongqwxd(map);
		//System.out.println(list.size());
		// 创建Json对象
		JSONArray jsonArray = new JSONArray();
		JSONObject jsonBody = new JSONObject();
		
		JSONArray jsArrayXuh = new JSONArray();
		JSONArray jsArrayRiq = new JSONArray();
		JSONArray jsArrayShij = new JSONArray();
		JSONArray jsArrayRqxh = new JSONArray();
		JSONArray jsArrayShul = new JSONArray();
		JSONArray jsArrayWld = new JSONArray();
		JSONArray jsArrayYuany = new JSONArray();
		JSONArray jsArrayYjwcsj = new JSONArray();
		if (list.size() > 0){
		String weixdh="";
			long xuh = 1;
			
			for (int i = 0; i < list.size(); i++) {
				if(!list.get(i).getWeixdh().equals(weixdh)){
					
					jsonBody = new JSONObject();
					Rongqwx beanHead = list.get(i);
					//单号
					jsonBody.put("DANH",beanHead.getWeixdh());
					//申请部门
					jsonBody.put("SHENQBH",beanHead.getShenqbm());
					//条形码
					jsonBody.put("barcode",beanHead.getWeixdh());
					 jsArrayXuh = new JSONArray();
					 jsArrayRiq = new JSONArray();
					 jsArrayShij = new JSONArray();
					 jsArrayRqxh = new JSONArray();
					 jsArrayShul = new JSONArray();
					 jsArrayWld = new JSONArray();
					 jsArrayYuany = new JSONArray();
					 jsArrayYjwcsj= new JSONArray();
					
					weixdh=list.get(i).getWeixdh();
					xuh = 1;
				}
				// 单据明细
				Rongqwx beanBody = list.get(i);
				jsArrayXuh.add(xuh);
				jsArrayRiq.add(beanBody.getRiq());
				jsArrayShij.add(beanBody.getShij());
				jsArrayRqxh.add(beanBody.getRqxh());
				jsArrayShul.add(beanBody.getShul());
				jsArrayWld.add(beanBody.getWld());
				jsArrayYuany.add(beanBody.getYuany());
				jsArrayYjwcsj.add(beanBody.getYjwcsj());
				//序号
				jsonBody.put("XUH", jsArrayXuh);
				//日期
				jsonBody.put("RIQ", jsArrayRiq);
				//时间
				jsonBody.put("SHIJ", jsArrayShij);
				//容器编码
				jsonBody.put("RONGQBM", jsArrayRqxh);
				//容器数量
				jsonBody.put("RONGQSL", jsArrayShul);
				//物理点
				jsonBody.put("WULD", jsArrayWld);
				//维修摘要
				jsonBody.put("WEIXZY", jsArrayYuany);
				//预计完成时间
				jsonBody.put("YUJWCSJ",jsArrayYjwcsj);
				xuh++ ;
				if(list.size() == (i+1) || !list.get(i+1).getWeixdh().equals(weixdh)){
					jsonArray.add(jsonBody);
				}
			}
			
		}
/*		jsonArray.add(jsonBody);
		String json = jsonArray.toString();
		log.info(json);
		System.out.println(json);*/
		setResult("result", jsonArray);
	}

	/*630 容器报废查询*/
	/**
	 * 630 容器报废查询页面
	 * @return
	 * String
	 */
	public String rongqbfcxYm(){
		return SELECT;
	}
	
	/**
	 * 63001 容器报废查询页面查询
	 * @return
	 */
	public String rongqbfcxCx() {
		String transcode = "63001";
		Map<String,String> map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	
	/**
	 * 63002 容器报废申请单打印
	 * @return
	 */
	public String rongqbfsqdDy() {
		Map map = this.getParams();
		printRongqbfsqd(map);
		return AJAX;
	}
	
	
	private void printRongqbfsqd(Map map) {
		// 根据维修单号查询容器维修单
		List<Rongqdj> list = rongqiService.getRongqbfsqd(map);
		//System.out.println(list.size());
		// 创建Json对象
		JSONArray jsonArray = new JSONArray();
		JSONObject jsonBody = new JSONObject();
		if (list.size() > 0){
			Rongqdj beanHead = list.get(0);
			//单号
			jsonBody.put("DANH",beanHead.getDanjbh());
			jsonBody.put("barcode",beanHead.getDanjbh());
			
			JSONArray jsArrayXuh = new JSONArray();
			JSONArray jsArrayRiq = new JSONArray();
			JSONArray jsArrayShij = new JSONArray();
			JSONArray jsArrayRongqlx = new JSONArray();
			JSONArray jsArrayRongqsl = new JSONArray();
			JSONArray jsArrayWuld = new JSONArray();
			JSONArray jsArrayZhizsdm = new JSONArray();
			JSONArray jsArrayZhaiy = new JSONArray();
			// 单据明细
			for (int i = 0; i < list.size(); i++) {
				Rongqdj beanBody = list.get(i);
				jsArrayXuh.add(i+1);
				jsArrayRiq.add(beanBody.getRiq());
				jsArrayShij.add(beanBody.getShij());
				jsArrayRongqlx.add(beanBody.getRongqlx());
				jsArrayRongqsl.add(beanBody.getRongqsl());
				jsArrayWuld.add(beanBody.getWuld());
				jsArrayZhizsdm.add(beanBody.getZhizsdm());
				jsArrayZhaiy.add(beanBody.getZaiy());
			}
			//序号
			jsonBody.put("XUH", jsArrayXuh);
			//日期
			jsonBody.put("RIQ", jsArrayRiq);
			//时间
			jsonBody.put("SHIJ", jsArrayShij);
			//容器编码
			jsonBody.put("RONGQBM", jsArrayRongqlx);
			//容器数量
			jsonBody.put("RONGQSL", jsArrayRongqsl);
			//物理点
			jsonBody.put("WULD", jsArrayWuld);
			//制造商
			jsonBody.put("ZHIZS", jsArrayZhizsdm);
			//摘要
			jsonBody.put("ZHAIY", jsArrayZhaiy);
			jsonArray.add(jsonBody);
		}
		String json = jsonArray.toString();
		log.info(json);
		//System.out.println(json);
		setResult("result", jsonArray);
	}

	/**
	 * 631容器维修结果维护页面
	 * @return
	 * String
	 */
	public String rongqwxjgwh(){
		return SELECT;
	}
	
	/**
	 * 63101容器维修结果维护查询
	 * @return
	 */
	public String rongqwxjgwhsearch() {
		String transcode = "63101";
		Map<String,String> map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	/**
	 * 63102容器维修结果维护修改
	 * @return
	 */
	public String rongqwxjgwhupdate() {
		String transcode = "63102";
		Map<String,String> map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 63103容器维修结果维护修改
	 * @return
	 */
	public String rongqwxjgwhok() {
		String transcode = "63103";
		Map<String,String> map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	/**
	 * 632 容器总账查询页面
	 * @return
	 * String
	 */
	public String rongqzzcx(){
		return SELECT;
	}
	/**
	 * 63201容器总账查询查询
	 * @return
	 */	
	public String rongqzzcxsearch() {
		String transcode = "63201";
		Map<String,String> map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	
	/**
	 * 633盘点启动结束
	 * @return
	 * String
	 */
	public String pandqdjs(){
		return SELECT;
	}
	/**
	 * 634供应商容器接收
	 * @return
	 * String
	 */
	public String gongysjs(){
		return SELECT;
	}
	/**
	 * 63403 容器接收返还查询
	 * @return
	 * String
	 */
	public String rongqjsfhcx(){
		String transcode = "63403";
		Map<String,String> map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 63405 容器接收返还确认
	 * @return
	 * String
	 */
	public String rongqjsfhqr(){
		String transcode = "63405";
		Map<String,String> map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}/**
	/**
	 * 63406 容器接收返还修改
	 * @return
	 * String
	 */
	public String rongqjsfhxg(){
		String transcode = "63406";
		Map<String,String> map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}/**
	 * 63404 容器接收返还结束录入
	 * @return
	 * String
	 */
	public String rongqjsfhjs(){
		String transcode = "63404";
		Map<String,String> map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	/**
	 *  打印容器接收单634
	 */
	public String printRongQijsd() {
		//获取单据类型
		Map<String,String> map =this.getParams();
		String danjlx=(String) map.get("danjlx");
		// 根据接收单号查询容器接收单
		List<RongQiPring_634> list = rongqiService.getRongqjsd_634(map);
		// 根据返还单号查询容器接收单
		//List<Rongqjs> list = rongqiService.getRongqfhd(jsfhdh);
		String strResponse;
		if(null == list || list.size() == 0){
			//list = new ArrayList<Rongqjs>();
			strResponse = "C_1403";
		}else{
			strResponse = "0001";
		}
		String riq = "";
		String shij = "";
		String danh = "";
		int pagesize = 0;
		int page = 0;
		if (list.size() > 0){
			RongQiPring_634 beanHead = list.get(0);
			//单号
			 danh = beanHead.getJsfhdh();
			riq = beanHead.getRiq();
			shij = beanHead.getShij();
         pagesize = list.size();
         page = list.size() % 10 ==0 ?list.size() / 10 : list.size()/10 + 1;
		}
		Map<String, Object> result=new HashMap<String, Object>();
		result.put("response", strResponse);
		result.put("danh", danh);
		result.put("riq", riq);
		result.put("shij", shij);
		result.put("liush",danh);
		result.put("page",page);
		result.put("pagesize", pagesize);
		result.put("chengysmc", list.get(0).getChengysmc());
		result.put("chengysdm", list.get(0).getChengysdm());
		result.put("tch", list.get(0).getKach());
		result.put("list", list);
		if(danjlx.equals("2")){
			result.put("zhay","记账区间容器接收");
		}else{
			result.put("zhay","容器接收");
		}
		setRequestAttribute("result", result);
		return "select";
	}
	
	/**
	 * 635容器接收返还查询
	 * @return
	 * String
	 */
	public String rongqijsfh(){
		return SELECT;
	}
	/**
	 * 636容器移库入库
	 * @return
	 * String
	 */
	public String rongqi636(){
		return SELECT;
	}
	
	/**
	 * 63601 容器移库入库查询
	 * @return 
	 */
	public String rongqiruksearch(@Param("list") ArrayList<Rongqjs> list) {
		String transcode = "63601";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	/**
	 * 637容器移库出库
	 * @return
	 * String
	 */
	public String rongqi637(){
		return SELECT;
	}
	/**
	 * 63701 容器移库入库查询
	 * @return 
	 */
	public String rongqi637search(@Param("list") ArrayList<Rongqjs> list) {
		String transcode = "63701";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 638容器移库查询
	 * @return
	 * String
	 */
	public String rongqi638(){
		return SELECT;
	}
	/**
	 * 63801 容器移库入库查询
	 * @return 
	 */
	public String rongqi638search() {
		String transcode = "63801";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	/**
	 * 63802 容器移库入库撤销
	 * @return 
	 */
	public String rongqi638cancel(@Param("list") ArrayList<Kongq> list) {
		String transcode = "63802";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	/**
	 * 63801 容器移库入库查看
	 * @return 
	 */
	public String rongqi638info() {
		JSONObject obj = JSONObject.fromObject(this.getParam("putvalue"));
		setRequestAttribute("result", obj);
		return "select";
	}
	
	
	/**
	 * 639容器移库执行查询
	 * @return
	 * String
	 */
	public String rongqi639(){
		return SELECT;
	}
	/**
	 * 63901 容器移库入库查询
	 * @return 
	 */
	public String rongqi639search() {
		String transcode = "63901";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	/**0010495
	 * 640容器打包页面
	 * @return	
	 * String
	 */
	public String rongqdb(){
		return "select";
	}
	
	/**
	 * 64001容器打包查询
	 * @return	
	 * String
	 */
	public String rongqdbcx() {
		String transcode = "64001";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	/**
	 * 64002容器打包增加
	 * @return	
	 * String
	 */
	public String rongqdbadd() {
		String transcode = "64002";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	/**
	 * 64003容器打包删除
	 * @return	
	 * String
	 */
	public String rongqdbdel(@Param("list") ArrayList<Kongq> list) {
		String transcode = "64003";	
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	
	/**
	 * 64004容器打包删除
	 * @return	
	 * String
	 */
	public String rongqdbdelall(@Param("list") ArrayList<Kongq> list) {
		String transcode = "64004";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	/**
	 * 64005容器打包结束录入
	 * @return	
	 * String
	 */
	public String rongqdbend() {
		String transcode = "64005";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	
	
	
	/**
	 * 641容器包裹查询修改页面
	 * @return	
	 * String
	 */
	public String rongqbgxgym(){
		return "select";
	}
	
	/**
	 * 64101容器包裹查询
	 * @return	
	 * String
	 */
	public String rongqbgcx() {
		String transcode = "64101";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	
	/**
	 * 64102容器包裹查看
	 * @return	
	 * String
	 */
	public String rongqbgck(@Param("list") ArrayList<Kongq> list) {
		String transcode = "64102";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	/**
	 * 64101 容器包裹查看页面
	 * @return 
	 */
	public String rongqbgckym() {
		JSONObject obj = JSONObject.fromObject(this.getParam("putvalue"));
		setRequestAttribute("result", obj);
		return "select";
	}
	
	/**
	 * 64103 容器包裹查看撤销
	 * @return 
	 */
	public String rongqbgchex() {
		String transcode = "64103";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	
	/**
	 * 64104 容器包裹查看撤销打印
	 * @return 
	 */
	public String rongqbgchexdy() {
		String transcode = "64104";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	
	
	
	
	
	
	/**
	 * 642容器退供应商（包）页面
	 * @return	
	 * String
	 */
	public String rongqtgysym(){
		return "select";
	}
	
	
	/**
	 * 64201 容器退供应商（包）查询
	 * @return	
	 * String
	 */
	public String rongqtgysbcx(){
		String transcode = "64201";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;	
	}
	
	
	/**
	 * 64202 容器退供应商（包）增加
	 * @return 
	 */
	public String rongqtgysbadd(){
		String transcode = "64202";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;	
	}
	
	/**
	 * 64203 容器退供应商（包）删除
	 * @return 
	 */
	public String rongqtgysbdel(@Param("list") ArrayList<Kongq> list){
		String transcode = "64203";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;	
	}
	
	/**
	 * 64204 容器退供应商（包）删除全部
	 * @return 
	 */
	public String rongqtgysbdelall() {
		String transcode = "64204";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	
	/**
	 * 64205 容器退供应商（包）确认返还
	 * @return 
	 */
	public String rongqtgysbqrfh() {
		String transcode = "64205";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	
	/**
	 * 643容器退供应商（包）查询撤销页面
	 * @return	
	 * String
	 */
	public String rongqtgscxym(){
		return "select";
	}
	
	/**
	 * 64301 容器退供应商（包）撤销查询
	 * @return	
	 * String
	 */
	public String rongqtgscxcx(){
		String transcode = "64301";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;	
	}
	
	/**
	 * 64302容器退供应商（包）明细查询
	 * @return	
	 * String
	 */
	public String rongqtgscxmx(@Param("list") ArrayList<Kongq> list){
		String transcode = "64302";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;	
	}
		
	/**
	 * 64302 容器包裹查看页面
	 * @return 
	 */
	public String rongqtgscxmxym() {
		JSONObject obj = JSONObject.fromObject(this.getParam("putvalue"));
		setRequestAttribute("result", obj);
		return "select";
	}
	
	/**
	 * 64203 容器退供应商（包）撤销
	 * @return 
	 */
	public String rongqtgscxchex(@Param("list") ArrayList<Rongqfh> list){
		String transcode = "64303";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;	
	}
	
	/**
	 * 64206 打印
	 * @return
	 */
	public String rongqtgysdy() {
		String strResponse;
		Map<String,String> map =this.getParams();
		
		String fanhdh=this.getParam("fanhdh");		
		
		map.put("fanhdh",fanhdh);
		
		//更新返还单打印次数		
		if(rongqiService.rongqtgysdy_cs(map)!="0000"){
			strResponse = "0001";
		}				
		
		//主区域
		List<Rongqfh> list = rongqiService.rongqtgysdy_00(map);
		
		
		//列表1
		List<RongQiPring_634> list2 = rongqiService.rongqtgysdy_01(map);
		
		//列表2
		List<RongQiPring_634> list3 = rongqiService.rongqtgysdy_02(map);
		
		// 根据返还单号查询容器接收单
		//List<Rongqjs> list = rongqiService.getRongqfhd(jsfhdh);
		
		Map<String, Object> result=new HashMap<String, Object>();
		
		
		if(null == list || list.size() == 0){
			//list = new ArrayList<Rongqjs>();
			strResponse = "C_1403";
			result.put("response", strResponse);
			setRequestAttribute("result", result);
			return "select";			
		}else{
			strResponse = "0001";
		}
		String riq = "";
		String shij = "";
		String fanhjzq = "";
		String fanhs ="";
		String tch="";
		String cishu="";
		
		int pagesize = 0;
		int page = 0;
		if (list.size() > 0){
			Rongqfh beanHead = list.get(0);
			
			fanhjzq = beanHead.getFanhjzq();//返还记账区
			
			fanhs = beanHead.getFanhs(); //返还商
			
			fanhdh = beanHead.getFanhdh();//返还单号
			riq = beanHead.getRiq();//日期
			shij = beanHead.getShij();//时间
			tch = beanHead.getTch();//卡车号
			
			cishu = beanHead.getCishu();//打印次数
			
			pagesize = list.size();
			//0011516 打印分页问题
			page = (list2.size()+list3.size() ) % 7 ==0 ?( list2.size()+list3.size() ) / 7 : ( list2.size()+list3.size() )/7 + 1;
		}

		result.put("response", strResponse);
		result.put("cishu", cishu);//打印次数
		result.put("fanhs", fanhs);
		result.put("tch", tch);
		result.put("fanhdh", fanhdh);
		result.put("riq", riq);
		result.put("shij", shij);
		result.put("fanhjzq", fanhjzq);		
		result.put("page",page);		
		result.put("pagesize", pagesize);		
		
		Map<String,String> map2 =this.getParams();
		map2.put("fanhjzq",fanhjzq);
		map2.put("fanhs",fanhs);
		
		//序号
		int xuh =rongqiService.rongqtgysdy_xuh(map2);
		result.put("xuh", xuh);
		
		result.put("list2", list2);
		result.put("list3", list3);
		result.put("zhay","返还");
		setRequestAttribute("result", result);
		return "select";
	}
	
	
	/**
	 * 64307  是否可以打判断
	 * @return
	 */
	public String rongqtgysdypd() {
		Map<String,String> map =this.getParams();
		
		String fanhdh=this.getParam("fanhdh");		
		
		map.put("fanhdh",fanhdh);
		
		//主区域
		List<Rongqfh> list = rongqiService.rongqtgysdy_00(map);		
		
		String strResponse;
		Map<String, Object> result=new HashMap<String, Object>();		
		
		if(null == list || list.size() == 0){
			strResponse = "C_1403";		
		}else{
			strResponse = "0001";
		}	
	
		CommonEntity commonEntity=new CommonEntity();
		commonEntity.setResponse(strResponse);
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return  AJAX;
	}	
	
	
	/**
	 * 644容器按返还单接收  11891
	 * @return	
	 * String
	 */
	public String rongqanfhdjs(){
		return "select";
	}
	/**
	 * 644容器按返还单接收  11891
	 * @return	
	 * String
	 */
	public String rongqanfhdjssel()
	{
		String transcode = "64401";
		Map map = this.getParams();
		
		Map<String, Object> result=new HashMap<String, Object>();
		
		String Usercenter = rongqiService.getUsercenterByFanhdh((String) map.get("rongqfhdh"));
		if(Usercenter.equals(""))
		{
			result.put("response", "C_1403");
			setResult("result", result);
			return AJAX;	
		}
		setResult("result", this.callWtc(Usercenter, transcode, map));
		return AJAX;	
	}
	/**
	 * 644容器按返还单接收  11891
	 * @return	
	 * String
	 */
	public String rongqanfhdjsxg()
	{
		String transcode = "64402";
		Map map = this.getParams();
		String Usercenter = rongqiService.getUsercenterByFanhdh((String) map.get("rongqfhdh"));
		Map<String, Object> result=new HashMap<String, Object>();
		if(Usercenter.equals(""))
		{
			result.put("response", "C_1403");
			setResult("result", result);
			return AJAX;	
		}
		setResult("result", this.callWtc(Usercenter, transcode, map));
		return AJAX;	
	}
	
	/**
	 * 644容器按返还单接收  11891
	 * @return	
	 * String
	 */
	public String rongqanfhdjsmx()
	{
		String transcode = "64403";
		Map map = this.getParams();
		String Usercenter = rongqiService.getUsercenterByFanhdh((String) map.get("rongqfhdh"));
		Map<String, Object> result=new HashMap<String, Object>();
		if(Usercenter.equals(""))
		{
			result.put("response", "C_1403");
			setResult("result", result);
			return AJAX;	
		}
		setResult("result", this.callWtc(Usercenter, transcode, map));
		return AJAX;	
	}
	
	/**
	 * 644容器按返还单接收  11891
	 * @return	 P64401
	 * String
	 */
	public String rongqanfhdjsmxck()
	{
		JSONObject obj = JSONObject.fromObject(this.getParam("putvalue"));
		setRequestAttribute("result", obj);
		return "select";
	}
	
	/**
	 * 644容器按返还单接收  11891
	 * @return	
	 * String
	 */
	public String rongqanfhdjsqr()
	{
		String transcode = "64404";
		Map map = this.getParams();
		String Usercenter = rongqiService.getUsercenterByFanhdh((String) map.get("rongqfhdh"));
		Map<String, Object> result=new HashMap<String, Object>();
		if(Usercenter.equals(""))
		{
			result.put("response", "C_1403");
			setResult("result", result);
			return AJAX;	
		}
		setResult("result", this.callWtc(Usercenter, transcode, map));
		return AJAX;	
	}
	/**
	 * 644容器按返还单接收确认插入  11891
	 * @return	64405
	 * String
	 */
	public String rongqanfhdjsqrcr()
	{
		Map<String, Object> result=new HashMap<String, Object>();
		String strResponse = new String();
		String transcode = "64405";
		log.info("进入64405---开始解析数据");
		JSONObject obj = JSONObject.fromObject(this.getParam("putvalue1"));
		
		log.info("------------------------------------------------------------------------");
		log.info(obj.get("result"));
		JSONObject obj1 = JSONObject.fromObject(obj.get("result"));
		log.info("------------------------------------------------------------------------");
		log.info(obj1.get("parameter"));
		JSONObject obj2 = JSONObject.fromObject(obj1.get("parameter"));
		log.info("------------------------------------------------------------------------");
		List list = obj2.getJSONArray("list");
		log.info("------------------------------------------------------------------------");
		int j = list.size();
		
		List<Rongqzwls> zwls = new ArrayList<Rongqzwls>();
		Map map;
		
		for(int i=0;i<list.size();i++)
		{
			Rongqzwls bean = new Rongqzwls();
			bean =  setParamesBean(bean,obj2);
			map = (Map) list.get(i);
			bean.setRongqxh((String) map.get("rongqxh"));
			bean.setRongqsl((Integer) map.get("rongqsl"));
			
			zwls.add(bean);		
		}
		log.info("解析数据完成---插入总帐");
		strResponse = rongqiService.insertZZ(zwls);
		if(!strResponse.equals("0000"))
		{
			result.put("response", strResponse);
			setResult("result", result);
			return AJAX;
		}
		/*
		try{
			String success = rongqiService.insertZwls(zwls);
			log.info(new String("插入容器帐务流水---64405"));
		}catch(Exception e){
			Map<String,String> map1 = new HashMap<String,String>();
			map1.put("message", e.getMessage());
			log.error(e.getMessage());
		}
		Map map2 = new HashMap<String,String>();
		map2.put("rongqfhdh", (String) obj2.get("rongqfhdh"));
		map2.put("usercenter", (String) obj2.get("usercenter"));
		setResult("result", this.callWtc(transcode, map2));
		*/
		
		result.put("response", "0000");
		//setRequestAttribute("result", result);
		setResult("result", result);
		return AJAX;	
	}
	
	
	public Rongqzwls setParamesBean(Rongqzwls bean,JSONObject obj2){
		bean.setUsercenter((String) obj2.get("usercenter"));
		bean.setCaozm((String) obj2.get("peislx"));
		bean.setCaozy((String) obj2.get("pageusername"));
		bean.setChengysbh("000000");
		bean.setChengysmc("DPCA");
		bean.setGongysdm("000000");
		bean.setGongysmc("DPCA");
		bean.setDiaorwld((String) obj2.get("wuld"));
		bean.setWuld((String) obj2.get("diaoruwld"));
		bean.setTch((String) obj2.get("tch"));
		bean.setZaiy((String) obj2.get("laiy"));
		bean.setFlag("1");
		bean.setJsfhdh((String) obj2.get("rongqfhdh"));
		bean.setCreator((String) obj2.get("pageusername"));
		bean.setJiesrq(CKUtil.getSysDate());
		bean.setCreate_time(CKUtil.getSysDate());
		return bean;
	}

	/**
	 * 64308  容器返还单高速行补打 13142
	 * @return	
	 * String
	 */
	public String rongqfhdgshdy(){
		String transcode = "64308";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;	
	}
}
