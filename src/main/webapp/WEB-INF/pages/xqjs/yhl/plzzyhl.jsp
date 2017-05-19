<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html>
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
		<script type="text/javascript">
		 $(function(){ 

	           $('body div.layout-panel.panel-north').remove();
	
	           $('body td.td-west').remove();
	
	           $('body div.layout-panel.panel-south').remove(); 
	       });
		</script>
	</head>
	<t:page  i18n="i18n.xqjs.kanbyhl.kanbjs" >
	<t:grid id="grid_plzzyhl" caption="批量终止要货令" showNum="true" idKeys="lingjbh,usercenter,yaohlh,creator"
	src="/yhl/queryPlzzyhl.ajax" add="NOT" edit="NOT"  remove="NOT" scrollHeight="450" pageSize="20">
	<t:fieldLayout prefix="gridLayout" columns="4">
	   <t:fieldSelect property="usercenter" width="75" notNull="true" convert="queryUserCenterMap" defaultValue="${usercenter}" caption="${i18n.usercenter}" ></t:fieldSelect>
		<t:fieldText property="lingjbh" width="100" caption="${i18n.lingjbh}" maxLength="10"></t:fieldText>
		<t:fieldText property="yaohlh" width="100" caption="${i18n.yhlh}" maxLength="12"></t:fieldText>
		<t:fieldSelect property="zhuangt" width="75" convert="zhuangt" defaultValue="0" caption="${i18n.zhuangt}"></t:fieldSelect>
	</t:fieldLayout> 
	<t:gridCol property="usercenter" convert="queryUserCenterMap" width="75" caption="${i18n.usercenter}"></t:gridCol>
	<t:gridCol property="lingjbh" width="150" caption="${i18n.lingjbh}"></t:gridCol>
	<t:gridCol property="yaohlh"  width="150" caption="${i18n.yhlh}"></t:gridCol>
	<t:gridCol property="zhuangt"  convert="zhuangt" caption="${i18n.zhuangt}"></t:gridCol>
	</t:grid>
	<t:buttons id="button_forms">
		<t:button caption="批量终止要货令" name="shenh"></t:button>   
	</t:buttons>
	</t:page>
	<script type="text/javascript"> 
	$.sdcui.serverConfig.convertArray['zhuangt']={'0':'导入','1':'终止失败','2':'已终止'};
	function func_button_shenh(){
	$('#button_shenh').addClass('disabled');
	$.sdcui.ajaxUtil.ajax({
            url:"../yhl/pizzyhl.ajax",  //请求url
           	success:function (result){
           		alert(result.result);
            }
    	});
	
	}
	</script>
	<style type="text/css">
	</style>
</t:html>