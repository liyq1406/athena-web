<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html>
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
		<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 65px; } </style>
	</head>
	<t:page i18n="i18n.ckx.workCalendar.i18n_workCalendar">
		<t:grid id="grid_CkxCalendarDayOff" 
			idKeys="riq" caption="${i18n.xiuxr}" 
			src="queryCkxXiuxr.ajax" editable="true"
			insertAlias="addList" editAlias="editList" afterSaveRowsEvent="afterSaveRows"

			delAlias="delList" saveRowsSrcs="saveCkxXiuxr.ajax" load="false" showNum="true"
			scrollHeight="335" pageSize="15"
			showEditorAddName="editorAdd" showEditorRemoveName="editorRemove">
			<t:fieldLayout prefix="record0" >
				<t:fieldCalendar property="beginDate" caption="${i18n.kaissj}" format="yyyy-MM-dd" />
				<t:fieldCalendar property="endDate" caption="${i18n.jiezsj}" format="yyyy-MM-dd" />
				<t:fieldSelect property="biaos" caption="${i18n.biaos}" convert="biaos" />

			</t:fieldLayout>
			<t:gridCol editor="fieldCalendar"  editorOptions="{'notNull':true,'format':'yyyy-MM-dd'}"  property="riq" caption="${i18n.riq}"/>
			<t:gridCol editor="fieldText" property="beiz" caption="${i18n.beiz}" editorOptions="{'maxLength':'100'}"/>
			<t:gridCol convert="biaos"  property="biaos" editor="fieldSelect"  editorOptions="{'notNull':true}" caption="${i18n.biaos}" defaultValue="1"/>
		<t:gridCol property="a" caption="   "
				></t:gridCol>
		</t:grid>
	</t:page>
	<script type="text/javascript">
			function initPage(){
				//页面初始化
			}
			$.sdcui.serverConfig.convertArray['biaos'] = {'1':'${i18n.available}','0':'${i18n.unavailable}'};
		</script>
</t:html>