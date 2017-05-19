<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="有发货通知且入库报表">

 
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 65px; } </style>
</head>

<t:page i18n="" >
	<t:grid id="grid_fahruk" caption="有发货通知且入库报表" idKeys="lingjbh" load="" editable="false" 
	showNum="true" back="NOT" 
		 src="/baob/queryfahruk.ajax" exportXls="true" add="NOT" edit="NOT" remove="NOT"
		  scrollHeight="290" pageSize="15">
		<t:fieldLayout id="fahruk" prefix="layout" columns="4">
			<t:fieldSelect property="usercenter" caption="用户中心" width="150" defaultValue="${USERCENTER}" convert="queryUserCenterMap"/>
			<t:fieldText property="lingjbh" caption="零件号"  width="150" dataType="text"   />
			<t:fieldText property="gongysdm" caption="供应商代码"  width="150" dataType="text" />
			<t:fieldSelect property="zhizlx" caption="订货路线" width="150" defaultValue="97X" convert="queryDinghlx"/>
			<t:fieldText property="blh" caption="发货通知" width="150" />
 			<t:fieldCalendar property="startrukrq" caption="入库时间" format="yyyy-MM-dd" width="165"></t:fieldCalendar>
 			<t:fieldCalendar property="endrukrq" caption="至" format="yyyy-MM-dd" width="165"></t:fieldCalendar>
		</t:fieldLayout>
		
		<t:gridCol  property="usercenter" caption="用户中心"  />
		<t:gridCol  property="lingjbh" caption="零件号" width="85" 	/>
		<t:gridCol  property="lingjmc" caption="零件名称" width="85" 	/>
		<t:gridCol  property="danw" caption="单位" width="85" 	/>
		<t:gridCol  property="zhizlx" caption="订货路线" width="70"  />
		<t:gridCol  property="gongysdm" caption="供应商代码" width="70" />
		<t:gridCol  property="uaxh" caption="供应商UA代码" width="60" />
		<t:gridCol  property="uarl" caption="供应商UA容量" width="60" />
		<t:gridCol  property="ucxh" caption="供应商UC代码" width="60" />
		<t:gridCol  property="ucrl" caption="供应商UC容量" width="60" />
		<t:gridCol  property="blh" caption="发货通知" width="95" />
		<t:gridCol  property="lingjsl" caption="发货通知数量" width="95" />
		<t:gridCol  property="keyljsl" caption="实际入库数量" width="95"/>
		<t:gridCol  property="rukrq" caption="入库时间" width="95" />
	
		<t:gridCol  property="" caption="" />
	</t:grid>
</t:page>

<script type="text/javascript">

	function grid_fahruk_beforeSubmit() {
		var beginTime = $("#layout_startrukrq").fieldValue();
		var endTime = $("#layout_endrukrq").fieldValue();
		var beginTimes = beginTime.substring(0, 10).split('-');
	    var endTimes = endTime.substring(0, 10).split('-');

	    beginTime = beginTimes[1] + '-' + beginTimes[2] + '-' + beginTimes[0] + ' ' + beginTime.substring(10, 19);
	    endTime = endTimes[1] + '-' + endTimes[2] + '-' + endTimes[0] + ' ' + endTime.substring(10, 19);

	    var a = (Date.parse(endTime) - Date.parse(beginTime)) / 3600 / 1000;
	    if (beginTime|endTime|a < 0) {
	        alert("时间输入错误，入库起始时间大于入库截至时间!");
	        return false;
	    } else {
	        return true;
	    }
		
	}
	
	
</script>

</t:html>