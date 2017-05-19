<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="${i18n.anxyhltongjbb}">
<!-- huxy_V4_041 -->
<head>
	<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
	<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 100px; } </style>
</head>
<t:page i18n="i18n.ckx.cangk.i18n_yhlbb" >
	<t:grid id="grid_yaohlbb" caption="${i18n.anxyhltongjbb}" idKeys="gongc,tongjrq" load="false" 
		back="NOT"
		src="/baob/queryAnxyhlbb.ajax" 
		showNum="true"  showCheckbox="false"
		pageSize="10" scrollHeight="300" afterSaveRowsEvent="afterSaveRows" >
		<t:fieldLayout id="form_select" prefix="baob" columns="3">
			<t:fieldLabel property="usercenter" caption="${i18n.usercenter}" defaultValue="${usercenter}" width="140" />
			<t:fieldSelect property="gongc" caption="${i18n.gongc}" src="/baob/queryGongc.ajax"
			 show="VALUE" code="KEY" width="150" />
 			<t:fieldSelect property="flag" caption="${i18n.baoblx}" convert="bb"
 				show="VALUE" code="KEY"  width="150" />
			<t:fieldCalendar property="tongjrq" caption="${i18n.tongjrq}" width="150" format="yyyy-MM-dd" ></t:fieldCalendar>
		</t:fieldLayout>
		<t:gridCol property="factory" caption="${i18n.gongc}"  width="120" />
		<t:gridCol property="yaohllx" caption="${i18n.lxOrgongc}" width="150"/>
		<t:gridCol property="tongjrq" caption="${i18n.tongjrq}"  width="150" />
		<t:gridCol property="shul" caption="${i18n.shul}" width="120" />
		<t:gridCol property="jihgcsl" caption="${i18n.jihgcsl}" width="120" />
		<t:gridCol property="flag" caption="${i18n.tongjlx}" convert="bb" width="200"/>
		<t:gridCol property="editor" caption="${i18n.editor}" width="120" />
		<t:gridCol property="edit_time" caption="${i18n.edit_time}" width="200"/>
		<t:gridCol property="" caption="" width="15"></t:gridCol>
		<t:button caption="生成报表" name="baob" active="0"></t:button>
	</t:grid>
		<input id="serachKey" name="serachKey" type="Hidden"></input>
			<form id="putform" method="post" name="putform" accept-charset="UTF-8" target="_blank">
	 		   <input id="putvalue" name="putvalue" type="hidden"></input>
			</form> 
</t:page>


<script type="text/javascript">
	$.sdcui.serverConfig.convertArray['bb']={
		'0' : '外部要货令数量报表',
		'1' : '紧急开班外部要货令数量报表',
		'2' : '过点数量报表'
	};
	$.sdcui.serverConfig.convertArray['fac']={}; 
	<c:forEach items="${fac}" var="item">
	$.sdcui.serverConfig.convertArray['fac']['${item.KEY}'] = '${item.VALUE}';
	</c:forEach>
	
	function grid_yaohlbb_beforeSubmit()
	{
		if($('#baob_gongc').fieldValue()== "")
		{
			alert('必须选择一个工厂');
			return false;
		}
		return true;
	}
	
	function button_baob_beforeSubmit()
	{
		if($('#baob_gongc').fieldValue()== "")
		{
			alert('必须选择一个工厂');
			return false;
		}
		return true;
	}
	function func_button_baob()
	{
	   var c = encodeURI($('#baob_gongc').fieldValue());
	   var strWindowType = "top=0,left=0,toolbar=no,location=no,directories=no,menubar=no,scrollbars=yes,resizable=yes,status=yes,fullscreen=yes";
	   $('#putvalue').val(c);
	   var obj = window ;
	   obj.value = c;
	   window.open("${ctx}/baob/showbb.do?"+"gongc="+c,"cc",strWindowType);
	}
	</script>
</t:html>