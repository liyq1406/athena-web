<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="${i18n.pc_yancyhl_title }" >
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
	<script type="text/javascript">

	</script>	
		
	</head>
	<t:page i18n="i18n.pc.pc" >
		<t:grid id="yancyhlGrid" idKeys="usercenter,yaohlh" caption="${i18n.pc_yancyhl_title }" 
		src="/pc/queryYancyhl.ajax" add="NOT" remove="NOT" edit="NOT" usePager="true" showNum="true">
		<t:fieldLayout  id="sq_select" prefix="yancyhl" columns="2">
		        <t:fieldCalendar property="kaissj" format="yyyy-MM-dd" caption="${i18n.kaissj }"></t:fieldCalendar>
		        <t:fieldCalendar property="jiessj" format="yyyy-MM-dd"  caption="${i18n.jiessj }"></t:fieldCalendar>
		        <t:fieldText property="yaohlh"  caption="${i18n.yaohlh }"></t:fieldText>
		        <t:fieldText property="lingjbh"  caption="${i18n.lingjbh }"></t:fieldText>
		</t:fieldLayout>
		<t:gridCol   property="usercenter"  caption="${i18n.usercenter } "></t:gridCol>
		<t:gridCol   property="yaohlh"   caption="${i18n.yaohlh } "></t:gridCol>
		<t:gridCol   property="lingjbh"   caption="${i18n.lingjbh } "></t:gridCol>
		<t:gridCol   property="jiaofj"    caption="${i18n.jiaofj } "></t:gridCol>
		<t:gridCol   property="yaohsl"   caption="${i18n.yaohsl } "></t:gridCol>
		</t:grid>
	</t:page >
</t:html>