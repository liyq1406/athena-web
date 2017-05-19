package com.athena.ck.module.kunei.action;

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
import com.athena.ck.entity.common.CommonEntity;
import com.athena.ck.entity.kunei.Budinfo;
import com.athena.ck.entity.kunei.JiufUsbzxx;
import com.athena.ck.entity.kunei.Pandcl;
import com.athena.ck.entity.kunei.Pandrw;
import com.athena.ck.entity.kunei.USgbzxx;
import com.athena.ck.entity.shouhuo.Chengpbz;
import com.athena.ck.entity.yichang.Yic;
import com.athena.ck.entity.zhijian.Chengptxb;
import com.athena.ck.module.kunei.service.KunService;
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
 * Description:定义库内相关页面动作处理
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
 * @date 2012-2-10
 */
@Component(scope = ComponentDefinition.SCOPE_PROTOTYPE)
public class KunAction extends BaseWtcAction {
	public UserInfo getUserInfo(){
		return (UserInfo) getSessionAttribute(ToftConst.Toft_SessionKey_UserData);
	}
	
	@Inject
	private KunService kunService;
	@Inject
	private DownLoadServices  downloadServices = null;
	
	/*纠纷创建*/
	/**
	 * 120 纠纷创建页面
	 * @return
	 * String
	 */
	public String jiufcjYm(){
		return "select";
	}
	/**
	 * 12001 纠纷创建 查询数据
	 * @return 
	 */
	public String jiufcjQuery(){
		String transcode = "12001";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	/**
	 * 12002 纠纷创建  纠纷保存
	 * @return 
	 */
	public String jiufcjSave(@Param("list") ArrayList<JiufUsbzxx> list){
		String transcode = "12002";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	/**
	 * 12003 纠纷创建  纠纷提交
	 * @return 
	 */
	public String jiufcjSubmit(@Param("list") ArrayList<JiufUsbzxx> list){
		String transcode = "12003";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * P12001 纠纷创建  改包装页面
	 * @return
	 * String
	 */
	public String jiufcjGbzYm(){
		JSONObject obj = JSONObject.fromObject(this.getParam("putvalue"));
		setRequestAttribute("result", obj);
		return "select";
	}
	/**
	 * 12004 纠纷创建  改包装提交
	 * @return 
	 */
	public String jiufcjGbzSubmit(@Param("list") ArrayList<USgbzxx> list){
		String transcode = "12004";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	
	/**
	 * 12005 纠纷创建  查询实际零件编号仓库 xss_0011694
	 * @return 
	 */
	public String jiufcjShijljbhck(){ 
    	Map map = this.getParams();
		LoginUser loginUser = AuthorityUtils.getSecurityUser();
		map.put("usercenter",loginUser.getUsercenter()); 
		List<String> str2 = kunService.jiufcjShijljbhck(map); 
			ArrayList list = new ArrayList();
			for( int i=0; i<str2.size(); i++ ){
				String c = str2.get(i);
				list.add("{name:'"+c+"',value:'"+c+"'}");
			}
			// 拼Json串
			String sJson = JSONArray.fromObject(list).toString();
			CommonEntity commonEntity = new CommonEntity();
			commonEntity.setParameter("{list:" + sJson + "}");
			JSONObject obj = JSONObject.fromObject(commonEntity);
			setResult("result", obj);
		
		return AJAX;
	}
	

	/*纠纷修改*/
	/**
	 * 121 纠纷修改页面
	 * @return
	 * String
	 */
	public String jiufxgYm(){
		return "select";
	}
	/**
	 * 12101 纠纷修改 查询数据
	 * @return 
	 */
	public String jiufxgQuery(){
		String transcode = "12101";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	/**
	 * 12102 纠纷修改  纠纷保存
	 * @return 
	 */
	public String jiufxgSave(@Param("list") ArrayList<JiufUsbzxx> list){
		String transcode = "12102";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	/**
	 * 12103 纠纷修改   纠纷提交
	 * @return 
	 */
	public String jiufxgSubmit(@Param("list") ArrayList<JiufUsbzxx> list){
		String transcode = "12103";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * P12101  纠纷修改  改包装页面
	 * @return
	 * String
	 */
	public String jiufxgGbzYm(){
		JSONObject obj = JSONObject.fromObject(this.getParam("putvalue"));
		setRequestAttribute("result", obj);
		return "select";
	}
	/**
	 * 12104 纠纷修改   改包装提交
	 * @return 
	 */
	public String jiufxgGbzSubmit(@Param("list") ArrayList<USgbzxx> list){
		String transcode = "12104";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	/*纠纷查询*/
	/**
	 * 122纠纷查询页面
	 * @return
	 * String
	 */
	public String jiufcxYm(){
		return "select";
	}
	/**
	 * 12201 纠纷查询 查询数据
	 * @return 
	 */
	public String jiufcxQuery(){
		String transcode = "12201";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	
	/*纠纷取消*/
	/**
	 * 123纠纷取消页面
	 * @return
	 * String
	 */
	public String jiufqxYm(){
		return "select";
	}
	/**
	 * 12301 纠纷取消 查询数据
	 * @return 
	 */
	public String jiufqxQuery(){
		String transcode = "12301";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	/**
	 * 12302 纠纷取消 取消纠纷单
	 * @return 
	 */
	public String jiufqxCancel(){
		String transcode = "12302";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	
	/*纠纷单查询*/
	/**
	 * 124纠纷单查询页面
	 * @return
	 * String
	 */
	public String jiufdcxYm(){
		return "select";
	}
	/**
	 * 12401 纠纷单查询 查询数据
	 * @return 
	 */
	public String jiufdcxQuery(){
		String transcode = "12401";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	/**
	 * 12402 纠纷单查询 查询数据
	 * @return 
	 */
	public String jiufdcxShowDetail(){
		JSONObject obj = JSONObject.fromObject(this.getParam("putvalue"));
		setRequestAttribute("result", obj);
		setRequestAttribute("foward", 124);
		return "select";
	}
	
	/**
	 * 125 补打功能页面
	 * @return
	 * String
	 */
	public String budgn(){
		return "select";
	}
	
	/*库内改包装*/
	/**
	 * 201 库内改包装页面
	 * @return
	 * String
	 */
	public String kungbzYm(){
		return "select";
	}
	
	/**
	 * 20101 库内改包装通过EL号查询
	 * @return 
	 */
	public String kungbzELCx(){
		String transcode = "20101";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}

	/**
	 * 20102 库内改包装通过EL号提交
	 * @return 
	 */
	public String kungbzELTj(@Param("list") ArrayList<USgbzxx> list) {
		String transcode = "20102";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	/**
	 * 20103 库内改包装通过US号查询
	 * @return 
	 */
	public String kungbzUSCx(){
		String transcode = "20103";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	
	/**
	 * 20104 库内改包装通过US号提交
	 * @return 
	 */
	public String kungbzUSTj(@Param("list") ArrayList<USgbzxx> list) {
		String transcode = "20104";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	
	/*正常退库*/
	/**
	 * 202 正常退库页面
	 * @return
	 * String
	 */
	public String zhangctkYm(){
		return "select";
	}
	
	/**
	 * 20201 正常退库通过零件或ELH查询信息
	 * @return 
	 */
	public String zhangctkLJQuery(){
		String transcode = "20201";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	
	/**
	 * 20202 正常退库通过推荐改包装
	 * @return 
	 */
	public String zhangctkLJTjgbz(){
		String transcode = "20202";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	
	/**
	 * 20203 正常退库通过零件或ELH推荐改包装  提交
	 * @return 
	 */
	public String zhangctkLJSumbit(@Param("list") ArrayList<USgbzxx> list) {
		String transcode = "20203";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	/**
	 * 20204  正常退库查询US/UC信息
	 * @return 
	 */
	public String zhangctkUSQuery(){
		String transcode = "20204";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	
	/**
	 * 20206 正常退库US/UC推荐改包装  提交
	 * @return 
	 */
	public String zhangctkUSSumbit(@Param("list") ArrayList<USgbzxx> list) {
		String transcode = "20206";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	

	/**
	 * 正常退库-通过零件推荐包装确认
	 * 222 正常退库-POA页面
	 * @author 贺志国
	 * @date 2014-9-18
	 * @return String
	 */
	public String zhangctkMainPage(){
		return "select";
	}

	/**
	 * 22203 正常退库通过零件或ELH推荐改包装  提交
	 * @author 贺志国
	 * @date 2014-9-19
	 * @param list
	 * @return String
	 */
	public String zhangctkLingjSumbit(@Param("list") ArrayList<USgbzxx> list) {
		String transcode = "22203";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	/**
	 * 20204  正常退库查询US/UC信息
	 * @return 
	 
	public String zhangctkUSQuery(){
		String transcode = "20204";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}*/
	
	/**
	 * 20206 正常退库US/UC推荐改包装  提交
	 * @return 
	 
	public String zhangctkUSSumbit(@Param("list") ArrayList<USgbzxx> list) {
		String transcode = "20206";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}*/
	
	
	/*盘点策略新增*/
	/**
	 * 204 盘点策略新增页面
	 * @return
	 * String
	 */
	public String pandclXzYm(){
		return "select";
	}
	
	/**
	 * 20401 盘点策略新增提交
	 * @return 
	 */
	public String pandclTj() {
		String transcode = "20401";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	
	/*盘点策略查询*/
	/**
	 * 205 盘点策略查询页面
	 * @return
	 * String
	 */
	public String pandclCxYm(){
		return "select";
	}
	
	/**
	 * 20501 盘点策略查询
	 * @return 
	 */
	public String pandclCx() {
		String transcode = "20501";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	
	/**
	 * 20502 盘点策略删除
	 * @return 
	 */
	public String pandclSc(@Param("list") ArrayList<Pandcl> list) {
		String transcode = "20502";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}

	
	/*盘点任务新增*/
	/**
	 * 206 盘点任务新增页面
	 * @return
	 * String
	 */
	public String pandrwXzYm(){
		return "select";
	}
	/**
	 * 20601 盘点任务新增
	 * @return 
	 */
	public String pandrwXzAdd() {
		String transcode = "20601";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	/**
	 * 20602 盘点任务新增删除
	 * @return 
	 */
	public String pandrwXzDelete(@Param("list") ArrayList<Pandrw> list) {
		String transcode = "20602";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	/**
	 * 20603 盘点任务新增查询
	 * @return 
	 */
	public String pandrwXzQuery() {
		String transcode = "20603";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	/**
	 * 20604 盘点任务新增打印
	 * @return 
	 */
	public String pandrwXzPrint() {
		String transcode = "20604";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	/*盘点任务查询*/
	/**
	 * 207 盘点任务查询页面
	 * @return
	 * String
	 */
	public String pandrwCxYm(){
		return "select";
	}
	
	/**
	 * 20701 盘点任务查询
	 * @return 
	 */
	public String pandrwCxQuery() {
		String transcode = "20701";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	
	/*滚动盘点查看*/
	/**
	 * P20701  滚动盘点查看页面
	 * @return
	 * String
	 */
	public String gundpdckYm(){
		JSONObject obj = JSONObject.fromObject(this.getParam("putvalue"));
		setRequestAttribute("result", obj);
		return "select";
	}
	/**
	 * 20702 滚动盘点查看查询
	 * @return 
	 */
	public String gundpdckQuery() {
		String transcode = "20702";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * P20702  静态盘点查看页面
	 * @return
	 * String
	 */
	public String jingtpdckYm(){
		JSONObject obj = JSONObject.fromObject(this.getParam("putvalue"));
		setRequestAttribute("result", obj);
		return "select";
	}
	/**
	 * 20703 静态盘点查看查询
	 * @return 
	 */
	public String jingtpdckQuery() {
		String transcode = "20703";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 20704  盘点任务查询打印
	 * @return 
	 */
	public String pandrwCxPrint(@Param("list") ArrayList<Pandrw> list) {
		String transcode = "20704";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 20705  盘点任务查询导出
	 * @return 
	 */
	public String pandrwCxExport() {
		//拼装查询条件
		Map map = this.getParams();
		map.put("usercenter", AuthorityUtils.getSecurityUser().getUsercenter());
		StringBuffer queryWhere = new StringBuffer();
		if (!map.get("cangkbh").toString().trim().isEmpty()){
			queryWhere.append(" and t1.cangkbh='"+ map.get("cangkbh").toString().trim() +"'");
		}
		if (!map.get("kuczt").toString().trim().isEmpty()){
			queryWhere.append(" and t1.zhuangt='"+ map.get("kuczt").toString().trim() +"'");
		}
		if (!map.get("renwbh").toString().trim().isEmpty()){
			queryWhere.append(" and t1.renwbh='"+ map.get("renwbh").toString().trim() +"'");
		}
		if (!map.get("shengckcsj").toString().trim().isEmpty()){
			queryWhere.append(" and t1.shengckcsj='"+ map.get("shengckcsj").toString().trim() +"'");
		}
		if (!map.get("creator").toString().trim().isEmpty()){
			queryWhere.append(" and t1.pandr='"+ map.get("creator").toString().trim() +"'");
		}
		map.put("queryWhere", queryWhere );
		//查询盘点任务
		List<Pandrw> list = kunService.selectPandrw(map);
		//转换数据格式
		List<Map<String, Object>> listMap = new ArrayList<Map<String,Object>>();
		for (Pandrw item : list) {
			Map<String,Object> mapData = new HashMap<String, Object>();
			mapData.put("renwbh",item.getRenwbh());
			mapData.put("usercenter",item.getUsercenter());
			mapData.put("cangkbh",item.getCangkbh());
			mapData.put("pandfs",CKUtil.getBundleValue("C2_PDFS"+item.getPandfs(), null));
			mapData.put("shengckcsj",item.getShengckcsj());
			mapData.put("pandr",item.getPandr());
			mapData.put("kucscfs",CKUtil.getBundleValue("C2_KCSCFS"+item.getKucscfs(), null));
			mapData.put("zhuangt",CKUtil.getBundleValue("C2_PDMXZT"+item.getZhuangt(), null));
			listMap.add(mapData);
		}
		//数据源
		Map<String, Object> dataSource = new HashMap<String, Object>();
		dataSource.put("date", CKUtil.getSysDate());
		dataSource.put("renwbh", map.get("renwbh").toString().trim());
		dataSource.put("zhuangt", CKUtil.getBundleValue("C2_PDMXZT"+map.get("kuczt").toString(), null));
		dataSource.put("shengckcsj", map.get("shengckcsj").toString().trim());
		dataSource.put("pandr", map.get("creator").toString().trim());
		String colunm[] = {"任务编号","用户中心","仓库","盘点方式","生成库存时间","创建人","库存生成方式","状态"};
		dataSource.put("colunm", colunm);
		dataSource.put("list", listMap);
		//拿到response对象
		HttpServletResponse response = ActionContext.getActionContext().getResponse() ;
		//设置下载 (0为文本，1为Excel)
		if (map.get("daoclx").toString().equals("0")){  
			downloadServices.downloadFile("Pandrw.ftl", dataSource, response, "盘点任务", ExportConstants.FILE_TXT, false);
		} else {
			downloadServices.downloadFile("PandrwXls.ftl", dataSource, response, "盘点任务", ExportConstants.FILE_XLS, false);
		}
		//返回类型一定要是download类型的
		return "downLoad";
	}
	
	/*盘点任务删除*/
	/**
	 * 208 盘点任务删除页面
	 * @return
	 * String
	 */
	public String pandrwScYm(){
		return "select";
	}
	
	/**
	 * 20801 盘点任务删除查询
	 * @return 
	 */
	public String pandrwScQuery() {
		String transcode = "20801";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	
	/**
	 * 20802 盘点任务删除
	 * @return 
	 */
	public String pandrwScDelete(@Param("list") ArrayList<Pandrw> list) {
		String transcode = "20802";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	
	/*滚动盘点维护*/
	/**
	 * 211滚动盘点维护页面
	 * @return
	 * String
	 */
	public String gundpdWhYm(){
		return "select";
	}
	
	/**
	 * 21101 滚动盘点维护 登记已盘点零件
	 * @return 
	 */
	public String gundpdWhDj() {
		String transcode = "21101";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	/**
	 * 21102滚动盘点维护-创建US-查询零件信息
	 * @return 
	 */
	public String gundpdWhQueryLj() {
		String transcode = "21102";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	/**
	 * 21103滚动盘点维护-创建US-US入库
	 * @return 
	 */
	public String gundpdWhAddUS() {
		String transcode = "21103";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	/**
	 * 21104滚动盘点维护-维护US-查询US信息
	 * @return 
	 */
	public String gundpdWhQueryUS() {
		String transcode = "21104";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	/**
	 * 21105滚动盘点维护-维护US-US入库
	 * @return 
	 */
	public String gundpdWhAlertUS() {
		String transcode = "21105";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	/**
	 * 21106滚动盘点维护-更新零件的盘点日期
	 * @return 
	 */
	public String gundpdWhGenxpd() {
		String transcode = "21106";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	
	/*静态盘点维护*/
	/**
	 * 212静态盘点维护页面
	 * @return
	 * String
	 */
	public String jintpdWhYm(){
		return "select";
	}
	
	/**
	 * 21201静态盘点维护-创建US-查询零件信息
	 * @return 
	 */
	public String jintpdWhQueryLj() {
		String transcode = "21201";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	/**
	 * 21202静态盘点维护-创建US-US入库
	 * @return 
	 */
	public String jintpdWhAddUS() {
		String transcode = "21202";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	/**
	 * 21203静态盘点维护-维护US-查询US信息
	 * @return 
	 */
	public String jintpdWhQueryUS() {
		String transcode = "21203";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	/**
	 * 21204静态盘点维护-维护US-US入库
	 * @return 
	 */
	public String jintpdWhAlertUS() {
		String transcode = "21204";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	
	/**
	 * 21205  创建US-US入库
	 * @return
	 * String
	 */
	public String chuangjusYm(){
		JSONObject obj = JSONObject.fromObject(this.getParam("putvalue"));
		setRequestAttribute("result", obj);
		return "select";
	}
	
	/**
	 * 21206  维护US-US入库
	 * @return
	 * String
	 */
	public String weihusYm(){
		JSONObject obj = JSONObject.fromObject(this.getParam("putvalue"));
		setRequestAttribute("result", obj);
		return "select";
	}
	
	
	/*库存查询*/
	/**
	 * 213库存查询页面
	 * @return
	 * String
	 */
	public String KuccxYm(){
		return "select";
	}
	
	/**
	 * 21301库存查询执行
	 * @return 
	 */
	public String KuccxQuery() {
		String transcode = "21301";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	
	/**
	 * 21302库存查询打印
	 * @return 
	 */
	public String KuccxPrint() {
		String transcode = "21302";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	
	/*盘点任务导出*/
	/**
	 * 214盘点任务导出页面
	 * @return
	 * String
	 */
	public String KucdcYm(){
		return "select";
	}
	
	/*库内移库*/
	/**
	 * 328 进入库内移库页面
	 * @return
	 * String
	 */
	public String kunykYm(){
		return "select";
	}
	
	/**
	 * 32801 库内移库查询
	 * @return 
	 */
	public String kunykCx(){
		String transcode = "32801";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	/**
	 * 32802 库内移库提交
	 * @return 
	 */
	public String kunykTj() {
		String transcode = "32802";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	/*库内冻结*/
	/**
	 * 334 进入库内冻结页面
	 * @return
	 * String
	 */
	public String kundjYm(){
		return "select";
	}
	
	/**
	 * 33401 库内冻结查询
	 * @return 
	 */
	public String kundjCx(){
		String transcode = "33401";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	
	/**
	 * 33402 库内冻结修改
	 * @return 
	 */
	public String kundjXg() {
		String transcode = "33402";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	/*库内解冻*/
	/**
	 * 335 进入库内解冻页面
	 * @return
	 * String
	 */
	public String kunjdYm(){
		return "select";
	}
	
	/**
	 * 33501 库内解冻查询
	 * @return 
	 */
	public String kunjdCx(){
		String transcode = "33501";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	
	/**
	 * 33502 库内冻结修改
	 * @return 
	 */
	public String kunjdXg() {
		String transcode = "33502";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	/**
	 * 217 单取库移库页面
	 */
	public  String   danqkykYm(){
		return   "select";
	}
	/**
	 * 21701 单取库移库查询 
	 */
	public   String  danqkykCx(){
		String transcode = "21701";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return  AJAX;
	}
	/**
	 * 21702单取库移库确认
	 */
	public  String   danqkykQr(@Param("list") ArrayList<Chengptxb> list){
		String transcode = "21702";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return  AJAX;
	}
	/**
	 * 21703单取库移库取消
	 */
	public  String   danqkykQx(@Param("list") ArrayList<Chengptxb> list){
		String transcode = "21703";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return  AJAX;
	}
	/**
	 * 218 唯一成品滚动盘点维护页面
	 */
	public  String   weiycpgdpdwhYm(){
		return   "select";
	}
	/**
	 * 21801唯一成品盘点维护查询零件信息
	 */
	public  String   wycppdwhcxlj(){
		String transcode = "21801";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return  AJAX;
	}
	/**
	 * P21801  创建零件信息
	 * @return
	 * String
	 */
	public String P21801(){
		JSONObject obj = JSONObject.fromObject(this.getParam("putvalue"));
		setRequestAttribute("result", obj);
		return "select";
	}
	
	/**
	 * P21802  创建US-US入库
	 * @return
	 * String
	 */
	public String P21802(){
		JSONObject obj = JSONObject.fromObject(this.getParam("putvalue"));
		setRequestAttribute("result", obj);
		return "select";
	}
	
	/**
	 * 21802唯一成品盘点维护创建US确认
	 */
	public  String   wycppdwhcjus(){
		String transcode = "21802";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return  AJAX;
	}
	/**
	 * 21803唯一成品盘点维护查询US信息
	 */
	public  String   wycppdwhcxus(){
		String transcode = "21803";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return  AJAX;
	}
	/**
	 * 21804唯一成品盘点维护US确认
	 */
	public  String   wycppdwhusqr(){
		String transcode = "21804";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return  AJAX;
	}
	
	/**
	 * 21805唯一成品盘点维护新增序列号
	 */
	public  String   wycppdwhxzxlh(){
		String transcode = "21805";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return  AJAX;
	}
	/**
	 * 21806唯一成品盘点维护删除序列号
	 */
	public  String   wycppdwhscxlh(@Param("list") ArrayList<Chengpbz> list){
		String transcode = "21806";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return  AJAX;
	}
	/**
	 * 21807唯一成品盘点维护查询序列号
	 */
	public  String   wycppdwhcxxlh(){
		String transcode = "21807";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return  AJAX;
	}
	/**
	 * 219 唯一成品静态盘点维护页面
	 */
	public  String   weiycpjtpdwhYm(){
		return   "select";
	}
	/**
	 * 220 唯一成品退产线页面
	 */
	public  String   weiycptcxYm(){
		return   "select";
	}
	/**
	 * 22001 唯一成品退产线查询零件信息
	 */
	public  String   tcxljcx(){
		String transcode = "22001";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return  AJAX;
	}
	/**
	 * 22002 唯一成品退产线查询零件序列号信息
	 */
	public  String   ljxlhcx(){
		String transcode = "22002";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return  AJAX;
	}
	/**
	 * 22003 唯一成品退产线查询零件信息
	 */
	public  String   wycptcxxz(){
		String transcode = "22003";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return  AJAX;
	}
	/**
	 * 22004 唯一成品退产线查询零件序列号信息
	 */
	public  String   wycptxcqr(){
		String transcode = "22004";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return  AJAX;
	}
	
	/**
	 * 22005 全选-唯一成品退产线查询零件序列号信息
	 */
	public  String   wycptxcqrqx(@Param("list") ArrayList<Chengpbz> list){
		String transcode = "22005";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return  AJAX;
	
	}
	
	/**
	 * 221 手工触发单取库移库推荐单页面
	 */
	public  String   sgcfdqkYm(){
		return   "select";
	}
	/**
	 * 22101手工触发单取库移库推荐
	 */
	public  String   sgcfdqktjd(){
		String transcode = "22101";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return  AJAX;
	}
	
	/**
	 * 224 CD零件库存查询 V4_028
	 */
	public  String   cdlingjkccxjr(){
		return   "select";
	}
	
	/**
	 * 224 CD零件库存查询打印  V4_028
	 */
	public  String   cdlingjkccx(){
		String transcode = "22401";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return  AJAX;
	}
	
	/**
	 * 224 CD零件库存查询打印  V4_028
	 */
	public  String   cdlingjkcdy(){
		String transcode = "22402";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return  AJAX;
	}
	
	
	/**
	 * 223 惟一成品退库 V4_030
	 */
	public  String   weiycptuik(){
		return "select";
	}
	/**
	 * 22301 惟一成品退库根据零件创建US V4_030
	 */
	public  String   weiycpcjus(){
		String transcode = "22301";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return  AJAX;
	}
	
	/**
	 * 22302 唯一成品退库序列号校验 V4_030
	 */
	public  String   weiyTkLjXLH(){
		String transcode = "22302";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return  AJAX;
	}
	/**
	 * 22303 唯一成品退库序列号校验 V4_030
	 */
	public  String   weiyTkLjqr(){
		String transcode = "22303";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return  AJAX;
	}
	/**
	 * 22304 通过USH查询包装信息  V4_030
	 */
	public  String   weiyTkUSSel(){
		String transcode = "22304";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return  AJAX;
	}
	/**
	 * 22305 通过USH唯一成品退库确认 V4_030
	 */
	public  String   weiyTkUSqr(){
		String transcode = "22305";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return  AJAX;
	}
	/**
	 * 22306  删除序列号
	 * @return
	 * String
	 */
	public String weiyTkUSDel(@Param("list") ArrayList<Chengpbz> list){
		String transcode = "22306";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", this.callWtc(transcode, map));
		return  AJAX;
	}
	/**
	 * 22307  创建US-US入库
	 * @return
	 * String
	 */
	public String weiycpcjustz(){
		JSONObject obj = JSONObject.fromObject(this.getParam("putvalue"));
		setRequestAttribute("result", obj);
		return "select";
	}
	
	/**
	 * 22308  创建US-US入库
	 * @return
	 * String
	 */
	public String weiycpxgustz(){
		JSONObject obj = JSONObject.fromObject(this.getParam("putvalue"));
		setRequestAttribute("result", obj);
		return "select";
	}
	
	/**
	 * 22309  唯一成品序列号查询
	 * @return
	 * String
	 */
	public String weiyTkUSxlhsel(){
		String transcode = "22307";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return  AJAX;
	}
}
