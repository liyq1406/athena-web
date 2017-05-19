<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html title="">
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>

</head>
<t:page i18n="i18n.ckx.transTime.i18n_yunssjmb">

	<t:grid id="grid_ckx_shij" caption="${i18n.yunssjmbsj }" idKeys="xuh,usercenter,xiehztbh,gcbh"
		src="/transTime/queryYunssjmb.ajax" showNum="true"
		saveRowsSrcs="/transTime/saveYunssjmb.ajax" editable="true" 
		afterSaveRowsEvent="afterSaveRows"	scrollHeight="335" pageSize="15"	
		showEditorAddName="editorAdd" showEditorRemoveName="editorRemove"
		editModel="true" load="false" add="NOT" remove="NOT" edit="NOT">
		<t:fieldLayout id="chengpk" prefix="yunssjmb" columns="4">
			<t:fieldText property="xiehztbh" caption="${i18n.xiehztbz }" dataType="text" maxLength="4" minLength="4"/>
			<t:fieldText property="gcbh" caption="${i18n.gcbh }" 
				maxLength="10"  width="110"/>
		</t:fieldLayout>
		<t:gridCol property="usercenter" caption="${i18n.usercenter }" editor="fieldSelect" defaultValue="${loginUsercenter }" convert="queryUserCenterMap"
			></t:gridCol>
		<t:gridCol property="xiehztbh" caption="${i18n.xiehztbz }" editor="fieldText" width="90"
			editorOptions="{'maxLength':'4','notNull':true,'dataType':'text','minLength':'4'}"
			></t:gridCol>
		<t:gridCol property="gcbh" caption="${i18n.gcbh }"  editor="fieldText" 
		editorOptions="{'maxLength':'10','notNull':true}"
			  ></t:gridCol>
		<t:gridCol property="daohsj" width="150" caption="${i18n.daohsjpl }" editor="fieldText"
			editorOptions="{'notNull':true,'expression':'^[1-9][0-9]{0,2}$|^1[0-3][0-9]{2}$|^14[0-3][0-9]$|^0$','expressionMessage':'${i18n.qingsr }0~1440${i18n.zhijdsz }'}"></t:gridCol>
		<t:gridCol property="facsj" width="150" caption="${i18n.facsjpl }" editor="fieldText"
			editorOptions="{'notNull':true,'expression':'^-?[1-9][0-9]{0,2}$|^-?1[0-3][0-9]{2}$|^-?14[0-3][0-9]$|^0$','expressionMessage':'${i18n.qingsr }-1440~1440${i18n.zhijdsz }'}"></t:gridCol>
			<t:gridCol property="a" caption="   "
				></t:gridCol>
		<t:button caption="导出xls" name="daocxls"></t:button>
	</t:grid>
	
</t:page>
</t:html>
<script type="text/javascript">
	function func_button_daocxls(){
	//		window.location.href = "${ctx}/transTime/derivedYunssjmbTemp.do?fileName=ckx\\运输时间计算.xls";
		var xiehztbh = trim($("#yunssjmb_xiehztbh").fieldValue());
		var gcbh = trim($("#yunssjmb_gcbh").fieldValue());
		// 'quf'：'2' 代表实际，‘1’ 代表 计算
		var record = {'xiehztbh':xiehztbh,'gcbh':gcbh,'type':''};
		
		$.sdcui.pageUtils.goPage({
			url : '../transTime/derivedYunssjmbTemp.do',
			mode : 'form',
			record : record,
			beforeSubmit : function(){
				return true;
			}
	   });
	}
	

</script>
