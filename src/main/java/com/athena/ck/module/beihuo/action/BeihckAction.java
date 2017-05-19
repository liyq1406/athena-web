package com.athena.ck.module.beihuo.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.shiro.crypto.hash.Md5Hash;

import com.athena.authority.entity.LoginUser;
import com.athena.authority.util.AuthorityUtils;
import com.athena.ck.common.CKUtil;
import com.athena.ck.entity.beihuo.Beihdtbyhl;
import com.athena.ck.entity.beihuo.Beihdtbyhlmx;
import com.athena.ck.entity.beihuo.CPLingjzthz;
import com.athena.ck.entity.beihuo.Chukdsh;
import com.athena.ck.entity.beihuo.Chuklscx;
import com.athena.ck.entity.beihuo.Kuccx;
import com.athena.ck.entity.shouhuo.Daohtzd;
import com.athena.ck.entity.beihuo.Saokcx;
import com.athena.ck.entity.common.CommonEntity;
import com.athena.ck.entity.common.Xiehzt;
import com.athena.ck.entity.shouhuo.Daohxxlrxg;
import com.athena.ck.entity.shouhuo.Tongbyhl;
import com.athena.ck.entity.yichang.Yic;
import com.athena.ck.module.beihuo.service.BeihckService;
import com.athena.component.wtc.WtcResponse;
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
 * Title:备货出库Action
 * </p>
 * <p>
 * Description:定义备货出库相关页面动作处理
 * </p>
 * <p>
 * Copyright: Copyright (c) 2011
 * </p>
 * <p>
 * Company: 软通动力
 * </p>
 * 
 * @author 陈川川
 * @version v1.0
 * @date 2012-1-6
 */
@Component(scope = ComponentDefinition.SCOPE_PROTOTYPE)
public class BeihckAction extends BaseWtcAction {

	public UserInfo getUserInfo() {
		return (UserInfo) getSessionAttribute(ToftConst.Toft_SessionKey_UserData);
	}

	// log4j日志初始化
	private final Log log = LogFactory.getLog(BeihckAction.class);
	/**
	 * 注入BeihckService
	 */
	@Inject
	private BeihckService beihckService = null;
	

	/**
	 * 注入downloadsevices
	 */
	@Inject
	private DownLoadServices downloadServices = null;
	LoginUser loginUser = AuthorityUtils.getSecurityUser();
    String cklist = (String) loginUser.getParams().get("cklist");
	/* 备货单 */
	/**
	 * 301 进入备货单页面
	 * 
	 * @return String
	 */
	public String beihdYm() {
		return SELECT;
	}

	/* 按需备货单 */
	/**
	 * 302 进入按需备货单页面
	 * 
	 * @return String
	 */
	public String anxbhdYm() {
		return SELECT;
	}

	/* 成品库备货单 */
	/**
	 * 303 进入成品库备货单页面
	 * 
	 * @return String
	 */
	public String chengpkbhdYm() {
		return SELECT;
	}

	/* 异常申报备货单 */
	/**
	 * 304 进入异常申报备货单页面
	 * 
	 * @return String
	 */
	public String yicsbbhdYm() {
		return SELECT;
	}

