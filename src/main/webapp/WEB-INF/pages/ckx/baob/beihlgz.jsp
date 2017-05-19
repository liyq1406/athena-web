<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="备货令跟踪报表">
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>

<script type="text/javascript">
	
</script>
</head>
<t:page i18n="备货令跟踪">
	<t:grid id="grid_bhlgz" caption="查询条件" add="NOT" edit="NOT" remove="NOT" load="false" save="NOT"  pageSize="15"
		idKeys="beihdh,usercenter" scrollHeight="280" exportXls="true"  src="/baob/querybeihlgz.ajax" >
		<t:fieldLayout id="bhdh" prefix="layout" columns="4">
			<t:fieldSelect property="usercenter" caption="用户中心" convert="queryUserCenterMap" notNull="true" width="90"  defaultValue="${usercenter}"></t:fieldSelect>
			<t:fieldText property="beihdh" caption="备货单号" width="90" maxLength="12"></t:fieldText>
			<t:fieldCalendar property="createtime" caption="开始日期" format="yyyy-MM-dd" width="120" notNull="true"/>
			<t:fieldCalendar property="finishedtime" caption="结束日期" format="yyyy-MM-dd" width="120" notNull="true"/>
			<t:fieldText property="chanx" caption="产线" width="90" maxLength="5"></t:fieldText>
			<t:fieldText property="cangkbh" caption="仓库" width="90" maxLength="3" minLength="3"></t:fieldText>
			<t:fieldText property="keh" caption="分配区" width="120"></t:fieldText>
			<t:fieldText property="xiehd" caption="卸货点" width="120" maxLength="13"></t:fieldText>
			<t:fieldSelect property="beihdzt" caption="备货单状态" width="90" convert="bhzt"></t:fieldSelect>
		</t:fieldLayout>
		<t:gridCol  property="usercenter" caption="用户中心"  />
		<t:gridCol  property="beihdh" caption="备货单号" width="70"  />
		<t:gridCol  property="beihdzt" caption="备货令状态" width="90"  />
		<t:gridCol  property="bhsj" caption="备货单生成时间" width="140"  />
		<t:gridCol  property="shangxsj" caption="最晚上线时间" width="140" />
		<t:gridCol  property="chanx" caption="产线" width="85" 	/>
		<t:gridCol  property="cangkbh" caption="仓库" width="50" />
		<t:gridCol  property="zickbh" caption="子仓库" width="70" />
		<t:gridCol  property="lingjbh" caption="零件编号" width="120" />
		<t:gridCol  property="lingjmc" caption="零件名称" width="95" />
		<t:gridCol  property="ush" caption="US号" width="95" />
		<t:gridCol  property="kuwbh" caption="库位" width="95" />
		<t:gridCol  property="beihsl" caption="备货数量" width="95" />
		<t:gridCol  property="gongysdm" caption="供应商编号" width="95" />
		<t:gridCol  property="gongysmc" caption="供应商名称" width="95" />
		<t:gridCol  property="yaohlh" caption="要货令号" width="95" />
		<t:gridCol  property="yaohsl" caption="要货数量" width="95" />
		<t:gridCol  property="editor" caption="要货令操作者" width="95" />
		<t:gridCol  property="keh" caption="分配区" width="95" />
		<t:gridCol  property="xiehd" caption="卸货点" width="95" />
		<t:gridCol  property="elh" caption="EL号" width="95" />
		<t:gridCol  property="" caption="" />
	</t:grid>
</t:page>
<script type="text/javascript">
$.sdcui.serverConfig.convertArray['bhzt'] = {
		'0' : '备货开始',
		'1' : '出库确认中',
		'2' : '备货结束'
	};

//空格查询
function grid_bhlgz_beforeSubmit() {
	$("#layout_beihdh").fieldValue(trim($("#layout_beihdh").fieldValue()));    
	$("#layout_createtime").fieldValue(trim($("#layout_createtime").fieldValue()));  
	$("#layout_finishedtime").fieldValue(trim($("#layout_finishedtime").fieldValue()));
	$("#layout_chanx").fieldValue(trim($("#layout_chanx").fieldValue()));    
	$("#layout_cangk").fieldValue(trim($("#layout_cangk").fieldValue()));  
 	$("#layout_keh").fieldValue(trim($("#layout_keh").fieldValue()));
	$("#layout_xiehd").fieldValue(trim($("#layout_xiehd").fieldValue()));    
	$("#layout_beihdzt").fieldValue(trim($("#layout_beihdzt").fieldValue()));  
	
	//比较时间大小 结束时间必须大于开始时间
	var createtime = trim($("#layout_createtime").fieldValue());
	var finishedtime = trim($("#layout_finishedtime").fieldValue());
	if(!compareDate(createtime,finishedtime)){
		alert("结束日期必须大于开始日期");
		return false;
	}
	
}
	
// 	function func_button_download() {
		
// 		var usercenter = trim($('#layout_usercenter').fieldValue());
// 		var xunhbm = trim($('#layout_xunhbm').fieldValue());
// 		var lingjbh = trim($('#layout_lingjbh').fieldValue());
// 		var gonghms = trim($('#layout_gonghms').fieldValue());
// 		var cangkdm = trim($('#layout_cangkdm').fieldValue());
// 		var dinghck = trim($('#layout_dinghck').fieldValue());
// 		var yaohlh = trim($('#layout_yaohlh').fieldValue());
// 		var xinmdd = trim($('#layout_xinmdd').fieldValue());
// 		var gongysdm = trim($('#layout_gongysdm').fieldValue());
// 		var chanx = trim($('#layout_chanx').fieldValue());
// 		var keh = trim($('#layout_keh').fieldValue());
// 		var chengysdm = trim($('#layout_chengysdm').fieldValue());
// 		var pianysj = trim($('#layout_pianysj').fieldValue());
		
// 		var record = {'usercenter':﻿usercenter,'chanx':chanx,'xunhbm':xunhbm,'lingjbh':lingjbh,'gonghms':gonghms,'cangkdm':cangkdm,'dinghck':dinghck,'yaohlh':yaohlh,'xinmdd':xinmdd,'gongysdm':gongysdm,'keh':keh,'chengysdm':chengysdm,'pianysj':pianysj};
// 		$.sdcui.pageUtils.goPage({
// 			url : '../baob/downloadkbxhk.do',
// 			record : record,
// 			mode : 'form',
// 			beforeSubmit : function(){
// 				return true;
// 			}
// 	   });
// 	}
</script>
</t:html>
