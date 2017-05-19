<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="${i18n.queryTitle}">
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
</head>

<t:page i18n="i18n.xqjs.kdorder">

	<t:form id="kdorder_query" reset="NOT" submit="NOT">
		<t:grid id="grid_kdorder" idKeys="dingdh,id,editor,edit_time" usePager="false"
			caption="${i18n.queryTitle}" showNum="true" selectRowEvent="xqjsRowSelect" multiple="true" back="true"
			editAlias="DingdUpdate" src="/kdorder/queryOrderLine.ajax" add="NOT"
			remove="NOT" edit="NOT" load="true" submit="NOT" reset="NOT"  scrollHeight="483">
			<t:fieldLayout prefix="kd">
				<t:fieldHidden property="dingdh"></t:fieldHidden>
				<t:fieldHidden property="lingjbh"></t:fieldHidden>
				<t:fieldHidden property="gongysdm"></t:fieldHidden>
				<t:fieldHidden property="usercenter"></t:fieldHidden>
				<t:fieldHidden property="dingdzt"></t:fieldHidden>
				<t:fieldHidden property="ids"></t:fieldHidden>
			</t:fieldLayout>
			<t:gridCol property="checkBox" width="40" caption="${i18n.xuanz}" renderer="createCheckBox" />
			<t:gridCol property="dingdh" type="text" caption="${i18n.dingdh}" width="100"></t:gridCol>
			<t:gridCol property="lingjbh" type="text" caption="${i18n.lingjbh}" width="100"></t:gridCol>
			<t:gridCol property="fahzq" type="text" caption="${i18n.fayzq}" width="90"></t:gridCol>
			<t:gridCol property="faykssj" type="text" caption="${i18n.yaohqsrq}"  editor="fieldCalendar" editorOptions="{'format':'yyyy-MM-dd','notNull':true}" width="90"></t:gridCol>
			<t:gridCol property="fayjssj" type="text" caption="${i18n.yaohjsrq}"  editor="fieldCalendar" editorOptions="{'format':'yyyy-MM-dd','notNull':true}" width="100"></t:gridCol>
			<t:gridCol editor="fieldText" property="shul" type="text"
				caption="${i18n.shul}"
				editorOptions="{'notNull':true,'expression':'^[0-9]{1,7}(?:\\.[0-9]{1,3})?$|^0\\.[0-9]{1,3}$','expressionMessage':'${i18n.numbermessage}'}" width="100"></t:gridCol>
			<t:gridCol property="baozsl" type="text" caption="${i18n.baozsl}"  renderer="showBaozsl" width="100"></t:gridCol>
			<t:gridCol property="uabzucsl" type="text" caption="${i18n.uabzucsl}" width="100"></t:gridCol>
			<t:gridCol property="uabzucrl" type="text" caption="${i18n.uabzucrl}" width="120"></t:gridCol>
		</t:grid>
	</t:form>

	<t:fieldLayout>
		<div class="but">
			<t:buttons id="update">
				<t:button name="update" caption="${i18n.update}"></t:button>
			</t:buttons>
		</div>	
	</t:fieldLayout>
</t:page>

<script type="text/javascript">
$(function(){ 


	           $('body div.layout-panel.panel-north').remove();
	
	           $('body td.td-west').remove();
	
	           $('body div.layout-panel.panel-south').remove(); 
	           
	          
	       });
		$.sdcui.serverConfig.convertArray['dingdzt'] = {'0':'${i18n.dingyizt}','1':'${i18n.zhizuozt}','2':'${i18n.shengxiaozt}','3':'${i18n.fasongzt}'};
		$.sdcui.serverConfig.convertArray['dingdlx']={'0':'${i18n.kdlx}','1':'${i18n.teslx}','2':'${i18n.aixlx}'};
		function createCheckBox(){
			return "<input  name='choices'  type='CheckBox' value='0'/>";
		}
		
		function func_button_update(){
			//alert(ids);
			
			 var param = $("#grid_kdorder").grid("getSelectedRecords");
			 if(param.length==0){
			    alert("${i18n.xuanzts}");
			    return false;
			 }
			 var dingdzt = $("#kd_dingdzt").fieldValue();
			 if (dingdzt != '1'&&dingdzt != '3') {
					alert("${i18n.dingdztts}");
					return;
				}
			var error=$('#grid_kdorder').find('td.validate-error');
			var errorMessage = [];
			if(error!=null&&error.length!=0){
				errorMessage.push($(error[0]).attr('title'));
				$.sdcui.messageUtil.showError(errorMessage.join('\n'));
			return ;
			}
			 var params = [];
			 for(var i=0,len=param.length;i<len;i++){
			     params.push('update['+i+'].id='+param[i].id);
			     params.push('update['+i+'].dingdh='+param[i].dingdh);
			     params.push('update['+i+'].lingjbh='+param[i].lingjbh);
			     params.push('update['+i+'].shul='+param[i].shul);
			     params.push('update['+i+'].fahzq='+param[i].fahzq);
			     params.push('update['+i+'].editor='+param[i].editor);
			     params.push('update['+i+'].faykssj='+param[i].faykssj);
			     params.push('update['+i+'].fayjssj='+param[i].fayjssj);
			     params.push('update['+i+'].edit_time='+param[i].edit_time);
			 }
			 params.push('dingdzt='+dingdzt);
			 $.sdcui.ajaxUtil.ajax({
				url : "${ctx}/kdorder/upDateDingdmx.ajax",
				data : params.join('&'),
				success : function(result) {
					alert(result.flag);
					$('#grid_kdorder').grid('reload');
				}
			});
			var allRecords = $("#grid_kdorder").grid("getRecords");
			var ljparams = [];
			for(var i=0;i<allRecords.length;i++){
			     for(var j=i+1;j<allRecords.length;j++){
				     var shulI = allRecords[i].shul;
				     var fahzqI = allRecords[i].fahzq;
				     var shulJ = allRecords[j].shul;
				     var fahzqJ = allRecords[j].fahzq;
				     if(fahzqI===fahzqJ){
				         var shul=parseInt(shulI)+parseInt(shulJ);
					     allRecords[i].shul=shul.toString();
					     allRecords.splice(j,1);
					     j--;
				     }
			     }
				    
			 }
			 
			 for(var i=0,len=allRecords.length;i<len;i++){
	             ljparams.push('update['+i+'].id='+$("#kd_ids").fieldValue());
		         ljparams.push('update['+i+'].lingjbh='+allRecords[i].lingjbh);
		         ljparams.push('update['+i+'].gongysdm='+$("#kd_gongysdm").fieldValue());
		         ljparams.push('update['+i+'].usercenter='+$("#kd_usercenter").fieldValue());
			     ljparams.push('update['+i+'].p0sl='+allRecords[i].shul);
			     ljparams.push('update['+i+'].fayzq='+allRecords[i].fahzq);
			     			    
			 }
			 
		
		// xss - 2016.6.29 0011856-0011996	 
		//	 $.sdcui.ajaxUtil.ajax({
		//		url : "${ctx}/kdorder/doUpdateDingdlj.ajax",
		//		data : ljparams.join('&'),
		//		success : function(result) {
		//			//alert(result.flag);
		//		}
		//	});
			 
		}
		
		function showBaozsl(col, value, rowIndex, colIndex) {
		var obj = this;
		var uabzrl = value["uabzucrl"];
		var baozsl = value["uabzucsl"];
		var showValue;
		showValue = uabzrl*baozsl;
		return "" + showValue;
	}
	</script>


<style type="text/css">
.but {
	width: 100px;
	float: left;
	text-align: center;
	margin: 0 0 0 5px;
}
</style>
</t:html>