	/* 同步上线备货 */
	/**
	 * 305 进入同步上线备货页面
	 * 
	 * @return String
	 */
	public String tongbsxbhYm() {
		return SELECT;
	}
	 /**
	  * 350 仓库移库备货确认撤销页面
	  */
	public String ckykbhym() {
		return SELECT;
	}
	/**
	 * 30501 同步上线备货查询
	 * 
	 * @return
	 */
	public String tongbsxbhCx() {
		String transcode = "30501";
		Map<String, String> map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)) );
		return AJAX;
	}

	/**
	 * 30502 同步上线备货备货
	 * 
	 * @return
	 */
	public String tongbsxbhBh() {
		String transcode = "30502";
		Map<String, String> map = this.getParams();
		WtcResponse response = this.callWtc(transcode, map);
		setResult("result", response);
		// TODO
		// if ("0000".equals(response.get("response"))){
		// String beihdh = response.get("beihdh").toString();
		// //打印同步包装单元卡308
		// printTongbbzdyk(beihdh);
		// }
		return AJAX;
	}

	public String tongbbzdykDy() {
		String beihdh = "W00000299";
		printTongbbzdyk(beihdh);
		return AJAX;
	}

	/**
	 * 打印同步包装单元卡308
	 */
	private void printTongbbzdyk(String beihdh) {
		// 根据备货单号查询要货令
		List<Beihdtbyhl> list = beihckService.getTongbyhl(beihdh);
		//System.out.println(list.size());
		// 创建Json对象
		JSONObject jsonReturn = new JSONObject();
		JSONArray jsonArray = new JSONArray();

		// 根据要货令查询备货明细
		for (int i = 0; i < list.size(); i++) {
			JSONObject jsonObjectYhl = new JSONObject();
			Beihdtbyhl beanHead = list.get(i);
			// 要货令号
			String yaohlh = beanHead.getYaohlh();
			// 包装单元卡号:要货令号的后5位
			jsonObjectYhl
					.put("BAOZDYKH", yaohlh.substring(yaohlh.length() - 5));
			// 条码号:产线+配送类型+要货令号
			jsonObjectYhl.put("TIAOMH",
					beanHead.getYaohlh() + beanHead.getPeislb() + yaohlh);
			// 零件类别:要货令的配送类别
			jsonObjectYhl.put("LINGJLB", beanHead.getPeislb());
			// 生产线号
			jsonObjectYhl.put("SHENGCXH", beanHead.getChanx());
			// 消耗点编号
			jsonObjectYhl.put("XIAOHDBH", beanHead.getXiaohd());
			// 要货量
			jsonObjectYhl.put("YAOHL", beanHead.getYaohslsum());
			// 配送量
			jsonObjectYhl.put("PEISL", beanHead.getBeihslsum());

			JSONArray jsArrayXuh = new JSONArray();
			JSONArray jsArrayWeiz = new JSONArray();
			JSONArray jsArrayLingjbh = new JSONArray();
			JSONArray jsArrayLiush = new JSONArray();
			JSONArray jsArrayLingjmc = new JSONArray();
			JSONArray jsArrayYaohsl = new JSONArray();
			JSONArray jsArrayXiaosxsj = new JSONArray();
			JSONArray jsArrayElh = new JSONArray();
			List<Beihdtbyhlmx> listMx = beihckService.getTongbyhlmx(yaohlh);
			//System.out.println(listMx.size());
			// 根据要货令号查询同步要货令明细
			for (int j = 0; j < listMx.size(); j++) {
				Beihdtbyhlmx mx = listMx.get(j);
				jsArrayXuh.add(mx.getXuh());
				jsArrayWeiz.add(mx.getWeiz());
				jsArrayLingjbh.add(mx.getLingjbh());
				jsArrayLiush.add(mx.getLiush());
				jsArrayLingjmc.add(mx.getLingjmc());
				jsArrayYaohsl.add(mx.getYaohsl());
				jsArrayXiaosxsj.add(mx.getXiaosxsj());
				jsArrayElh.add(mx.getElh());
			}
			jsonObjectYhl.put("XUH", jsArrayXuh);
			jsonObjectYhl.put("WEIZ", jsArrayWeiz);
			jsonObjectYhl.put("LINGJH", jsArrayLingjbh);
			jsonObjectYhl.put("LIUSH", jsArrayLiush);
			jsonObjectYhl.put("LINGJMC", jsArrayLingjmc);
			jsonObjectYhl.put("YAOHSL", jsArrayYaohsl);
			jsonObjectYhl.put("SHANGX", jsArrayXiaosxsj);
			jsonObjectYhl.put("ELH", jsArrayElh);
			jsonArray.add(jsonObjectYhl);
		}

		// 转换数据格式
		jsonReturn.put("list", jsonArray);
		String json = jsonReturn.toString();
		log.info(json);
		//System.out.println(json);
		setResult("json", json);

	}

	/* 同步备货单 */
	/**
	 * 306 进入同步备货单页面
	 * 
	 * @return String
	 */
	public String tongbbhdYm() {
		return SELECT;
	}

	/* 同步归集备货单 */
	/**
	 * 307 进入同步归集备货单页面
	 * 
	 * @return String
	 */
	public String tongbgjbhdYm() {
		return SELECT;
	}

	/* 按零件号查询备货单 */
	/**
	 * 311 进入按零件号查询备货单页面
	 * 
	 * @return String
	 */
	public String anljhcxbhdYm() {
		return SELECT;
	}

	/**
	 * 31101 按零件号查询备货单页面查询
	 * 
	 * @return
	 */
	public String anljhcxbhdCx() {
		String transcode = "31101";
		Map<String, String> map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}

	/**
	 * 31102 按零件号查询备货单页面查看
	 * 
	 * @return
	 */
	public String anljhcxbhdCk() {
		String transcode = "31102";
		Map<String, String> map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}

	/* 备货单查询 */
	/**
	 * 312 进入备货单查询页面
	 * 
	 * @return String
	 */
	public String beihdcxYm() {
		return SELECT;
	}

	/**
	 * 31201 备货单查询页面查询
	 * 
	 * @return
	 */
	public String beihdcxCx() {
		String transcode = "31201";
		Map<String, String> map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}

	/**
	 * 31202 备货单查询页面查看
	 * 
	 * @return
	 */
	public String beihdcxCk() {
		String transcode = "31202";
		Map<String, String> map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	//31203备货单查询页面打印
	public String beihdcxdy(@Param("list") ArrayList<Chuklscx> list) {
		String transcode = "31203";
		Map map = this.getParams();
        map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	/* 调拨备货单查询 */
	/**
	 * 313 进入调拨备货单查询页面
	 * 
	 * @return String
	 */
	public String diaobbhdcxYm() {
		return SELECT;
	}

	/**
	 * 31301 调拨备货单查询页面查询
	 * 
	 * @return String
	 */
	public String diaobbhdcxCx() {
		String transcode = "31301";
		Map<String, String> map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}

	/**
	 * 31302 调拨备货单查询页面查看
	 * 
	 * @return String
	 */
	public String diaobbhdcxCk() {
		String transcode = "31302";
		Map<String, String> map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}

	/* 修改备货单查询 */
	/**
	 * 314 修改备货单查询页面
	 * 
	 * @return String
	 */
	public String xiugbhdcxYm() {
		return SELECT;
	}

	/**
	 * 31400 修改备货单新增页面
	 * 
	 * @return String
	 */
	public String xiugbhdxzYm() {
		JSONObject obj = JSONObject.fromObject(this.getParam("putvalue"));
		setRequestAttribute("result", obj);
		return SELECT;
	}

	/**
	 * 31401 修改备货单查询页面查询
	 * 
	 * @return
	 */
	public String xiugbhdcxCx() {
		String transcode = "31401";
		Map<String, String> map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}

	/**
	 * P31401 备货单明细页面跳转
	 * 看板RI/RP/KI/KP，按需CD/C0/M1/MD，同步备货单02，同步归集备货单03，成品库备货单04，配载备货单05，
	 * 调拨备货单06，异常申报备货单07
	 * 
	 * @return String
	 */
	public String beihdmxymTz() {
		JSONObject obj = JSONObject.fromObject(this.getParam("putvalue"));
		String beihlx = this.getParam("beihlx");
		setRequestAttribute("result", obj);
		String forward = "selectBeihd";
		if ("CD".equals(beihlx) || "C0".equals(beihlx) || "M1".equals(beihlx) || "MD".equals(beihlx) || "CS".equals(beihlx)) { 
			// 按需CD/C0
			forward = "selectAnxbhd";
		} else if ("04".equals(beihlx)) {
			// 成品库备货单04
			forward = "selectChengpkbhd";
		}else if ("05".equals(beihlx)|| "CP".equals(beihlx)) {
			// 成品库备货单05
			forward = "selectChengpkbhd";
		}else if ("02".equals(beihlx)) {
			// 同步备货单02
			forward = "selectTongbbhd";
		} else if ("03".equals(beihlx)) {
			// 同步归集备货单03
			forward = "selectTongbgjbhd";
		} else if ("07".equals(beihlx)) {
			// 异常申报备货单07
			forward = "selectYicsbbhd";
		}
		return forward;
	}

	/**
	 * 31402 修改备货单新增
	 * 
	 * @return
	 */
	public String xiugbhdXz() {
		String transcode = "31402";
		Map<String, String> map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}

	/**
	 * 31403 修改备货单新增确认
	 * 
	 * @return
	 */
	public String xiugbhdXzqr() {
		String transcode = "31403";
		Map<String, String> map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}

	/**
	 * 31404 修改备货单新增查询
	 * 
	 * @return
	 */
	public String xiugbhdXzcx() {
		String transcode = "31404";
		Map<String, String> map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}

	/**
	 * 31405 修改备货单删除
	 * 
	 * @return
	 */
	public String xiugbhdSc() {
		String transcode = "31405";
		Map<String, String> map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}

	/**
	 * 31406 修改备货单删除备货单
	 * 
	 * @return
	 */
	public String xiugbhdScbhd() {
		String transcode = "31406";
		Map<String, String> map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 31407 修改备货单打印
	 * 
	 * @return
	 */
	public String xiugbhdprint() {
		String transcode = "31407";
		Map<String, String> map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}

	/* 出库确认B模式 */
	/**
	 * 316 进入出库确认B模式页面
	 * 
	 * @return String
	 */
	public String chukqrbmsYm() {
		return SELECT;
	}

	/**
	 * 31601 出库确认B模式查询
	 * 
	 * @return
	 */
	public String chukqrbmsCx() {
		String transcode = "31601";
		Map<String, String> map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}

	/**
	 * 31602 出库确认B模式修改
	 * 
	 * @return
	 */
	public String chukqrbmsXg() {
		String transcode = "31602";
		Map<String, String> map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}

	/**
	 * 31603 出库确认B模式确认出库
	 * 
	 * @return
	 */
	public String chukqrbmsQrck() {
		String transcode = "31603";
		Map<String, String> map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}

	/* 出库确认C模式 */
	/**
	 * 317 进入出库确认C模式页面
	 * 
	 * @return String
	 */
	public String chukqrcmsYm() {
		return SELECT;
	}

	/**
	 * 31701 出库确认C模式查询客户
	 * 
	 * @return
	 */
	public String chukqrcmsCxkh() {
		String transcode = "31701";
		Map<String, String> map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}

	/**
	 * 31702 出库确认C模式查询备货明细
	 * 
	 * @return
	 */
	public String chukqrcmsCxbhmx() {
		String transcode = "31702";
		Map<String, String> map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}

	/**
	 * 31703 出库确认C模式确认
	 * 
	 * @return
	 */
	public String chukqrcmsQr() {
		String transcode = "31703";
		Map<String, String> map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}

	/**
	 * 31704 出库确认C模式打印发货通知
	 * 
	 * @return
	 */
	public String chukqrcmsDyfhtz() {
		String transcode = "31704";
		Map<String, String> map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	
	
	/***
	 * 验证页面响应码
	 
	 */
	public String chukqrcmsDyfhtz44() {
		Map<String,String> param = getParams();
		String usercenter = param.get("usercenter");
		param.put("usercenter", usercenter);
		
		String len = param.get("len");
		
		ArrayList list = new ArrayList();
		if(len.equals("5")==true){	
			Integer message=beihckService.chukqrcmsDyfhtz4_5(param);
			if(message==null){
				list.add("{name:\"flag\",value:\"0\"}");			
			}else{
				list.add("{name:\"flag\",value:\"1\"}");						
			}
		}else{						
			Integer message=beihckService.chukqrcmsDyfhtz4_9(param);
			if(message==null){
				list.add("{name:\"flag\",value:\"0\"}");			
			}else{
				list.add("{name:\"flag\",value:\"1\"}");						
			}
		}


		Map<String,Object> result = new HashMap<String, Object>();
		
		// 拼Json串
		String sJson = JSONArray.fromObject(list).toString();
		CommonEntity commonEntity = new CommonEntity();
		commonEntity.setParameter("{list:" + sJson + "}");
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;

	}
	
	
	

	/* 出库确认F模式 */
	/**
	 * 318 进入出库确认F模式页面
	 * 
	 * @return String
	 */
	public String chukqrfmsYm() {
		return SELECT;
	}

	/**
	 * 31801 出库确认F模式查询
	 * 
	 * @return
	 */
	public String chukqrfmsCx() {
		String transcode = "31801";
		Map<String, String> map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}

	/**
	 * 31802 出库确认F模式修改
	 * 
	 * @return
	 */
	public String chukqrfmsXg() {
		String transcode = "31802";
		Map<String, String> map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}

	/**
	 * 31803 出库确认F模式确认出库
	 * 
	 * @return
	 */
	public String chukqrfmsQrck() {
		String transcode = "31803";
		Map<String, String> map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}

	/* 出库确认D模式 */
	/**
	 * 319 进入出库确认D模式页面
	 * 
	 * @return String
	 */
	public String chukqrdmsYm() {
		return SELECT;
	}

	/**
	 * 31901 出库确认D模式查询客户
	 * 
	 * @return
	 */
	public String chukqrdmsCxkh() {
		String transcode = "31901";
		Map<String, String> map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}

	/**
	 * 31902 出库确认D模式查询US明细
	 * 
	 * @return
	 */
	public String chukqrdmsCxusmx() {
		String transcode = "31902";
		Map<String, String> map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}

	/**
	 * 31903 出库确认D模式确认
	 * 
	 * @return
	 */
	public String chukqrdmsQr() {
		String transcode = "31903";
		Map<String, String> map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}

	/**
	 * 31904 出库确认D模式打印发货通知
	 * 
	 * @return
	 */
	public String chukqrdmsDyfhtz() {
		String transcode = "31904";
		Map<String, String> map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}

	/**
	 * 31905 出库确认D模式查询UA明细
	 * 
	 * @return
	 */
	public String chukqrdmsCxuamx() {
		String transcode = "31905";
		Map<String, String> map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}

	/**
	 * 31906出库确认D模式修改UA明细
	 * 
	 * @return
	 */
	public String chukqrdmsXguamx() {
		String transcode = "31906";
		Map<String, String> map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}

	/* 出库确认E模式 */
	/**
	 * 320 进入出库确认E模式页面
	 * 
	 * @return String
	 */
	public String chukqremsYm() {
		return SELECT;
	}

	/**
	 * 32001出库确认E模式查询客户
	 * 
	 * @return
	 */
	public String chukqremsCxkh() {
		String transcode = "32001";
		Map<String, String> map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}

	/**
	 * 32002出库确认E模式查询US
	 * 
	 * @return
	 */
	public String chukqremsCxus() {
		String transcode = "32002";
		Map<String, String> map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}

	/**
	 * 32003出库确认E模式确认出库
	 * 
	 * @return
	 */
	public String chukqremsQrck() {
		String transcode = "32003";
		Map<String, String> map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}

	/* 出库确认G模式 */
	/**
	 * 321 进入出库确认G模式页面
	 * 
	 * @return String
	 */
	public String chukqrgmsYm() {
		return SELECT;
	}

	/**
	 * 32101 出库确认G模式查询
	 * 
	 * @return
	 */
	public String chukqrgmsCx() {
		String transcode = "32101";
		Map<String, String> map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}

	/**
	 * 32102 出库确认G模式修改
	 * 
	 * @return
	 */
	public String chukqrgmsXg() {
		String transcode = "32102";
		Map<String, String> map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}

	/**
	 * 32103 出库确认G模式确认出库
	 * 
	 * @return
	 */
	public String chukqrgmsQrck() {
		String transcode = "32103";
		Map<String, String> map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	


	/* 按备货单出库 */
	/**
	 * 322 进入按备货单出库页面
	 * 
	 * @return String
	 */
	public String anbhdckYm() {
		return SELECT;
	}

	/**
	 * 32201 按备货单出库查询
	 * 
	 * @return
	 */
	public String anbhdckCx() {
		String transcode = "32201";
		Map<String, String> map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}

	/**
	 * 32202 按备货单出库修改
	 * 
	 * @return
	 */
	public String anbhdckXg() {
		String transcode = "32202";
		Map<String, String> map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}

	/**
	 * 32203 按备货单出库确认出库
	 * 
	 * @return
	 */
	public String anbhdckQrck() {
		String transcode = "32203";
		Map<String, String> map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 323 CD/MD出库页面
	 */
	public  String cdmdCK(){
        return  SELECT;
	}

	/* 调拨备货 */
	/**
	 * 326 进入调拨备货页面
	 * 
	 * @return String
	 */
	public String diaobbhYm() {
		return SELECT;
	}

	/**
	 * 32601 调拨备货查询
	 * 
	 * @return
	 */
	public String diaobbhmxCx() {
		String transcode = "32601";
		Map<String, String> map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}

	/**
	 * 32602 调拨备货备货
	 * 
	 * @return
	 */
	public String diaobbhBh() {
		String transcode = "32602";
		Map<String, String> map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 32603 调拨备货查询
	 * 
	 * @return
	 */
	public String diaobbhCx() {
		String transcode = "32603";
		Map<String, String> map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	
	/**
	 * P32603 调拨备货页面
	 * 
	 * @return String
	 */
	public String tiaozdbbh() {
		JSONObject obj = JSONObject.fromObject(this.getParam("putvalue"));
		setRequestAttribute("result", obj);
		return "select";
	}
	/* 仓库间移库 */
	/**
	 * 329 进入仓库间移库页面
	 * 
	 * @return String
	 */
	public String cangkjykYm() {
		return SELECT;
	}

	/**
	 * 32901 仓库间移库查询
	 * 
	 * @return
	 */
	public String cangkjykCx() {
		String transcode = "32901";
		Map<String, String> map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}

	/**
	 * 32902 仓库间移库添加
	 * 
	 * @return
	 */
	public String cangkjykTj() {
		String transcode = "32902";
		Map<String, String> map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}

	/**
	 * 32903 仓库间移库查看
	 * 
	 * @return
	 */
	public String cangkjykCk() {
		String transcode = "32903";
		Map<String, String> map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}

	/**
	 * P32901 仓库间移库备货单维护页面
	 * 
	 * @return String
	 */
	public String cangkjykbhdwhYm() {
		JSONObject obj = JSONObject.fromObject(this.getParam("putvalue"));
		setRequestAttribute("result", obj);
		return SELECT;
	}

	/**
	 * 32904仓库间移库备货单维护删除
	 * 
	 * @return
	 */
	public String cangkjykbhdwhSc() {
		String transcode = "32904";
		Map<String, String> map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}

	/**
	 * 32905 仓库间移库打印移库备货单
	 * 
	 * @return
	 */
	public String cangkjykDyykbhd() {
		String transcode = "32905";
		Map<String, String> map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}

	/* 仓库间移库备货确认 */
	/**
	 * 330 进入仓库间移库备货确认页面
	 * 
	 * @return String
	 */
	public String cangkjykbhqrYm() {
		return SELECT;
	}

	/**
	 * 33001仓库间移库备货确认明细确认
	 * 
	 * @return
	 */
	public String cangkjykbhqrMxqr() {
		String transcode = "33001";
		Map<String, String> map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}

	/**
	 * 33002仓库间移库备货确认备货单确认
	 * 
	 * @return
	 */
	public String cangkjykbhqrBhdqr() {
		String transcode = "33002";
		Map<String, String> map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}

	/**
	 * 33003仓库间移库备货确认备货单权限查询
	 * 
	 * @return
	 */
	public String cangkjykbhqrBhdqxcx() {
		String transcode = "33003";
		Map<String, String> map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}

	/* 仓库间移库接收确认 */
	/**
	 * 331 进入仓库间移库接收确认页面
	 * 
	 * @return String
	 */
	public String cangkjykjsqrYm() {
		return SELECT;
	}

	/**
	 * 33101仓库间移库接收确认明细确认
	 * 
	 * @return
	 */
	public String cangkjykjsqrMxqr() {
		String transcode = "33101";
		Map<String, String> map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}

	/**
	 * 33102仓库间移库接收确认备货单确认
	 * 
	 * @return
	 */
	public String cangkjykjsqrBhdqr() {
		String transcode = "33102";
		Map<String, String> map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}

	/**
	 * 33103仓库间移库接收确认备货单权限查询
	 * 
	 * @return
	 */
	public String cangkjykjsqrBhdqxcx() {
		String transcode = "33103";
		Map<String, String> map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	/**
	 * 33104 出库确认G模式确认出库
	 * 
	 * @return
	 */
	public String chukqrgmsQrckkk() {
		String transcode = "33104";
		Map<String, String> map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	/* 仓库间移库单查询 */
	/**
	 * 332 进入 仓库间移库单查询页面
	 * 
	 * @return String
	 */
	public String cangkjykdcxYm() {
		return SELECT;
	}

	/**
	 * 33201 仓库间移库单查询页面查询
	 * 
	 * @return
	 */
	public String cangkjykdcxCx() {
		String transcode = "33201";
		Map<String, String> map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}

	/* 仓库间移库备货单查询 */
	/**
	 * 333 进入仓库间移库备货单查询页面
	 * 
	 * @return String
	 */
	public String cangkjykbhdYm() {
		return SELECT;
	}

	/**
	 * 33301 仓库间移库备货单查询页面查询
	 * 
	 * @return
	 */
	public String cangkjykbhdCx() {
		String transcode = "33301";
		Map<String, String> map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}

	/**
	 * 33302 仓库间移库备货单查询页面删除
	 * 
	 * @return
	 */
	public String cangkjykbhdSc() {
		String transcode = "33302";
		Map<String, String> map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}

	/* 出库流水查询 */
	/**
	 * 338 进入出库流水查询页面
	 * 
	 * @return String
	 */
	public String chuklscxYm() {
		return SELECT;
	}

	/**
	 * 33801 出库流水查询页面查询
	 * 
	 * @return
	 */
	public String chuklscxCx() {
		String transcode = "33801";
		Map<String, String> map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}

	/**
	 * 33802 出库流水查询页面导出
	 * 
	 * @return
	 */
	public String chuklscxDc() {
		Map<String, String> map = this.getParams();
		map.put("usercenter", AuthorityUtils.getSecurityUser().getUsercenter());

		// 出库流水查询数据
		List<Chuklscx> list = beihckService.selectChuklscx(map);
		// 转换数据格式
		List<Map<String, Object>> listMap = new ArrayList<Map<String, Object>>();

		for (Chuklscx entity : list) {
			Map<String, Object> mapData = new HashMap<String, Object>();
			mapData.put("yaohlh", CKUtil.setValue(entity.getYaohlh(), 12));
			mapData.put("beihdh", CKUtil.setValue(entity.getBeihdh(), 12));
			mapData.put("cangkbh", CKUtil.setValue(entity.getCangkbh(), 3));
			mapData.put("ush", CKUtil.setValue(entity.getUsh(), 10));
			mapData.put("usxh", CKUtil.setValue(entity.getUsxh(), 5));
			mapData.put("lingjbh", CKUtil.setValue(entity.getLingjbh(), 12));
			mapData.put("lingjmc", CKUtil.setValue(entity.getLingjmc(), 20));
			mapData.put("lingjsl", CKUtil.setValue(entity.getLingjsl(), 9));
			mapData.put("danw", CKUtil.setValue(entity.getDanw(), 2));
			mapData.put("gongysdm", CKUtil.setValue(entity.getGongysdm(), 10));
			mapData.put("elh", CKUtil.setValue(entity.getElh(), 10));
			mapData.put("pich", CKUtil.setValue(entity.getPich(), 12));
			mapData.put("keh", CKUtil.setValue(entity.getKeh(), 10));
			mapData.put("shangxfs", CKUtil.setValue(entity.getShangxfs(), 4));
			mapData.put("chukrq", CKUtil.setValue(entity.getChukrq(), 20));
			mapData.put("zhengclsh", CKUtil.setValue(entity.getZhengclsh(), 9));
			mapData.put("peislb", CKUtil.setValue(entity.getPeislb(), 4));
			mapData.put("usercode", CKUtil.setValue(entity.getUsercode(), 20));
			mapData.put("beihybh", CKUtil.setValue(entity.getBeihybh(), 20));
			listMap.add(mapData);
		}
		// 数据源
		Map<String, Object> dataSource = new HashMap<String, Object>();
		dataSource.put("date", CKUtil.getSysDate());
		// 导出查询条件
		dataSource.put("params", map);
		dataSource.put("lingjbh", CKUtil.setValue(map.get("lingjbh"), 10));
		dataSource.put("gongysdm", CKUtil.setValue(map.get("gongysdm"), 10));
		dataSource.put("cangkbh", CKUtil.setValue(map.get("cangkbh"), 3));
		dataSource.put("zickbh", CKUtil.setValue(map.get("zickbh"), 3));
		dataSource.put("keh", CKUtil.setValue(map.get("keh"), 10));
		dataSource.put("shangxms", CKUtil.setValue(map.get("shangxms"), 4));
		dataSource.put("shangxfs", CKUtil.setValue(map.get("shangxfs"), 4));
		dataSource.put("peislb", CKUtil.setValue(map.get("peislb"), 4));
		dataSource.put("chukrq1", CKUtil.setValue(map.get("chukrq1"), 20));
		dataSource.put("chukrq2", CKUtil.setValue(map.get("chukrq2"), 20));
		dataSource.put("zhengclsh1", CKUtil.setValue(map.get("zhengclsh1"), 9));
		dataSource.put("zhengclsh2", CKUtil.setValue(map.get("zhengclsh2"), 9));
		// 导出查询结果
		dataSource.put("list", listMap);

		// 拿到response对象
		HttpServletResponse response = ActionContext.getActionContext()
				.getResponse();
		// 设置下载
		
		//设置下载 (0为文本，1为Excel)
		if (map.get("daoclx").toString().equals("0")){  
			downloadServices.downloadFile("Chuklscx.ftl", dataSource, response, "出库流水查询", ExportConstants.FILE_TXT, false);
		} else {
			downloadServices.downloadFile("ChuklscxXls.ftl", dataSource, response, "出库流水查询", ExportConstants.FILE_XLS, false);
		}
		
		
		/*downloadServices.downloadFile("Chuklscx.ftl", dataSource, response,
				"出库流水查询", ExportConstants.FILE_TXT, false);*/
		// 返回类型一定要是download类型的
		return "downLoad";
	}

	/* 零件状态查询 */
	/**
	 * 339 零件状态查询页面
	 * 
	 * @return String
	 */
	public String lingjztcxYm() {
		return SELECT;
	}

	/**
	 * 33901 零件状态查询页面查询
	 * 
	 * @return
	 */
	public String lingjztcxCx() {
		String transcode = "33901";
		Map<String, String> map = this.getParams();
 		if("0".equals(map.get("flag")) ){
			map.put("cklist", cklist);
		}
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	/**
	 * 33902 零件状态查询页面查询打印
	 * 0011460/0011522
	 * @return String
	 */
	public String lingjztcxdy(@Param("list") ArrayList<Kuccx> list) {
		String transcode = "33902";
		Map map = this.getParams();
        map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}

	/* 零件EL清单查询 */
	/**
	 * 340 进入零件EL清单查询页面
	 * 
	 * @return String
	 */
	public String lingjelqdYm() {
		return SELECT;
	}

	/**
	 * 34001 零件EL清单查询页面查询
	 * 
	 * @return
	 */
	public String lingjelqdCx() {
		String transcode = "34001";
		Map<String, String> map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}

	/* 342 库存查询 */
	/**
	 * 342 库存查询页面
	 * 
	 * @return String
	 */
	public String kuccxYm() {
		return SELECT;
	}

	/**
	 * 34201 库存查询页面查询
	 * 
	 * @return
	 */
	public String kuccxCx() {
		String transcode = "34201";
		Map<String, String> map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	/**
	 * 34203 库存查询页面打印 huxy_11459
	 * public String cpkljzthzprint(@Param("list") ArrayList<CPLingjzthz> list) {
	 * @return
	 */
	public String kuccxPrint(@Param("list" )ArrayList<Kuccx> list) {
		String transcode = "34203";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}

	/**
	 * 34202 库存查询页面导出
	 * 
	 * @return
	 */
	public String kuccxDc() {
		Map<String, String> map = this.getParams();
		String usercenter = AuthorityUtils.getSecurityUser().getUsercenter();
		map.put("usercenter", usercenter);
        if("3".equals(map.get("baozzt1"))){
        	map.remove("baozzt1");
        	map.put("baozzt1","6");
        	if("".equals(map.get("zhuangtsx1"))){
        		map.put("zhuangtsx1", "11");
        	}
        }
		// 库存查询数据
		List<Kuccx> list = beihckService.selectKuccx(map);
		// 转换数据格式
		List<Map<String, Object>> listMap = new ArrayList<Map<String, Object>>();
		Map<String, Object> mapData = new HashMap<String, Object>();
		mapData.put("cangkbh", CKUtil.setValue(CKUtil.getBundleValue("cangkbh",null), 6));
		mapData.put("ush", CKUtil.setValue(CKUtil.getBundleValue("ush",null), 10));
		mapData.put("ucgs", CKUtil.setValue(CKUtil.getBundleValue("ucgs",null), 5));
		mapData.put("gongysdm", CKUtil.setValue(CKUtil.getBundleValue("gongysdm",null), 10));
		mapData.put("kuwbh", CKUtil.setValue(CKUtil.getBundleValue("kuwbh",null), 6));
		mapData.put("lingjsl", CKUtil.setValue(CKUtil.getBundleValue("lingjsl",null), 9));
		mapData.put("danw",CKUtil.setValue(CKUtil.getBundleValue("danw",null), 2));
		mapData.put("elh", CKUtil.setValue(CKUtil.getBundleValue("elh",null), 10));
		mapData.put("pich", CKUtil.setValue(CKUtil.getBundleValue("pich",null), 12));
		mapData.put("ruklx",CKUtil.setValue(CKUtil.getBundleValue("ruklx",null),8));
		mapData.put("rukrq", CKUtil.setValue(CKUtil.getBundleValue("rukrq",null), 20));
		mapData.put("shixrq", CKUtil.setValue(CKUtil.getBundleValue("shixrq",null), 20));
		mapData.put("kucts", CKUtil.setValue(CKUtil.getBundleValue("kucts",null), 20));
		mapData.put("zhuangtsx", CKUtil.setValue(CKUtil.getBundleValue("zhuangtsx",null),8));
		listMap.add(mapData);
		for (Kuccx entity : list) {
            mapData = new HashMap<String, Object>();
			mapData.put("cangkbh", CKUtil.setValue(entity.getCangkbh(), 6));
			mapData.put("ush", CKUtil.setValue(entity.getUsh(), 10));
			mapData.put("ucgs", CKUtil.setValue(entity.getUcgs(), 5));
			mapData.put("gongysdm", CKUtil.setValue(entity.getGongysdm(), 10));
			mapData.put("kuwbh", CKUtil.setValue(entity.getKuwbh(), 6));
			mapData.put("lingjsl", CKUtil.setValue(entity.getLingjsl(), 9));
			mapData.put("danw", CKUtil.setValue(entity.getDanw(), 2));
			mapData.put("elh", CKUtil.setValue(entity.getElh(), 10));
			mapData.put("pich", CKUtil.setValue(entity.getPich(), 12));
			mapData.put("ruklx",CKUtil.setValue(CKUtil.getBundleValue("C_RUKLX"+entity.getRuklx(),null),8));
			mapData.put("rukrq", CKUtil.setValue(entity.getRukrq(), 20));
			mapData.put("shixrq", CKUtil.setValue(entity.getShixrq(), 20));
			mapData.put("kucts", CKUtil.setValue(entity.getKucts(), 20));
			mapData.put("zhuangtsx",CKUtil.setValue( CKUtil.getBundleValue("C_USZTSX_"+entity.getZhuangtsx(),null),8));
			listMap.add(mapData);
		}
		// 数据源
		Map<String, Object> dataSource = new HashMap<String, Object>();
		dataSource.put("date", CKUtil.getSysDate());
		// 导出查询条件
		dataSource.put("params", map);
		dataSource.put("lingjbh", CKUtil.setValue(map.get("lingjbh"), 10));
		dataSource.put("gongysdm", CKUtil.setValue(map.get("gongysdm"), 10));
		dataSource.put("cangkbh", CKUtil.setValue(map.get("cangkbh"), 3));
		dataSource.put("zickbh", CKUtil.setValue(map.get("zickbh"), 3));
		dataSource.put("rukrq1", CKUtil.setValue(map.get("rukrq1"), 20));
		dataSource.put("rukrq2", CKUtil.setValue(map.get("rukrq2"), 20));
		// 导出查询结果
		dataSource.put("list", listMap);

		// 拿到response对象
		HttpServletResponse response = ActionContext.getActionContext()
				.getResponse();
		// 设置下载
		//设置下载 (0为文本，1为Excel)
		if (map.get("daoclx").toString().equals("0")){  
			downloadServices.downloadFile("Kuccx.ftl", dataSource, response,
					"库存查询", ExportConstants.FILE_TXT, false);
		} else {
			downloadServices.downloadFile("KuccxXls.ftl", dataSource, response,
					"库存查询", ExportConstants.FILE_XLS, false);
		}
		
		// 返回类型一定要是download类型的
		return "downLoad";
	}

	/* 看板扫卡 */
	/**
	 * 343 进入看板扫卡页面
	 * 
	 * @return String
	 */
	public String kanbskYm() {
		return SELECT;
	}

	/**
	 * 34301 看板扫卡确定
	 * 
	 * @return
	 */
	public String kanbskQd() {
		String transcode = "34301";
		Map<String, String> map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}

	/* 扫卡查询 */
	/**
	 * 344 进入扫卡查询页面
	 * 
	 * @return String
	 */
	public String saokcxYm() {
		return SELECT;
	}

	/**
	 * 34401 扫卡查询页面查询
	 * 
	 * @return
	 */
	public String saokcxCx() {
		String transcode = "34401";
		Map<String, String> map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}

	/**
	 * 34402 扫卡查询页面导出
	 * 
	 * @return
	 */
	public String saokcxDc() {
		Map<String, String> map = this.getParams();
		map.put("usercenter", AuthorityUtils.getSecurityUser().getUsercenter());
		// 查询扫卡数据
		List<Saokcx> list = beihckService.selectSaokcx(map);
		// 转换数据格式
		List<Map<String, Object>> listMap = new ArrayList<Map<String, Object>>();
		Map<String, Object> mapData = new HashMap<String, Object>();
		mapData.put("xunhbm", CKUtil.setValue(CKUtil.getBundleValue("xunhbh",null), 8));
		mapData.put("dangqxhgm", CKUtil.setValue(CKUtil.getBundleValue("xunhgm",null), 6));
		mapData.put("gonghms", CKUtil.setValue(CKUtil.getBundleValue("xunhlx",null), 20));
		mapData.put("yaohlh", CKUtil.setValue(CKUtil.getBundleValue("yaohlh",null), 12));
		mapData.put("yaohlzt", CKUtil.setValue(CKUtil.getBundleValue("zhuangt",null), 2));
		mapData.put("lingjbh", CKUtil.setValue(CKUtil.getBundleValue("lingbh",null), 10));
		mapData.put("lingjmc",CKUtil.setValue(CKUtil.getBundleValue("lingjmc",null), 40));
		mapData.put("yaohsl", CKUtil.setValue(CKUtil.getBundleValue("zhuangcsl",null), 9));
		mapData.put("danw", CKUtil.setValue(CKUtil.getBundleValue("lingjdw",null), 2));
		mapData.put("shiflsk",CKUtil.setValue(CKUtil.getBundleValue("linskbz",null),1));
		mapData.put("quxbs", CKUtil.setValue(CKUtil.getBundleValue("quxbz",null), 1));
		mapData.put("keh", CKUtil.setValue(CKUtil.getBundleValue("keh",null), 10));
		mapData.put("saoksj", CKUtil.setValue(CKUtil.getBundleValue("kadscsj",null), 20));
		mapData.put("zuiwsj", CKUtil.setValue(CKUtil.getBundleValue("zuiwjfsj",null),20));
		mapData.put("jiaofsj", CKUtil.setValue(CKUtil.getBundleValue("jiaofsj",null), 20));
		mapData.put("oper_no", CKUtil.setValue(CKUtil.getBundleValue("yonghbh",null), 32));
		mapData.put("gongysdm", CKUtil.setValue(CKUtil.getBundleValue("gongys",null), 10));
		mapData.put("fasbh", CKUtil.setValue(CKUtil.getBundleValue("fasbh",null),10));
		listMap.add(mapData);
		for (Saokcx entity : list) {
			mapData = new HashMap<String, Object>();
			mapData.put("xunhbm", CKUtil.setValue(entity.getXunhbm(), 8));
			mapData.put("dangqxhgm", CKUtil.setValue(entity.getDangqxhgm(), 6));
			mapData.put("gonghms", CKUtil.setValue(entity.getGonghms(), 20));
			mapData.put("yaohlh", CKUtil.setValue(entity.getYaohlh(), 12));
			mapData.put("yaohlzt", CKUtil.setValue(entity.getYaohlzt(), 2));
			mapData.put("lingjbh", CKUtil.setValue(entity.getLingjbh(), 10));
			mapData.put("lingjmc", CKUtil.setValue(entity.getLingjmc(), 40));
			mapData.put("yaohsl", CKUtil.setValue(entity.getYaohsl(), 9));
			mapData.put("danw", CKUtil.setValue(entity.getDanw(), 2));
			mapData.put("shiflsk", CKUtil.setValue(entity.getShiflsk(), 1));
			mapData.put("quxbs", CKUtil.setValue(entity.getQuxbs(), 1));
			mapData.put("keh", CKUtil.setValue(entity.getKeh(), 10));
			mapData.put("saoksj", CKUtil.setValue(entity.getSaoksj(), 20));
			mapData.put("zuiwsj", CKUtil.setValue(entity.getZuiwsj(), 20));
			mapData.put("jiaofsj", CKUtil.setValue(entity.getJiaofsj(), 20));
			mapData.put("oper_no", CKUtil.setValue(entity.getOper_no(), 32));
			mapData.put("gongysdm", CKUtil.setValue(entity.getGongysdm(), 10));
			mapData.put("fasbh", CKUtil.setValue(entity.getFasbh(), 10));
			listMap.add(mapData);
		}
		// 数据源
		Map<String, Object> dataSource = new HashMap<String, Object>();
		dataSource.put("date", CKUtil.getSysDate());
		// 导出查询条件
		dataSource.put("params", map);
		dataSource.put("lingjbh", CKUtil.setValue(map.get("lingjbh"), 10));
		dataSource.put("keh", CKUtil.setValue(map.get("keh"), 10));
		dataSource.put("xunhbm", CKUtil.setValue(map.get("xunhbm"), 8));
		dataSource.put("saoksj1", CKUtil.setValue(map.get("saoksj1"), 20));
		dataSource.put("saoksj2", CKUtil.setValue(map.get("saoksj2"), 20));
		dataSource.put("oper_no", CKUtil.setValue(map.get("oper_no"), 20));
		// 导出查询结果
		dataSource.put("list", listMap);

		// 拿到response对象
		HttpServletResponse response = ActionContext.getActionContext().getResponse();
		//设置下载 (0为文本，1为Excel)
		if (map.get("daoclx").toString().equals("0")){  
			downloadServices.downloadFile("Saokcx.ftl", dataSource, response,
					"扫卡查询", ExportConstants.FILE_TXT, false);
		} else {
			downloadServices.downloadFile("SaokcxXls.ftl", dataSource, response,
					"扫卡查询", ExportConstants.FILE_XLS, false);
		}
		// 返回类型一定要是download类型的
		return "downLoad";
		
	}
	

	/* 创建内部异常申报要货令 */
	/**
	 * 345 进入创建内部异常申报要货令页面
	 * 
	 * @return String
	 */
	public String chuangjnbycsbyhlYm() {
		return SELECT;
	}

	/**
	 * 34501 创建内部异常申报要货令查询
	 * 
	 * @return
	 */
	public String chuangjnbycsbyhlCx() {
		String transcode = "34501";
		Map<String, String> map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}

	/**
	 * 34502 创建内部异常申报要货令创建
	 * 
	 * @return
	 */
	public String chuangjnbycsbyhlCj() {
		String transcode = "34502";
		Map<String, String> map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}

	/* 346 要货令查询 */
	/**
	 * 346 要货令查询页面
	 * 
	 * @return String
	 */
	public String yaohlcxYm() {
		return SELECT;
	}

	/**
	 * 34601 要货令查询页面查询
	 * 
	 * @return
	 */
	public String yaohlcxCx() {
		String transcode = "34601";
		Map<String, String> map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}

	/**
	 * 34602 要货令查询页面查看
	 * 
	 * @return
	 */
	public String yaohlcxCk() {
		String transcode = "34602";
		Map<String, String> map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}

	/**
	 * 34603 要货令查询页面打印
	 * 
	 * @return
	 */
	public String yaohlcxDy(@Param("list") ArrayList<Beihdtbyhl> list) {
		String transcode = "34603";
		Map map = this.getParams();
        map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}

	/**
	 * P34601要货令查询-同步/集配清单页面跳转
	 * 
	 * @return
	 */
	public String yaohlcxtbjpqdYm() {
		JSONObject obj = JSONObject.fromObject(this.getParam("putvalue"));
		setRequestAttribute("result", obj);
		return SELECT;
	}

	/* 347根据出库单收货 */
	/**
	 * 347 进入根据出库单收货页面
	 * 
	 * @return String
	 */
	public String genjckdshYm() {
		return SELECT;
	}

	/**
	 * 34701根据出库单收货明细确认
	 * 
	 * @return
	 */
	public String genjckdshMxqr(@Param("list") ArrayList<Chukdsh> list) {
		String transcode = "34701";
		Map map = this.getParams();
	    map.put("list", list);
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}

	/**
	 * 34702根据出库单收货备货单确认
	 * 
	 * @return
	 */
	public String genjckdshBhdqr(@Param("list") ArrayList<Chukdsh> list) {
		String transcode = "34702";
		Map map = this.getParams();
		 map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}

	/**
	 * 34703根据出库单收货备货单确认备货单权限查询
	 * 
	 * @return
	 */
	public String genjckdshBhdqxcx() {
		String transcode = "34703";
		Map<String, String> map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	/**
	 * 34704根据出库单收货备货单修改
	 * 
	 * @return
	 */
	public String genjckdshBhdqxxg() {
		String transcode = "34704";
		Map<String, String> map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	/* 创建外部异常申报要货令 */
	/**
	 * 348 进入创建外部异常申报要货令页面
	 * 
	 * @return String
	 */
	public String chuangjwbycsbyhlYm() {
		return SELECT;
	}

	/**
	 * 34801 创建外部异常申报要货令查询
	 * 
	 * @return
	 */
	public String chuangjwbycsbyhlCx() {
		String transcode = "34801";
		Map<String, String> map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}

	/**
	 * 34802 创建外部异常申报要货令创建
	 * 
	 * @return
	 */
	public String chuangjwbycsbyhlCj() {
		String transcode = "34802";
		Map<String, String> map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 349 C0初始化布线页面
	 * 
	 * @return String
	 */
	public String chushbx() {
		return SELECT;
	}
	/**
	 * 349初始化布线开始
	 */
	public String chushbxks(){
		String transcode = "Y0901";
		Map<String, String> map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 35001 仓库移库备货确认撤销
	 * 
	 * @return
	 */
	public String ckykbh() {
		String transcode = "35001";
		Map<String, String> map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 351  创建临时要货令页面
	 * 
	 * @return String
	 */
	public String chuangjlsyhl() {
		return SELECT;
	}
	/**
	 * 35101 创建临时要货令新增
	 * 
	 * @return
	 */
	public String chuangjlsyhlinsert() {
		String transcode = "35101";
		Map<String, String> map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	
	/**
	 * 35101 创建临时要货令删除
	 * 
	 * @return
	 */
	public String chuangjlsyhldelete(@Param("list") ArrayList<Beihdtbyhl> list) {
		String transcode = "35101";
		Map map = this.getParams();
        map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 352 零件状态汇总查询
	 */
	public String lingjzthzcxym() {
		return SELECT;
	}
	/**
	 * 35201 零件状态汇总查询
	 * 
	 * @return
	 */
	public String lingjzthzcx() {
		String transcode = "35201";
		Map<String, String> map = this.getParams();
		if("0".equals(map.get("flag")) ){
			map.put("cklist", cklist);
		}
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	/**
	 * P35201 跳转到零件状态查看页面
	 * @return
	 */
	public String tzljztcxym() {
		JSONObject obj = JSONObject.fromObject(this.getParam("putvalue"));
		setRequestAttribute("result", obj);
		return SELECT;
	}
	/**
	 * 353 库位内容查询页面
	 */
	public String kuwnrcxym() {
		return SELECT;
	}
	/**
	 * 35301 库位内容查询
	 * 
	 * @return
	 */
	public String kuwnrcx() {
		String transcode = "35301";
		Map<String, String> map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	/**
	 * 要货令类型
	 * 
	 * @return
	 */
	public String yaohllx() {
		ArrayList list = new ArrayList();
		list.add("{name:\"C_CANGKYH\",value:\"1\"}");
		list.add("{name:\"C_GONGYSYH\",value:\"2\"}");
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
	public String neibugonghms() {
		ArrayList list = new ArrayList();
		list.add("{name:\"RD\",value:\"RD\"}");
		list.add("{name:\"RM\",value:\"RM\"}");
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
	public String waibugonghms() {
		ArrayList list = new ArrayList();
		list.add("{name:\"R1\",value:\"R1\"}");
		list.add("{name:\"R2\",value:\"R2\"}");
		// 拼Json串
		String sJson = JSONArray.fromObject(list).toString();
		CommonEntity commonEntity = new CommonEntity();
		commonEntity.setParameter("{list:" + sJson + "}");
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;
	}
	
	/**
	 * 是否
	 * 
	 * @return
	 */
	public String shiffsgys() {
		ArrayList list = new ArrayList();
		list.add("{name:\"C_SHI\",value:\"1\"}");
		list.add("{name:\"C_FOU\",value:\"0\"}");
		// 拼Json串
		String sJson = JSONArray.fromObject(list).toString();
		CommonEntity commonEntity = new CommonEntity();
		commonEntity.setParameter("{list:" + sJson + "}");
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;
	}
	
	/**
	 * 354 取消要货令
	 */
	public String quxyhlym() {
		return SELECT;
	}
	/**
	 * 35401 取消要货令查询
	 * 
	 * @return
	 */
	public String quxyhlymcx() {
		String transcode = "35401";
		Map<String, String> map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 35402 取消要货令
	 * 
	 * @return
	 */
	public String quxyhlymqx(@Param("list") ArrayList<Beihdtbyhl> list) {
		String transcode = "35402";
		Map map = this.getParams();
        map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 355 出库明细状态查询页面
	 */
	public String ckmxym() {
		return SELECT;
	}
	/**
	 * 35501 取消要货令查询
	 * 
	 * @return
	 */
	public String ckmxztcx() {
		String transcode = "35501";
		Map<String, String> map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 356H模式出库页面
	 */
	public String hmsckym() {
		return SELECT;
	}
	/**
	 * 35601 H模式出库备货单回车事件
	 * 
	 * @return
	 */
	public String beihdhccx() {
		String transcode = "35601";
		Map<String, String> map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 35602 H模式出库US号回车事件
	 * 
	 * @return
	 */
	public String ushhccx() {
		String transcode = "35602";
		Map<String, String> map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 35603H模式出库扫包装确认事件
	 * 
	 * @return
	 */
	public String saobzqrcx() {
		String transcode = "35603";
		Map<String, String> map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 *  35604H模式出库确认事件
	 * 
	 * @return
	 */
	public String hmsqr() {
		String transcode = "35604";
		Map<String, String> map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 35605H模式出库修改事件
	 * 
	 * @return
	 */
	public String hmsxg() {
		String transcode = "35605";
		Map<String, String> map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 35606 H模式出库取消
	 * 
	 * @return
	 */
	public String hmsqx(@Param("list") ArrayList<Beihdtbyhlmx> list) {
		String transcode = "35606";
		Map map = this.getParams();
        map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	/**
	 * 357内同步手动备货页面
	 */
	public String ntbsdbhym() {
		return SELECT;
	}
	/**
	 * 35701内同步手动备货查询
	 * @return
	 */
	public String ntbbhcx() {
		String transcode = "35701";
		Map<String, String> map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 35703内同步手动备货确认
	 * @return
	 */
	public String ntbbhqr() {
		String transcode = "35703";
		Map<String, String> map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 35702内同步手动备货强制备货
	 * @return
	 */
	public String ntbbhqz() {
		String transcode = "35702";
		Map<String, String> map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 承运商下拉框
	 */
	public  String  chengysdm(){
		Map<String, String> map = this.getParams();
		List<Tongbyhl> list = beihckService.chengysdmcx(map);
		CommonEntity commonEntity = new CommonEntity();
		ArrayList aList = new ArrayList();
		for (int i = 0; i < list.size(); i++) {
			Tongbyhl cys = list.get(i);
			if(cys.getChengysdm() !=null){
				aList.add("{name:\"" + cys.getChengysdm() + "\",value:\""
					+ cys.getChengysdm() + "\"}");
			}
		}
		String sJson = JSONArray.fromObject(aList).toString();
		String response ="0000";
		if(0 == list.size()){
			response ="C3_CYS_01";
			commonEntity.setResponse(response);
		}else if(1==list.size()){
			if(list.get(0).getChengysdm()==null){
				response ="C3_CYS_01";
			 }else{
			    commonEntity.setParameter("{list:" + sJson + ",chengysdm:\""+list.get(0).getChengysdm()+"\"}");
			 }
			   commonEntity.setResponse(response);
			
		}else{
			commonEntity.setParameter("{list:" + sJson + "}");
			commonEntity.setResponse(response);
		}
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;
	}
	/**
	 * 358内同步要货令备货时间提前页面
	 */
	public String ntbtqbhym() {
		return SELECT;
	}
	/**
	 * 35801内同步要货令备货时间提前查询
	 * @return
	 */
	public String ntbtqbhcx() {
		String transcode = "35801";
		Map<String, String> map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 35802内同步要货令备货时间提前提交
	 * @return
	 */
	public String ntbtqbhqr() {
		String transcode = "35802";
		Map<String, String> map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	

	/**
	 * 361按需延误要货令查询页面
	 */
	public String axywyhlcxym() {
		return SELECT;
	}
	/**
	 * 36101按需延误要货令查询
	 * @return
	 */
	public String axywyhlcx() {
		String transcode = "36101";
		Map<String, String> map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	/**
	 * 362成品库零件状态汇总
	 */
	public String cpkljzthz() {
		return SELECT;
	}
	
	/**
	 * 36201查询成品库零件状态汇总 huxy_11470
	 * @return
	 */
	public String cpkljzthzsel() {
		String transcode = "36201";
		Map<String, String> map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	/**
	 * 36202 打印成品库零件状态汇总
	 * @return
	 */
	public String cpkljzthzprint(@Param("list") ArrayList<CPLingjzthz> list) {
		String transcode = "36202";
		Map map = this.getParams();
		//Map<String, String> map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 363 发运单查询 huxy_11468
	 * @return
	 */
	public String fayd(){
		return SELECT;
	}
	/**
	 * 36301 发运单查询 huxy_11468
	 * @return
	 */
	public String faydcx() {
		String transcode = "36301";
		Map<String, String> map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	/**
	 * 36302 发运单查询明细 huxy_11468
	 * @return
	 */
	public String faydcxmx() {
		String transcode = "36302";
		Map<String, String> map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	/**
	 * 36303 发运单查询明细打印 huxy_11468
	 * @return
	 */
	public String faydcxprint() {
		String transcode = "36303";
		Map<String, String> map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	/**
	 * 跳转到页面
	 * @return
	 */
	public String tiaozyem() {
		JSONObject obj = JSONObject.fromObject(this.getParam("putvalue"));
		setRequestAttribute("result", obj);
		return "select";
	}
	
	/**
	 * 364混流到货通知单查询 huxy_11937
	 * @return
	 */
	public String huldhtzd() {
		return SELECT;
	}
	
	/**
	 * 36401  混流仓库-仓库发货通知单查询 huxy_11937
	 * @return
	 */
	public String hldhtzdcx() {
		String transcode = "36401";
		Map<String, String> map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	/**
	 * 36402  混流到货通知单对账 huxy_11937
	 * @return
	 */
	public String hlckdz() {
		String transcode = "36402";
		Map<String, String> map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	
	/**
	 * 365 混流DFPV库存对账查询 huxy_11947
	 * @return
	 */
	public String hulckdz() {
		return SELECT;
	}
	
	/**
	 * 36401  混流仓库对账查询 huxy_11947
	 * @return
	 */
	public String hlckdzcx() {
		String transcode = "36501";
		Map<String, String> map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
}
