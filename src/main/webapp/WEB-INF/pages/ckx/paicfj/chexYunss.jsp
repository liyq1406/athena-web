<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html title="${i18n.chanxz }">
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
</head>
<t:page i18n="i18n.ckx.paicfj.i18n_chexyunss">
		<t:grid id="grid_chexYunss" caption="${i18n.chexyunssgx}" idKeys="usercenter,yunssbh,chexbh"
			src="/paicfj/queryChexYunss.ajax" showNum="true"
			saveRowsSrcs="/paicfj/saveChexYunss.ajax" editable="true"
			afterSaveRowsEvent="afterSaveRows"
			showEditorAddName="editorAdd" showEditorRemoveName="editorRemove"
			editModel="false" load="false" >
			<t:fieldLayout id="c" prefix="chexyunss" columns="2">
			    <t:fieldSelect property="usercenter"  caption="${i18n.usercenter}" convert="queryUserCenterMap" defaultValue="${loginUsercenter }" />
				<t:fieldText property="yunssbh" caption="${i18n.yunssbh}" dataType="text" maxLength="10"/>
				<t:fieldText property="chexbh" caption="${i18n.chexbh}" dataType="text" maxLength="10" />
			</t:fieldLayout>
			<t:gridCol property="usercenter" caption="${i18n.usercenter}"
				  convert="queryUserCenterMap" editor="fieldSelect"
				defaultValue="${loginUsercenter }"></t:gridCol>
			<t:gridCol property="yunssbh" caption="${i18n.yunssbh}"
				editor="fieldText" editorOptions="{'notNull':true,'maxLength':'10','dataType':'text'}"></t:gridCol>
			<t:gridCol property="chexbh" caption="${i18n.chexbh}"
				editor="fieldText" 
				editorOptions="{'notNull':true,'maxLength':'10','dataType':'text'}"></t:gridCol>
				<t:gridCol property="zuidsl" caption="${i18n.zuidsl}"
				editor="fieldText" 
				editorOptions="{'notNull':true,'maxLength':'3','dataType':'integer'}"></t:gridCol>
					<t:gridCol property="a" caption="   "
				></t:gridCol>
		</t:grid>

</t:page>
</t:html>
<script type="text/javascript">

	function func_button_save() {
		$("#grid_chexYunss").grid("saveRows");
	}
	function grid_ckx_chex_beforeSubmit() {
		$("#chexyunss_yunssbh").fieldValue(trim($("#chexyunss_yunssbh").fieldValue()));
		$("#chexyunss_chexbh").fieldValue(trim($("#chexyunss_chexbh").fieldValue()));
	}
</script>
