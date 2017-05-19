package com.athena.ck.module.shouhuo.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.athena.authority.entity.LoginUser;
import com.athena.authority.util.AuthorityUtils;
import com.athena.ck.common.CKUtil;
import com.athena.ck.entity.beihuo.Kuccx;
import com.athena.ck.entity.beihuo.Ucbq;
import com.athena.ck.entity.common.CommonEntity;
import com.athena.ck.entity.common.Peislb;
import com.athena.ck.entity.common.Xitcsdy;
import com.athena.ck.entity.shouhuo.Daohxxlrxg;
import com.athena.ck.entity.shouhuo.Tongbyhl;
import com.athena.ck.entity.shouhuo.Uabq;
import com.athena.ck.entity.shouhuo.Yaohl;
import com.athena.ck.entity.yichang.Yic;
import com.athena.ck.module.common.service.CommonService;
import com.athena.ck.module.shouhuo.service.TongbshService;
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
@Component(scope = ComponentDefinition.SCOPE_PROTOTYPE)
public class TongbshAction extends BaseWtcAction {
	public UserInfo getUserInfo() {
		return (UserInfo) getSessionAttribute(ToftConst.Toft_SessionKey_UserData);
	}
	/**
	 * 注入downloadsevices
	 */
	@Inject
	private DownLoadServices downloadServices = null;
	@Inject
	private TongbshService tongbshService;
	@Inject
	private CommonService   cs;
	/**
	 * 150 补货申报页面
	 * 
	 * @return String
	 */
	public String buhsbym() {
		return "select";
	}
	/**
	 * 15001 补货申报查询页面
	 * 
	 * @return String
	 */
	public String buhsbcxym() {
		return "select";
	}
	/**
	 * 137 同步要货令修订页面
	 * 
	 * @return String
	 */
	public String tongbyhlxdym() {
		return "select";
	}

	/**
	 * 117 同步包装单元卡收货页面
	 * 
	 * @return String
	 */
	public String tongbbzdykshym() {
		return "select";
	}

