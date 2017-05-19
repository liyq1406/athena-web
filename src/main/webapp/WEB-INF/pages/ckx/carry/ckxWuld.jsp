<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html>
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
	</head>
	<t:page i18n="i18n.ckx.carry.i18n_carry">
		<t:grid id="grid_CkxWuld" 
			idKeys="wuldbh"
			caption="${i18n.wuld}" 
			src="queryWuld.ajax"
			editable="true"
			insertAlias="addList" afterSaveRowsEvent="afterSaveRows"
			editAlias="editList"
			delAlias="delList"
			showEditorAddName="editorAdd" showEditorRemoveName="editorRemove"
			saveRowsSrcs="saveWuld.ajax" 
			load="false" showNum="true"
			scrollHeight="335" pageSize="15">
			<t:fieldLayout prefix="record0" columns="4">
				<t:fieldText property="wuldbh" caption="${i18n.wuld}" maxLength="3" width="110"/>
				<t:fieldText property="wuldmc" caption="${i18n.wuldmc}" maxLength="50" width="110"/>
				<t:fieldText property="wuldlx" caption="${i18n.wuldlx}" maxLength="4" width="110"/>
				<t:fieldSelect property="biaos" caption="${i18n.biaos}" convert="biaos"  width="110"/>
			</t:fieldLayout>
			<t:gridCol editor="fieldText" editorOptions="{'notNull':true,'maxLength':'3','minLength':'3','dataType':'text'}"  property="wuldbh" caption="${i18n.wuld}"/>
			<t:gridCol editor="fieldText"  editorOptions="{'notNull':true,'maxLength':'25',closeEvent:func_set_wuldmc}"  property="wuldmc" caption="${i18n.wuldmc}"/>
			<t:gridCol editor="fieldText"  editorOptions="{'maxLength':'4','dataType':'text','notNull':true}" property="wuldlx" caption="${i18n.wuldlx}"/>
			<t:gridCol editor="fieldText" editorOptions="{'notNull':true,'dataType':'integer','maxLength':'3'}" property="shunxh" caption="${i18n.shunxh}"/>
			<t:gridCol editor="fieldText"  property="quy" caption="${i18n.quy}"  editorOptions="{'notNull':true,'maxLength':'3','dataType':'text'}"/>
			<t:gridCol convert="biaos"  property="biaos" editor="fieldSelect"  editorOptions="{'notNull':true}" caption="${i18n.biaos}"/>
		<t:gridCol property="a" caption="   "
				></t:gridCol>
		</t:grid>
	</t:page>
	<script type="text/javascript">
	
	//保存按钮
	function func_button_save() {
		$('#grid_CkxWuld').grid('saveRows');
	}
	
	
	function func_set_wuldmc() {
		var cell = this.col.cell;
		var rowElement = cell.parent("tr:first");

		var wuldmcIndex = $('td.wuldmc:first').prevAll().length;
		var wuldmcTemp = rowElement.find('td:eq(' + wuldmcIndex + ')').text();
		
		var wuldmcname=trim(wuldmcTemp);
		
		if(undefined != wuldmcname && null != wuldmcname){
			if (!checkCH(25, wuldmcname)) {
				rowElement.find('td:eq(' + wuldmcIndex + ')')
				.addClass("editing edited validate-error")
				.attr("title", "【物理点名称】最大长度为25位");
				return false;
			}
		}
		
	}
			function initPage(){
				//页面初始化
			}
			
			$.sdcui.serverConfig.convertArray['biaos'] = {'1':'${i18n.available}','0':'${i18n.unavailable}'};
		</script>
</t:html>