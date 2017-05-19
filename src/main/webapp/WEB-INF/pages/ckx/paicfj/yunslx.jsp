<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html title="${i18n.chanxz }">
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<style type="text/css">
 .youi-fieldLayout table td.contral.label-col { width: 110px; }
</style>
</head>
<t:page i18n="i18n.ckx.paicfj.i18n_yunslx">

		<t:grid id="grid_yunslx" caption="${i18n.yunslx}" idKeys="usercenter,yunssbh"
			src="/paicfj/queryYunslx.ajax" showNum="true"	scrollHeight="90"	 clickRowEvent="grid_yunslx_click"
			 load="false" remove="NOT" dataFormId="form_yunslx">
			<t:fieldLayout id="c" prefix="yunslx" columns="2">
			    <t:fieldSelect property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap" defaultValue="${loginUsercenter }" />
				<t:fieldText property="yunslxbh" caption="${i18n.yunslxbh}" dataType="text" maxLength="10"/>
				<t:fieldSelect property="biaos" caption="${i18n.active}"  convert="active" defaultValue="1"   />
			</t:fieldLayout>
			<t:gridCol property="usercenter" caption="${i18n.usercenter}"convert="queryUserCenterMap"></t:gridCol>
			<t:gridCol property="yunslxbh" caption="${i18n.yunslxbh}" width="120"></t:gridCol>
			<t:gridCol property="yunslxmc" caption="${i18n.yunslxmc}" width="120"></t:gridCol>
			<t:gridCol property="zuidtqfysj" caption="${i18n.zuidtqfysj}(分钟)" width="150"></t:gridCol>
			<t:gridCol property="biaos" caption="${i18n.active}" convert="active"></t:gridCol>
			<t:button caption="${i18n.shix}" name="btnDel" active="1" icon="removeRecord"></t:button>
		</t:grid>
		<t:grid id="grid_yunslxjfsk" caption="${i18n.yunslxjfsk}" idKeys="usercenter,yunssbh,xingqxh,jiaofsk" submit="NOT" reset="NOT"
			src="/paicfj/queryYunslxJiaof.ajax" showNum="true" scrollHeight="90"	load="false" remove="NOT" add="NOT" edit="NOT">
			 <t:fieldLayout prefix="jfsk" columns="2">
			    <t:fieldHidden property="usercenter" caption="${i18n.usercenter}"  />
				<t:fieldHidden property="yunslxbh" caption="${i18n.yunslxbh}" />
			</t:fieldLayout>
			<t:gridCol property="usercenter" caption="${i18n.usercenter}"convert="queryUserCenterMap"></t:gridCol>
			<t:gridCol property="yunslxbh" caption="${i18n.yunslxbh}" width="120"></t:gridCol>
			<t:gridCol property="xingqxh" caption="${i18n.xiqxh}"></t:gridCol>
			<t:gridCol property="jiaofsk" caption="${i18n.jiaofsk}"></t:gridCol>
		</t:grid>
		<t:form id="form_yunslx" caption="${i18n.yunslx}" action="/paicfj/saveYunslx.ajax" 
		reset="NOT" dialog="true" idKeys="usercenter,yunslxbh" width="700">
			<t:fieldLayout columns="2" prefix="f_yunslx" width="700">
				<t:fieldSelect property="usercenter" caption="${i18n.usercenter}"  convert="queryUserCenterMap" defaultValue="${loginUsercenter }"></t:fieldSelect>
				<t:fieldText property="yunslxbh" caption="${i18n.yunslxbh}" dataType="text" notNull="true" maxLength="3"/>
			    <t:fieldText property="yunslxmc" caption="${i18n.yunslxmc}"  maxLength="40"/>
			    <t:fieldText property="zuidtqfysj" caption="${i18n.zuidtqfysj}" expression="^(0|[1-9][0-9]{0,8})$" expressionMessage="请输入正整数类型" notNull="true" maxLength="5"/>
			    <t:fieldSelect property="biaos" caption="${i18n.active}" convert="active" defaultValue="1"  notNull="true"/>
				<t:fieldCustom property="biaos"></t:fieldCustom>
				<t:fieldGrid property="jfsk" parents="usercenter,yunslxbh" mode="reload" caption="${i18n.yunslxjfsk}" column="2" width="680">
					<t:grid id="form_grid_jiaofsk" panel="false"  scrollHeight="150"
					showEditorAddName="editorAdd" showEditorRemoveName="editorRemove"
					idKeys="usercenter,yunssbh,xingqxh,jiaofsk"	src="/paicfj/queryYunslxJiaof.ajax" 
					showNum="true"	load="false" submit="NOT" reset="NOT" editable="true">
					<t:gridCol property="xingqxh" caption="${i18n.xiqxh}" editor="fieldSelect" convert="queryXQ" editorOptions="{'notNull':true}"></t:gridCol>
					<t:gridCol property="jiaofsk" caption="${i18n.jiaofsk}" editor="fieldText" editorOptions="{'notNull':true,'expression':'^(0[0-9]{1}|1[0-9]{1}|2[0-3]):[0-5][0-9]{1}$','expressionMessage':'请填写5位时间格式(hh24:mm)'}"></t:gridCol>
						<t:gridCol property="a" caption="   "
				></t:gridCol>
					</t:grid>
				</t:fieldGrid>
			</t:fieldLayout>
		</t:form>
