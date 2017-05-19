<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="开箱入库集装箱报表">
 
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 65px; } </style>
</head>

<t:page i18n="" >
	<t:grid id="grid_kaixrukjizx" caption="开箱入库集装箱报表" idKeys="lingjbh" load="" editable="false" 
	showNum="true" back="NOT"   exportXls="true"
		 src="/baob/querykaixrukjizx.ajax"  add="NOT" edit="NOT" remove="NOT"
		  scrollHeight="290" pageSize="15">
		<t:fieldLayout id="kaixrukjizx" prefix="layout" columns="4">
			<t:fieldSelect property="usercenter" caption="用户中心" width="150" defaultValue="${USERCENTER}" convert="queryUserCenterMap"/>
			<t:fieldText property="lingjbh" caption="零件编号"  width="150" dataType="text" maxLength="10"/>
			<t:fieldText property="tcno" caption="集装箱号" width="150" />
			<t:fieldText property="gongysdm" caption="供应商代码"  width="150" />
 			<t:fieldCalendar property="startqiysj" caption="启运时间" format="yyyy-MM-dd" width="165"></t:fieldCalendar>
 			<t:fieldCalendar property="endqiysj" caption="至" format="yyyy-MM-dd" width="165"></t:fieldCalendar>
 			<t:fieldCalendar property="startdaodwldsj" caption="到港时间" format="yyyy-MM-dd" width="165"></t:fieldCalendar>
 			<t:fieldCalendar property="enddaodwldsj" caption="至" format="yyyy-MM-dd" width="165"></t:fieldCalendar>
 			<t:fieldCalendar property="startkaixzdsj" caption="开箱时间" format="yyyy-MM-dd" width="165"></t:fieldCalendar>
 			<t:fieldCalendar property="endkaixzdsj" caption="至" format="yyyy-MM-dd" width="165"></t:fieldCalendar>
		</t:fieldLayout>
		
		<t:gridCol  property="usercenter" caption="用户中心"  />
		<t:gridCol  property="lingjbh" caption="零件编号" width="85" 	/>
		<t:gridCol  property="lingjmc" caption="零件名称" width="50" />
		<t:gridCol  property="lingjsl" caption="零件数量" width="95" />
		<t:gridCol  property="tcno" caption="集装箱号" width="70" />
		<t:gridCol  property="dinghcj" caption="订货车间" width="95" />
		<t:gridCol  property="gongysdm" caption="供应商编号" width="60" />
		<t:gridCol  property="gongysmc" caption="供应商名称" width="95" />
		<t:gridCol  property="qiysj" caption="启运时间" width="95" />
		<t:gridCol  property="daodwldsj" caption="到港时间" width="95" />
		<t:gridCol  property="kaixzdsj" caption="开箱时间" width="95" />
	
		<t:gridCol  property="" caption="" />
	</t:grid>
</t:page>

<script type="text/javascript">

	//空格查询
	function grid_kaixrukjizx_beforeSubmit() {
		var beginTime = $("#layout_startqiysj").fieldValue();
		var endTime = $("#layout_endqiysj").fieldValue();
		var beginTimes = beginTime.substring(0, 10).split('-');
	    var endTimes = endTime.substring(0, 10).split('-');

	    beginTime = beginTimes[1] + '-' + beginTimes[2] + '-' + beginTimes[0] + ' ' + beginTime.substring(10, 19);
	    endTime = endTimes[1] + '-' + endTimes[2] + '-' + endTimes[0] + ' ' + endTime.substring(10, 19);
	    
	    var beginTime2 = $("#layout_startdaodwldsj").fieldValue();
		var endTime2 = $("#layout_enddaodwldsj").fieldValue();
		var beginTimes2 = beginTime2.substring(0, 10).split('-');
	    var endTimes2 = endTime2.substring(0, 10).split('-');

	    beginTime2 = beginTimes2[1] + '-' + beginTimes2[2] + '-' + beginTimes2[0] + ' ' + beginTime2.substring(10, 19);
	    endTime2 = endTimes2[1] + '-' + endTimes2[2] + '-' + endTimes2[0] + ' ' + endTime2.substring(10, 19);
	    
	    
	    var beginTime3 = $("#layout_startkaixzdsj").fieldValue();
		var endTime3 = $("#layout_endkaixzdsj").fieldValue();
		var beginTimes3 = beginTime3.substring(0, 10).split('-');
	    var endTimes3 = endTime3.substring(0, 10).split('-');

	    beginTime3 = beginTimes3[1] + '-' + beginTimes3[2] + '-' + beginTimes3[0] + ' ' + beginTime3.substring(10, 19);
	    endTime3 = endTimes3[1] + '-' + endTimes3[2] + '-' + endTimes3[0] + ' ' + endTime3.substring(10, 19);

	    var a = (Date.parse(endTime) - Date.parse(beginTime)) / 3600 / 1000;
	    var b = (Date.parse(endTime2) - Date.parse(beginTime2)) / 3600 / 1000;
	    var c = (Date.parse(endTime3) - Date.parse(beginTime3)) / 3600 / 1000;
	 
	    if (beginTime|endTime|a < 0) {
	        alert("时间输入错误，启运起始时间大于启运截至时间!");
	        return false;
	    } else if (beginTime2|endTime2|b < 0) {
	    	alert("时间输入错误，到港起始时间大于到港截至时间!");
	        return false;
	    } else if (beginTime|endTime|c < 0) {
	        alert("时间输入错误，开箱起始时间大于开箱截至时间!");
	        return false;
	    } else {
	        return true;
	    }
	}
	
	
	
</script>

</t:html>