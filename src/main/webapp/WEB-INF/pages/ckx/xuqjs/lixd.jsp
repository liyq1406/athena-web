<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="role" value="${role}"/>

<t:html title="lixd">

<!-- 
	  离线点
 -->
 
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 120px; } </style>
</head>

<t:page i18n="i18n.ckx.xuqjs.i18n_lixd">
	<t:grid id="grid_lixd" caption="${i18n.lixd}" idKeys="usercenter,xianh,lixd" remove="NOT" load="false" showNum="true" dataFormId="form_lixd" back="NOT"
		 src="/xuqjs/queryLixd.ajax" scrollHeight="295" pageSize="10">
		<t:fieldLayout prefix="record" columns="3">
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap" width="150"/>
			<t:fieldText property="xianh" caption="${i18n.xianh}" maxLength="5" minLength="5" width="150"/>
			<t:fieldText property="lixd" caption="${i18n.lixd}" maxLength="3" width="150"/>
			<t:fieldSelect property="leix" caption="${i18n.leix}" convert="leix" width="150"/>
			<t:fieldText property="duiyxhd" caption="${i18n.duiyxhd}" maxLength="9" minLength="9" width="150"/>
			<t:fieldSelect property="biaos" caption="${i18n.biaos}"  defaultValue="1" convert="biaos" width="150"/>
		</t:fieldLayout>
		
		<t:gridCol property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap"  width="80"></t:gridCol>
		<t:gridCol property="xianh" caption="${i18n.xianh}" width="80"></t:gridCol>
		<t:gridCol property="lixd" caption="${i18n.lixd}" width="60"></t:gridCol>
		<t:gridCol property="leix" caption="${i18n.leix}" convert="leix" width="100"></t:gridCol>
		<t:gridCol property="duiyxhd" caption="${i18n.duiyxhd}" width="100"></t:gridCol>
		<t:gridCol property="biaos" caption="${i18n.biaos}" convert="biaos"  width="60"></t:gridCol>
		<t:gridCol property="" caption=""></t:gridCol>
	</t:grid>
	
	
	<t:form id="form_lixd" caption="${i18n.lixd}" action="/xuqjs/saveLixd.ajax" idKeys="usercenter,xianh,lixd,leix" dialog="true" reset="NOT" width="600">
		<t:fieldLayout columns="2" prefix="lixd">
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap" notNull="true" width="150"/>
			<t:fieldText property="xianh" caption="${i18n.xianh}"  maxLength="5" minLength="5" notNull="true" width="150"/>
			<t:fieldText property="lixd" caption="${i18n.lixd}" maxLength="3" notNull="true" width="150"/>
			<t:fieldText property="duiyxhd" caption="${i18n.duiyxhd}" maxLength="9" minLength="9" notNull="true" width="150"/>
			<t:fieldSelect property="biaos" caption="${i18n.biaos}" convert="biaos" defaultValue="1" notNull="true" width="150"/>
		</t:fieldLayout>
	</t:form>
	
</t:page>

<script type="text/javascript">

	//标识
	$.sdcui.serverConfig.convertArray['biaos'] = {
		'1' : '${i18n.youx}',
		'0' : '${i18n.wux}'
	};	
	
	//离线点类型
	$.sdcui.serverConfig.convertArray['leix'] = {
		'1' : '${i18n.daxlxd}',
		'2' : '${i18n.fenzxlxd}'
	};	
	
	
	//修改按钮
	function func_button_edit() {
		
		$('#form_lixd').form("clear");//清除弹出窗口的数据
		
		$('#form_lixd').removeClass('operant-add');//增加的operant为1，修改的operant为2
		
		var record = $("#grid_lixd").grid("getSelectedRecords")[0];//选中的行的数据
		
		$('#form_lixd').form('fillRecord', $.extend({}, record));
		
		$("#form_lixd").form("open","${i18n.update}");
		
		
	}
</script>

</t:html>