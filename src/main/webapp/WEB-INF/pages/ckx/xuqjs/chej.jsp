 <%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="${i18n.usercenter}">

<!-- 
	 用户中心
	 @author denggq
	 @date 2012-3-19
 -->
 
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 65px; } </style>
</head>

<t:page i18n="i18n.ckx.xuqjs.i18n_chej">
	<t:grid id="grid_chej" caption="${i18n.chej}" 
		src="/xuqjs/queryChej.ajax"
		removeSrc="/xuqjs/removeChej.ajax"
		saveRowsSrcs="/xuqjs/saveChej.ajax"
		idKeys="usercenter,chejbm"  
		back="NOT"
		load="false" 
		editable="true" 
		showNum="true"
		afterSaveRowsEvent="afterSaveRows"
		scrollHeight="335"  
		pageSize="15"
		showEditorAddName="editorAdd" showEditorRemoveName="editorRemove"
		>
		<t:fieldLayout id="layout" prefix="usercenter" columns="3">
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" defaultValue="${usercenter}" convert="queryUserCenterMap" width="150"/>
			<t:fieldText property="chejbm" caption="${i18n.chejbm}" dataType="text" maxLength="10" width="150"/>
			<t:fieldText property="chejmc" caption="${i18n.chejmc}" width="150"/>
		</t:fieldLayout>
		
		<t:gridCol property="usercenter" caption="${i18n.usercenter}" editor="fieldSelect" convert="queryUserCenterMap" defaultValue="${usercenter}" 
			editorOptions="{'notNull':true}"></t:gridCol>
		<t:gridCol property="chejbm" caption="${i18n.chejbm}" editor="fieldText" width="90" 
			editorOptions="{'maxLength':'3','minLength':'3','dataType':'text','notNull':true}"/>
		<t:gridCol property="chejmc" caption="${i18n.chejmc}" editor="fieldText" width="120" 
			editorOptions="{closeEvent:func_set_chejmc,'notNull':true}"/>
		<t:gridCol property="beiz" caption="${i18n.beiz}" editor="fieldText" width="140" 
			editorOptions="{closeEvent:func_set_beiz}"/>
		<t:gridCol property="" caption=""/>
	</t:grid>
	
</t:page>

<script type="text/javascript">

	//空格查询
	function grid_chej_beforeSubmit() {
		$("#usercenter_usercenter").fieldValue(trim($("#usercenter_usercenter").fieldValue()));
		$("#usercenter_chejmc").fieldValue(trim($("#usercenter_chejmc").fieldValue()));
	}
	
	var flag=true;
	//保存按钮
	function func_button_save() {
		if(flag)
		$('#grid_chej').grid('saveRows');
	}
	
	
	//用户中心名称长度为40
	function func_set_chejmc() {
		var cell = this.col.cell;
		var rowElement = cell.parent("tr:first");

		var chejmcIndex = $('td.chejmc:first').prevAll().length;
		var chejmcTemp = rowElement.find('td:eq(' + chejmcIndex + ')').text();
		
		var chejmc=trim(chejmcTemp);
		
		if (!checkCH(40, chejmc)) {
			alert("${i18n.chejmczdcd}");
			flag=false;
			return false;
		}
	}
	
	//用户中心名称长度为40
	function func_set_beiz() {
		var cell = this.col.cell;
		var rowElement = cell.parent("tr:first");

		var beizIndex = $('td.beiz:first').prevAll().length;
		var beizTemp = rowElement.find('td:eq(' + beizIndex + ')').text();
		
		var beiz=trim(beizTemp);
		
		if (!checkCH(40, beiz)) {
			alert("${i18n.beizzdcd}");
			return false;
		}
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