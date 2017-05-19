<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="${i18n.ziyhqrl}">

<!-- 
	资源获取日历
	 @author qizhongtao
	 @date 2012-4-16
 -->
 
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
</head>
	<t:page i18n="i18n.ckx.xuqjs.i18n_ziyhqrl">
		<t:grid id="grid_ziyhqrl" caption="${i18n.ziyhqrl}" idKeys="ziyhqrq" load="false" remove="NOT" back="NOT" scrollHeight="335" pageSize="15"
			src="/xuqjs/queryZiyhqrl.ajax"  editable="true" showNum="true" saveRowsSrcs="/xuqjs/saveZiyhqrl.ajax" 
			showEditorAddName="editorAdd" showEditorRemoveName="editorRemove" afterSaveRowsEvent="afterSaveRows">
			<t:fieldLayout id="fl_ziyhqrl" prefix="ziyhqrl" columns="2">
				<t:fieldCalendar property="ziyhqrq" caption="${i18n.ziyhqrq}" format="yyyy-MM-dd" width="150"/>
			</t:fieldLayout>
			<t:gridCol property="ziyhqrq" caption="${i18n.ziyhqrq}" editor="fieldCalendar" editorOptions="{'format':'yyyy-MM-dd','notNull':true}" width="100"/>
			<t:gridCol property="" caption=""/>
		</t:grid>
	</t:page>
	
<script type="text/javascript">

	
	//行编辑保存
	function func_button_save(){
// 		$('#grid_ziyhqrl').grid('reload');//刷新表格
		$('#grid_ziyhqrl').grid('saveRows');
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











