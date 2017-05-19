 <%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="${i18n.usercenter}">

<!-- 
	 责任主体
	 @author wangyu
	 @date 2014-2-19
 -->
 
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 90px; } </style>
</head>

<t:page i18n="i18n.ckx.ck.i18n_zerzt">
	<t:grid id="grid_zerzt" caption="责任主体" 
		src="/cangk/queryZerzt.ajax"
		removeSrc="/cangk/removeZerzt.ajax"
		saveRowsSrcs="/cangk/saveZerzt.ajax"
		idKeys="usercenter,zrztdm"  
		load="false" 
		back="NOT"
		editable="true" 
		showNum="true"
		afterSaveRowsEvent="afterSaveRows"
		scrollHeight="335" 
		pageSize="5"
		showEditorAddName="editorAdd" showEditorRemoveName="editorRemove"						
		>
		<t:fieldLayout id="layout" prefix="zrzt" columns="3">
			<t:fieldSelect property="usercenter" caption="用户中心" convert="queryUserCenterMap" defaultValue="${usercenter}" width="150" />
			<t:fieldText property="zrztdm" caption="责任主体代码" maxLength="12" dataType="text" width="150"/>
			<t:fieldSelect property="zrztlx" caption="责任主体类型" convert="zrztlx" width="150"/>
		</t:fieldLayout>
		
		<t:gridCol property="usercenter" caption="用户中心" convert="queryUserCenterMap" defaultValue="${usercenter}"  editor="fieldSelect" width="100" editorOptions="{'maxLength':'3','dataType':'text','notNull':true}"/>
		<t:gridCol property="zrztdm" caption="责任主体代码"  editor="fieldText" width="100" editorOptions="{'maxLength':'12','dataType':'text','notNull':true}"/>
		<t:gridCol property="zrztmc" caption="责任主体名称" editor="fieldText" width="160" editorOptions="{'maxLength':'70'}"/>
		<t:gridCol property="zrztlx" caption="责任主体类型" convert="zrztlx" editor="fieldSelect" editorOptions="{'notNull':true}"/>
		<t:gridCol property="" caption=""/>
	</t:grid>
	
</t:page>

<script type="text/javascript">

	//标识
	$.sdcui.serverConfig.convertArray['zrztlx'] = {
		'4' : '厂内物流商',
		'3' : 'DPCA',
		'5' : 'DFPV2'
	};
	
	
	//空格查询
	function grid_zerzt_beforeSubmit() {
		$("#zrzt_usercenter").fieldValue(trim($("#zrzt_usercenter").fieldValue()));
		$("#zrzt_zrztdm").fieldValue(trim($("#zrzt_zrztdm").fieldValue()));
	}
	
	
	//保存按钮
	function func_button_save() {
		$('#grid_zerzt').grid('saveRows');
	}
	
	//用户中心名称长度为40
// 	function func_set_centername() {
// 		var cell = this.col.cell;
// 		var rowElement = cell.parent("tr:first");

// 		var centernameIndex = $('td.centername:first').prevAll().length;
// 		var centernameTemp = rowElement.find('td:eq(' + centernameIndex + ')').text();
		
// 		var centername=trim(centernameTemp);
		
// 		if(undefined != centername && null != centername){
// 			if (!checkCH(40, centername)) {				
// 				rowElement.find('td:eq(' + centernameIndex + ')')
// 				.addClass("editing edited validate-error")
// 				.attr("title", "${i18n.zuidcd}");
// 				return false;
// 			}
// 		}
// 	}
	
	//行编辑保存后的方法
	function afterSaveRows(result){
		if(false == result.success){
			return false;
		}
		return true;
	}
</script>

</t:html>