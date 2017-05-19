<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="${i18n.title}">

<!-- 
	托盘包装对应关系参考系
	 @author denggq
	 @date 2012-4-12
 -->
 
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 75px; } </style>
</head>

<t:page i18n="i18n.ckx.xuqjs.i18n_quhys">
	<t:grid id="grid_tuopbzdygx" caption="" 
	idKeys="usercenter,baozxh" 
	editable="true"  
	back="NOT" 
	scrollHeight="290" 
	pageSize="15"
	src="/xuqjs/queryTuopbzdygx.ajax" 
	load="false" 
	saveRowsSrcs="/xuqjs/savesTuopbzdygx.ajax"
	removeSrc="/xuqjs/removeTuopbzdygx.ajax" 
	showNum="true" 
	afterSaveRowsEvent="afterSaveRows"
	showEditorAddName="editorAdd" 
	showEditorRemoveName="editorRemove" >
		
		<t:fieldLayout id="layout1" prefix="tuopbzdygx" columns="4">
			<t:fieldSelect property="usercenter" caption="用户中心" defaultValue="${usercenter}" convert="queryUserCenterMap" width="110"/>
			<t:fieldText property="tuopxh" caption="托盘型号" dataType="text" maxLength="5" minLength="5" width="110"/>
			<t:fieldText property="baozxh" caption="包装型号" dataType="text" maxLength="5" width="110"/>
		<t:fieldSelect property="biaos" caption="标识" convert="biaos" defaultValue="1" width="150"/>
		</t:fieldLayout>
		
		
	
		<t:gridCol   property="usercenter" caption="用户中心" editor="fieldSelect" convert="queryUserCenterMap" defaultValue="${usercenter}" editorOptions="{'notNull':true}"></t:gridCol>
		<t:gridCol property="tuopxh" caption="托盘型号" editor="fieldText" width="100" editorOptions="{'maxLength':'5','minLength':'5','dataType':'text','notNull':true}"></t:gridCol>
		<t:gridCol  property="baozxh" caption="包装型号" editor="fieldText" width="100" editorOptions="{'maxLength':'5','minLength':'5','dataType':'text','notNull':true}"></t:gridCol>
		<t:gridCol   property="baozgs" caption="包装个数" editor="fieldText" width="100" editorOptions="{'expression':'^([1-9][0-9]{0,9})$','expressionMessage':'只能输入大于0-999999999之间的整数值','notNull':true}"></t:gridCol>
		<t:gridCol property="biaos" caption="标识"  convert="biaos" editor="fieldSelect" defaultValue="1" editorOptions="{'notNull':true}"/>
				<t:gridCol  property="creator" caption="创建人"  width="70" ></t:gridCol>	
		<t:gridCol property="create_time" caption="创建时间" width="130"/>
		<t:gridCol  property="editor" caption="修改人"  width="70" ></t:gridCol>	
		<t:gridCol property="edit_time" caption="修改时间" width="130"/>
		<t:gridCol property="" caption=""/>
	</t:grid>
	
</t:page>

<script type="text/javascript">

//标识
$.sdcui.serverConfig.convertArray['biaos'] = {
	'1' : '${i18n.youx}',
	'0' : '${i18n.wux}'
};



	//空格查询
	function grid_tuopbzdygx_beforeSubmit() {
		$("#tuopbzdygx_tuopxh").fieldValue(trim($("#tuopbzdygx_tuopxh").fieldValue()));
		$("#tuopbzdygx_baozxh").fieldValue(trim($("#tuopbzdygx_baozxh").fieldValue()));
	}

	function func_button_save(){
		$('#grid_tuopbzdygx').grid('saveRows');
	}
	
	//行编辑保存后的方法
	function afterSaveRows(result){
		if(false == result.success){
			return false;
		}
		$('#grid_tuopbzdygx').grid('reload');
		return true;
	}
	
	
</script>

</t:html>