<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="${i18n.yansbllj}">

<!-- 
	  零件验收比例设置
	 @author denggq
	 @date 2012-2-6
 -->

<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 75px; } </style>

</head>

<t:page i18n="i18n.ckx.cangk.i18n_yansbllj">
	<t:grid id="grid_yansbllj" caption="${i18n.yansbllj}" idKeys="usercenter,lingjbh,gongysbh,yansxbh"  
		edit="NOT" editable="true"  showNum="true" back="NOT" scrollHeight="320" pageSize="15"
		showEditorAddName="editorAdd" showEditorRemoveName="editorRemove"
		src="/cangk/queryYansbllj.ajax" removeSrc="/cangk/removeYansbllj.ajax" saveRowsSrcs="/cangk/saveYansbllj.ajax" 
		load="false"  afterSaveRowsEvent="afterSaveRows" showCheckbox="true">
		<t:fieldLayout id="fl_yansbllj" prefix="yansbllj" columns="4">
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" defaultValue="${usercenter}" convert="queryUserCenterMap" width="110"/>
			<t:fieldText property="lingjbh" caption="${i18n.lingjbh}" maxLength="10" minLength="10" dataType="text" width="110"/>
			<t:fieldText property="gongysbh" caption="${i18n.gongysbh}" maxLength="10" minLength="10" width="110"/>
			<t:fieldText property="yansxbh" caption="${i18n.yansxbh}" maxLength="3" dataType="text" width="110"/>
		</t:fieldLayout>
		
		<t:button caption="${i18n.deletes}" name="deletes" active="2"></t:button>
		<t:button caption="${i18n.addByGongys}" name="addByGongys"></t:button>
		
		<t:gridCol property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap" defaultValue="${usercenter}" editor="fieldSelect" 
			editorOptions="{'notNull':true}" width="70"/>
		<t:gridCol property="lingjbh" caption="${i18n.lingjbh}" editor="fieldText" 
			editorOptions="{'notNull':true,'maxLength':'10','minLength':'10','dataType':'text'}"/>
		<t:gridCol property="lingjmc" caption="${i18n.lingjmc}"/>
		<t:gridCol property="gongysbh" caption="${i18n.gongysbh}" editor="fieldText" 
			editorOptions="{'maxLength':'10','minLength':'10','expression':exp,'expressionMessage':'${gongysbh_ex_mes}','notNull':true}"/>
		<t:gridCol property="yansxbh" caption="${i18n.yansxbh}" editor="fieldText" width="80"
			editorOptions="{'maxLength':'3','dataType':'text','notNull':true}"></t:gridCol>
		<t:gridCol property="yansxsm" caption="${i18n.yansxsm}" width="100" />
<%-- 		<t:gridCol property="yansbl" caption="${i18n.yansbl}" editor="fieldText" defaultValue="0"  --%>
<%-- 			editorOptions="{'expression':'^(100|[1-9][0-9]?)$','expressionMessage':'${yansbl_ex_mes}'}" width="70"/> --%>
		<t:gridCol property="creator" caption="${i18n.creator}" width="70"/>
		<t:gridCol property="create_time" caption="${i18n.create_time}" width="130"/>
		<t:gridCol property="editor" caption="${i18n.editor}" width="70"/>
		<t:gridCol property="edit_time" caption="${i18n.edit_time}" width="130"/>
		<t:gridCol property="" caption=" "></t:gridCol>
	</t:grid>
	
	<t:form dialog="true" id="form_yansbllj_add" caption="${i18n.yansbllj}"  idKeys="usercenter,gongysbh,yansxbh" 
		action="/cangk/addYansblljByGongys.ajax" width="490" reset="NOT">
		<t:fieldLayout prefix="record1" columns="2">
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" defaultValue="${usercenter}" convert="queryUserCenterMap" notNull="true" width="150"/>
			<t:fieldText property="gongysbh" caption="${i18n.gongysbh}" maxLength="10" minLength="10" expression="(^[0-9A-Z]{6}[\s0-9A-Z]{2}[0-9A-Z]{2}$)" 
				expressionMessage="${gongysbh_ex_mes}" notNull="true" width="150"/>
			<t:fieldText property="lingjbh" caption="${i18n.lingjbh }"	maxLength="10" minLength="10" dataType="text" notNull="true" width="150"/>
			<t:fieldText property="yansxbh" caption="${i18n.yansxbh}" maxLength="3" dataType="text" notNull="true" width="150"/>
		</t:fieldLayout>
	</t:form>

</t:page>

<script type="text/javascript">
	var exp = '^[0-9A-Z]{6}[\\s0-9A-Z]{2}[0-9A-Z]{2}$';
	
	/* 设置同一个供应商的零件 */
	function func_button_addByGongys(){
		$('#form_yansbllj_add').form("clear");
		$('#form_yansbllj_add').addClass('operant-add');
		$("#form_yansbllj_add").form("open");
	}
	
	function form_yansbllj_add_afterSubmit() {
		$("#record1_yansxbh").fieldValue("");
		$("#record1_gongysbh").fieldValue("");
		$("#record1_lingjbh").fieldValue("");
		//$("#form_yansbllj_add").form("close");
		$("#grid_yansbllj").grid("reload");
	}
	
	//保存按钮
	function func_button_save() {
		$('#grid_yansbllj').grid('saveRows');
	}


	//空格查询
	function grid_yansbllj_beforeSubmit() {
		$("#yansbllj_lingjbh").fieldValue(trim($("#yansbllj_lingjbh").fieldValue()));
		$("#yansbllj_gongysbh").fieldValue(trim($("#yansbllj_gongysbh").fieldValue()));
		$("#yansbllj_yansxbh").fieldValue(trim($("#yansbllj_yansxbh").fieldValue()));
	}
	
	//行编辑保存后的方法
	function afterSaveRows(result){
		if(false == result.success){
			return false;
		}
		return true;
	}
	
	//自定义多行删除按钮
 	function func_button_deletes(){
 		var record=$("#grid_yansbllj").grid("getSelectedRecords");
 		if(record.length > 0){
 			if(confirm("${i18n.quedsc}")){
 				var params = [];
				for(var i=0;i<record.length;i++){
					params.push('delete['+i+'].usercenter='+record[i].usercenter);
					params.push('delete['+i+'].lingjbh='+record[i].lingjbh);
					params.push('delete['+i+'].gongysbh='+record[i].gongysbh);
					params.push('delete['+i+'].yansxbh='+record[i].yansxbh);
				}
				
 				$.sdcui.ajaxUtil.ajax({
 		 	 	   url:"../cangk/deletesYansbllj.ajax",
 		 	 	   data:params.join('&'),
 		 	       success:function (result){
 		 	    	 $('#grid_yansbllj').grid('reload');//刷新表格数据	
 		 	       }
 		     	});
 	 		}
 		}else{
 			alert("${i18n.qingxxzzsyhsj}");
 		}
	}
</script>

</t:html>