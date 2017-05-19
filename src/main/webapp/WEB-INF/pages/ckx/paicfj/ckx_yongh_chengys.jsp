<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html title="${i18n.chanxz }">
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>

</head>
<t:page i18n="i18n.ckx.paicfj.i18n_yonghcys">

		<t:grid id="grid_ckx_yongh_shengys" caption="${i18n.yonghcys }"
			idKeys="usercenter,yonghbh,chengysbh"
			src="/paicfj/queryCkx_yongh_chengys.ajax" showNum="true"
			removeSrc="/paicfj/removeCkx_yongh_chengys.ajax" editable="true"
			saveRowsSrcs="/paicfj/saveCkx_yongh_chengys.ajax" load="false">
			<t:fieldLayout id="cys" prefix="cys" columns="3">
				<t:fieldSelect property="usercenter" caption="${i18n.usercenter }"
					convert="queryUserCenterMap" defaultValue="${loginUsercenter }" />
				<t:fieldText property="yonghbh" caption="${i18n.yonghbh }" maxLength="10" minLength="10" dataType="text"/>
				<t:fieldSelect property="chengysbh" caption="${i18n.chengysbh }"
					src="/paicfj/listCkx_gongys.ajax?leix=4" show="gcbh" code="gcbh"
					parents="usercenter" />
			</t:fieldLayout>
			<t:gridCol property="usercenter" caption="${i18n.usercenter }" defaultValue="${loginUsercenter }"
				convert="queryUserCenterMap" editor="fieldSelect" editorOptions="{'notNull':true}"></t:gridCol>
			<t:gridCol property="yonghbh" caption="${i18n.yonghbh }"
				editor="fieldText"
				editorOptions="{'notNull':true,'maxLength':'10','minLength':'10','dataType':'text'}"></t:gridCol>
			<t:gridCol property="chengysbh" caption="${i18n.chengysbh }"
				editor="fieldSelect"
				editorOptions="{'src':'../paicfj/listCkx_gongys.ajax','show':'gcbh','code':'gcbh','notNull':true}"></t:gridCol>
		</t:grid>

</t:page>
</t:html>
<script type="text/javascript">
	$.sdcui.serverConfig.convertArray['shifqyjjpl'] = {
		'0' : '${i18n.n }',
		'1' : '${i18n.y }'
	};
	$(document).ready(function() {

	});
	function form_kehb_beforeSubmit() {

		return true;
	}
	function func_button_save() {
		// 		var record=$("#grid_ckx_shengcx_lingj").grid("getSelectedRecords")[0];

		$("#grid_ckx_yongh_shengys").grid("saveRows");
	}
</script>
