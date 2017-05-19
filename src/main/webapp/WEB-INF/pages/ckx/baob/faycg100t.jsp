<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="发运超过100天汇总零件清单">

 
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 65px; } </style>
</head>

<t:page i18n="" >
	<t:grid id="grid_faycg100t" caption="发运超过100天汇总零件清单" idKeys="lingjbh" load="" editable="false" 
	showNum="true" back="NOT" 
		 src="/baob/queryfaycg100t.ajax" exportXls="true" add="NOT" edit="NOT" remove="NOT"
		  scrollHeight="290" pageSize="15">
		<t:fieldLayout id="faycg100t" prefix="layout" columns="4">
			<t:fieldSelect property="usercenter" caption="用户中心" width="150" defaultValue="${USERCENTER}" convert="queryUserCenterMap"/>
			<t:fieldText property="lingjbh" caption="零件号"  width="150" dataType="text" maxLength="10"  />
			<t:fieldSelect property="zhuangtsx" caption="状态" width="150"  src="/baob/queryallztsx.ajax" show="value" code="key"/>
			<t:fieldText property="cangkbh" caption="仓库" width="150" />
			<t:fieldText property="zickbh" caption="子仓库" width="150" />
			<t:fieldText property="elh" caption="EL号"  width="150" dataType="text" maxLength="9"/>
 			<t:fieldCalendar property="startrukrq" caption="入库时间" format="yyyy-MM-dd" width="165"></t:fieldCalendar>
 			<t:fieldCalendar property="endrukrq" caption="至" format="yyyy-MM-dd" width="165"></t:fieldCalendar>
 			<t:fieldCalendar property="startqiysj" caption="发运时间" format="yyyy-MM-dd" width="165"></t:fieldCalendar>
 			<t:fieldCalendar property="endqiysj" caption="至" format="yyyy-MM-dd" width="165"></t:fieldCalendar>
		</t:fieldLayout>
		
		<t:gridCol  property="usercenter" caption="用户中心"  />
		<t:gridCol  property="lingjbh" caption="零件号" width="85" 	/>
		<t:gridCol  property="zhuangtsx" caption="状态" width="85" 	/>
		<t:gridCol  property="lingjsl" caption="零件数量" width="50" />
		<t:gridCol  property="usxh" caption="US代码" width="70" />
		<t:gridCol  property="usgs" caption="US个数" width="60" />
		<t:gridCol  property="usrl" caption="US容量" width="60" />
		<t:gridCol  property="cangkbh" caption="仓库代码" width="60" />
		<t:gridCol  property="zickbh" caption="子仓库代码" width="60" />
		<t:gridCol  property="elh" caption="EL号" width="95" />
		<t:gridCol  property="rukrq" caption="入库时间" width="95" />
		<t:gridCol  property="qiysj" caption="发运时间" width="95"/>
	
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
	        alert("时间输入错误，起始时间大于截至时间!");
	        return false;
	    } else {
	        return true;
	    }
		
	}
	 
</script>

</t:html>