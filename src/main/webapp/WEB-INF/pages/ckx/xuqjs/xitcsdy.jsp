<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="${i18n.xitcsdy}">

<!-- 
	  系统参数定义
	 @author denggq
	 @date 2012-3-19
 -->
 
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
</head>

<t:page i18n="i18n.ckx.xuqjs.i18n_xitcsdy">
	<t:grid id="grid_xitcsdy" caption="${i18n.xitcsdy}" 
		idKeys="zidlx,zidbm"
		add="NOT"
		back="NOT"
		src="/xuqjs/queryXitcsdy.ajax"
		removeSrc="/xuqjs/removeXitcsdy.ajax"
		dataFormId="form_xitcsdy" 
		load="false" 
		showNum="true"
		scrollHeight="320"  pageSize="15"
		>
		<t:fieldLayout id="layout" prefix="xitcsdy" columns="3">
			<t:fieldSelect property="zidlxmc" caption="${i18n.zidlxmc}"  width="150" src="/xuqjs/getZidlxmc.ajax" show="zidlxmc" code="zidlxmc"/>
			<t:fieldText property="zidmc" caption="${i18n.zidmc}"  width="150"/>
		</t:fieldLayout>
		<t:gridCol property="zidlx" caption="${i18n.zidlx}"/>
		<t:gridCol property="zidlxmc" caption="${i18n.zidlxmc}" width="150"/>
		<t:gridCol property="zidbm" caption="${i18n.zidbm}"/>
		<t:gridCol property="zidmc" caption="${i18n.zidmc}" width="170"/>
		<t:gridCol property="beiz" caption="${i18n.beiz}" width="150"/>
		<t:gridCol property="shifqj" caption="${i18n.shifqj}" convert="shifqj" width="120"/>
		<t:gridCol property="qujzxz" caption="${i18n.qujzxz}" width="120"/>
		<t:gridCol property="qujzdz" caption="${i18n.qujzdz}" width="120"/>
		<t:gridCol property="paix" caption="${i18n.paix}"/>
	</t:grid>
	
	<t:form dialog="true" id="form_xitcsdy" idKeys="zidlx" action="/xuqjs/saveXitcsdy.ajax?operant=2" width="900" reset="NOT" submit="NOT">
		<t:fieldLayout prefix="record1" columns="3">
			<t:fieldText property="zidlx" caption="${i18n.zidlx}" dataType="text" maxLength="10" notNull="true"/>
			<t:fieldText property="zidlxmc" caption="${i18n.zidlxmc}" notNull="true"/>
		</t:fieldLayout>
		<t:fieldLayout prefix="record2" showLabel="false" columns="1">
			<t:fieldGrid property="list" parents="zidlx,zidlxmc" width="900">
				<t:grid id="zidlist" idKeys="zidbm" src="/xuqjs/queryXitcsdy.ajax" panel="false" editable="true" load="false" showNum="true"
					showEditorAddName="editorAdd" showEditorRemoveName="editorRemove"
					add="NOT" edit="NOT" remove="NOT" submit="NOT" save="NOT" reset="NOT" back="NOT" preSaveRowsEvent="preSaveEvent" >
					<t:fieldLayout prefix="record1">
						<t:fieldHidden property="zidlx" caption="${i18n.zidlx}"/>
					</t:fieldLayout>
					<t:gridCol property="zidbm" caption="${i18n.zidbm}${i18n.bitx}" editor="fieldText" 
						editorOptions="{'dataType':'text','maxLength':'10','notNull':true}" width="100" />
					<t:gridCol property="zidmc" caption="${i18n.zidmc}${i18n.bitx}" editor="fieldText" width="180" 
						editorOptions="{'notNull':true,closeEvent:func_set_zidmc,'maxLength':'40'}"/>
					<t:gridCol property="beiz" caption="${i18n.beiz}" editor="fieldText" width="160" editorOptions="{'maxLength':'100'}"/>
					<t:gridCol property="shifqj" caption="${i18n.shifqj}" editor="fieldSelect" convert="shifqj" width="100" editorOptions="{'notNull':true}"/>
					<t:gridCol property="qujzxz" caption="${i18n.qujzxz}" editor="fieldText" width="110" 
						editorOptions="{'expression':'^[1-9][0-9]{0,8}(?:\.[0-9]{1,3})?$|0\.[0-9]{1,3}$','expressionMessage':'${i18n.qujzxz_ex_mes}'}"/>
					<t:gridCol property="qujzdz" caption="${i18n.qujzdz}" editor="fieldText" width="110" 
						editorOptions="{'expression':'^[1-9][0-9]{0,8}(?:\.[0-9]{1,3})?$|0\.[0-9]{1,3}$','expressionMessage':'${i18n.qujzdz_ex_mes}'}"/>
					<t:gridCol property="paix" caption="${i18n.paix}" editor="fieldText" 
						editorOptions="{'expression':'^[1-9][0-9]{0,4}$','expressionMessage':'${i18n.paix_ex_mes}','notNull':true}" width="90"/>
					<t:gridCol property="" caption="" width="20"/>
				</t:grid>
			</t:fieldGrid>
		</t:fieldLayout>
		<t:button caption="${i18n.submit_zdy}" name="submit_zdy"></t:button>
	</t:form>
	
