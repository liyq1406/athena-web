<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html title="${i18n.chanxz }">
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>

</head>
<t:page i18n="i18n.ckx.paicfj.i18n_chex">

		<t:grid id="grid_ckx_chex" caption="${i18n.chex}" idKeys="chexbh"
			src="/paicfj/queryCkx_chex.ajax" showNum="true" 
			saveRowsSrcs="/paicfj/saveCkx_chex.ajax" editable="true"
			afterSaveRowsEvent="afterSaveRows"
			showEditorAddName="editorAdd" showEditorRemoveName="editorRemove"
			editModel="false" load="false" >
			<t:fieldLayout id="chengpk" prefix="chex" columns="2">
				<t:fieldText property="chexbh" caption="${i18n.chexbh}" dataType="text" maxLength="10" />
				<t:fieldSelect property="biaos" caption="${i18n.active}"
					convert="active" defaultValue="1" />
			</t:fieldLayout>
			<t:gridCol property="chexbh" caption="${i18n.chexbh}"
				editor="fieldText" 
				editorOptions="{'notNull':true,'dataType':'text','maxLength':'10'}"></t:gridCol>
			<t:gridCol property="chexmc" caption="${i18n.chexmc}"
				editor="fieldText" editorOptions="{'maxLength':'20'}"></t:gridCol>
			<t:gridCol property="biaos" caption="${i18n.active}"
				editor="fieldSelect" convert="active" defaultValue="1"
				editorOptions="{'notNull':true}"></t:gridCol>
				<t:gridCol property="a" caption="   "
				></t:gridCol>
		</t:grid>

</t:page>
</t:html>
<script type="text/javascript">
	$.sdcui.serverConfig.convertArray['active'] = {
		'1' : '${i18n.y}',
		'0' : '${i18n.n}'
	};
	function func_button_save() {
		$("#grid_ckx_chex").grid("saveRows");
	}
	function grid_ckx_chex_beforeSubmit() {
		$("#chex_chexbh").fieldValue(trim($("#chex_chexbh").fieldValue()));
	}
	function func_setRow(defaultValue){
		defaultValue['chexbh'] = 'b';
	}
</script>
