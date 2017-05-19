<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="${i18n.xiaohcmb}">

<!-- 
	  小火车运输时刻模板
	 @author denggq
	 @date 2012-4-11
 -->
 
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 75px; } </style>
</head>

<t:page i18n="i18n.ckx.xuqjs.i18n_xiaohcmb">
	<t:grid id="grid_xiaohcmb" caption="${i18n.xiaohcmb}" idKeys="usercenter,shengcxbh,xiaohcbh,tangc" editable="true"  back="NOT" load="false" edit="NOT" showEditorAdd="NOT" showEditorRemove="NOT"
		src="/xiaohc/queryXiaohcmb.ajax" saveRowsSrcs="/xiaohc/savesXiaohcmb.ajax" dataFormId="form_xiaohcmb"   showNum="true" afterSaveRowsEvent="afterSaveRows" scrollHeight="335" pageSize="15">
		<t:fieldLayout id="layout1" prefix="xiaohcmb" columns="3">
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap" width="150" defaultValue="${usercenter}"/>
			<t:fieldText property="shengcxbh" caption="${i18n.shengcxbh}" dataType="text" maxLength="5" minLength="5" width="150"/>
			<t:fieldText property="xiaohcbh" caption="${i18n.xiaohcbh}" dataType="text" maxLength="5" width="150"/>
		</t:fieldLayout>
		
		<t:button caption="${i18n.add }" name="addMob" icon="addRecord"/>
		<t:button caption="${i18n.delete }" name="removeMob" active="1" icon="removeRecord"/>
		
		<t:gridCol property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap" />
		<t:gridCol property="shengcxbh" caption="${i18n.shengcxbh}"  width="100" />
		<t:gridCol property="xiaohcbh" caption="${i18n.xiaohcbh}"  width="100" />
		<t:gridCol property="tangc" caption="${i18n.tangc}" />
			<t:gridCol property="shangxpysj" caption="上线偏移时间(分钟)" editor="fieldText" width="180" 
			editorOptions="{'expression':'^[1-9][0-9]{0,2}$|^1[0-3][0-9]{2}$|^14[0-3][0-9]$|^0$','expressionMessage':'${i18n.shangxpysj_ex_mes}','notNull':true}"/>
		<t:gridCol property="beihpysj" caption="备货距上线提前量(分钟)" editor="fieldText" width="150" 
			editorOptions="{'expression':'^1[0-7][0-9]$|^180$|^[1-9][0-9]{0,1}$|^0$','expressionMessage':'请输入[0,180]之间的整数','notNull':true}"/>
		<t:gridCol property="" caption="" width="5"/>
	</t:grid>
	
	<t:form dialog="true" id="form_xiaohcmb" idKeys="usercenter,shengcxbh,xiaohcbh" action="/xiaohc/saveXiaohcmb.ajax" width="530" reset="NOT"  >
		<t:fieldLayout prefix="record1" columns="3">
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap" width="100" notNull="true" defaultValue="${usercenter}"/>
			<t:fieldText property="shengcxbh" caption="${i18n.shengcxbh}" dataType="text" maxLength="5" minLength="5" width="100"/>
			<t:fieldText property="xiaohcbh" caption="${i18n.xiaohcbh}" dataType="text" maxLength="5" width="100"/>
		</t:fieldLayout>
		<t:fieldLayout prefix="record2" showLabel="false" columns="1">
			<t:fieldGrid property="list" width="530">
				<t:grid id="moblist" idKeys="tangc" panel="false" editable="true" load="false" showNum="true" back="NOT" save="NOT"
					add="NOT" edit="NOT" remove="NOT" submit="NOT"  reset="NOT" 
					showEditorAddName="editorAdd" showEditorRemoveName="editorRemove"
					preSaveRowsEvent="preSaveEvent" >
					<t:gridCol property="shangxpysj" caption="上线偏移时间(分钟)" editor="fieldText" width="190" 
						editorOptions="{'expression':'^[1-9][0-9]{0,2}$|^1[0-3][0-9]{2}$|^14[0-3][0-9]$|^0$','expressionMessage':'${i18n.shangxpysj_ex_mes}','notNull':true}"/>
					<t:gridCol property="beihpysj" caption="备货距上线提前量(分钟)" editor="fieldText" width="150" 
						editorOptions="{'expression':'^1[0-7][0-9]$|^180$|^[1-9][0-9]{0,1}$|^0$','expressionMessage':'请输入[0,180]之间的整数','notNull':true}"/>
					<t:gridCol property="" caption=" " width="20"></t:gridCol>
				</t:grid>
			</t:fieldGrid>
		</t:fieldLayout>
		
	</t:form>
</t:page>

<script type="text/javascript">


	//空格查询
	function grid_xiaohcmb_beforeSubmit() {
		$("#xiaohcmb_xiaohcbh").fieldValue(trim($("#xiaohcmb_xiaohcbh").fieldValue()));
		$("#xiaohcmb_shengcxbh").fieldValue(trim($("#xiaohcmb_shengcxbh").fieldValue()));
	}
	
	//保存
	function func_button_save(){
		$('#grid_xiaohcmb').grid('saveRows');
	}
	
	function preSaveEvent(){		
// 		$('#form_xiaohcmb').form('submit');
		return true;
	}
	
	function func_button_addMob(){
		$('#form_xiaohcmb').form("clear");//清除弹出窗口的数据
		$('#form_xiaohcmb').removeClass('operant-add');//增加的operant为1，修改的operant为2
		var record = $("#grid_xiaohcmb").grid("getSelectedRecords")[0];
		if(undefined != record){
			$("#record1_usercenter").fieldValue(record.usercenter);
			$("#record1_shengcxbh").fieldValue(record.shengcxbh);
			$("#record1_xiaohcbh").fieldValue(record.xiaohcbh);
		}
		$('#form_xiaohcmb').form("open","${i18n.add}");
	}
	
	function form_xiaohcmb_afterSubmit(){
		$('#form_xiaohcmb').form("close");
	}
	
	//失效按钮
	function func_button_removeMob(){
		if(confirm("${i18n.quersc}")){
			var record = $("#grid_xiaohcmb").grid("getSelectedRecords");
			
			var params = [];
			params.push("usercenter="+record[0].usercenter);	//用户中心
			params.push("shengcxbh="+record[0].shengcxbh);		//生产线编号
			params.push("xiaohcbh="+record[0].xiaohcbh);		//小火车编号
			params.push("tangc="+record[0].tangc);				//趟次
			
				 $.sdcui.ajaxUtil.ajax({
			 	 	   url:"../xiaohc/removeXiaohcmb.ajax",
			 	 	   data:params.join('&'),
			 	       success:function (result){
			 	    	  $('#grid_xiaohcmb').grid('reload');
// 			 	    	   alert("${i18n.shanccg}");
			 	       	}
			     	});
		}		
 	}

	//行编辑保存后的方法
	function afterSaveRows(result){
		if(false == result.success){
			return false;
		}
		return true;
	}
</script>

</t:html>