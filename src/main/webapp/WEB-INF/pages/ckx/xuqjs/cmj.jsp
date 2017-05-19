<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="${i18n.cmj}">

<!-- 
	 CMJ
	 @author denggq
	 @date 2012-3-26
 -->
 
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 95px; } </style>
</head>

<t:page i18n="i18n.ckx.xuqjs.i18n_cmj" >
	<t:grid id="grid_cmj" caption="${i18n.cmj}" 
		idKeys="usercneter,chanxck,lingjbh" 
		src="/xuqjs/queryCmj.ajax"
		load="false" 
		add="NOT" 
		edit="NOT" 
		remove="NOT" 
		back="NOT"
		pageSize="15" 
		scrollHeight="335"
		showNum="true"
		>
		 
		<t:fieldLayout id="fl_cmj" prefix="cmj" columns="4">
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" defaultValue="${usercenter}" convert="queryUserCenterMap" width="100"/>
			<t:fieldText property="chanxck" caption="${i18n.chanxck}" dataType="text" maxLength="6" minLength="3" width="100"/>
			<t:fieldText property="lingjbh" caption="${i18n.lingjbh}" dataType="text" maxLength="10" minLength="10" width="100"/>
			<t:fieldText property="gongyzq" caption="${i18n.gongyzq}" maxLength="6" expression="^[0-9]{4}(0[1-9]|1[0-2])$" expressionMessage="${i18n.gongyzq_ex_mes}" width="100"/>
		</t:fieldLayout>
		
<%-- 		<t:button caption="${i18n.jiscmj}" name="calculate"></t:button> --%>
		<t:button caption="${i18n.export}" name="download"></t:button>
		
		<t:gridCol property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap"/>
		<t:gridCol property="chanxck" caption="${i18n.chanxck}" width="120"/>
		<t:gridCol property="lingjbh" caption="${i18n.lingjbh}" />
		<t:gridCol property="gongyzq" caption="${i18n.gongyzq}" />
		<t:gridCol property="jisrq" caption="${i18n.jisrq}" width="100"/>
		<t:gridCol property="cmj" caption="${i18n.cmj}" width="100"/>
		<t:gridCol property="" caption="" />
	</t:grid>
	
</t:page>

<script type="text/javascript">


	//空格查询
	function grid_cmj_beforeSubmit() {
		var chanxck = trim($("#cmj_chanxck").fieldValue());
		var lingjbh = trim($("#cmj_lingjbh").fieldValue());
// 		if( "" == chanxck && "" == lingjbh){
// 			alert("${i18n.chaxtjzslg}");
// 			return false;
// 		}
		$("#cmj_chanxck").fieldValue(chanxck);
		$("#cmj_lingjbh").fieldValue(lingjbh);
	}
	
	
	
	//计算CMJ
	function func_button_calculate(){
		$.sdcui.ajaxUtil.ajax({
			url : "../xuqjs/calculateCmj.ajax",
			success : function(result) {
				return true;
			}
		});
	}
	
	//导出数据
	function func_button_download(){
		
		var usercenter = trim($('#cmj_usercenter').fieldValue());
		var lingjbh = trim($('#cmj_lingjbh').fieldValue());
		var chanxck = trim($('#cmj_chanxck').fieldValue());
		
		var record = {'usercenter':usercenter,'lingjbh':lingjbh,'chanxck':chanxck};
		
		$.sdcui.pageUtils.goPage({
			url : '../xuqjs/downloadCmj.do',
			record : record,
			mode : 'form',
			beforeSubmit : function(){
				return true;
			}
	   });
	}
</script>

</t:html>