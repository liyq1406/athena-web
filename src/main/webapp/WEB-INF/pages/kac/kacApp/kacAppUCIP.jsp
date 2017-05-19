 <%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="${i18n.kacAppUCIP}">

<!-- 
	 用户中心坐标编码
	 @author CSY
	 @date 2016-9-5
 -->
 
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 90px; } </style>
</head>

<t:page i18n="i18n.kac.i18n_kacAppUCIP">
	<t:grid id="grid_kacAppUCIP" caption="用户中心坐标编码" 
		src="/kcApp/queryKacAppUCIP.ajax"
		removeSrc="/kcApp/removeKacAppUCIP.ajax"
		saveRowsSrcs="/kcApp/saveKacAppUCIP.ajax"
		idKeys="usercenter"  
		load="false" 
		back="NOT"
		editable="true" 
		showNum="true"
		afterSaveRowsEvent="afterSaveRows"
		scrollHeight="335" 
		pageSize="5"
		showEditorAddName="editorAdd" showEditorRemoveName="editorRemove"						
		>
		<t:fieldLayout id="layout" prefix="kacAppUCIP" columns="2">
			<t:fieldText property="usercenter" caption="${i18n.usercenter}" maxLength="3" dataType="text" width="150"/>
			<t:fieldSelect property="biaos" caption="${i18n.biaos}" convert="biaos" defaultValue="1" width="150"/>
		</t:fieldLayout>
		
		<t:gridCol property="usercenter" caption="${i18n.usercenter}" editor="fieldText" width="100" editorOptions="{'maxLength':'3','dataType':'text','notNull':true}"/>
		<t:gridCol property="ucname" caption="厂名" editor="fieldText" width="180" editorOptions="{'maxLength':'50','notNull':true}"/>
		<t:gridCol property="longitude" caption="${i18n.longitude}" editor="fieldText" width="180" editorOptions="{closeEvent:func_set_longitude,'expression':'^-?(?:(?:180(?:\.0{1,6})?)|(?:(?:(?:1[0-7]\d)|(?:[1-9]?\d))(?:\.\d{1,6})?))$','expressionMessage':'请输入正确的经度（-180.000000~180.000000）','maxLength':'12','notNull':true}"/>
		<t:gridCol property="latitude" caption="${i18n.latitude}" editor="fieldText" width="180" editorOptions="{closeEvent:func_set_latitude,'expression':'^-?(?:90(?:\.0{1,6})?|(?:[1-8]?\d(?:\.\d{1,6})?))$','expressionMessage':'请输入正确的纬度（-90.000000~90.000000）','maxLength':'12','notNull':true}"/>
		<t:gridCol property="ip" caption="厂区编码" editor="fieldText" width="100" editorOptions="{'maxLength':'1','dataType':'text','notNull':true}"/>
		<t:gridCol property="shenbjl" caption="申报距离(米)" editor="fieldText" width="180" editorOptions="{closeEvent:func_set_shenbjl,'expression':'^[1-9]\d{0,4}$','expressionMessage':'请输入整数距离（1~99999，单位米）','maxLength':'5','notNull':false}"/>
		<t:gridCol property="biaos" caption="${i18n.biaos}" convert="biaos" editor="fieldSelect" defaultValue="1" editorOptions="{'notNull':true}"/>
		<t:gridCol property="" caption=""/>
	</t:grid>
	
</t:page>

<script type="text/javascript">

	//标识
	$.sdcui.serverConfig.convertArray['biaos'] = {
		'1' : '${i18n.youx}',
		'0' : '${i18n.wux}'
	};
	
	//空格查询
	function grid_usercenter_beforeSubmit() {
		$("#kacAppUCIP_usercenter").fieldValue(trim($("#kacAppUCIP_usercenter").fieldValue()));
	}
	
	//保存按钮
	function func_button_save() {
		$('#grid_kacAppUCIP').grid('saveRows');
	}
	
	//经度验证
	function func_set_longitude() {
		var cell = this.col.cell;
		var rowElement = cell.parent("tr:first");

		var longitudeIndex = $('td.longitude:first').prevAll().length;
		var longitudeTemp = rowElement.find('td:eq(' + longitudeIndex + ')').text();
		
		var longitude=trim(longitudeTemp);
		
		if(undefined != longitude && null != longitude){
			if (!checkCH(12, longitude)) {				
				rowElement.find('td:eq(' + longitudeIndex + ')')
				.addClass("editing edited validate-error")
				.attr("title", "${i18n.zuidcdJD}");
				return false;
			}
		}
	}
	
	//纬度验证
	function func_set_latitude() {
		var cell = this.col.cell;
		var rowElement = cell.parent("tr:first");

		var latitudeIndex = $('td.latitude:first').prevAll().length;
		var latitudeTemp = rowElement.find('td:eq(' + latitudeIndex + ')').text();
		
		var latitude=trim(latitudeTemp);
		
		if(undefined != latitude && null != latitude){
			if (!checkCH(12, latitude)) {				
				rowElement.find('td:eq(' + latitudeIndex + ')')
				.addClass("editing edited validate-error")
				.attr("title", "${i18n.zuidcdWD}");
				return false;
			}
		}
	}
	
	//申报距离验证
	function func_set_shenbjl() {
		var cell = this.col.cell;
		var rowElement = cell.parent("tr:first");

		var shenbjlIndex = $('td.shenbjl:first').prevAll().length;
		var shenbjlTemp = rowElement.find('td:eq(' + shenbjlIndex + ')').text();
		
		var shenbjl=trim(shenbjlTemp);
		
		if(undefined != shenbjl && null != shenbjl){
			if (!checkCH(5, shenbjl)) {				
				rowElement.find('td:eq(' + shenbjlIndex + ')')
				.addClass("editing edited validate-error")
				.attr("title", "最大距离不能超过5位");
				return false;
			}
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