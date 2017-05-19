<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="${i18n.pc_weiclxq_title }" >
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
	</head>
	<t:page i18n="i18n.pc.pc" >
		<t:grid id="weiclxqGrid" idKeys="usercenter" caption="${i18n.pc_weiclxq_title }" 
		src="/pc/queryWeiclxq.ajax" add="NOT" remove="NOT" edit="NOT" usePager="true" showNum="true"  load="false" >
		<t:fieldLayout  id="sq_select" prefix="weiclxq" columns="2">
		        <t:fieldCalendar property="kaissj" format="yyyy-MM-dd" notNull="true" caption="${i18n.kaissj }"></t:fieldCalendar>
		        <t:fieldCalendar property="jiessj" format="yyyy-MM-dd" notNull="true"  caption="${i18n.jiessj }"></t:fieldCalendar>
		        <t:fieldText property="lingjbh"  caption="${i18n.lingjbh }"></t:fieldText>
		        <t:fieldSelect property="leix" caption="${i18n.leix }" convert="leix" notNull="true" defaultValue="DD"></t:fieldSelect>
		</t:fieldLayout>
		<t:gridCol   property="usercenter"  caption="${i18n.usercenter } "></t:gridCol>
		<t:gridCol   property="lingjbh"   caption="${i18n.lingjbh } "></t:gridCol>
		<t:gridCol   property="kaissj"   caption="${i18n.kaissj } "></t:gridCol>
		<t:gridCol   property="jiessj"   caption="${i18n.jiessj } "></t:gridCol>
		<t:gridCol   property="lingjsl"    caption="${i18n.lingjsl } "></t:gridCol>
		<t:gridCol   property="leix"   caption="${i18n.leix } "></t:gridCol>
		</t:grid>
		
	<script type="text/javascript">
	$.sdcui.serverConfig.convertArray['leix'] ={'DD':'${i18n.dingdmx }','YG':'${i18n.wbddyg }','YHL':'${i18n.gevpyhl }'};
	</script>	
	</t:page >
</t:html>