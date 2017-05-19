<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html title="${i18n.rafmodth}">
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
	</head>
	
	<script type="text/javascript">
		function isflush(a,b){
			var message = a.result.message;
			if(message=="保存成功"){
				return true;
			}else{
				return false;
			}		
		}
	</script>
	
	<t:page i18n="i18n.ckx.ddbh.i18n_rafmodth">
		<t:grid id="grid_rafmodth" 
			idKeys="id,flag"
			caption="${i18n.rafmodthlb}" 
			src="/ddbh/list_RAFMODth.ajax"
			editable="true"
			insertAlias="addList"
			editAlias="editList"
			delAlias="delList"
			showEditorAddName="editorAdd" showEditorRemoveName="editorRemove" 
			saveRowsSrcs="/ddbh/savePg.ajax" load="false" showNum="true" showCheckbox="true" afterSaveRowsEvent="isflush" scrollHeight="280">
			<t:fieldLayout prefix="record0" columns="3">
				<t:fieldText property="ofh" caption="${i18n.ofh}" maxLength="8"  minLength="8" dataType="text" width="180"/>
				<t:fieldText property="yuanxhd" caption="${i18n.yxhd}" maxLength="9" minLength="9" dataType="text" width="180"/>
				<t:fieldText property="yuanlj" caption="${i18n.ylj}"  maxLength="10" minLength="10" dataType="text" width="180"/>
				<t:fieldText property="xinxhd" caption="${i18n.xxhd}" maxLength="9" minLength="9" dataType="text" width="180"/>
				<t:fieldText property="xinlj" caption="${i18n.xlj}" maxLength="10" minLength="10" dataType="text" width="180"/>
			</t:fieldLayout>
			<t:gridCol convert="caozbs" editor="fieldSelect"  editorOptions="{'notNull':true}"  property="caozbs" caption="${i18n.clbs}"  width="80" />
			<t:gridCol editor="fieldText" editorOptions="{'maxLength':'8','minLength':'8','dataType':'text'}"  property="ofh" caption="${i18n.ofh}" width="80"/>
			<t:gridCol editor="fieldText"  editorOptions="{'maxLength':'9','minLength':'9','dataType':'test'}"  property="yuanxhd" caption="${i18n.yxhd}" width="85"/>			
			<t:gridCol editor="fieldText" editorOptions="{'dataType':'text','maxLength':'10','minLength':'10'}" property="yuanlj" caption="${i18n.ylj}" width="90"/>
			<t:gridCol editor="fieldText" property="yuanxs" caption="${i18n.yxs}" width="80"/>
			<t:gridCol editor="fieldText"  editorOptions="{'maxLength':'9','minLength':'9','dataType':'test'}"  property="xinxhd" caption="${i18n.xxhd}" width="85"/>			
			<t:gridCol editor="fieldText" editorOptions="{'dataType':'text','maxLength':'10','minLength':'10'}" property="xinlj" caption="${i18n.xlj}" width="90"/>
			<t:gridCol editor="fieldText" property="xinxs" caption="${i18n.xxs}" width="80" />			
		</t:grid>
	</t:page>
	<script type="text/javascript">
			function initPage(){
				//页面初始化
			}
			
			$.sdcui.serverConfig.convertArray['caozbs'] = {'1':'${i18n.xz}','2':'${i18n.th}','3':'${i18n.sc}'};
		</script>
</t:html>