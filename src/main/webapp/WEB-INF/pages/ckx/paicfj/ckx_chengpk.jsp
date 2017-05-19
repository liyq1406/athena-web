<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html title="${i18n.chanxz }">
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<style type="text/css">
 .youi-fieldLayout table td.contral.label-col { width: 70px; }
</style>
</head>
<t:page i18n="i18n.ckx.paicfj.i18n_chengpk">

		<t:grid id="grid_ckx_chengpk" caption="${i18n.chengpk }"
			idKeys="usercenter" src="/paicfj/queryCkx_chengpk.ajax"
			saveRowsSrcs="/paicfj/saveCkx_chengpk.ajax" editable="true"
			afterSaveRowsEvent="afterSaveRows"
			showEditorAddName="editorAdd" showEditorRemoveName="editorRemove"
			editModel="false" load="false" showNum="true">
			<t:fieldLayout id="chengpk" prefix="chengpk" columns="3">
				<t:fieldSelect property="usercenter" caption="${i18n.usercenter }"
					convert="queryUserCenterMap" defaultValue="${loginUsercenter }" />
			</t:fieldLayout>
			<t:gridCol property="usercenter" caption="${i18n.usercenter }"
				convert="queryUserCenterMap" editor="fieldSelect"
				editorOptions="{'notNull':true}"></t:gridCol>
			<t:gridCol property="shixts" caption="${i18n.shixts }" width="200"
				editorOptions="{'notNull':true,'dataType':'integer','maxLength':'2'}"
				editor="fieldText"></t:gridCol>
				<t:gridCol property="a" caption="   "
				></t:gridCol>
		</t:grid>

</t:page>
</t:html>
<script type="text/javascript">
	function func_button_save(){
		$("#grid_ckx_chengpk").grid("saveRows");
// 		$("#grid_ckx_chengpk").grid("reload");
	}
		</script>
