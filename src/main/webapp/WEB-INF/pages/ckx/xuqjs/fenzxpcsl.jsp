<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="role" value="${role}"/>

<t:html title="lixd">

<!-- 
	  分装线排产数量
 -->
 
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 120px; } </style>
</head>

<t:page i18n="i18n.ckx.xuqjs.i18n_fenzxpcsl">
	<t:grid id="grid_fenzxpcsl" caption="${i18n.fenzxpcsl}" idKeys="usercenter,daxxh,fenzxh,riq" remove="NOT" load="false" showNum="true" dataFormId="form_fenzxpcsl" back="NOT"
		 src="/xuqjs/queryFenzxpcsl.ajax" scrollHeight="295" pageSize="10">
		<t:fieldLayout prefix="record" columns="3">
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap" width="150"/>
			<t:fieldText property="daxxh" caption="${i18n.daxxh}" maxLength="5" minLength="5" width="150"/>
			<t:fieldText property="fenzxh" caption="${i18n.fenzxh}" maxLength="5" minLength="5" width="150"/>
			<t:fieldCalendar property="kaissj" format="yyyy-MM-dd" caption="${i18n.kaissj}" width="150"></t:fieldCalendar>
			<t:fieldCalendar property="jiessj" format="yyyy-MM-dd" caption="${i18n.jiessj}" width="150"></t:fieldCalendar>
		</t:fieldLayout>
		
		<t:button name="deleteFenzxpcsl" caption="${i18n.delete}"  active="1" icon="removeRecord"></t:button>
		
		<t:gridCol property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap"  width="80"></t:gridCol>
		<t:gridCol property="daxxh" caption="${i18n.daxxh}" width="100"></t:gridCol>
		<t:gridCol property="fenzxh" caption="${i18n.fenzxh}" width="100"></t:gridCol>
		<t:gridCol property="riq" caption="${i18n.riq}" width="100"></t:gridCol>
		<t:gridCol property="jihsxl" caption="${i18n.jihsxl}" width="100"></t:gridCol>
		<t:gridCol property="jihxxl" caption="${i18n.jihxxl}" width="100"></t:gridCol>
		<t:gridCol property="beiz" caption="${i18n.beiz}" width="150"></t:gridCol>
		<t:gridCol property="" caption=""></t:gridCol>
	</t:grid>
	
	
	<!-- 新增、修改form -->
	<t:form id="form_fenzxpcsl" caption="${i18n.fenzxpcsl}" action="/xuqjs/saveFenzxpcsl.ajax" idKeys="usercenter,daxxh,fenzxh,riq" dialog="true" reset="NOT" width="600">
		<t:fieldLayout columns="2" prefix="fenzxpcsl">
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap" notNull="true" width="150"/>
			<t:fieldSelect property="daxxh" caption="${i18n.daxxh}"  src="/xuqjs/listHanzdx.ajax" show="daxxh" code="daxxh" notNull="true" width="150" parents="usercenter"/>
			<t:fieldText property="fenzxh" caption="${i18n.fenzxh}" maxLength="5" minLength="5" notNull="true" width="150"/>
			<t:fieldCalendar property="riq" format="yyyy-MM-dd" caption="${i18n.riq}" notNull="true" width="150"></t:fieldCalendar>
			<t:fieldText property="jihsxl" caption="${i18n.jihsxl}" maxLength="4" expression="^[1-9][0-9]{0,3}$|^0$" expressionMessage="${i18n.jihsxl_ex_mes}" notNull="true" width="150"/>
			<t:fieldText property="jihxxl" caption="${i18n.jihxxl}" maxLength="4" expression="^[1-9][0-9]{0,3}$|^0$" expressionMessage="${i18n.jihsxl_ex_mes}" notNull="true" width="150"/>
		</t:fieldLayout>
		<t:fieldLayout prefix="fenzxpcsl" columns="1">
			<t:fieldArea property="beiz" caption="${i18n.beiz}" width="450"/>
		</t:fieldLayout>
	</t:form>
	
</t:page>

<script type="text/javascript">

	//修改按钮
	function func_button_edit() {
		
		$('#form_fenzxpcsl').form("clear");//清除弹出窗口的数据
		
		$('#form_fenzxpcsl').removeClass('operant-add');//增加的operant为1，修改的operant为2
		
		var record = $("#grid_fenzxpcsl").grid("getSelectedRecords")[0];//选中的行的数据
		
		$('#form_fenzxpcsl').form('fillRecord', $.extend({}, record));
		
		$("#form_fenzxpcsl").form("open","${i18n.update}");
		
		
	}
	
	//删除按钮
	function func_grid_deleteFenzxpcsl(){
		var record = $('#grid_fenzxpcsl').grid('getSelectedRecords')[0];
		if(confirm("${i18n.quedsc}")){					
			$.sdcui.ajaxUtil.ajax({
				url : "deleteFenzxpcsl.ajax?usercenter="+record.usercenter+"&daxxh="+record.daxxh+"&fenzxh="+record.fenzxh+"&riq="+record.riq,
				success : function() {
					$("#grid_fenzxpcsl").grid("reload");
					//$('#field-pop-record0_bianzh').removeClass("loaded");//刷新表格数据
				}
			});
		}				
	}
</script>

</t:html>