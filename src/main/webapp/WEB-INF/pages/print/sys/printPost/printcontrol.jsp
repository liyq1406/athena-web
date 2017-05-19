 <%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="${i18n.usercenter}">

<!-- 
	 用户中心
	 @author denggq
	 @date 2012-3-19
 -->
 
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 90px; } </style>
</head>

<t:page i18n="i18n.ckx.xuqjs.i18n_usercenter">
	<t:grid id="grid_printcontrol" caption="打印单据控制" 
		src="/sys/queryPrintcontrol.ajax"
		saveRowsSrcs="/sys/savePrintcontrol.ajax"
		idKeys="usercenter,cangkbh,danjbh,jiaoym"  
		load="false" 
		back="NOT"
		editable="true" 
		showNum="true"
		afterSaveRowsEvent="afterSaveRows"
		scrollHeight="335" 
		pageSize="10"
		showEditorAddName="editorAdd" showEditorRemoveName="editorRemove"						
		>
		<t:fieldLayout id="layout" prefix="control" columns="3">
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" defaultValue="${usercenter}" convert="queryUserCenterMap" readonly="" width="150"/>
			<t:fieldText property="cangkbh" caption="仓库编号" maxLength="3" dataType="text" width="150"/>
			<t:fieldText property="danjbh" caption="单据编号" maxLength="3" dataType="text" width="150" upperCase="false"/>
			<t:fieldText property="jiaoym" caption="交易码" maxLength="10" dataType="text" width="150" upperCase="false"/>
<%-- 			<t:fieldSelect property="biaos" caption="${i18n.biaos}" convert="biaos" defaultValue="1" width="150"/> --%>
		</t:fieldLayout>
		
		<t:gridCol property="usercenter" width="100" caption="${i18n.usercenter}" editor="fieldSelect" convert="queryUserCenterMap" defaultValue="${usercenter}"></t:gridCol>
		<t:gridCol property="cangkbh" caption="仓库编号"  editor="fieldText" width="100" editorOptions="{'maxLength':'3','dataType':'text','notNull':true}"/>
		<t:gridCol property="danjbh" caption="单据编号" editor="fieldText" width="100" editorOptions="{'upperCase':false,'maxLength':'3','dataType':'text','notNull':true}"/>
		<t:gridCol property="jiaoym" caption="交易码"  editor="fieldText" width="100" editorOptions="{'upperCase':false,'maxLength':'10','dataType':'text','notNull':true}"/>
<%-- 		<t:gridCol property="biaos" caption="${i18n.biaos}" convert="biaos" editor="fieldSelect" defaultValue="1" editorOptions="{'notNull':true}"/> --%>
		<t:gridCol property="" caption=""/>
	</t:grid>
	
</t:page>

<script type="text/javascript">

	//标识
	$.sdcui.serverConfig.convertArray['biaos'] = {
		'1' : '有效',
		'0' : '无效'
	};
	
	
	//空格查询
	function grid_printcontrol_beforeSubmit() {
		$("#control_usercenter").fieldValue(trim($("#control_usercenter").fieldValue()));
		$("#control_cangkbh").fieldValue(trim($("#control_cangkbh").fieldValue()));
		$("#control_danjbh").fieldValue(trim($("#control_danjbh").fieldValue()));
		$("#control_jiaoym").fieldValue(trim($("#control_jiaoym").fieldValue()));
	}
	
	//var flag = true;
	//var flag1 = true;
	//var flag2 = true;
	
	//保存按钮
	function func_button_save() {
// 		 if(!flag2){
// 			 alert("仓库编号不存在");
// 			return false;
// 		}else if(!flag1){
// 			alert("单据编号不存在");
// 			return false;
// 		}else if(!flag){
// 			alert("交易码或批量号不存在");
// 			return false;
// 		}else{
			$('#grid_printcontrol').grid('saveRows');
		//}	
	}
	
	//验证是否存在的单据编号
	function func_set_danjbh(){
		var  cell = this.col.cell;
		var rowElement = cell.parent('tr:first');
		var danjbhIndex = $('td.danjbh:first').prevAll().length;
		var danjbhStr = rowElement.find('td:eq('+danjbhIndex+')').text();
		var danjbh = trim(danjbhStr);
		 $.sdcui.ajaxUtil.ajax({
				url:'jiaoydanjbh.ajax?danjbh='+danjbh,
				success:function(result){
					if(result.result){
						flag1 = true;
					}else{
						flag1 = false;
					}
				}
			});
		
	}
	
	//验证是否存在的仓库编号
	function func_set_cangkbh(){
		var  cell = this.col.cell;
		var rowElement = cell.parent('tr:first');
		var cangkbhIndex = $('td.cangkbh:first').prevAll().length;
		var cangkbhStr = rowElement.find('td:eq('+cangkbhIndex+')').text();
		var cangkbh = trim(cangkbhStr);
		 $.sdcui.ajaxUtil.ajax({
				url:'jiaoycangkbh.ajax?cangkbh='+cangkbh,
				success:function(result){
					if(result.result){
						flag2 = true;
					}else{
						flag2 = false;
					}
				}
			});
		
	}
	
	//验证是否存在的交易码
	function func_set_jiaoym(){
		var  cell = this.col.cell;
		var rowElement = cell.parent('tr:first');
		var jiaoymIndex = $('td.jiaoym:first').prevAll().length;
		var jiaoymStr = rowElement.find('td:eq('+jiaoymIndex+')').text();
		var jiaoym = trim(jiaoymStr);
		 $.sdcui.ajaxUtil.ajax({
				url:'jiaoyjiaoym.ajax?jiaoym='+jiaoym,
				success:function(result){
					if(result.result){
						flag = true;
					}else{
						flag = false;
					}
				}
			});
		
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