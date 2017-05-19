<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html title="">
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>

</head>
<t:page i18n="i18n.ckx.transTime.i18n_yunssk">
	<t:grid id="grid_ckx_yunssk" caption="${i18n.yunssk }" idKeys="xuh,usercenter,xiehztbh,gcbh"
		src="/transTime/queryCkxYunssk.ajax" showNum="true"
		removeSrc="/transTime/removeCkxYunssk.ajax"
		dataFormId="form_ckx_yunssk"
		load="false" scrollHeight="335" pageSize="15">
		<t:fieldLayout id="yssk" prefix="yssk" columns="4">
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter }" convert="queryUserCenterMap"  defaultValue="${loginUsercenter }" width="110"/>
			<t:fieldText property="xiehztbh" caption="${i18n.xiehztbz }" dataType="text"
				maxLength="4"  width="110"/>
			<t:fieldText property="gcbh" caption="${i18n.gcbh }" dataType="text"
				maxLength="10"  width="110"/>
			<t:fieldCalendar property="gongzr" format="yyyy-MM-dd" caption="${i18n.gongzr }" width="120" ></t:fieldCalendar>
		</t:fieldLayout>
		<t:button caption="${i18n.daochu }"    name="download"></t:button>
		<t:gridCol property="usercenter" caption="${i18n.usercenter }" defaultValue="${loginUsercenter }" convert="queryUserCenterMap"></t:gridCol>
		<t:gridCol property="xiehztbh" caption="${i18n.xiehztbz }" ></t:gridCol>
		<t:gridCol property="gcbh" caption="${i18n.gcbh }" ></t:gridCol>
		<t:gridCol property="daohsj" caption="${i18n.daohsj }" ></t:gridCol>
		<t:gridCol property="facsj" caption="${i18n.facsj}" ></t:gridCol>
	</t:grid>
	
	<t:form id="form_ckx_yunssk" caption="${i18n.yunssk }" 
	dialog="true" idKeys="usercenter,xiehztbh,gcbh,xuh"
	action="/transTime/saveCkxYunssk.ajax" reset="NOT">
		<t:fieldLayout id="ysskForm" prefix="ysskForm" columns="2">
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter }" notNull="true" convert="queryUserCenterMap" defaultValue="${loginUsercenter }"/>
<%-- 			<t:fieldText property="xiehztbh" caption="${i18n.xiehztbh }" dataType="text"	maxLength="6" notNull="true"/> --%>
			<t:fieldText property="xiehztbh" caption="${i18n.xiehztbz }" maxLength="4" minLength="4" notNull="true" dataType="text"/>
			<t:fieldText property="gcbh" caption="${i18n.gcbh }" maxLength="10" notNull="true" dataType="text"/>
			<t:fieldHidden property="xuh" ></t:fieldHidden>
			<t:fieldCustom property="xuh"></t:fieldCustom>
		    <t:fieldCalendar property="daohsj" caption="${i18n.daohsj }" notNull="true" format="yyyy-MM-dd HH:mm:ss"></t:fieldCalendar>
		    <t:fieldCalendar property="facsj" caption="${i18n.facsj }" notNull="true" format="yyyy-MM-dd HH:mm:ss"></t:fieldCalendar>
		</t:fieldLayout>
	</t:form>
</t:page>
</t:html>
<script type="text/javascript">
	
	function grid_ckx_yunssk_beforeSubmit() {
		$("#yssk_xiehztbh").fieldValue(trim($("#yssk_xiehztbh").fieldValue()));
		$("#yssk_usercenter").fieldValue(trim($("#yssk_usercenter").fieldValue()));
	}
	
	function func_button_edit() {
		$("#form_ckx_yunssk").form('clear');
		$('#form_ckx_yunssk').removeClass('operant-add');
		var record = $("#grid_ckx_yunssk").grid("getSelectedRecords")[0];
		$("#form_ckx_yunssk").form('fillRecord', $.extend({}, record));
		$("#form_ckx_yunssk").form("open","${i18n.xiug }");
	}
	
	//导出数据
	function func_button_download(){
		var usercenter = trim($('#yssk_usercenter').fieldValue());
		var xiehztbh = trim($("#yssk_xiehztbh").fieldValue());
		var gcbh = trim($('#yssk_gcbh').fieldValue());
		var gongzr = $('#yssk_gongzr').fieldValue();
		if(gongzr == null  || gongzr ==""){
			alert("【工作日】不能为空");
			return false;
		} 
		var record = {'usercenter':usercenter,'xiehztbh':xiehztbh,'gcbh':gcbh,'gongzr':gongzr};
		$.sdcui.pageUtils.goPage({
			url : '/transTime/downloadCkxYunssk.do',
			record : record,
			mode : 'form',
			beforeSubmit : function(){
				return true;
			}
	   });
	}
</script>
