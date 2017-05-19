<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="${i18n.xingzysts}">

<!-- 
	  行政验收提示验收项
	 @author denggq
	 @date 2012-2-6
 -->

<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 75px; } </style>
</head>

<t:page i18n="i18n.ckx.cangk.i18n_xingzysts">
	<t:grid id="grid_xingzysts" caption="${i18n.xingzysts}" idKeys="yansxbh" edit="NOT" 
		editable="true" load="false"  showNum="true" back="NOT"
		src="/cangk/queryXingzysts.ajax" removeSrc="/cangk/removeXingzysts.ajax" 
		saveRowsSrcs="/cangk/saveXingzysts.ajax"  afterSaveRowsEvent="afterSaveRows"
		showEditorRemove="true" scrollHeight="335" pageSize="15" showEditorAddName="editorAdd" showEditorRemoveName="editorRemove">
		<t:fieldLayout id="fl_xingzysts" prefix="xingzysts" columns="3">
			<t:fieldText property="yansxbh" caption="${i18n.yansxbh}" maxLength="3" dataType="text" width="150"/>
			<t:fieldText property="yansxsm" caption="${i18n.yansxsm}" maxLength="20" width="150"/>
			<t:fieldSelect property="biaos" caption="${i18n.biaos}" convert="biaos" defaultValue="1" width="150"/>
		</t:fieldLayout>
		
		<t:gridCol property="yansxbh" caption="${i18n.yansxbh}" editor="fieldText" width="120"
			editorOptions="{'notNull':true,'maxLength':'3','dataType':'text'}"></t:gridCol>
		<t:gridCol property="yansxsm" caption="${i18n.yansxsm}" editor="fieldText" width="200" editorOptions="{'notNull':true,closeEvent:func_set_yansxsm}"></t:gridCol>
		<t:gridCol property="biaos" caption="${i18n.biaos}" convert="biaos" editor="fieldSelect" width="150" defaultValue="1" editorOptions="{'notNull':true}"></t:gridCol>
		<t:gridCol property="" caption=" " ></t:gridCol>
	</t:grid>
</t:page>

<script type="text/javascript">

	//标识
	$.sdcui.serverConfig.convertArray['biaos'] = {
		'1' : '${i18n.yes}',
		'0' : '${i18n.no}'
	};

	//空格查询
	function grid_xingzysts_beforeSubmit() {
		$("#xingzysts_yansxbh").fieldValue(trim($("#xingzysts_yansxbh").fieldValue()));
		$("#xingzysts_yansxsm").fieldValue(trim($("#xingzysts_yansxsm").fieldValue()));
	}

	//保存按钮
	function func_button_save() {
		$('#grid_xingzysts').grid('saveRows');
	}
	
	//行编辑保存后的方法
	function afterSaveRows(result){
		if(false == result.success){
			return false;
		}
		return true;
	}
	
	//验收项说明长度为20
	function func_set_yansxsm() {
		var cell = this.col.cell;
		var rowElement = cell.parent("tr:first");

		var yansxsmIndex = $('td.yansxsm:first').prevAll().length;
		var yansxsm = trim(rowElement.find('td:eq(' + yansxsmIndex + ')').text());
		
		if(undefined != yansxsm && null != yansxsm && "" !== yansxsm){
			if (!checkCH(20, yansxsm)) {
				alert("${i18n.yansxsmcd}");
				return false;
			}
		}
		return true;
	}
</script>

</t:html>