<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="${i18n.illtitle}">
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
</head>
<t:page i18n="i18n.xqjs.ilOrder">
<t:form id="zhuangtForm" submit="NOT" reset="NOT">
<!--xh  141222 	0010851  js报错  -->
<t:grid id="grid_jisclcssz" caption="${i18n.zqdljs}" showNum="true"  idKeys="USERCENTER,JISCLDM,CHULZT,BEIZ"
	src="/ilorder/queryAllStats.ajax" add="NOT" multiple="true" edit="NOT" remove="NOT" load="true" reset="NOT"  scrollHeight="160"> 
	<t:gridCol property="usercenter" width="70" caption="${i18n.usercenter}" />
	<t:gridCol property="jiscldm" caption="${i18n.jiscldm}" width="70"></t:gridCol>
	<t:gridCol property="chulzt"  caption="${i18n.chulzt}" width="70"></t:gridCol>
	<t:gridCol  property="beiz" caption="${i18n.beiz}" width="70"></t:gridCol>
	</t:grid>
	<t:fieldLayout>
		<t:buttons id="insert_1">
			<t:button name="chongz" caption="${i18n.chongz}"></t:button>
		</t:buttons>
	</t:fieldLayout>
</t:form>

</t:page>
<script type="text/javascript">
 function createCheckBox(){
	return "<input  name='choices' type='CheckBox' value='0'/>";
}
function func_button_chongz() {
		var zhuangt = $('#grid_jisclcssz').grid('getSelectedRecords');
		
		if (zhuangt.length == 0) {
			alert("${i18n.xuanzts}");
			return false;
		}
		var params = [];
		for ( var i = 0, len =zhuangt.length; i < len; i++) {
			
			params.push('zt[' + i + '].usercenter=' + zhuangt[i].usercenter);
			params.push('zt[' + i + '].jiscldm=' + zhuangt[i].jiscldm);
			params.push('zt[' + i + '].chulzt=' + zhuangt[i].chulzt);
			params.push('zt[' + i + '].beiz=' + zhuangt[i].beiz);
		}
		$.sdcui.ajaxUtil.ajax({
			url : "${ctx}/ilorder/changeStats.ajax",
			data : params.join('&'),
			success : function(result) {
				alert(result.result);
				$('#grid_jisclcssz').grid('reload');
			}
		});

	}
</script>
</t:html>