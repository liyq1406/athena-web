<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="${i18n.kuwdj_baoz}">

<!-- 
	  库位等级与包装
	 @author denggq
	 @date 2012-1-17
 -->

<head>
	<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
</head>

<t:page i18n="i18n.ckx.cangk.i18n_kuwdj_baoz">
	<t:grid id="grid_kuwdj_baoz" caption="${i18n.kuwdj_baoz}" idKeys="usercenter,cangkbh,kuwdjbh,baozlx" 
		add="NOT" edit="NOT" load="false" back="NOT" scrollHeight="335" pageSize="15"
		src="/cangk/queryKuwdjBaoz.ajax" removeSrc="/cangk/removeKuwdjBaoz.ajax" 
		showEditorAddName="editorAdd" showEditorRemoveName="editorRemove" 
		saveRowsSrcs="/cangk/saveKuwdjBaoz.ajax" editable="true"  showNum="true"  afterSaveRowsEvent="afterSaveRows">
		<t:fieldLayout id="fl_kuwdj_baoz" prefix="kuwdj_baoz" columns="4">
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" defaultValue="${usercenter}" convert="queryUserCenterMap" width="110"/>
			<t:fieldText property="cangkbh" caption="${i18n.cangkbh}" maxLength="3" minLength="3" dataType="text" width="110"/>
			<t:fieldText property="kuwdjbh" caption="${i18n.kuwdjbh}" maxLength="5" dataType="text" width="110"/>
			<t:fieldText property="baozlx" caption="${i18n.baozlx}" maxLength="5" dataType="text" defaultValue="${baozlx}" width="110"/>
		</t:fieldLayout>
		<t:button caption="导出" name="download"></t:button>
		<t:gridCol property="usercenter" caption="${i18n.usercenter}" editor="fieldSelect" convert="queryUserCenterMap" defaultValue="${usercenter}" editorOptions="{'notNull':true}"></t:gridCol>
		<t:gridCol property="cangkbh" caption="${i18n.cangkbh}" editor="fieldText" editorOptions="{'dataType':'text','notNull':true,'maxLength':'3','minLength':'3'}"></t:gridCol>
		<t:gridCol property="kuwdjbh" caption="${i18n.kuwdjbh}" width="110" editor="fieldText" editorOptions="{'maxLength':'5','dataType':'text','notNull':true}"></t:gridCol>
		<t:gridCol property="baozlx" caption="${i18n.baozlx}" editor="fieldText" editorOptions="{'maxLength':'5','minLength':'5','dataType':'text','notNull':true}"></t:gridCol>
		<t:gridCol property="baozgs" caption="${i18n.baozgs}" editor="fieldText" editorOptions="{'expression':'^(0|[1-9][0-9]{0,4})$','expressionMessage':'${i18n.baozgs_ex_mes}','notNull':true}"></t:gridCol>
		<t:gridCol property="" caption=" " ></t:gridCol>
	</t:grid>
</t:page>

<script type="text/javascript">

	//空格查询
	function grid_kuwdj_baoz_beforeSubmit() {
		$("#kuwdj_baoz_cangkbh").fieldValue(trim($("#kuwdj_baoz_cangkbh").fieldValue()));
		$("#kuwdj_baoz_kuwdjbh").fieldValue(trim($("#kuwdj_baoz_kuwdjbh").fieldValue()));
	}
	
	//行编辑保存
	function func_button_save(){
		$('#grid_kuwdj_baoz').grid('saveRows');
	} 
	
	//行编辑保存后的方法
	function afterSaveRows(result){
		if(false == result.result.success){
			return false;
		}
		return true;
	}
	
	//导出数据
	function func_button_download(){
		
		var usercenter = trim($('#kuwdj_baoz_usercenter').fieldValue());
		var kuwdjbh = trim($('#kuwdj_baoz_kuwdjbh').fieldValue());
		var cangkbh = $('#kuwdj_baoz_cangkbh').fieldValue();
		var baozlx = $('#kuwdj_baoz_baozlx').fieldValue();
		
		var record = {'usercenter':usercenter,'kuwdjbh':kuwdjbh,'cangkbh':cangkbh,'baozlx':baozlx};
		$.sdcui.pageUtils.goPage({
			url : '../cangk/downloadKuwdjbz.do',
			record : record,
			mode : 'form',
			beforeSubmit : function(){
				return true;
			}
	   });
	}
	
</script>

</t:html>