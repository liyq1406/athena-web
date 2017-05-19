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
<t:page i18n="i18n.ckx.paicfj.i18n_lingjxlh">

		<t:grid id="grid_ckx_lingjxlh_qud" showNum="true"
			caption="${i18n.lingjxlh}-${i18n.qud}" idKeys="qid,usercenter,lingjbh"
			src="/paicfj/queryCkx_lingjxlh_qud.ajax" editable="true" load="false"
			afterSaveRowsEvent="afterSaveRows"
			showEditorAddName="editorAdd" showEditorRemoveName="editorRemove"
			saveRowsSrcs="/paicfj/saveCkx_lingjxlh_qud.ajax" editModel="false">
			<t:fieldLayout id="lingjxlh" prefix="lingjxlh" columns="3">
				<t:fieldSelect property="usercenter" caption="${i18n.usercenter}"
					convert="queryUserCenterMap" defaultValue="${loginUsercenter }" />
				<t:fieldText property="lingjbh" caption="${i18n.lingjbh}" maxLength="10" />
					<t:fieldSelect property="biaos" caption="${i18n.active}"
					 convert="active"  />
			</t:fieldLayout>
			<t:gridCol property="usercenter" caption="${i18n.usercenter}"
				convert="queryUserCenterMap" editor="fieldSelect" width="70"
				editorOptions="{'notNull':true}"></t:gridCol>
			<t:gridCol property="lingjbh" caption="${i18n.lingjbh}" width="70"
				editorOptions="{'notNull':true,'maxLength':'10'}"
				editor="fieldText"></t:gridCol>
			<t:gridCol property="xulhqz" caption="${i18n.xlhqzbm}" width="100"
				editor="fieldText" editorOptions="{'maxLength':'6','minLength':'6','notNull':true}"></t:gridCol>
			<t:gridCol property="xulhks" caption="${i18n.xlhksbm}" width="100"
				editor="fieldText" editorOptions="{'maxLength':'7','minLength':'7','notNull':true,'expression':'^[0-9]{7}$','expressionMessage':'请输入7为数字型【序列号开始】'}"></t:gridCol>
			<t:gridCol property="xulhjs" caption="${i18n.xlhjsbm}" width="100"
				editor="fieldText" editorOptions="{'maxLength':'7','minLength':'7','notNull':true,'expression':'^[0-9]{7}$','expressionMessage':'请输入7为数字型【序列号结束】'}"></t:gridCol>
			<t:gridCol property="qisrq" caption="${i18n.qisrq}" width="70"
				editor="fieldCalendar" editorOptions="{'notNull':true,'format':'yyyy-MM-dd'}"></t:gridCol>
			<t:gridCol property="jiesrq" caption="${i18n.jiesrq}" width="70"
				editor="fieldCalendar" editorOptions="{'notNull':true,'format':'yyyy-MM-dd'}"></t:gridCol>
			<t:gridCol property="zhidr" caption="${i18n.zhidr}" width="50"
				></t:gridCol>
			<t:gridCol property="zhidsj" caption="${i18n.zhidsj}" width="60"
				></t:gridCol>
				<t:gridCol property="biaos" caption="${i18n.active}" width="40"
				convert="active" editor="fieldSelect" editorOptions="{'notNull':true}" defaultValue="1"></t:gridCol>
					<t:gridCol property="a" caption="   "
				></t:gridCol>
		</t:grid>

</t:page>
</t:html>
<script type="text/javascript">
$.sdcui.serverConfig.convertArray['active'] = {
		'1' : '${i18n.youx}',
		'0' : '${i18n.wux}'
	};
	function func_button_save(){
		$("#grid_ckx_lingjxlh_qud").grid("saveRows");
// 		$("#grid_ckx_lingjxlh_qud").grid("reload");
	}
		</script>
