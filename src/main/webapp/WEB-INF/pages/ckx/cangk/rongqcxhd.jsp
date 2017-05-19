<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="消耗点-容器厂">

<!-- 
	 容器场-消耗点
	 @author wangyu
	 @date 2012-12-10
 -->
 
<head>
	<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
	<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 95px; } 
	
	#grid_gongyxhd  .grid-footer   .pRemoveRow{
				display: none;
			}
	</style>
</head>

<t:page i18n="i18n.ckx.xuqjs.i18n_rongqcxhd" >
	<t:grid id="grid_rongqcxhd" caption="消耗点-容器厂" 
		idKeys="gongyxhd" 
		src="/cangk/queryRongqcxhd.ajax"
		saveRowsSrcs="/cangk/saveRongqcxhd.ajax"
		load="false"  add="NOT"  edit="NOT"  remove="NOT" editable="true"  showNum="true" back="NOT"
		showEditorAdd="false" showEditorRemove="false"
	    afterSaveRowsEvent="afterSaveRows" scrollHeight="335" pageSize="15" >
		 
		<t:fieldLayout id="layout" prefix="rongqcxhd" columns="3">
			<t:fieldText property="gongyxhd" caption="工艺消耗点" dataType="text" maxLength="9" width="100"/>
			<t:fieldText property="rongqcbh" caption="容器场编号" dataType="text" maxLength="10" width="100"/>
<%-- 			<t:fieldHidden property="rongqcbhYN"></t:fieldHidden> --%>
			<t:fieldText property="shengcxbh" caption="生产线编号" dataType="text" maxLength="5" width="100"/>
			<t:fieldCheckboxGroup  property="rongqcbhYN" caption="是否空容器场"  convert="rongqcbhYN" width="360" >
			</t:fieldCheckboxGroup>
		</t:fieldLayout>
		
		<t:button caption="增加容器场" name="addrongqc" active="0" icon="addRecord"></t:button>
<%-- 		<t:button caption="查询空容器场" name="notexist" active="0"></t:button> --%>
		
		<t:gridCol property="gongyxhd" editor="fieldText" caption="工艺消耗点" width="150" 
			editorOptions="{'maxLength':'9','minLength':'9','dataType':'text','notNull':true}"/>
		<t:gridCol property="rongqcbh" caption="容器场编号" width="200" editor="fieldText"
			editorOptions="{'maxLength':'10','dataType':'text'}"/>
		<t:gridCol property="shengcxbh" caption="生产线编号" width="200" 
			editorOptions="{'dataType':'text','maxLength':'5','minLength':'5','notNull':true}"/>
		<t:gridCol property="" caption="" width="20"/>	
	</t:grid>
	<t:form dialog="true" caption="增加容器场" id="form_rongqcxhd" action="/cangk/addRongqc.ajax" width="400" reset="NOT" >
				<t:fieldLayout prefix="groups1" columns="2">
					<t:fieldText property="gongyxhd" caption="工艺消耗点" dataType="text" maxLength="9" width="100"/>
					<t:fieldText property="rongqcbh" caption="容器场编号" dataType="text" maxLength="10" width="100" notNull="true"/>
					<t:gridCol property="" caption=" " />
				</t:fieldLayout>
	</t:form>
</t:page>

<script type="text/javascript">
$.sdcui.serverConfig.convertArray['rongqcbhYN'] = {'1':'是'};
	//空格查询
	function grid_rongqcxhd_beforeSubmit() {
		if($("#rongqcxhd_rongqcbhYN").fieldValue()==1){
			$("#rongqcxhd_rongqcbh").fieldValue("");
		}else{
			$("#rongqcxhd_rongqcbh").fieldValue(trim($("#rongqcxhd_rongqcbh").fieldValue()));
		}
		$("#rongqcxhd_gongyxhd").fieldValue(trim($("#rongqcxhd_gongyxhd").fieldValue()));
		$("#rongqcxhd_shengcxbh").fieldValue(trim($("#rongqcxhd_shengcxbh").fieldValue()));
	}
	
	//增加容器场弹出窗口
	function func_button_addrongqc(){
		$('#form_rongqcxhd').form("clear");//清除弹出窗口的数据
		$("#form_rongqcxhd").form("open");
	}
	
	function form_rongqcxhd_afterSubmit(result){
		if(typeof result.success=="undefined"||result.success!==false){
			$("#form_rongqcxhd").form("close");
			$('#grid_rongqcxhd').grid("reload");
		}
	}
	
	
	//保存按钮
	 function func_button_save() {
		$('#grid_rongqcxhd').grid('saveRows');
	} 
	
	//行编辑保存后的方法
	function afterSaveRows(result){
		if(false == result.success){
			return false;
		}
		return true;
	}
	
	//未配置容器场
	function func_button_notexist(){
		$("#rongqcxhd_gongyxhd").fieldValue(trim($("#rongqcxhd_gongyxhd").fieldValue()));
		$("#rongqcxhd_rongqcbh").fieldValue("");
		$("#rongqcxhd_shengcxbh").fieldValue(trim($("#rongqcxhd_shengcxbh").fieldValue()));
		$("#rongqcxhd_rongqcbhYN").fieldValue("1");
		$('#grid_rongqcxhd').grid('reload');
		//$("#rongqcxhd_rongqcbhYN").fieldValue("");
// 		$.sdcui.ajaxUtil.ajax({
// 			url:'queryWeipz.ajax',
// 			success:function(result){
// 			}
// 		});
	}
</script>

</t:html>