	/**
	 * 15001 补货申报
	 * 
	 * @return String
	 */
	public String buhSb() {
		//验证承运商是否存在
		String transcode = "15001";
		Map map = this.getParams();
		/*LoginUser loginUser = AuthorityUtils.getSecurityUser();
		map.put("usercenter", loginUser.getUsercenter());
		List<Yic> list = cs.searchgongysmc(map);
		if (list.size()<1){
			map.put("response", "C_CHENGYSMCCW");
			setResult("result", JSONObject.fromObject(map));
		} else {
			setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		}*/
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	/**
	 * 15002 补货申报查询
	 * 
	 * @return String
	 */
	public String buhSbcx() {
		String transcode = "15002";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 15003 补货申报添加
	 * 
	 * @return String
	 */
	public String buhSbtj() {
		String transcode = "15003";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 15004 补货申报删除
	 * 
	 * @return String
	 */
	public String buhSbsc(@Param("list") ArrayList<Daohxxlrxg> list) {
		String transcode = "15004";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 15005 补货申报修改
	 * 
	 * @return String
	 */
	public String buhSbxg() {
		String transcode = "15005";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 15006补货申报零件回车查询
	 * 
	 * @return String
	 */
	public String buhSbljcx() {
		Map map = this.getParams();
		LoginUser loginUser = AuthorityUtils.getSecurityUser();
		map.put("usercenter", loginUser.getUsercenter());
		List<Peislb> list=tongbshService.selectLjpslb(map);
		CommonEntity commonEntity = new CommonEntity();
		if(list==null || list.size()==0){
			commonEntity.setResponse("C_9999");	
		}else{
			commonEntity.setResponse("0001");	
		}
		JSONObject obj = JSONObject.fromObject(commonEntity);
		setResult("result", obj);
		return AJAX;
	}
	/**
	 * 15007补货申报查询客户
	 * 
	 * @return String
	 */
	public String buhSbkehcx() {
		Map map = this.getParams();
		Map result=new HashMap();
		  result.put("xiaohd", tongbshService.selectKeh(map));
		  setResult("result",result) ;
		  return  AJAX;
	}

	/**
	 * 11701 同步包装单元卡收货查询
	 * 
	 * @return String
	 */
	public String tongbbzdykshCx() {
		String transcode = "11701";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}

	/**
	 * 11702 同步包装单元卡收货修改
	 * 
	 * @return String
	 */
	public String tongbbzdykshQr() {
		String transcode = "11702";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	/**
	 * 11703 同步包装单元卡收货收货
	 * 
	 * @return String
	 */
	public String tongbbzdykSh() {
		String transcode = "11703";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}

	/**
	 * 11704 同步包装单元卡收货 拒收
	 * 
	 * @return String
	 */
	public String tongbbzdykJs(@Param("list") ArrayList<Daohxxlrxg> list) {
		String transcode = "11704";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 13701 同步要货令修订
	 * 
	 * @return String
	 */
	public String tongbyhlXd() {
		String transcode = "13701";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}

	/**
	 * 118 同步交货单收货
	 * 
	 * @return String
	 */
	public String tongbjhd() {
		return "select";
	}

	/**
	 * 11801 交货单号查询
	 * 
	 * @return String
	 */
	public String cxtongbjhd() {
		String transcode = "11801";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}

	/**
	 * 11804  同步验收单打印页面
	 * 
	 * @return String
	 */
	public String tongbysdPrintYm(){
		return "select";
	}
	
	/**
	 * 11805  打印同步验收单
	 * 
	 * @return String
	 */
	public String tongbysdPrint(){
		Map map = this.getParams();
		JSONObject obj = JSONObject.fromObject(tongbshService.selectTongbysd(map));
		setResult("result", obj);
		return AJAX;
	}
	

	/**
	 * 10206 到货信息录入修改
	 * 
	 * @return
	 * 
	 */
	public String daohxxlrxg() {
		return "select";
	}

	/**
	 * 10207 通过BL号查询供应商零件 F1查询
	 */
	public String selectel(@Param("list") ArrayList<Daohxxlrxg> list) {

		String transcode = "16107";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}

	/**
	 * 16108 修改承运商信息
	 */
	public String updatecys(@Param("list") ArrayList<Daohxxlrxg> list) {

		String transcode = "16108";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}

	/**
	 * 10209 修改EL信息
	 */
	public String updateel(@Param("list") ArrayList<Daohxxlrxg> list) {
		String transcode = "16109";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}

	/**
	 * 10210 修改单条UA信息
	 */
	public String updateua(@Param("list") ArrayList<Daohxxlrxg> list) {
		String transcode = "16110";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}

	/**
	 * 10211 同步信息录入修改 查询单条UA信息
	 */
	public String selectua(@Param("list") ArrayList<Daohxxlrxg> list) {
		String transcode = "16111";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}

	/**
	 * 10212删除UA EL信息
	 */
	public String deleteua(@Param("list") ArrayList<Daohxxlrxg> list) {
		String transcode = "16112";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}

	/**
	 * 128 129 同步包装单元卡查询 进入页面
	 * 
	 * @return
	 */
	public String tongbdyk() {
		return "select";
	}

	/**
	 * 12901 同步包装单元卡 查询到货通知单
	 * 
	 * @return
	 */
	public String daohtzd() {
		String transcode = "12901";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}

	/**
	 * 
	 * 129 同步包装单元卡 通过UT号查询UA标签
	 * 
	 * @return
	 */
	public String utselectua() {
		String transcode = "12902";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		JSONObject obj2 = JSONObject.fromObject(this.getParam("putvalue1"));
		setRequestAttribute("result2", obj2);
		return AJAX;
	}

	/**
	 * 跳转到UA标签页面
	 */
	public String queryua() {
		JSONObject obj = JSONObject.fromObject(this.getParam("putvalue"));
		JSONObject obj1 = JSONObject.fromObject(this.getParam("putvalue1"));
		setRequestAttribute("result", obj);
		setRequestAttribute("result1", obj1);
		return "select";
	}

	/**
	 * 12903 同步包装单元卡 查询UA标签
	 * 
	 * @return
	 */
	public String selecttbua() {
		String transcode = "12903";
		String transcode1 = "12905";
		Map map = this.getParams();
		setResult("result1",CKUtil.getJsonValue(this.callWtc(transcode1, map)));
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}

	/**
	 * 12902 同步包装单元卡 查询包装单元卡明细
	 * 
	 * @return
	 */
	public String selectuamx() {
		String transcode = "12904";
		String transcode1 = "12906";
		Map map = this.getParams();
		setResult("result2",CKUtil.getJsonValue(this.callWtc(transcode1, map)));
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	/**
	 * 12905同步包装单元卡 查询包装单元卡明细
	 * 
	 * @return
	 */
	public String selectuahz1() {
		String transcode = "12905";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	
	/**
	 * 12906 同步包装单元卡 查询包装单元卡明细
	 * 
	 * @return
	 */
	public String selectuahz2() {
		String transcode = "12906";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	

	/**
	 * 130跳转到包装单元卡明细
	 * 
	 * @return
	 */
	public String tiaozuamx() {
		System.out.println(this.getParam("putvalue"));
		JSONObject obj = JSONObject.fromObject(this.getParam("putvalue"));
		
		System.out.println(this.getParam("putvalue1"));
		JSONObject obj1 = JSONObject.fromObject(this.getParam("putvalue1"));
		System.out.println(obj1);
		
		setRequestAttribute("result", obj);
		setRequestAttribute("result2", obj1);	
		return "select";
	}
    /**
     * 131同步整车流水号查询清单 页面
     */
	public  String zclshcxqdym(){
		return "select";
	}
	/**
     * 131同步整车流水号查询清单 
     */
	public  String zclshcxqd(){
		String transcode = "13101";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 132同步整车流水号查询汇总 页面
	 * @return
	 */
	public String zclshcxhzym(){
		return "select";
	}
	/**
	 * 132同步整车流水号查询汇总 
	 * @return
	 */
	public String zclshcxhz(){
		String transcode = "13201";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 133 同步上线时间查询清单
	 * 
	 * @return
	 */
	public String selecttbqd() {
		return "select";
	}

	/**
	 * 13301 同步上线时间查询
	 */
	public String selecttbsxsj() {
		String transcode = "13301";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}

	/**
	 * 134 同步上线时间查询清单
	 * 
	 * @return
	 */
	public String selecttbqdhz() {
		return "select";
	}

	/**
	 * 13401 同步上线时间查询
	 */
	public String selecttbsxsjhz() {
		String transcode = "13401";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
    /**
     * 13402通过仓库及配送类别查询卸货站台
     */
	public String selectxiehzt() {
		Map map = this.getParams();
		  Map result=new HashMap();
		  result.put("xiehzt", cs.selectPeislbXiehzt(map));
		  setResult("result",result) ;
		  return  AJAX;
	}
	/**
	 * 135 同步零件查询清单页面
	 * @return
	 */
	public String tongbljqd() {
		return "select";
	}

	/**
	 * 13501 同步零件查询清单查询
	 */
	public String selecttongbljqd() {
		String transcode = "13501";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}

	/**
	 * 136 同步零件查询汇总页面
	 * 
	 * @return
	 */
	public String tongbljhz() {
		return "select";
	}

	/**
	 * 13601 同步零件查询清单查询
	 */
	public String selecttongbljhz() {
		String transcode = "13601";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}

	/**
	 * 146 流水号跳号查询页面
	 * 
	 * @return
	 */
	public String liushth() {
		return "select";
	}

	/**
	 * 14601 同步要货令修改
	 */
	public String selectliushth() {
		String transcode = "14601";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}

	/**
	 * 147 降级生成包装单元卡号
	 * 
	 * @return
	 */
	public String jiangjscbzdyk() {
		return "select";
	}

	/**
	 * 14701 降级生成包装单元卡号查询
	 */
	public String selectjjscbzdyk() {
		String transcode = "14701";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	/**
	 * 14702 降级生产包装单元卡打印
	 */
	public String printjjscbzdyk(@Param("list") ArrayList<Yaohl> list) {
		String transcode = "14702";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 14703 降级生产包装单元卡导出
	 */
	public String daocjjscbzdyk() {
		LoginUser loginUser = AuthorityUtils.getSecurityUser();
		Map map = new HashMap();
		map.put("usercenter",loginUser.getUsercenter());
		map.put("cangkbh", this.getParam("cangkbh"));
		String str= this.getParam("putvalue");
		map.put("ylist", str);
		//同步要货令降级包装单元卡查询
		List<Tongbyhl> yaohllist = tongbshService.selectbaozdykxx(map);
		// 转换数据格式
		List<Map<String, Object>> listMap = new ArrayList<Map<String, Object>>();
		Map<String, Object> mapData = new HashMap<String, Object>();
		mapData.put("yaohlh", CKUtil.setValue(CKUtil.getBundleValue("baozdykh",null), 6));
		mapData.put("weizh", CKUtil.setValue(CKUtil.getBundleValue("weizh",null), 10));
		mapData.put("zhengclsh", CKUtil.setValue(CKUtil.getBundleValue("zhengclsh",null), 5));
		mapData.put("lingjbh", CKUtil.setValue(CKUtil.getBundleValue("lingjbh",null), 10));
		mapData.put("lingjmc", CKUtil.setValue(CKUtil.getBundleValue("lingjmc",null), 6));
		mapData.put("gongysdm", CKUtil.setValue(CKUtil.getBundleValue("gongysdm",null), 9));
		mapData.put("gongysmc",CKUtil.setValue(CKUtil.getBundleValue("gongysmc",null), 2));
		mapData.put("baozxh", CKUtil.setValue(CKUtil.getBundleValue("baozxh",null), 10));
		mapData.put("usxh", CKUtil.setValue(CKUtil.getBundleValue("baozrl",null), 12));
		mapData.put("zhengcsxsj",CKUtil.setValue(CKUtil.getBundleValue("shangxsj",null),20));
		mapData.put("lingjsl", CKUtil.setValue(CKUtil.getBundleValue("lingjsl",null), 20));
		mapData.put("yaohlztxx", CKUtil.setValue(CKUtil.getBundleValue("yaohlzt",null), 20));
		mapData.put("danw", CKUtil.setValue(CKUtil.getBundleValue("danw",null), 20));
		listMap.add(mapData);
		for (Tongbyhl entity : yaohllist) {
            mapData = new HashMap<String, Object>();
			mapData.put("yaohlh", CKUtil.setValue(entity.getYaohlh(), 6));
			mapData.put("weizh", CKUtil.setValue(entity.getWeizh(), 10));
			mapData.put("zhengclsh", CKUtil.setValue(entity.getZhengclsh(), 5));
			mapData.put("lingjbh", CKUtil.setValue(entity.getLingjbh(), 10));
			mapData.put("lingjmc", CKUtil.setValue(entity.getLingjmc(), 6));
			mapData.put("gongysdm", CKUtil.setValue(entity.getGongysdm(), 9));
			mapData.put("gongysmc", CKUtil.setValue(entity.getGongysmc(), 2));
			mapData.put("baozxh", CKUtil.setValue(entity.getBaozxh(), 10));
			mapData.put("usxh", CKUtil.setValue(entity.getUsxh(), 12));
			mapData.put("zhengcsxsj", CKUtil.setValue(entity.getZhengcsxsj(), 20));
			mapData.put("lingjsl", CKUtil.setValue(entity.getLingjsl(), 20));
			mapData.put("yaohlztxx",CKUtil.setValue(CKUtil.getBundleValue(entity.getYaohlztxx(),null),20));
			mapData.put("danw", CKUtil.setValue(entity.getDanw(), 20));
			listMap.add(mapData);
		}
		// 数据源
		Map<String, Object> dataSource = new HashMap<String, Object>();
		dataSource.put("date", CKUtil.getSysDate());
		// 导出查询条件
		dataSource.put("params", map);
		dataSource.put("peislb",CKUtil.setValue((String) map.get("peislb"),10));
		dataSource.put("chanx", CKUtil.setValue((String) map.get("chanx"), 10));
		dataSource.put("gongysdm", CKUtil.setValue((String) map.get("gongysdm"), 3));
		
		// 导出查询结果
		dataSource.put("list", listMap);

		// 拿到response对象
		HttpServletResponse response = ActionContext.getActionContext()
				.getResponse();
		// 设置下载
	
			downloadServices.downloadFile("jjscbzdykXls.ftl", dataSource, response,
					"降级生成包装单元卡", ExportConstants.FILE_XLS, false);

		
		// 返回类型一定要是download类型的
		return "downLoad";
	}
	/**
	 * 152 包装单元卡号查询 (BL)
	 */
	public String baozdykhbl() {
		return "select";
	}

	/**
	 * 15201 根据包装单元卡号（BL）
	 */
	public String selectbaozdykhbl() {
		String transcode = "15201";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}

	/**
	 * 15601 根据包装单元卡号查询
	 */
	public String baozdykhinfo() {
		String transcode = "15601";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}

	/**
	 * 15202 跳转到新页面 15203
	 */
	public String tiaozhuaninfo() {
		String transcode = "15601";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;

	}
   /**
    * 152 155跳转到页面
    */
	public  String tiaozinfo(){
		String transcode = "15602";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return  AJAX;
	}
	/**
	 * 跳转显示页面
	 * 15203
	 * @return String
	 */
	public String tiaozym(){
		JSONObject obj = JSONObject.fromObject(this.getParam("putvalue"));
		setRequestAttribute("result", obj);
		return "select";
	}
	/**
	 * 156 页面包装单元卡号
	 */
	public String baozdykh() {
		return "select";
	}

	/**
	 * 153 包装单元卡查询(执行状态)
	 */
	public String baozdykym() {
		return "select";
	}

	/**
	 * 15301 包装单元卡查询(执行状态)查询
	 */
	public String baozdykzxzt() {
		String transcode = "15301";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}

	/**
	 * 154 包装单元卡查询(执行状态)
	 */
	public String baozdykpsym() {
		return "select";
	}

	/**
	 * 15401 包装单元卡查询(执行状态)查询
	 */
	public String baozdykpslb() {
		String transcode = "15401";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}

	/**
	 * 155 同步包装单元卡(卸货站台)页面
	 */
	public String baozdykxhym() {
		return "select";
	}

	/**
	 * 155 同步包装单元卡(卸货站台)查询
	 */
	public String baozdykxhzt() {
		String transcode = "15501";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}

	/**
	 * 到达同步包装单元卡详细页面
	 */
	public String baozdykmx() {
		String transcode = "15601";
		Map map = this.getParams();
		JSONObject obj = JSONObject.fromObject(this.callWtc(transcode, map));
	    setRequestAttribute("result", obj);
		return "select";
	}
	/**
	 * 157 同步包装单元卡(BL)页面
	 */
	public String baozdykblym() {
		return "select";
	}

	/**
	 * 157 同步包装单元卡(BL)查询
	 */
	public String baozdykbl() {
		String transcode = "15701";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 158同步包装单元卡(零件)页面
	 */
	public String baozdykljym() {
		return "select";
	}

	/**
	 * 158 同步包装单元卡(零件)查询
	 */
	public String baozdyklj() {
		String transcode = "15801";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 159树状图查询页面
	 */
	public String sztym() {
		return "select";
	}

	/**
	 * 15901树状图(UT)查询
	 */
	public String utszt() {
		String transcode = "15901";
		Map map = this.getParams();
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
	 * 15902树状图(UL)查询
	 */
	public String ulszt() {
		String transcode = "15902";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 15903树状图(EL)查询
	 */
	public String elszt() {
		String transcode = "15903";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 15904树状图(US)查询
	 */
	public String usszt() {
		String transcode = "15904";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 15905树状图(UC)查询
	 */
	public String ucszt() {
		String transcode = "15905";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 15906树状图(UT)打印 huxy_11459
	 */
	public String utprint(@Param("list") ArrayList<Uabq> list) {
		String transcode = "15906";
		Map map = this.getParams();
		map.put("list",list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	/**
	 * 15907树状图(UL)打印 huxy_11459
	 */
	public String ulprint(@Param("list") ArrayList<Uabq> list) {
		String transcode = "15907";
		Map map = this.getParams();
		map.put("list",list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	/**
	 * 15908树状图(EL)打印 huxy_11459
	 */
	public String elprint(@Param("list") ArrayList<Kuccx> list) {
		String transcode = "15908";
		Map map = this.getParams();
		map.put("list",list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 15909树状图(UL)打印 huxy_11459
	 */
	public String usprint(@Param("list") ArrayList<Kuccx> list) {
		String transcode = "15909";
		Map map = this.getParams();
		map.put("list",list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 15910树状图(UC)打印 huxy_11459
	 */
	public String ucprint(@Param("list") ArrayList<Ucbq> list) {
		String transcode = "15910";
		Map map = this.getParams();
		map.put("list",list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
}
