<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html title="${i18n.scodegl}">
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
</head>
<t:page i18n="i18n.print.i18n_print">
	<t:grid id="grid_ckx_printDjlx" caption="${i18n.scodelist}" 
		src="/sys/queryPrintDjlx.ajax"
		removeSrc="/sys/removePrintDjlx.ajax"
		saveRowsSrcs="/sys/savePrintDjlx.ajax"
		idKeys="usercenter,zidbm" 
		load="false" 
		 back="NOT"
		editable="true" 
		showNum="true"
		>
		<t:fieldLayout id="djlx" prefix="dj" columns="3">
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter}"
				defaultValue="${loginUsercenter }" convert="queryUserCenterMap"/>
			<t:fieldText property="zidbm" caption="${i18n.zidbm}"
					dataType="text" maxLength="10"></t:fieldText>
			<t:fieldText property="zidmc" caption="${i18n.zidmc}" maxLength="40"></t:fieldText>	
		</t:fieldLayout>
		<t:gridCol property="usercenter" caption="${i18n.usercenter}" editor="fieldSelect" convert="queryUserCenterMap" editorOptions="{'notNull':true}"></t:gridCol>
		<t:gridCol property="zidbm" caption="${i18n.zidbm}" editor="fieldText" editorOptions="{'maxLength':'10','dataType':'text','notNull':true}"></t:gridCol>
		<t:gridCol property="zidmc" caption="${i18n.zidmc}" width="150" editor="fieldText" editorOptions="{'maxLength':'40','notNull':true}"></t:gridCol>
		<t:gridCol property="beiz" caption="${i18n.beiz}" width="150" editor="fieldText" editorOptions="{'maxLength':'200','dataType':'text'}"></t:gridCol>
		<t:gridCol property="" caption=""/>
	</t:grid>
</t:page>
</t:html>

<script>
	$.sdcui.serverConfig.convertArray['usercenter'] = {'UW':'${i18n.yic},${i18n.erc}','UL':'${i18n.sanc}','UX':'${i18n.xiangy}'};
 	
 	//查询前触发的函数
 	function grid_ckx_printDjlx_beforeSubmit(){
 		var zidbmStr = $('#dj_zidbm').fieldValue();
		$('#dj_zidbm').fieldValue(trim(zidbmStr));
		var zidmcStr = $('#dj_zidmc').fieldValue();
		$('#dj_zidmc').fieldValue(trim(zidmcStr));
 	}

	//保存按钮
	function func_button_save() {
		$('#grid_usercenter').grid('saveRows');
	}
	
	
</script>