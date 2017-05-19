<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="${i18n.plcjlsk}">
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<script type="text/javascript">
//V4_023
</script>
</head>
<t:page i18n="i18n.xqjs.kbyhl">
	<t:grid id="lsk" caption="${i18n.search_condition}" showNum="true" editAlias="kb" 
		src="/yhl/searchPlcjlsk.ajax" 
		removeSrc="/yhl/deletelsk.ajax"
		add="NOT" edit="NOT" remove="删除" load="false"
		reset="NOT"
		idKeys="usercenter,liush" scrollHeight="230">
		<t:fieldLayout id="kbxhgm" prefix="layout" columns="3">
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap" notNull="true" width="100"></t:fieldSelect>
			<t:fieldText property="xunhbm" maxLength="8" minLength="8" caption="${i18n.xhbm}"  width="150"></t:fieldText>
			<t:fieldSelect property="biaos" caption="${i18n.clzt}"  width="150" convert="clzt"></t:fieldSelect>
			<t:fieldCalendar property="createTimefrom" caption="导入日期从"  width="220" format="yyyy-MM-dd HH:mm:ss"></t:fieldCalendar>
			<t:fieldCalendar property="createTimeto" caption="导入日期至"  width="220" format="yyyy-MM-dd HH:mm:ss"></t:fieldCalendar>
		</t:fieldLayout>
		<t:gridCol property="usercenter" width="70" caption="${i18n.usercenter}"></t:gridCol>
		<t:gridCol property="xunhbm" width="100" caption="${i18n.xhbm}"></t:gridCol>
		<t:gridCol property="yaohsl" width="100" caption="${i18n.yaohsl}"></t:gridCol>
		<t:gridCol property="gongysdm" width="120" caption="${i18n.gongysdm}"></t:gridCol>
		<t:gridCol property="shiffsgys" width="120" caption="${i18n.shiffsgys}"></t:gridCol>
		<t:gridCol property="zuiwjfsj" width="150" caption="${i18n.zuiwjfsj}"></t:gridCol>
		<t:gridCol property="biaos" width="70" caption="${i18n.clzt}" convert="clzt"></t:gridCol>
		<t:gridCol property="creator" width="100" caption="${i18n.creator}"></t:gridCol>		
		<t:gridCol property="create_time" width="150" caption="${i18n.create_time}"></t:gridCol>
		<t:gridCol property="shibyy" width="500" caption="${i18n.shibyy}"></t:gridCol>
		<t:gridCol property="liush" caption="${i18n.liush}"></t:gridCol>
		
	</t:grid>
	
	<t:buttons id="btn">
		<t:button caption="批量创建模板下载"    name="mobxz"></t:button>
		<t:button caption="批量创建看板临时卡"  name="cjlsk"></t:button>
	</t:buttons>
	
	<t:file action="/yhl/importAth_pilcklsk.do" size="50">
			<t:fileparam sheet="pilcjlsk" keys="" table="{dbSchemal3}ck_pilcjlsk" dateColumns="ZUIWJFSJ" dateFormats="yyyy-MM-dd HH24:mm:ss" clazz="null" datasourceId="1"/>
	</t:file>
	<div><font color="red">导入结果不能大于100条</font></div>
		
</t:page>
<script type="text/javascript">
	//下载模板
	function func_button_mobxz()
	{
		$.sdcui.pageUtils.goPage({
				url : '/yhl/downloadPlcjlsk.do',
				mode : 'form',
				beforeSubmit : function(){
					return true;
				}
		   });
		}
   //创建临时卡
   function func_button_cjlsk()
   {
  		var param = [];
   	  	$.sdcui.ajaxUtil.ajax({
			url : "${ctx}/yhl/doCreatelsk.ajax",
			data : param.join('&'),
			success : function(result) {
				$("#lsk").grid('reload');
			}
		});
   }

	$.sdcui.serverConfig.convertArray['clzt'] = {
		'0' : '创建',
		'1' : '处理中',
		'2' : '处理成功',
		'3' : '处理失败'
	};
	$("#button_submit_upload").find("a").html("批量创建临时卡导入");  
	//huxy_13159 WTC调用2次
	$(function(){
		//模板下载按钮
		//$('#button_mobxz').click(func_button_mobxz);
		//批量创建看板临时卡按钮
		//$('#button_cjlsk').click(func_button_cjlsk);
	   });
	


</script>
<style type="text/css">
#kbxhgm td.contral.label-col.col-6 {
	width: 80px;
}

#kbxhgm td.contral.label-col.col-0 {
	width: 60px;
}

#kbxhgm td.contral.label-col.col-2 {
	width: 60px;
}

#kbxhgm td.contral.label-col.col-4 {
	width: 60px;
}
#btn div.youi-button.active-0 {
	padding-right: 20px;
}
</style>
</t:html>
