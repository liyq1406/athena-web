<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="${i18n.jiaofmsd}">

<!-- 
	 交付码设定
	 @author denggq
	 @date 2012-4-6
 -->
 
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 65px; } </style>
</head>

<t:page i18n="i18n.ckx.xuqjs.i18n_jiaofmsd" >
	<t:grid id="grid_jiaofmsd" caption="${i18n.jiaofmsd}" 
		idKeys="usercenter,jiaofm,zhouxh,xingqxh"
		src="/xuqjs/queryJiaofmsd.ajax" 
		saveRowsSrcs="/xuqjs/saveJiaofmsd.ajax"
		load="false" 
		editable="true"
		showNum="true"
		back="NOT"
		afterSaveRowsEvent="afterSaveRows"
		 scrollHeight="275" 
		 pageSize="15"
		 showEditorAddName="editorAdd" showEditorRemoveName="editorRemove"
		>
		<t:fieldLayout id="fl_jiaofmsd" prefix="jiaofmsd" columns="4">
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" defaultValue="${usercenter}" convert="queryUserCenterMap" width="110"/>
			<t:fieldText property="zhouxh" caption="${i18n.zhouxh}" expression="^[1-5]$" expressionMessage="${i18n.zhoux_ex_mes}" width="110"/>
			<t:fieldText property="jiaofm" caption="${i18n.jiaofm}" maxLength="3" minLength="3" dataType="text" width="110"/>
			<t:fieldText property="xingqxh" caption="${i18n.xingqxh}" expression="^[1-7]$" expressionMessage="${i18n.xingqxh_ex_mes}" width="110"/>
		</t:fieldLayout>
		<t:gridCol property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap" defaultValue="${usercenter}" editor="fieldSelect" editorOptions="{'notNull':true}"/>
		<t:gridCol property="jiaofm" caption="${i18n.jiaofm}" editor="fieldText" editorOptions="{'maxLength':'3','minLength':'3','dataType':'text','notNull':true}" width="90"/>
		<t:gridCol property="zhouxh" caption="${i18n.zhouxh}" editor="fieldText" editorOptions="{'expression':'^[1-5]$','expressionMessage':'${i18n.zhoux_ex_mes}','notNull':true}"/>
		<t:gridCol property="xingqxh" caption="${i18n.xingqxh}" editor="fieldText" editorOptions="{'expression':'^[1-7]$','expressionMessage':'${i18n.xingqxh_ex_mes}','notNull':true}"/>
		<t:gridCol property="" caption=""/>
	</t:grid>
	
	<t:form id="jfcalendar" reset="NOT" submit="NOT">
		<t:fieldLayout id="calendar" prefix="calendar" columns="3">
			<t:fieldSelect property="year" caption="${i18n.xuanzn}" convert="year1" width="100" defaultValue="${currentYear}"/>
			<t:button caption="${i18n.shengcrl}" name="jfcalendar"/>
		</t:fieldLayout>
		
	</t:form>
	
</t:page>

<script type="text/javascript">

	//标识
	$.sdcui.serverConfig.convertArray['year1'] = ${year};

	//空格查询
	function grid_jiaofmsd_beforeSubmit() {
		$("#jiaofmsd_jiaofm").fieldValue(trim($("#jiaofmsd_jiaofm").fieldValue()));
	}
	
	
	//保存按钮
	function func_button_save() {
		$('#grid_jiaofmsd').grid('saveRows');
	}
	
	//行编辑保存后的方法
	function afterSaveRows(result){
		if(false == result.success){
			return false;
		}
		return true;
	}
	
	//生成交付日历
	function func_button_jfcalendar(){
		// if(confirm("确认数据已保存")){
			var year=$('#calendar_year').fieldValue();
			var usercenter = $('#jiaofmsd_usercenter').fieldValue();
			var params = [];
			params.push("usercenter="+usercenter);	//用户中心
			params.push("year="+year);		//年份
			if(null == year || "" == year){
				alert("${i18n.xuanzn}");
				return false;
			}
			$.sdcui.ajaxUtil.ajax({
				data:params.join('&'),
				url : '../xuqjs/calculateJiaofrl.ajax',
				success : function(result) {
					$('#calendar_year input:first').val("");
					return true;
				}
			});
		// }
	}
</script>

</t:html>