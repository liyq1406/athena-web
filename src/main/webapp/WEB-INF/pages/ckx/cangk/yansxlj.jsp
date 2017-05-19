<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="零件类型验收项">

<!-- 
	  零件类型验收项
	 @author wangyu
	 @date 2012-2-6
 -->
 
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 75px; } </style>
</head>

<t:page i18n="i18n.ckx.cangk.i18n_yansblsz">
	<t:grid id="grid_yansxlj" caption="零件类型验收项" idKeys="usercenter,lingjlx,yansxbh" 
		editable="false"  showNum="true" save="NOT" edit="NOT" removeSrc="/cangk/removeYansxlj.ajax"
		dataFormId="form_yansxlj"
		src="/cangk/queryYansxlj.ajax" 
		load="false"
		showEditorRemove="false" showEditorAdd="false" scrollHeight="335" pageSize="15">
		<t:fieldLayout id="fl_yansxlj" prefix="yansxlj" columns="3">
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" defaultValue="${usercenter}" convert="queryUserCenterMap" width="150"/>
			<t:fieldSelect property="lingjlx" caption="${i18n.lingjlx}" convert="queryLjlx"  width="150"/>
		</t:fieldLayout>
		
<%-- 		<t:button caption="${i18n.shengcsj }" name="commit"></t:button> --%>
		
		<t:gridCol property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap" defaultValue="${usercenter}" editor="fieldSelect" editorOptions="{'notNull':true}"></t:gridCol>
		<t:gridCol property="lingjlx" caption="${i18n.lingjlx}" convert="queryLjlx" editor="fieldSelect" editorOptions="{'notNull':true}"></t:gridCol>
		<t:gridCol property="yansxbh" caption="验收项编号" editor="fieldText" width="90" editorOptions="{'minLength':'3','maxLength':'3','dataType':'text','notNull':true}"></t:gridCol>
		<t:gridCol property="creator" caption="${i18n.creator}" width="70"/>
		<t:gridCol property="create_time" caption="${i18n.create_time}" width="130"/>
		<t:gridCol property="editor" caption="${i18n.editor}" width="70"/>
		<t:gridCol property="edit_time" caption="${i18n.edit_time}" width="130"/>
		<t:gridCol property="" caption=" " width="10"></t:gridCol>
	</t:grid>
	
	<t:form dialog="true" caption="零件类型验收项"
		id="form_yansxlj" action="/cangk/saveYansxlj.ajax"  width="450" reset="NOT">
		<t:fieldLayout prefix="groups1" columns="2">
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap" notNull="true" defaultValue="${usercenter}" width="150"></t:fieldSelect>
			<t:fieldSelect property="lingjlx" caption="${i18n.lingjlx}" convert="queryLjlx" notNull="true"  width="150"/>
			<t:fieldText property="yansxbh" caption="验收项编号" maxLength="3" notNull="true" dataType="text" width="150"></t:fieldText>
		</t:fieldLayout>
	</t:form>
</t:page>

<script type="text/javascript">

	//标识
	$.sdcui.serverConfig.convertArray['biaos'] = {
		'1' : '${i18n.yes}',
		'0' : '${i18n.no}'
	};

	//保存按钮
	function func_button_save() {
		$('#grid_yansxlj').grid('saveRows');
	}

	//空格查询
	function grid_yansxlj_beforeSubmit() {
		$("#yansxlj_yansxbh").fieldValue(trim($("#yansxlj_yansxbh").fieldValue()));
	}
	
	
	
	//行编辑保存后的方法
	function afterSaveRows(result){
		if(false == result.success){
			return false;
		}
		return true;
	}
</script>

</t:html>