</t:page>
</t:html>
<script type="text/javascript">

$.sdcui.serverConfig.convertArray['active'] = {
		'0' : '${i18n.wux}',
		'1' : '${i18n.youx}'
	};
	function grid_yunslx_beforeSubmit() {
		$("#yunslx_yunssbh").fieldValue(trim($("#yunslx_yunssbh").fieldValue()));
		$("#yunslx_yunslxbh").fieldValue(trim($("#yunslx_yunslxbh").fieldValue()));
	}
	function grid_yunslx_click(record, rowIndex) {	
		$("#jfsk_usercenter").fieldValue(trim(record.usercenter));
		$("#jfsk_yunslxbh").fieldValue(trim(record.yunslxbh));
		$("#grid_yunslxjfsk").grid("reload");
		$('#grid_yunslxjfsk').parent().parent().show();	
		
	}
	function func_button_edit() {
		$("#form_yunslx").form('clear');
		$('#form_yunslx').removeClass('operant-add');
		var record = $("#grid_yunslx").grid("getSelectedRecords")[0];
		$("#form_yunslx").form('fillRecord', $.extend({
			jfsk : '--'
		}, record));
		$("#form_yunslx").form("open", "${i18n.update}");
	}
	function f_yunslx_biaos_change(){
		if('0'== $("#f_yunslx_biaos").fieldValue()){
			$("#f_yunslx_biaos").removeClass('disabled');
			$("#f_yunslx_biaos input").attr("disabled",false);
		}else{
			$("#f_yunslx_biaos").addClass('disabled');
			$("#f_yunslx_biaos input").attr("disabled",true);
		}
	}
	function func_button_btnDel() {
		
		var row = $("#grid_yunslx").grid("getSelectedRecords")[0];
		if ('1' == row.biaos) {
		     if (confirm("${i18n.niqdysx}?")) {
				$.sdcui.ajaxUtil
						.ajax({
						url : "${ctx}/paicfj/removeYunslx.ajax?usercenter="
											+ row.usercenter
											+ "&yunslxbh="
											+ row.yunslxbh,
						success : function() {
											$("#grid_yunslx").grid("reload");
								}
				});
			}							
		} else {
			alert("${i18n.shujsxcg}");
		}
	
	}
	function form_yunslx_beforeSubmit() {
		var f_yunslx_yunslxmc = $("#f_yunslx_yunslxmc").fieldValue();
		var params = [];			
		params.push(zobj(40,f_yunslx_yunslxmc,"${i18n.yunslxmc}"));		
		return checkAllChina(params);
		
	}
	function initPage(){
		//查询页面子表隐藏
		$('#grid_yunslxjfsk').parent().parent().hide();
	}
</script>
