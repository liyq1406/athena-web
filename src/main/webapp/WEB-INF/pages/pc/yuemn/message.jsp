<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html i18n="i18n.pc.pc" >
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>

</head>
<body>
<!-- 报警信息 -->
		<t:grid id="messageGrid" idKeys="usercenter" 
			src="/pc/queryMessage.ajax"  save="NOT"  usePager="true" reset="NOT" submit="NOT" showNum="true" add="NOT" edit="NOT" remove="NOT" load="true" >
			<t:fieldLayout>
			<t:fieldHidden property="gongyzq" defaultValue="${gongyzq}"></t:fieldHidden>
			<t:fieldHidden property="chanx" defaultValue="${chanx}"></t:fieldHidden>
			</t:fieldLayout>
			<t:gridCol property="XIAOX" caption="${i18n.xiaox }"></t:gridCol>

		</t:grid>
		<table align="center">
		<tr align="center">
			<td align="center">
				<div class="youi-button active-0" id="button_cancel">
				<div class="right"><div class="center"><a class="cancel" href="javascript:onclick=func_button_cancel();">${i18n.btnBack }</a></div></div>
				</div>
			</td>
		</tr>
		</table>
</body>
<script type="text/javascript">

//取消
function func_button_cancel(){ 
	parent.CloseModelWindow('','');
}

</script>
</t:html>