</t:page>

<script type="text/javascript">

	//标识
	$.sdcui.serverConfig.convertArray['shifqj'] = {
		'1' : '${i18n.shi}',
		'0' : '${i18n.fou}'
	};
	
	
	//空格查询
	function grid_xitcsdy_beforeSubmit() {
		$("#layout_zidlx").fieldValue(trim($("#layout_zidlx").fieldValue()));
		$("#layout_zidlxmc").fieldValue(trim($("#layout_zidlxmc").fieldValue()));
		$("#layout_zidbm").fieldValue(trim($("#layout_zidbm").fieldValue()));
	}
	
	
	//修改按钮
	function func_button_edit(){
		$("#form_xitcsdy").form('clear');
		$('#form_xitcsdy').removeClass('operant-add');
		var record = $("#grid_xitcsdy").grid("getSelectedRecords")[0];
		
		$("#form_xitcsdy").form('fillRecord', $.extend({}, record));
		
		$('#zidlist').grid('reload');
		
		$("#form_xitcsdy").form("open","${i18n.update}");
	}
	
	
	//复制
	function func_button_copy(){
		var record = $("#grid_xitcsdy").grid("getSelectedRecords")[0];
		if(undefined != record){
			$("#copy_yzidlx").fieldValue(record.zidlx);
		}
		$("#form_copy").form("open");
	}
	
	function func_button_submit_zdy(){
	
// 		var zidlxmc = trim($("#record1_zidlxmc").fieldValue());
// 		if (!checkCH(40, zidlxmc)) {
// 			alert("${i18n.zidlxmczdcd}");
// 			return false;
// 		}

		if($("#zidlist").grid("isEditedCell")){
			$("#zidlist").grid("saveRows");
		}else{			
			$('#form_xitcsdy').form('submit');
		}		
	}	
	function preSaveEvent(){		
		$('#form_xitcsdy').form('submit');
		return false;
	}
	
	//关闭弹出窗口
	function form_xitcsdy_afterSubmit() {
		$('#form_xitcsdy').grid('close'); 
	}
	
	//字典名称长度为40
	function func_set_zidmc() {
		var cell = this.col.cell;
		var rowElement = cell.parent("tr:first");

		var zidmcIndex = $('td.zidmc:last').prevAll().length;
		var zidmcTemp = rowElement.find('td:eq(' + zidmcIndex + ')').text();
		
		var zidmc=trim(zidmcTemp);
		
		if(undefined != zidmc && null != zidmc){
			if (!checkCH(40, zidmc)) {
				rowElement.find('td:eq(' + zidmcIndex + ')')
				.addClass("editing edited validate-error")
				.attr("title", "${i18n.zidmczdcd}");
				return false;
			}
		}
		return true;
	}
	
	//页面初始化
	function initPage(){
		//字典类型名称长度最大40
		$("#record1_zidlxmc input").blur(function() {

			var zidlxmc = trim($("#record1_zidlxmc").fieldValue());
			if(undefined != zidlxmc && null != zidlxmc){
				if (!checkCH(40, zidlxmc)) {
					alert("${i18n.zidlxmczdcd}");
					return false;
				}
			}
			
			//查询字典名称
			var zidmc = trim($("#xitcsdy_zidmc").fieldValue());
			if(undefined != zidmc && null != zidmc){
				if(undefined != zidmc && null != zidmc){
					if (!checkCH(40, zidmc)) {
						alert("${i18n.zidmczdcd}");
						return false;
					}
				}
			}
			
			//查询字典类型名称
			var zidlxmc = trim($("#xitcsdy_zidlxmc").fieldValue());
			if(undefined != zidlxmc && null != zidlxmc){
				if (!checkCH(40, zidlxmc)) {
					alert("${i18n.zidlxmczdcd}");
					return false;
				}
			}
			
			return true;
		});	
	}
	
</script>

</t:html>