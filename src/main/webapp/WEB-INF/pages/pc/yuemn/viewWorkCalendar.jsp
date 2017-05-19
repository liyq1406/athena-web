<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html i18n="i18n.pc.pc" >
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>

</head>
<body>

<!-- 工作详细 -->
		<t:form id="detailForm" submit="NOT" reset="NOT">
			<t:fieldLayout prefix="cx">
			 	<t:fieldLabel property="chanx" caption="${i18n.chanxh }" defaultValue="${chanx}"></t:fieldLabel>
			 	<t:fieldLabel property="hour" caption="${i18n.gongs }" defaultValue="${hour }"></t:fieldLabel>
			 	<t:fieldLabel property="kaissj" caption="${i18n.kaissj }" defaultValue="${kaissj }"></t:fieldLabel>
			 	<t:fieldLabel property="jiessj" caption="${i18n.jiessj }" defaultValue="${jiessj }"></t:fieldLabel>
		 	</t:fieldLayout>
		</t:form>
	

		<t:grid src="/pc/queryChanxLj.ajax"  scrollHeight="110"   id="detailGrid" idKeys="chanx"  usePager="false" showNum="true" add="NOT" edit="NOT" remove="NOT" reset="NOT" save="NOT" submit="NOT">
			<t:fieldLayout>
			<t:fieldHidden property="gongzbh" defaultValue="${gongzbh }" />
			</t:fieldLayout>
			<t:gridCol property="CHANXH" caption="${i18n.chanxh }"></t:gridCol>
			<t:gridCol property="SHIJ" caption="${i18n.riq }"></t:gridCol>
			<t:gridCol property="LINGJBH" caption="${i18n.lingjbh }"></t:gridCol>
			<t:gridCol property="LINGJSL" caption="${i18n.shul }"></t:gridCol>
		</t:grid>
	
		

		<t:grid src="/pc/queryErrorMessage.ajax" id="messageGrid" scrollHeight="80" idKeys="xiaox"  usePager="false" showNum="true" add="NOT" edit="NOT" remove="NOT" reset="NOT" save="NOT" submit="NOT" >
			<t:fieldLayout>
			<t:fieldHidden property="gongyzq" defaultValue="${gongyzq }" />
			<t:fieldHidden property="chanx" defaultValue="${chanx }" />
			<t:fieldHidden property="gongzbh" defaultValue="${gongzbh }" />
			</t:fieldLayout>
			<t:gridCol property="XIAOX" caption="${i18n.paicmessage }"></t:gridCol>
		</t:grid>
			
		<table align="center">
		<tr align="center">
			<td align="center">
				<div class="youi-button active-0" id="button_cancel">
				<div class="right"><div class="center"><a class="cancel" href="javascript:onclick=func_button_cancel();">${i18n.close }</a></div></div>
				</div>
			</td>
		</tr>
		</table>
</body>
<script type="text/javascript">
//关闭
function func_button_cancel(){ 
	parent.CloseModelWindow('','');
}


</script>
</t:html>
