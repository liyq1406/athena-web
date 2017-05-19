<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="${i18n.jiaofrl}">

<!-- 
	 交付日历
	 @author denggq
	 @date 2012-4-6
 -->
 
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 65px; } </style>
</head>

<t:page i18n="i18n.ckx.xuqjs.i18n_jiaofrl" >
	<t:grid id="grid_jiaofrl" caption="${i18n.jiaofrl}" 
		idKeys="usercneter,jiaofm,ri"
		src="/xuqjs/queryJiaofrl.ajax" 
		saveRowsSrcs="/xuqjs/saveJiaofrl.ajax"
		load="false" 
		showNum="true"
		add="NOT"
		edit="NOT"
		remove="NOT"
		back="NOT"
		scrollHeight="360" 
		pageSize="15"
		>
		<t:fieldLayout id="fl_jiaofrl" prefix="jiaofrl" columns="3">
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" defaultValue="${usercenter}" convert="queryUserCenterMap" width="150"/>
			<t:fieldText property="jiaofm" caption="${i18n.jiaofm}" maxLength="3" minLength="3" dataType="text" width="150"/>
			<t:fieldCalendar property="ri" caption="${i18n.ri}" format="yyyy-MM-dd"  width="150"/>
		</t:fieldLayout>
		<t:gridCol property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap" defaultValue="${usercenter}" editor="fieldSelect" editorOptions="{'notNull':true}"/>
		<t:gridCol property="jiaofm" caption="${i18n.jiaofm}"/>
		<t:gridCol property="ri" caption="${i18n.ri}" width="100"/>
		<t:gridCol property="nianzq" caption="${i18n.nianzq}" width="100"/>
		<t:gridCol property="zhoux" caption="${i18n.zhoux}" width="100"/>
		<t:gridCol property="" caption=""/>
	</t:grid>
	
</t:page>

<script type="text/javascript">

	//空格查询
	function grid_jiaofrl_beforeSubmit() {
		var ri = trim($("#jiaofrl_ri").fieldValue());
		var jiaofm = trim($("#jiaofrl_jiaofm").fieldValue());
		if("" == ri && "" == jiaofm){
			alert("${i18n.chaxtjzslg}");
			return false;
		}
		$("#jiaofrl_jiaofm").fieldValue(trim($("#jiaofrl_jiaofm").fieldValue()));
	}
	
	
</script>

</t:html>