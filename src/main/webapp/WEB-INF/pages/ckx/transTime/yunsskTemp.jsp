<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html title="">
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>

</head>
<t:page i18n="i18n.ckx.transTime.i18n_yunsskTemp">
	<t:grid id="grid_ckx_yunsskTemp" caption="${i18n.yunsskTemp}" idKeys="xuh,usercenter,xiehztbh,gcbh"
		src="/transTime/queryCkxYunsskTemp.ajax" showNum="true" remove="NOT" edit="NOT" add="NOT" 
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
		<t:gridCol property="xiehztbh" caption="${i18n.xiehztbz }" width="110"></t:gridCol>
		<t:gridCol property="gcbh" caption="${i18n.gcbh }" ></t:gridCol>
		<t:gridCol property="daohsj" caption="${i18n.daohsj }" ></t:gridCol>
		<t:gridCol property="facsj" caption="${i18n.facsj}" ></t:gridCol>
	</t:grid>
</t:page>
</t:html>
<script type="text/javascript">
	
	function grid_ckx_yunsskTemp_beforeSubmit() {
		$("#yssk_xiehztbh").fieldValue(trim($("#yssk_xiehztbh").fieldValue()));
		$("#yssk_usercenter").fieldValue(trim($("#yssk_usercenter").fieldValue()));
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
			url : '/transTime/downloadCkxYunsskTemp.do',
			record : record,
			mode : 'form',
			beforeSubmit : function(){
				return true;
			}
	   });
	}
</script>
