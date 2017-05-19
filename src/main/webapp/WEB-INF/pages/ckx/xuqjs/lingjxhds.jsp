 <%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="${i18n.usercenter}">

<!-- 
	 零件消耗点变更
	 @author denggq
	 @date 2012-3-19
 -->
 
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 90px; } </style>
</head>

<t:page i18n="i18n.ckx.xuqjs.i18n_usercenter">
	<t:grid id="grid_ckx_lingjxhd_s" caption="零件消耗点变更" 
		src="/xuqjs/queryLingjxhdbg.ajax"
		remove="NOT"
		idKeys="usercenter,lingjbh,yuanxhd"  
		saveRowsSrcs="/xuqjs/saveLingjxhds.ajax"
		load="false" 
		back="NOT"
		editable="true" 
		showNum="true"
		afterSaveRowsEvent="afterSaveRows"
		scrollHeight="335" 
		pageSize="15"
		showCheckbox="true"
		showEditorAddName="editorAdd" showEditorRemoveName="editorRemove"	
		>
		<t:fieldLayout id="layout" prefix="control" columns="3">
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" defaultValue="${usercenter}" convert="queryUserCenterMap" width="150"/>
			<t:fieldText property="lingjbh" caption="零件编号" maxLength="10" dataType="text" width="150"/>
			<t:fieldText property="xiaohd" caption="消耗点" maxLength="9" dataType="text" width="150"/>
			<t:fieldText property="yuanxhd" caption="原消耗点" maxLength="9" dataType="text" width="150"/>
			<t:fieldSelect property="biaos" caption="标识" convert="biaos" width="150"/>
		</t:fieldLayout>
		
<%-- 		<t:button caption="生效" name="shengxiao" active="0"></t:button> --%>
		<t:button caption="失效" name="shixiao" active="0"/>
		
		<t:gridCol property="usercenter" width="100" caption="${i18n.usercenter}" editor="fieldSelect" convert="queryUserCenterMap" editorOptions="{'notNull':true}"></t:gridCol>
		<t:gridCol property="lingjbh" caption="零件编号" width="100" editor="fieldText" editorOptions="{'maxLength':'10','minLength':'10','dataType':'text','notNull':true}"/>
		<t:gridCol property="xinljbh" caption="新零件编号" width="100" editor="fieldText" editorOptions="{'maxLength':'10','minLength':'10','dataType':'text'}"/>
		<t:gridCol property="xiaohd" caption="消耗点" width="100" editor="fieldText" editorOptions="{'maxLength':'9','minLength':'9','dataType':'text','notNull':true}"/>
		<t:gridCol property="yuanxhd" caption="原消耗点"  width="100" editor="fieldText" editorOptions="{'maxLength':'9','minLength':'9','dataType':'text','notNull':true}"/>
		<t:gridCol property="shengxr" caption="消耗点起始日" editor="fieldCalendar" width="90" editorOptions="{'format':'yyyy-MM-dd','notNull':true}"/>
		<t:gridCol property="jiesr" caption="结束日" editor="fieldCalendar" editorOptions="{'format':'yyyy-MM-dd','notNull':true}" width="80"/>
		<t:gridCol property="biaos" caption="${i18n.biaos}" editor="fieldSelect" convert="biaos"  editorOptions="{'notNull':true}"/>
		<t:gridCol property="" caption=""/>
	</t:grid>
	
	<t:form dialog="true" id="form_lingjxhd_s" caption="零件消耗点变更" action="/xuqjs/saveLingjxhds.ajax" width="660" 
		idKeys="usercenter,lingjbh,xiaohdbh" reset="NOT">
		<t:fieldLayout id="ljxhd" prefix="record" columns="3">
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap" defaultValue="${usercenter}" notNull="true" width="120"/>
			<t:fieldText property="lingjbh" caption="${i18n.lingjbh}" dataType="text" maxLength="10" minLength="10" notNull="true" width="120"/>
			<t:fieldText property="xinljbh" caption="新${i18n.lingjbh}" dataType="text" maxLength="10" minLength="10" width="120"/>
			<t:fieldText property="xiaohdbh" caption="${i18n.xiaohdbh}" dataType="text" maxLength="9" minLength="9" notNull="true" width="120"/>
			<t:fieldText property="yuanxhd" caption="原${i18n.xiaohdbh}" dataType="text" maxLength="9" minLength="9" width="120"/>
			<t:fieldCalendar property="shengxr" caption="${i18n.shengxr}" format="yyyy-MM-dd" notNull="true" width="120"/>
			<t:fieldCalendar property="jiesr" caption="结束日" format="yyyy-MM-dd" notNull="true" width="120"/>
		</t:fieldLayout>
	</t:form>
	
