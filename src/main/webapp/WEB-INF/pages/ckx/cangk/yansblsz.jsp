<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="${i18n.yansblsz}">

<!-- 
	  零件类型验收比例设置
	 @author denggq
	 @date 2012-2-6
 -->
 
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 75px; } </style>
</head>

<t:page i18n="i18n.ckx.cangk.i18n_yansblsz">
	<t:grid id="grid_yansblsz" caption="${i18n.yansblsz}" idKeys="usercenter,lingjlx,cangkbh" 
		edit="NOT" editable="true"  showNum="true" back="NOT"
		src="/cangk/queryYansblsz.ajax" removeSrc="/cangk/removeYansblsz.ajax" 
		saveRowsSrcs="/cangk/saveYansblsz.ajax" load="false"  afterSaveRowsEvent="afterSaveRows"
		showEditorAddName="editorAdd" showEditorRemoveName="editorRemove" scrollHeight="335" pageSize="15">
		<t:fieldLayout id="fl_yansblsz" prefix="yansblsz" columns="3">
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" defaultValue="${usercenter}" convert="queryUserCenterMap" width="150"/>
			<t:fieldSelect property="lingjlx" caption="${i18n.lingjlx}" convert="queryLjlx"  width="150"/>
			<t:fieldText property="cangkbh" caption="仓库编号" dataType="text" maxLength="3" minLength="3"  width="150"/>
		</t:fieldLayout>
		
<%-- 		<t:button caption="${i18n.shengcsj }" name="commit"></t:button> --%>
		
		<t:gridCol property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap" defaultValue="${usercenter}" editor="fieldSelect" editorOptions="{'notNull':true}"></t:gridCol>
		<t:gridCol property="lingjlx" caption="${i18n.lingjlx}" convert="queryLjlx" editor="fieldSelect" editorOptions="{'notNull':true}"></t:gridCol>
		<t:gridCol property="cangkbh" caption="仓库编号" editor="fieldText" width="90" editorOptions="{'minLength':'3','maxLength':'3','dataType':'text','notNull':true}"></t:gridCol>
		<t:gridCol property="yansbl" caption="${i18n.yansbl}" editor="fieldText" defaultValue="0"
			editorOptions="{'expression':'^(0|100|[1-9][0-9]?)$','expressionMessage':'${i18n.yansbl_ex_mes}'}"></t:gridCol>
		<t:gridCol property="creator" caption="${i18n.creator}" width="70"/>
		<t:gridCol property="create_time" caption="${i18n.create_time}" width="130"/>
		<t:gridCol property="editor" caption="${i18n.editor}" width="70"/>
		<t:gridCol property="edit_time" caption="${i18n.edit_time}" width="130"/>
		<t:gridCol property="" caption=" " width="10"></t:gridCol>
		
	</t:grid>
</t:page>

<script type="text/javascript">

	//标识
	$.sdcui.serverConfig.convertArray['biaos'] = {
		'1' : '${i18n.yes}',
		'0' : '${i18n.no}'
	};

	//保存按钮
	function func_button_save() {
		$('#grid_yansblsz').grid('saveRows');
	}

	//空格查询
	function grid_yansblsz_beforeSubmit() {
		$("#yansblsz_cangkbh").fieldValue(trim($("#yansblsz_cangkbh").fieldValue()));
	}
	
	
	//生效提交按钮--根据模板生成零件验收比例设置数据
	function func_button_commit() {
		$.sdcui.ajaxUtil.ajax({
			url : "../cangk/commitYansblsz.ajax",
			success : function(result) {
				return true;
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