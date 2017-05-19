<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="${i18n.xiaohcyssk}">

<!-- 
	  小火车运输时刻表
	 @author denggq
	 @date 2012-4-12
 -->
 
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 75px; } </style>
</head>

<t:page i18n="i18n.ckx.xuqjs.i18n_xiaohcyssk">
	<t:grid id="grid_xiaohcyssk" caption="${i18n.xiaohcyssk}" idKeys="usercenter,shengcxbh,xiaohcbh,riq,tangc" editable="true"  back="NOT" scrollHeight="335" pageSize="15"
		src="/xiaohc/queryXiaohcyssk.ajax" load="false" saveRowsSrcs="/xiaohc/saveXiaohcyssk.ajax" showNum="true" afterSaveRowsEvent="afterSaveRows"
		showEditorAddName="editorAdd" showEditorRemoveName="editorRemove" showEditorAdd="NOT" showEditorRemove="NOT">
		<t:fieldLayout id="layout1" prefix="xiaohcyssk" columns="4">
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" defaultValue="${usercenter}" convert="queryUserCenterMap" width="110"/>
			<t:fieldText property="shengcxbh" caption="${i18n.shengcxbh}" dataType="text" maxLength="5" minLength="5" width="110"/>
			<t:fieldText property="xiaohcbh" caption="${i18n.xiaohcbh}" dataType="text" maxLength="5" width="110"/>
			<t:fieldCalendar property="riq" caption="${i18n.riq}" format="yyyy-MM-dd" width="110"/>
		</t:fieldLayout>
		
<%-- 		<t:button caption="生成小火车运输时刻表" name="xiaohcyxsk"></t:button> --%>
		
		<t:gridCol editable="${edit_usercenter}"  property="usercenter" caption="${i18n.usercenter}" editor="fieldSelect" convert="queryUserCenterMap" defaultValue="${usercenter}" editorOptions="{'notNull':true}"></t:gridCol>
		<t:gridCol editable="${edit_shengcxbh}" property="shengcxbh" caption="${i18n.shengcxbh}" editor="fieldText" width="90" editorOptions="{'maxLength':'5','minLength':'5','dataType':'text','notNull':true}"></t:gridCol>
		<t:gridCol editable="${edit_xiaohcbh}" property="xiaohcbh" caption="${i18n.xiaohcbh}" editor="fieldText" width="90" editorOptions="{'maxLength':'5','dataType':'text','notNull':true}"></t:gridCol>
		<t:gridCol editable="${edit_riq}" property="riq" caption="${i18n.riq}" editor="fieldCalendar" editorOptions="{'format':'yyyy-MM-dd'}" width="90"></t:gridCol>
		<t:gridCol editable="${edit_tangc}" property="tangc" caption="${i18n.tangc}" editor="fieldText" width="70" editorOptions="{'expression':'^[1-9][0-9]{0,1}$','expressionMessage':'${i18n.tangc_ex_mes }'}"></t:gridCol>
		<t:gridCol editable="${edit_kaisbhsj}" property="kaisbhsj" caption="${i18n.kaisbhsj}" editor="fieldCalendar" width="150" editorOptions="{'format':'yyyy-MM-dd HH:mm:ss'}"></t:gridCol>
		<t:gridCol editable="${edit_chufsxsj}" property="chufsxsj" caption="${i18n.chufsxsj}" editor="fieldCalendar" width="150" editorOptions="{'format':'yyyy-MM-dd HH:mm:ss'}"></t:gridCol>
		<t:gridCol property="" caption="" width="5"/>
	</t:grid>
				
</t:page>

<script type="text/javascript">


	//空格查询
	function grid_xiaohcyssk_beforeSubmit() {
		$("#xiaohcyssk_xiaohcbh").fieldValue(trim($("#xiaohcyssk_xiaohcbh").fieldValue()));
		$("#xiaohcyssk_shengcxbh").fieldValue(trim($("#xiaohcyssk_shengcxbh").fieldValue()));
	}

	function func_button_save(){
		$('#grid_xiaohcyssk').grid('saveRows');
	}
	
	//行编辑保存后的方法
	function afterSaveRows(result){
		if(false == result.success){
			return false;
		}
		return true;
	}
	
	//生成小火车运输时刻表
	function func_button_xiaohcyxsk(){
		$.sdcui.ajaxUtil.ajax({
			url : "../xiaohc/calculateXiaohcyssk.ajax",
			success : function(result) {
				return true;
			}
		});
	}
</script>

</t:html>