</t:page>

<script type="text/javascript">

	//标识
	$.sdcui.serverConfig.convertArray['biaos'] = {
		'1' : '已生效',
		'2' : '失效',
		'0' : '未生效'
	};
	
	//空格查询
	function grid_printcontrol_beforeSubmit() {
		$("#control_usercenter").fieldValue(trim($("#control_usercenter").fieldValue()));
		$("#control_lingjbh").fieldValue(trim($("#control_lingjbh").fieldValue()));
		$("#control_xiaohd").fieldValue(trim($("#control_xiaohd").fieldValue()));
		$("#control_yuanxhd").fieldValue(trim($("#control_yuanxhd").fieldValue()));
	}
	
	
	//保存按钮
	function func_button_save() {
		$('#grid_ckx_lingjxhd_s').grid('saveRows');
	}
	
	//点击生效触发的函数
	function func_button_shengxiao(){
		 var roles = $('#grid_ckx_lingjxhd_s').grid('getSelectedRecords');
		 if(roles.length==0){
		 		alert("请至少选择一条记录");
		 		return false;
		 }
		 var params = [];
		 for(var i = 0 ; i < roles.length ; i++ ){
			 params.push("list["+i+"].usercenter="+roles[i].usercenter);
			 params.push("list["+i+"].lingjbh="+roles[i].lingjbh);
			 params.push("list["+i+"].yuanxhd="+roles[i].yuanxhd);
			 params.push("list["+i+"].xiaohd="+roles[i].xiaohd);
			 params.push("list["+i+"].shengxr="+roles[i].shengxr);
			 params.push("list["+i+"].jiesr="+roles[i].jiesr);
			 params.push("list["+i+"].biaos="+roles[i].biaos);
		 }
		 $.sdcui.ajaxUtil.ajax({
				url:'shengxiaolingjxhds.ajax',
				data:params.join('&'),
				success:function(result){
					if(typeof result.success=="undefined"||result.success!==false){
						$("#grid_ckx_lingjxhd_s").grid('reload');
					}
				}
			});
	}
	
	//点击失效触发的函数
	function func_button_shixiao(){
		var roles = $('#grid_ckx_lingjxhd_s').grid('getSelectedRecords');
		 if(roles.length==0){
		 		alert("请至少选择一条记录");
		 		return false;
		 }
		 var params = [];
		 for(var i = 0 ; i < roles.length ; i++ ){
			 params.push("list["+i+"].usercenter="+roles[i].usercenter);
			 params.push("list["+i+"].lingjbh="+roles[i].lingjbh);
			 params.push("list["+i+"].yuanxhd="+roles[i].yuanxhd);
			 params.push("list["+i+"].xiaohd="+roles[i].xiaohd);
			 params.push("list["+i+"].shengxr="+roles[i].shengxr);
			 params.push("list["+i+"].jiesr="+roles[i].jiesr);
			 params.push("list["+i+"].biaos="+roles[i].biaos);
		 }
		 $.sdcui.ajaxUtil.ajax({
				url:'shixiaolingjxhds.ajax',
				data:params.join('&'),
				success:function(result){
					if(typeof result.success=="undefined"||result.success!==false){
						$("#grid_ckx_lingjxhd_s").grid('reload');
					}
				}
			});
// 		 var role = $('#grid_ckx_lingjxhd_s').grid('getSelectedRecords')[0];
// 		 var biaos = role.biaos;
// 		 	if(biaos=='0'){
// 		 		alert("未生效状态，不能失效");
// 		 		return false;
// 		 	}else if(biaos=='2'){
// 		 		alert("已是失效状态");
// 		 		return false;
// 		 	}else{
// 				 $.sdcui.ajaxUtil.ajax({
// 						url:'shixiaolingjxhds.ajax?lingjbh='+role.lingjbh+'&xiaohd='+role.xiaohd+'&usercenter='+role.usercenter+'&yuanxhd='+role.yuanxhd+'&shengxr='+role.shengxr+'&jiesr='+role.jiesr,
// 						success:function(result){
// 							$('#grid_ckx_lingjxhd_s').grid('reload');
// 						}
// 				});
// 			}
	}
	
</script>

</t:html>