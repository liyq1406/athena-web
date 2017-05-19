<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html title="0303数据权限类型管理">
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
		<script type="text/javascript">
			function func_button_tijiao(){
				getGridHeight();
				var ckDataParam = $("#record_dataSQLParam").fieldValue(); 
				var ckDataType = $('#grid_ckDataType').grid('getSelectedRecords')[0];
				if(!$('#form_ckDataType').hasClass('operant-add')){
					if(ckDataType){
					  if(ckDataType.dataSQLParam!=ckDataParam){
					  	$.sdcui.ajaxUtil.ajax({
						url:'validatedataParam.ajax?dataParam='+ckDataParam,
						success:function(result){
								if(result.result=="2"){
									alert("数据权限参数输入有误，请重新输入!!");
								}else{
									$('#form_ckDataType').form('submit');
								}
							}
						});
					  }
					}
				}
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
		<t:grid id="grid_ckDataType" 
			idKeys="id"
			dataFormId="form_ckDataType"
			caption="仓库数据权限类型列表" 
			src="queryCkDataType.ajax"
			editSrc="getCkDataType.ajax"
			removeSrc="removeCkDataType.ajax" showNum="true" submit="NOT" reset="NOT"  load="true" back="NOT" >
			<t:gridCol width="100" property="dataParamName" caption="数据参数名"/>
			<t:gridCol width="600" property="dataSQLParam" caption="数据SQL参数"/>
			<t:gridCol width="150" property="cuncTableName" caption="存储表名" />
			<t:gridCol width="50" property="dicCode" caption="业务标识" convert="queryDicCode" />
		</t:grid>
		
		<!-- 0303数据权限类型表单 -->
		<t:form dialog="true" id="form_ckDataType" caption="数据权限类型" action="saveCkDataType.ajax" reset="NOT" submit="NOT">
			<t:fieldLayout prefix="record" columns="1">
				<t:fieldHidden property="id" />
				<t:fieldHidden property="active"  defaultValue="1"/>
				<t:fieldHidden property="dataSQLParamflag"  defaultValue="1"/>
				<t:fieldText property="dataParamName" caption="数据参数名" notNull="true"  minLength="2" maxLength="50"/>
				<t:fieldArea property="dataSQLParam" width="500"  caption="数据SQL参数" notNull="true"  minLength="3" maxLength="2000"/>
				<t:fieldText property="cuncTableName" caption="存储表名" maxLength="50" notNull="true"/>
				<t:fieldSelect property="dicCode" caption="业务标识" convert="queryDicCode" />
			</t:fieldLayout>
			<t:button caption="提交" name="tijiao"  active="2"></t:button>
		</t:form>
	</t:page>
</t:html>