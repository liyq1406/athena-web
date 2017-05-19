<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="SAP产线-下线结算零件">


 
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 90px; } </style>
</head>

<t:page i18n="">
	<t:grid id="grid_sapxxjs" 
		caption="SAP产线-下线结算零件" 
		src="/xuqjs/querySapxxjs.ajax"
		idKeys="usercenter,lingjbh,chanx"  
		load="false" 
		back="NOT"
		showNum="true"
		removeSrc="/xuqjs/deleteSapxxjs.ajax"
		dataFormId="form_sapxxjs"
		editSrc="/xuqjs/selectSapxxjs.ajax" 
		scrollHeight="300" 
		pageSize="15"				
		>
		<t:fieldLayout id="sapxxjs" prefix="layout" columns="3">
			<t:fieldSelect property="usercenter" caption="用户中心" defaultValue="${loginUsercenter}" convert="queryUserCenterMap"  width="150"/>
			<t:fieldText property="chanx" caption="产线" width="150" dataType="text" maxLength="5"/>
<%--			<t:fieldSelect property="shifzc" caption="是否总成" convert="shifzc" defaultValue="N" width="150"/> --%>
			<t:fieldText property="lingjbh" caption="零件编号" width="150" dataType="text" maxLength="10"/>
<%--			<t:fieldText property="zongch" caption="总成零件号" width="150" dataType="text" maxLength="10"/> --%>
		</t:fieldLayout>
		
		<t:gridCol property="usercenter" caption="用户中心" convert="queryUserCenterMap" defaultValue="${usercenter}"/>
		<t:gridCol property="chanx" caption="产线"/>
		<t:gridCol property="lingjbh" caption="零件编号"/>
<%--		<t:gridCol property="shifzc" caption="是否总成"/> --%>
<%--		<t:gridCol property="zongch" caption="总成零件号"/> --%>
		<t:gridCol property="creator" caption="创建人"/>
		<t:gridCol property="create_time" caption="创建时间"/>
		<t:gridCol property="editor" caption="编辑人"/>
		<t:gridCol property="edit_time" caption="编辑时间"/>
	</t:grid>
		<t:form dialog="true" caption="SAP产线-下线结算零件" idKeys="usercenter,lingjbh,chanx"  id="form_sapxxjs" action="/xuqjs/saveSapxxjs.ajax" width="720"  reset="NOT">
		<t:fieldLayout prefix="layout1" columns="2">		  
			<t:fieldSelect property="usercenter" caption="用户中心" notNull="true" width="120" defaultValue="${loginUsercenter}" convert="queryUserCenterMap"/>							
			<t:fieldText property="chanx" caption="产线" notNull="true"  width="120" maxLength="5" minLength="5"/>
			<t:fieldText property="lingjbh" caption="零件编号"  notNull="true"  width="120" maxLength="10" minLength="10"/>
<%--			<t:fieldSelect property="shifzc" caption="是否总成" notNull="true" convert="shifzc" defaultValue="N" width="120"/> --%>
<%--			<t:fieldText property="zongch" caption="总成零件号" width="120" maxLength="10"/> --%>	
		</t:fieldLayout>
	</t:form>
</t:page>



<script type="text/javascript">
    //0013490 删除页面中的是否总成和总成零件号
	/* //是否总成
	$.sdcui.serverConfig.convertArray['shifzc'] = {
		'Y' : 'Y',
		'N' : 'N'
	};
	
	function tes(){
		var currentRole = "${role}"; 
			var shifzc = $('#layout1_shifzc').fieldValue();
			var td = $("label#fieldText-record_zongch").parent("td:first");
			
			//是否总成为N 的时候  不能设置定置库位
			if ("N"==shifzc) {
				$(td).removeClass("notNull");
				$('#layout1_zongch').fieldValue("");
				$('#layout1_zongch').addClass("disabled").find(".textInput").attr("readonly","true");
				$('#layout1_zongch').addClass("disabled").addClass('readonly');
			}
			//是否总成为Y 的时候  必须设置定置库位
			if("Y"==shifzc){
				 $(td).addClass("notNull");
		        $('#layout1_zongch').removeClass("disabled").removeClass('readonly');
				$('#layout1_zongch').removeClass("disabled").find(".textInput").removeAttr("readonly","false");
		        
		      }
	}
	
		$(function() {
		$('#field-pop-layout1_shifzc').attr('onclick','tes()');
		tes();
		})
		function form_sapxxjs_beforeSubmit(){
			if($("#layout1_zongch").fieldValue()=="" &&  $('#layout1_shifzc').fieldValue()=="Y"){
			        	$('#layout1_zongch').attr("class","youi-field fieldText validate-error");
						alert("【总成零件号】不能为空");
						return false;
			  		}	
			  		return  true;
		} */
</script>

</t:html>