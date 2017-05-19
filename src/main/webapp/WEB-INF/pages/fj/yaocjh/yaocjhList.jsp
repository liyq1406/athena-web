<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="要车计划查询" >
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
	</head>
	<t:page>
		<t:grid id="yaocjhGrid" idKeys="yaocjhh" caption="要车计划" 
		src="/fj/queryYaocjh.do" add="NOT" edit="NOT" remove="NOT"  usePager="true" showNum="true">
		<t:fieldLayout  id="sq_select" prefix="sq">
		              <t:fieldText property="yaocjhh"  caption="要车计划编号 "></t:fieldText>
		              <t:fieldSelect property="yunssbm" caption="运输商" convert=""></t:fieldSelect>
		              <t:fieldText property="keh"  caption="客户"></t:fieldText>
		              <t:fieldCalendar property="kaissj" format="yyyy-MM-dd"  caption="开始时间"></t:fieldCalendar>
		              <t:fieldCalendar property="jiessj" format="yyyy-MM-dd"  caption="结束时间"></t:fieldCalendar>
		              <t:fieldSelect property="usercenter" caption="用户中心 " convert="queryUserCenterMap"></t:fieldSelect>
		</t:fieldLayout>
		<t:gridCol   property="yaocjhh"  type="text" caption="要车计划编号 " width="100%"></t:gridCol>
		<t:gridCol   property="usercenter"  type="text" caption="用户中心"></t:gridCol>
		<t:gridCol   property="yunssbm" type="text" caption="运输商"></t:gridCol>
		<t:gridCol   property="zongcc" type="text" caption="总车次 "></t:gridCol>
		<t:gridCol   property="kaissj" type="text" caption="开始时间 "></t:gridCol>
		<t:gridCol   property="jiessj" type="text" caption="结束时间 "></t:gridCol>
		<t:gridCol   property="shifqr" type="text" caption="状态"></t:gridCol>
		<t:gridCol   property="chuangjr" type="text" caption="制单人编号"></t:gridCol>
		<t:gridCol   property="chuangjsj" type="text" caption="制单时间"></t:gridCol>
		</t:grid>
		
		
		<t:grid id="yaocjhmxGrid" usePager="true" submit="NOT" reset="NOT" add="NOT" edit="NOT"  remove="NOT" caption="要车计划明细" src="">
			<t:fieldLayout>
				<t:fieldHidden property="yaocjhh" caption="要车计划号"></t:fieldHidden>
			</t:fieldLayout>
		
		
			<t:gridCol   property="daocsj"  type="text" caption="到车时间"></t:gridCol>
			<t:gridCol   property="faysj" type="text" caption="发运时间"></t:gridCol>
			<t:gridCol   property="usercenter" type="text" caption="用户中心"></t:gridCol>
			<t:gridCol   property="kehbm" type="text" caption="客户 "></t:gridCol>
			<t:gridCol   property="jihcx" type="text" caption="车型 "></t:gridCol>
			<t:gridCol   property="yaoczt" type="text" caption="计划状态"></t:gridCol>
		</t:grid>
		
	</t:page >
	

		

	
	
	
	
	<script type="text/javascript">

	</script>
	<style type="text/css"></style>
</t:html>