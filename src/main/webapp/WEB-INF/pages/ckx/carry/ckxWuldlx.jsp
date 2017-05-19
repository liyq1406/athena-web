<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html>
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
	</head>
	<t:page i18n="i18n.ckx.carry.i18n_carry">
		<t:grid id="grid_CkxWuldlx" 
			idKeys="wuldlxbh"
			caption="${i18n.wuldlx}" 
			src="queryWuldlx.ajax"
			editable="true"
			insertAlias="addList"
			editAlias="editList"
			showEditorAddName="editorAdd" showEditorRemoveName="editorRemove"
			delAlias="delList" afterSaveRowsEvent="afterSaveRows"
			saveRowsSrcs="saveType.ajax"load="false" showNum="true"
			scrollHeight="335" pageSize="15">
			<t:fieldLayout prefix="record0" columns="3">
				<t:fieldText property="wuldlxbh" caption="${i18n.wuldlx}"  maxLength="4" width="150"/>
				<t:fieldSelect property="biaos" caption="${i18n.biaos}" convert="biaos" width="150"/>
			</t:fieldLayout>
			<t:gridCol editor="fieldText" editorOptions="{'notNull':true,'maxLength':'4','dataType':'text'}"  property="wuldlxbh" caption="${i18n.wuldlx}"/>
			<t:gridCol editor="fieldText" editorOptions="{'maxLength':'12'}" property="hany" caption="含义" />
			<t:gridCol editor="fieldText" editorOptions="{'notNull':true,'dataType':'integer','expression':'^(([0-9])|([1-9][0-9])|([1-9][0-9][0-9]))$','expressionMessage':'只能输入0-3位整数','maxLength':'3'}"  property="qissxh" caption="${i18n.qissxh}"/>
			<t:gridCol editor="fieldText" editorOptions="{'notNull':true,'dataType':'integer','maxLength':'3'}" property="jiessxh" caption="${i18n.jiessxh}"/>
			<t:gridCol convert="biaos"  property="biaos" editor="fieldSelect"  editorOptions="{'notNull':true}" caption="${i18n.biaos}"/>
			<t:gridCol property="a" caption="" width="5"></t:gridCol>
		</t:grid>
	</t:page>
	<script type="text/javascript">
			function initPage(){
				//页面初始化
			}
			$.sdcui.serverConfig.convertArray['biaos'] = {'1':'${i18n.available}','0':'${i18n.unavailable}'};
		</script>
		<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 105px; } </style>
</t:html>