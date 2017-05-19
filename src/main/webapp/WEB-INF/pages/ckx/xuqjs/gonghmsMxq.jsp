<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="${i18n.gonghmsMxq}">

<!-- 
	供货模式-毛需求
	 @author qizhongtao
	 @date 2012-4-09
 -->
 
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 65px; } </style>
</head>
	<t:page i18n="i18n.ckx.xuqjs.i18n_gonghmsMxq">
		<t:grid id="grid_gonghmsMxq" caption="${i18n.gonghmsMxq}" load="false" remove="NOT" idKeys="gonghms,xuqly,dinghlx"  scrollHeight="335" pageSize="15"
			src="/xuqjs/queryGonghmsMxq.ajax"  editable="true" showNum="true" saveRowsSrcs="/xuqjs/saveGonghmsMxq.ajax"  
			showEditorAddName="editorAdd" showEditorRemoveName="editorRemove" afterSaveRowsEvent="afterSaveRows">
			<t:fieldLayout id="fl_gonghmsMxq" prefix="gonghmsMxq" columns="2">
				<t:fieldSelect property="gonghms" caption="${i18n.gonghms}" convert="queryGonghms" width="150"/>
				<t:fieldSelect property="xuqly" caption="${i18n.xuqly}" convert="queryXuqly" width="150"/>
			</t:fieldLayout>
			<t:gridCol property="gonghms"   caption="${i18n.gonghms}" editor="fieldSelect"  convert="queryGonghms" 
				editorOptions="{'notNull':true}"></t:gridCol>
			<t:gridCol property="xuqly"   caption="${i18n.xuqly}" editor="fieldSelect" convert="queryXuqly" 
				editorOptions="{'notNull':true}"  width="160"></t:gridCol>
			<t:gridCol property="dinghlx"  caption="${i18n.dinghlx}" editor="fieldSelect" convert="queryDinghlx" 
				editorOptions="{'notNull':true}" width="100"></t:gridCol>
			<t:gridCol property="" caption="" />
		</t:grid>
	</t:page>
	
<script type="text/javascript">

	
	
	//行编辑保存
	function func_button_save(){
		var rows = $('#grid_gonghmsMxq').grid('saveRows');
// 		$('#grid_gonghmsMxq').grid('reload',rows);//刷新表格
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











