<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="${i18n.pc_qickc_title }" >
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
	</head>
	<t:page i18n="i18n.pc.pc" >
		<t:grid id="qickcGrid" idKeys="usercenter" caption="${i18n.pc_qickc_title }" load="false"
		src="/pc/queryQickcAll.ajax" add="NOT" remove="NOT" edit="NOT"  usePager="true" showNum="true">
		<t:fieldLayout  id="sq_select" prefix="qickc" columns="2">
		        <t:fieldCalendar property="kaissj" format="yyyy-MM-dd" caption="${i18n.kaissj }"></t:fieldCalendar>
		        <t:fieldCalendar property="jiessj" format="yyyy-MM-dd"  caption="${i18n.jiessj }"></t:fieldCalendar>
		        <t:fieldText property="lingjbh"  caption="${i18n.lingjbh }"></t:fieldText>
		        <t:fieldSelect property="biaos" caption="${i18n.leix }" notNull="true" convert="leix" defaultValue="Y"></t:fieldSelect>
		</t:fieldLayout>
		<t:gridCol   property="usercenter"  caption="${i18n.usercenter } "></t:gridCol>
		<t:gridCol   property="lingjbh"   caption="${i18n.lingjbh } "></t:gridCol>
		<t:gridCol   property="shij"   caption="${i18n.riq }"></t:gridCol>
		<t:gridCol   property="lingjsl"    caption="${i18n.paicl }  "></t:gridCol>
		<t:gridCol   property="maoxq"   caption="${i18n.xuql } "></t:gridCol>
		<t:gridCol   property="qickc"   caption="${i18n.qickc } "></t:gridCol>
		<t:gridCol   property="anqkc"   caption="${i18n.anqkc }"></t:gridCol>
		<t:gridCol   property="kucbz"   caption="${i18n.kucbz }"></t:gridCol>
		<!-- xss-0012251 -->
	  	<t:gridCol   property="yaohsl"   caption="${i18n.fajsl }"></t:gridCol>
		<t:gridCol   property="ruksl"   caption="${i18n.ruksl }"></t:gridCol>
		<t:gridCol   property="beicsl"   caption="${i18n.beicsl }"></t:gridCol>
		</t:grid>
	<script type="text/javascript">
	$.sdcui.serverConfig.convertArray['leix'] ={'Y':'${i18n.zhouqmn }','R':'${i18n.rigd }','G':'${i18n.gundymn }'};
	</script>			
	</t:page >
</t:html>