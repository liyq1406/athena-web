<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html>
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
	</head>
	<t:page>
	<t:grid id="grid_ziykz" caption="零件库存" idKeys="lingjbh" showNum="true" load="false"
	src="/report/queryLingjkc.ajax" add="NOT" edit="NOT" remove="NOT" exportXls="true">
	<t:fieldLayout prefix="gridLayout" columns="3">
	<t:fieldSelect property="usercenter" width="150" convert="queryUserCenterMap" caption="用户中心"></t:fieldSelect>
		<t:fieldText property="lingjbh" width="150" caption="零件编号" maxLength="10"></t:fieldText>
		<t:fieldText property="cangkdm" width="150" caption="仓库代码" maxLength="10"></t:fieldText>
		<t:fieldSelect property="baoblx" notNull="true" convert="baoblx" defaultValue="2" width="150" caption="报表类型"></t:fieldSelect>
		<t:fieldSelect property="lingjlx" notNull="true" convert="lingjlx" defaultValue="1" width="150" caption="零件类型"></t:fieldSelect>
	</t:fieldLayout>
	<t:gridCol property="usercenter" caption="用户中心"></t:gridCol>
	<t:gridCol property="lingjbh" caption="零件编号"></t:gridCol>
	<t:gridCol property="lingjmc" caption="零件名称"></t:gridCol>
	<t:gridCol property="ziyhqrq" caption="记录日期"></t:gridCol>
	<t:gridCol property="cangkdm" caption="仓库代码"></t:gridCol>
	<t:gridCol property="zickbh"  caption="子仓库代码"></t:gridCol>
	<t:gridCol property="kucsl" caption="库存数量"></t:gridCol>
	<t:gridCol property="dingdlj" caption="订单累积"></t:gridCol>
	<t:gridCol property="jiaoflj" caption="交付累积"></t:gridCol>
	<t:gridCol property="jstzsz" caption="计算调整值"></t:gridCol>
	</t:grid>
	</t:page>
	<script type="text/javascript"> 
	$.sdcui.serverConfig.convertArray['baoblx']={'1':'按中心汇总','2':'按仓库汇总'};
	$.sdcui.serverConfig.convertArray['lingjlx']={'1':'IL','2':'KD'};
	</script>
	<style type="text/css"></style>
</t:html>