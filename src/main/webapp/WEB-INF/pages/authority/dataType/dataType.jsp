<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html title="0303数据权限类型管理">
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
		<script type="text/javascript">
			 function initPage(){
				getGridHeight();
		    	$('#record_dataCode').bind('focusout',function(){
					var dataCode = $("#record_dataCode").fieldValue();
					
					var dataType = $('#grid_dataType').grid('getSelectedRecords')[0];
					if(!$('#form_dataType').hasClass('operant-add')){
						if(dataType){
						  if(dataType.dataCode!=dataCode){
						  	$.sdcui.ajaxUtil.ajax({
							url:'validateOnlyDataType.ajax?value='+dataCode+'&tjName=dataCode',
							success:function(result){
								if(result.result=="1"){
									alert("该数据权限编码已经存在，请重新输入");
									$("#record_flag").fieldValue("1");
								}else{
									$("#record_flag").fieldValue("0");
								}
							}
							});
						  }
						}
					}
				});
				$('#record_dataName').bind('focusout',function(){
					var dataName = $("#record_dataName").fieldValue();
					var dataType = $('#grid_dataType').grid('getSelectedRecords')[0];
					if(!$('#form_dataType').hasClass('operant-add')){
						if(dataType){
						  if(dataType.dataName!=dataName){
						  	$.sdcui.ajaxUtil.ajax({
							url:'validateOnlyDataType.ajax?value='+encodeURI(dataName)+'&tjName=dataName',
							success:function(result){
								if(result.result=="1"){
									alert("该数据权限名称已经存在，请重新输入");
									$("#record_flag").fieldValue("2");
								}else{
									$("#record_flag").fieldValue("0");
								}
							}
							});
						  }
						}
					}
				});
				$('#record_dataParam').bind('focusout',function(){
					var dataParam = $("#record_dataParam").fieldValue(); 
					var dataType = $('#grid_dataType').grid('getSelectedRecords')[0];
					if(!$('#form_dataType').hasClass('operant-add')){
						if(dataType){
						  if(dataType.dataParam!=dataParam){
						  	$.sdcui.ajaxUtil.ajax({
							url:'validatedataParam.ajax?dataParam='+dataParam,
							success:function(result){
								if(result.result=="2"){
									alert("数据权限参数输入有误，请重新输入!");
									$("#record_dataParamflag").fieldValue("1");
								}else{
									$("#record_dataParamflag").fieldValue("0");
								}
								}
							});
						  }
						}
					}else{
						$.sdcui.ajaxUtil.ajax({
							url:'validatedataParam.ajax?dataParam='+dataParam,
							success:function(result){
								if(result.result=="2"){
									alert("数据权限参数输入有误，请重新输入!");
									$("#record_dataParamflag").fieldValue("1");
								}else{
									$("#record_dataParamflag").fieldValue("0");
								}
								}
							});
					}
				});
		    }
		    function form_dataType_beforeSubmit(){
				var flag  = "";
				var dataCode = $("#record_dataCode").fieldValue();
				var dataType = $('#grid_dataType').grid('getSelectedRecords')[0];
				if(!$('#form_dataType').hasClass('operant-add')){
					if(dataType){
					  if(dataType.dataCode!=dataCode){
					  	flag  = $('#record_flag').fieldValue();
					  }else{
					  	flag = "0";
					  }
					}
				}
				var dataName = $("#record_dataName").fieldValue();
				if(!$('#form_dataType').hasClass('operant-add')){
					if(dataType){
					  if(dataType.dataName!=dataName){
					  	flag  = $('#record_flag').fieldValue();
					  }else{
					  	flag = "0";
					  }
					}
				}
				var dataparamflag  = "";
				var dataParam = $("#record_dataParam").fieldValue(); 
				if(!$('#form_dataType').hasClass('operant-add')){
						if(dataType){
						  if(dataType.dataParam!=dataParam){
						  	dataparamflag = $('#record_dataParamflag').fieldValue();
						  }else{
						  	dataparamflag = "0";
						  }
					}
				}
				if(flag=="0"&&dataparamflag=='0'){
					return true;
				}else if(flag="1"&&dataparamflag=='0'){
					alert("该权限编码已经存在，请重新输入!");
					return false;
				}else if(flag="2"&&dataparamflag=='0'){
					alert("该权限编码已经存在，请重新输入!");
					return false;
				}else if(flag=="0"&&dataparamflag=='1'){
					alert("该数据权限参数有误,请重新输入!");
					return false;
				}else if(flag="1"&&dataparamflag=='0'){
					alert("组编码、数据权限名称、数据权限参数有误，请重新输入");
					return false
				}
				return true;
			}
		
		</script>
		<style type="text/css">
			#grid_dataType  .youi-fieldLayout table td.contral.label-col.col-0{
				    width: 100px;
			}
			#form_dataType .youi-fieldLayout table td.contral.label-col.col-0{
				width:100px;
			}
		</style>
	</head>
	<t:page>
		
		<!-- 0303数据权限类型列表 -->
		<t:grid id="grid_dataType" 
			idKeys="dataId"
			dataFormId="form_dataType"
			caption="数据权限类型列表" 
			src="queryDataType.ajax"
			editSrc="getDataType.ajax"
			removeSrc="removeDataType.ajax" showNum="true" load="false"  back="NOT">
			<t:fieldLayout>
				<t:fieldText property="dataName" caption="数据权限名称"/>
			</t:fieldLayout>
			<t:gridCol width="100" property="usercenter" caption="用户中心"/>
			<t:gridCol width="100" property="dataCode" caption="数据权限编码"/>
			<t:gridCol width="150" property="dataName" caption="数据权限名称"/>
			<t:gridCol width="400" property="dataParam" caption="数据权限参数"/>
			<t:gridCol width="200" property="dataDesc" caption="数据权限描述"/>
		</t:grid>
		
		<!-- 0303数据权限类型表单 -->
		<t:form dialog="true" id="form_dataType" caption="数据权限类型" action="saveDataType.ajax" reset="NOT" >
			<t:fieldLayout prefix="record" columns="1">
				<t:fieldHidden property="dataId" />
				<t:fieldHidden property="flag"  defaultValue="1"/>
				<t:fieldHidden property="dataParamflag"  defaultValue="1"/>
				<t:fieldSelect property="usercenter" caption="用户中心" convert="queryUserCenterMap" notNull="true"/>
				<t:fieldText property="dataCode" caption="数据权限编码" notNull="true"  expression="^[a-zA-Z]*$"  expressionMessage="数据权限编码只能为字母" minLength="3" maxLength="50"/>
				<t:fieldText property="dataName" caption="数据权限名称" notNull="true"  expression="^[\\u4e00-\\u9fa5]+$" expressionMessage="数据权限名称只能为汉字" minLength="3" maxLength="50"/>
				<t:fieldText property="dataParam" width="500" caption="数据权限参数" notNull="true" maxLength="1000" />
				<t:fieldText property="dataDesc" width="500" caption="数据权限描述" maxLength="125" />
				
				
			</t:fieldLayout>
		</t:form>
	</t:page>
</t:html>