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
<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 90px; } </style>
</head>

<t:page i18n="i18n.i18n_common">
	<t:grid id="grid_xianbkc" caption="${i18n.xianbkc }" 
		src="/xuqjs/queryXianbkc.ajax"	
		removeSrc="/xuqjs/removeXianbkc.ajax"	
		saveRowsSrcs="/xuqjs/saveXianbkc.ajax"
		idKeys="usercenter,lingjbh,mudd"  
		load="false" 
		back="NOT"			
		editable="true" 
		showNum="true"
		afterSaveRowsEvent="afterSaveRows"
		scrollHeight="335" 
		pageSize="10"
		showEditorAddName="editorAdd" showEditorRemoveName="editorRemove"						
		>
		<t:fieldLayout id="layout" prefix="xianbkc" columns="4">
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" defaultValue="${usercenter}" convert="queryUserCenterMap" width="150"/>
			<t:fieldText property="lingjbh" caption="${i18n.lingjbh}" maxLength="20" width="150"/>
			<t:fieldText property="chanx" caption="${i18n.shengcxbh}" maxLength="20"  width="100"/>
			<t:fieldText property="mudd" caption="${i18n.mudd}" maxLength="20" width="100"/>
		</t:fieldLayout>
		
		<t:gridCol property="usercenter" caption="${i18n.usercenter}"  width="100" editorOptions="{'maxLength':'3','dataType':'text','notNull':true}"/>
		<t:gridCol property="lingjbh" caption="${i18n.lingjbh}" width="160" editorOptions="{'maxLength':'10','notNull':true}"/>
		<t:gridCol property="chanx" caption="${i18n.shengcxbh}" editorOptions="{'maxLength':'5'}" width="100"/>
		<t:gridCol property="mudd" caption="${i18n.mudd }"  editorOptions="{'maxLength':'9','notNull':true}" width="100"/>
		<t:gridCol property="leix" caption="${i18n.leix}" convert="leix"  editorOptions="{'maxLength':'3','dataType':'text','notNull':true}" width="100"/>
		<t:gridCol property="yingy" caption="${i18n.yingy}" editor="fieldText"  width="100" editorOptions="{'expression':'^[1-9]+[0-9]*\.[0-9]+$|^0\.[0-9]+$|^[1-9]+[0-9]*$|^0$','expressionMessage':'${i18n.formatyingy}','notNull':true}"/>
		<t:gridCol property="danw" caption="${i18n.danw}" width="100"/>
		<t:gridCol property="editor" caption="${i18n.editor}" width="100"/>
		<t:gridCol property="edit_time" caption="${i18n.edit_time}" width="100"/>
	</t:grid>
	
</t:page>

<script type="text/javascript">
    $(function(){
    	$("#editorAdd").hide();
    	$("#editorRemove").hide();
    })
	//标识位
	$.sdcui.serverConfig.convertArray['usercenter'] = {
		'UL' : 'UL',
		'UW' : 'UW',	
		'VD' : 'VD'
	};

	//类型
	$.sdcui.serverConfig.convertArray['leix'] = {
		'1' : '${i18n.cangk}',
		'2' : '${i18n.xiaohd}'
	};
	
	//空格查询
	function grid_xianbkc_beforeSubmit() {
		$("#xianbkc_usercenter").fieldValue(trim($("#xianbkc_usercenter").fieldValue()));
		$("#xianbkc_shengcxbh").fieldValue(trim($("#xianbkc_shengcxbh").fieldValue()));
		$("#xianbkc_lingjbh").fieldValue(trim($("#xianbkc_lingjbh").fieldValue()));
		$("#xianbkc_mudd").fieldValue(trim($("#xianbkc_mudd").fieldValue()));
	}
	
	var allRecords=null;
	
	//保存按钮
	function func_button_save() {	
	    allRecords = $("#grid_xianbkc").grid("getRecords");	     
		$('#grid_xianbkc').grid('saveRows');		
	}
			
	//行编辑保存后的方法
	function afterSaveRows(result){	
		if(false == result.success){	
			return false;
		}
		$('#grid_xianbkc').grid('parseRecords', allRecords);
		return true;
	}
</script>

</t:html>