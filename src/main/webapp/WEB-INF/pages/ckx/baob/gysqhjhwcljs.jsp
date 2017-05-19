<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="供应商取货完成率">


<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
</head>

<t:page i18n="">
	<t:grid id="grid_gysqhjhwcljs" caption="供应商取货完成率" idKeys="gongysdm,chengysdm" src="/baob/querygysqhjhwcl.ajax" 
	        add="NOT" edit="NOT" remove="NOT" load="false" save="NOT" showNum="true" exportXls="true" pageSize="15" scrollHeight="290">
		<t:fieldLayout id="gysqhjhwcljs" prefix="layout" columns="4">
			<t:fieldSelect property="year" caption="年" convert="year1" width="120" defaultValue="${currentYear}" notNull="true"/>
			<t:fieldSelect property="month" caption="周期" convert="month1" width="120" defaultValue="01" notNull="true"/>
			<t:fieldText property="gongysdm" caption="供应商代码" width="120" maxLength="10"></t:fieldText>
			<t:fieldText property="chengysdm" caption="承运商代码" width="120" maxLength="10"></t:fieldText>		
		</t:fieldLayout>
		<t:gridCol property="gongysdm" caption="供应商代码" width="80"/>
		<t:gridCol property="chengysdm" caption="承运商代码" width="80"/>
		<t:gridCol property="month" caption="周期" width="80"/>
		<t:gridCol property="lingjsl" caption="要货令总数量" width="80"/>
		<t:gridCol property="zhengcsl" caption="要货令正常数量" width="100"/>
		<t:gridCol property="yicsl" caption="要货令异常数量" width="100"/>				
		<t:gridCol property="wancl" caption="供应商取货计划完成率%" width="150"/>
		<t:gridCol property="" caption=" "></t:gridCol>
	</t:grid>		
	<div><font color="red">导出结果不能大于5000条,否则为空</font></div>
</t:page>
<script type="text/javascript">
//年
$.sdcui.serverConfig.convertArray['year1'] = ${year};

//月
$.sdcui.serverConfig.convertArray['month1'] = {
		'01' : '1月',
		'02' : '2月',
		'03' : '3月',
		'04' : '4月',
		'05' : '5月',
		'06' : '6月',
		'07' : '7月',
		'08' : '8月',
		'09' : '9月',
		'10' : '10月',
		'11' : '11月',
		'12' : '12月',
		'1' : '第一季度',
		'2' : '第二季度',
		'3' : '第三季度',
		'4' : '第四季度'
	};

//空格查询
function grid_gysqhjhwcljs_beforeSubmit() {      
	$("#layout_gongysdm").fieldValue(trim($("#layout_gongysdm").fieldValue()));
	$("#layout_chengysdm").fieldValue(trim($("#layout_chengysdm").fieldValue()));    
	
}

</script>
</t:html>
