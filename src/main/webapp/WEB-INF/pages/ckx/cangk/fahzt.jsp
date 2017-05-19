<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="${i18n.fahzt}">

<!-- 
	  发货站台
	 @author denggq
	 @date 2012-1-16
 -->

<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
</head>

<t:page i18n="i18n.ckx.cangk.i18n_fahzt">
	<t:grid id="grid_fahzt" caption="${i18n.fahzt}" idKeys="usercenter,fahztbh" edit="NOT" editable="true" load="false"  showNum="true"  back="NOT"
		src="/cangk/queryFahzt.ajax" removeSrc="/cangk/removeFahzt.ajax"  showEditorAddName="editorAdd" showEditorRemoveName="editorRemove" saveRowsSrcs="/cangk/saveFahzt.ajax" afterSaveRowsEvent="afterSaveRows" scrollHeight="310" pageSize="15">
		<t:fieldLayout id="fl_fahzt" prefix="fahzt" columns="3">
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" defaultValue="${usercenter}" convert="queryUserCenterMap"  width="150"/>
			<t:fieldText property="fahztbh" caption="${i18n.fahztbh}" maxLength="3" dataType="text" width="150"/>
			<t:fieldText property="fahztmc" caption="${i18n.fahztmc}" maxLength="30" width="150"/>
			<t:fieldText property="cangkbh" caption="${i18n.cangkbh}" dataType="text" maxLength="3" minLength="3" width="150"/>
			<t:fieldSelect property="biaos" caption="${i18n.biaos}" convert="biaos" defaultValue="1"  width="150"/>
		</t:fieldLayout>
		<t:gridCol property="usercenter" caption="${i18n.usercenter}" editor="fieldSelect" convert="queryUserCenterMap" defaultValue="${usercenter}" editorOptions="{'notNull':true}"></t:gridCol>
		<t:gridCol property="fahztbh" caption="${i18n.fahztbh}" editor="fieldText" width="150"
			editorOptions="{'dataType':'text','notNull':true,'maxLength':'3'}"></t:gridCol>
		<t:gridCol property="fahztmc" caption="${i18n.fahztmc}" editor="fieldText" width="150" 
			editorOptions="{closeEvent:func_set_fahztmc}"></t:gridCol>
		<t:gridCol property="cangkbh" caption="${i18n.cangkbh}"></t:gridCol>
		<t:gridCol property="biaos" caption="${i18n.biaos}" convert="biaos" defaultValue="1" editor="fieldSelect" editorOptions="{'notNull':true}"></t:gridCol>
		<t:gridCol property="" caption=" " ></t:gridCol>
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
		var rows = $('#grid_fahzt').grid('saveRows');
		$('#grid_fahzt').grid('reload', rows);//刷新表格
	}
	
	//行编辑保存后的方法
	function afterSaveRows(result){
		if(false == result.success){
			return false;
		}
		return true;
	}
	
	//空格查询
	function grid_fahzt_beforeSubmit() {
		$("#fahzt_fahztbh").fieldValue(trim($("#fahzt_fahztbh").fieldValue()));
		$("#fahzt_fahztmc").fieldValue(trim($("#fahzt_fahztmc").fieldValue()));
	}

	//发货站台名称长度为30
	function func_set_fahztmc() {
		var cell = this.col.cell;
		var rowElement = cell.parent("tr:first");

		var fahztmcIndex = $('td.fahztmc:first').prevAll().length;
		var fahztmc = trim(rowElement.find('td:eq(' + fahztmcIndex + ')').text());
		
		if(undefined != fahztmc && null != fahztmc && "" !== fahztmc){
			if (!checkCH(30, fahztmc)) {
				alert("${i18n.fahztmccd}");
				return false;
			}
		}
		return true;
	}
</script>

</t:html>