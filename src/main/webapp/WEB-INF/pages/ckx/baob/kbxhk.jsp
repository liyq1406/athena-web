<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="看板循环卡异常报表">
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>

<script type="text/javascript">
	
</script>
</head>
<t:page i18n="看板循环卡">
	<t:grid id="kbxh" caption="查询条件" add="NOT" edit="NOT" remove="NOT" load="false"  save="NOT"  src="/baob/querykbxhk.ajax"
		idKeys="xunhbm,usercenter" scrollHeight="280">
		<t:fieldLayout id="kbxhgm" prefix="layout" columns="4">
			<t:fieldSelect property="usercenter" caption="用户中心" convert="queryUserCenterMap" notNull="true" width="90"  defaultValue="${usercenter}"></t:fieldSelect>
			<t:fieldText property="xunhbm" caption="循环编码" width="90" maxLength="8" minLength="8"></t:fieldText>
			<t:fieldText property="lingjbh" caption="零件编号" width="90" maxLength="10"></t:fieldText>
			<t:fieldSelect property="gonghms" caption="供货模式" width="90" convert="ghms"></t:fieldSelect>
			<t:fieldText property="cangkdm" caption="线边仓库" width="90" maxLength="3" minLength="3"></t:fieldText>
			<t:fieldText property="dinghck" caption="订货仓库" width="90" maxLength="3" minLength="3"></t:fieldText>
			<t:fieldText property="yaohlh" caption="要货令号" width="90" maxLength="12"></t:fieldText>
			<t:fieldText property="xinmdd" caption="新目的地" width="90" maxLength="13"></t:fieldText>
			<t:fieldText property="gongysdm" caption="供应商代码" width="90" maxLength="10" minLength="10"></t:fieldText>
			<t:fieldSelect property="chanx" caption="产线" src="/baob/selectChanx.ajax" code="shengcxbh" show="shengcxbh" parents="usercenter" parentsAlias="usercenter" width="90"></t:fieldSelect>
			<t:fieldText property="keh" caption="客户" width="90" maxLength="6"></t:fieldText>
			<t:fieldText property="chengysdm" caption="承运商代码" width="90" maxLength="10" minLength="10"></t:fieldText>
			<t:fieldText property="pianysj" caption="偏移天数" width="90" notNull="true" dataType="number" expressionMessage='只能为0-9999整数' expression="^[1-9][0-9]{0,4}$|^0$"></t:fieldText>
		</t:fieldLayout>
		<t:gridCol  property="usercenter" caption="用户中心" width="90"  />
		<t:gridCol  property="yaohlh" caption="要货令号" width="120" />
		<t:gridCol  property="xunhbm" caption="循环编码" width="70"  />
		<t:gridCol  property="kanbkh" caption="看板卡号" width="70" />
		<t:gridCol  property="lingjbh" caption="零件编号"  />
		<t:gridCol  property="gonghms" caption="供货模式" width="70"  />
		<t:gridCol  property="xiaohd" caption="消耗点" width="90"  />
		<t:gridCol  property="cangkdm" caption="线边仓库" width="70"  />
		<t:gridCol  property="dinghck" caption="订货仓库" width="70" />
		<t:gridCol  property="dangqxhgm" caption="当前循环规模" width="85" 	/>
		<t:gridCol  property="jisxhgm" caption="计算循环规模" width="85" />
		<t:gridCol  property="yaohlscsj" caption="要货令生成时间" width="140" />
		<t:gridCol  property="zuizsj" caption="最早上线时间" width="120" />
		<t:gridCol  property="zuiwsj" caption="最晚到货时间" width="120" />
		<t:gridCol  property="danw" caption="单位" width="95" />
		<t:gridCol  property="yaohsl" caption="要货数量" width="95" />
		<t:gridCol  property="baozxh" caption="UA包装型号" width="95" />
		<t:gridCol  property="usxh" caption="UA容量" width="95" />
		<t:gridCol  property="ucxh" caption="UC型号" width="95" />
		<t:gridCol  property="ucrl" caption="UC容量" width="95" />
		<t:gridCol  property="xiehd" caption="卸货点" width="95" />
		<t:gridCol  property="xinxhd" caption="新卸货点" width="95" />
		<t:gridCol  property="cangkbh" caption="仓库编号" width="95" />
		<t:gridCol  property="zickbh" caption="子仓库编号" width="95" />
		<t:gridCol  property="mudd" caption="目的地" width="95" />
		<t:gridCol  property="xinmdd" caption="新目的地" width="95" />
		<t:gridCol  property="gongysdm" caption="供应商代码" width="95" />
		<t:gridCol  property="gongysmc" caption="供应商名称" width="95" />
		<t:gridCol  property="chanx" caption="产线" width="95" />
		<t:gridCol  property="keh" caption="客户" width="95" />
		<t:gridCol  property="shiflsk" caption="是否临时卡" width="95" />
		<t:gridCol  property="chengysdm" caption="承运商代码" width="95" />
		<t:gridCol  property="chengysmc" caption="承运商名称" width="95" />
		<t:gridCol property="" caption="" />
		<t:button caption="导出XLS" name="download"></t:button>
	</t:grid>
</t:page>
<script type="text/javascript">
$.sdcui.serverConfig.convertArray['ghms'] = {
		'R1' : 'R1',
		'R2' : 'R2',
		'RD' : 'RD',
		'RM' : 'RM'
	};


	//导出 	
	function func_button_download() {
		
		var usercenter = trim($('#layout_usercenter').fieldValue());
		var xunhbm = trim($('#layout_xunhbm').fieldValue());
		var lingjbh = trim($('#layout_lingjbh').fieldValue());
		var gonghms = trim($('#layout_gonghms').fieldValue());
		var cangkdm = trim($('#layout_cangkdm').fieldValue());
		var dinghck = trim($('#layout_dinghck').fieldValue());
		var yaohlh = trim($('#layout_yaohlh').fieldValue());
		var xinmdd = trim($('#layout_xinmdd').fieldValue());
		var gongysdm = trim($('#layout_gongysdm').fieldValue());
		var chanx = trim($('#layout_chanx').fieldValue());
		var keh = trim($('#layout_keh').fieldValue());
		var chengysdm = trim($('#layout_chengysdm').fieldValue());
		var pianysj = trim($('#layout_pianysj').fieldValue());
		
		var record = {'usercenter':﻿usercenter,'chanx':chanx,'xunhbm':xunhbm,'lingjbh':lingjbh,'gonghms':gonghms,'cangkdm':cangkdm,'dinghck':dinghck,'yaohlh':yaohlh,'xinmdd':xinmdd,'gongysdm':gongysdm,'keh':keh,'chengysdm':chengysdm,'pianysj':pianysj};
		$.sdcui.pageUtils.goPage({
			url : '../baob/downloadkbxhk.do',
			record : record,
			mode : 'form',
			beforeSubmit : function(){
				return true;
			}
	   });
	}
</script>
</t:html>
