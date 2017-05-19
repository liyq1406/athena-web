<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html>
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
	</head>
	
	<t:page i18n="i18n.xqjs.ildingd.ildingddy" >
		<t:grid id="grid_ildingddy" dataFormId="form_ildingddy" load="false" showNum="true" scrollHeight="282"
		  idKeys="dingdh,usercenter" src="/ilorder/queryDingd.ajax" removeSrc="/ilorder/removeDingd.ajax">
			<t:fieldLayout prefix="gridLayout" columns="3">
				<t:fieldSelect property="usercenter" width="150" caption="${i18n.usercenter}"
					convert="queryUserCenterMap" ></t:fieldSelect>
				<t:fieldText property="dingdh" caption="${i18n.dingdh}" width="150" maxLength="9"></t:fieldText>
				<t:fieldText property="editor" caption="${i18n.weihr}" width="150" maxLength="20"></t:fieldText>
				<t:fieldSelect property="dingdlx" caption="${i18n.dingdlx}"
					convert="dingdlx" width="150"></t:fieldSelect>
					<t:fieldHidden property="dingdzt" defaultValue="0"></t:fieldHidden>
				<t:fieldCalendar property="heth" caption="${i18n.zhizsj}"
					format="yyyy-MM-dd HH:mm" width="150"></t:fieldCalendar>
				<t:fieldCalendar property="jislx" caption="${i18n.zhi}"
					format="yyyy-MM-dd HH:mm" width="150"></t:fieldCalendar>
				<t:fieldHidden property="editorHidden"></t:fieldHidden>
			</t:fieldLayout>
			<t:gridCol property="dingdh" caption="${i18n.dingdh}"></t:gridCol>
			<t:gridCol property="dingdlx" convert="dingdlx" caption="${i18n.dingdlx}"></t:gridCol>
			<t:gridCol property="gongysdm" caption="${i18n.gongysdm}"></t:gridCol>
			<t:gridCol property="heth" caption="${i18n.heth}"></t:gridCol>
			<t:gridCol property="dingdnr" caption="${i18n.dingdnr}"></t:gridCol>
			<t:gridCol property="jiszq"  caption="计算周期"></t:gridCol>
			<t:gridCol property="chullx" caption="${i18n.leix}"></t:gridCol>
			<t:gridCol property="editor" caption="${i18n.weihr}"></t:gridCol>
			<t:gridCol property="dingdjssj" caption="${i18n.zhizsj}"></t:gridCol>
			<t:gridCol property="dingdzt" convert="queryDingdzt" caption="${i18n.dingdzt}"></t:gridCol>
		</t:grid>
		<t:form dialog="true" id="form_ildingddy" caption="${i18n.tianjdd}" idKeys="dingdh,usercenter" action="/ilorder/addDingd.ajax" reset="NOT">
			<t:fieldLayout prefix="kdorder"  id="add_kdorder">
					<t:fieldText  property="dingdh" notNull="true" caption="${i18n.dingdh}" maxLength="9"></t:fieldText>
			     	<t:fieldSelect property="dingdlx" notNull="true" readonly="true" defaultValue="9" caption="${i18n.dingdlx}" convert="dingdlx"></t:fieldSelect>
			     	<t:fieldSelect property="usercenter" width="150" caption="${i18n.usercenter}"
					convert="queryUserCenterMap" notNull="true"></t:fieldSelect>
					<t:fieldText property="gongysdm" caption="${i18n.gongysdm}" validateSrc="/ilorder/checkGongys.ajax" notNull="true" width="150" maxLength="10"></t:fieldText>
					<t:fieldText property="jiszq" caption="计算周期" notNull="true" expression="^[0-9]{6}$" expressionMessage="6位的日期：yyyyMM" width="150" maxLength="6"></t:fieldText>
					<t:fieldText  property="dingdnr" notNull="true"  caption="${i18n.dingdnr}"  maxLength="5"></t:fieldText>
					<t:fieldSelect  property="chullx" defaultValue="PP" convert="chullx" notNull="true" caption="${i18n.leix}"></t:fieldSelect>
				    <t:fieldText property="editor"   defaultValue="${editor }" caption="${i18n.weihr}" readonly="true" maxLength="20"></t:fieldText>
				    <t:fieldSelect property="dingdzt" defaultValue="0" readonly="true" notNull="true" caption="${i18n.dingdzt}" convert="queryDingdzt"></t:fieldSelect>
				    <t:fieldHidden property="dingdjssj"></t:fieldHidden>
				    <t:fieldHidden property="creator" defaultValue="${creator }"></t:fieldHidden>
				    <t:fieldHidden property="create_time"  defaultValue="${create_time }"></t:fieldHidden>
					<t:button caption="重置" name="resetForm"></t:button>
			</t:fieldLayout>
			</t:form>
	</t:page>
		
	<script type="text/javascript">
	 function initPage(){
	    	$('#kdorder_jiszq').bind('focusout',function(){
				var jiszq = $("#kdorder_jiszq").fieldValue();
				if(jiszq.length != 6){
					alert('计算周期请输入6位数字');
				}else{
					$.sdcui.ajaxUtil.ajax({
						url:'queryDingdNr.ajax?jiszq='+jiszq,
						success:function(result){
							$("#kdorder_dingdnr").fieldValue(result.result);
						}
						});	
				}
			});
	    }

	
	$.sdcui.serverConfig.convertArray['dingdlx']={'9':'卷料订单'};
	$.sdcui.serverConfig.convertArray['chullx']={'PP':'周期'};
	
	function func_button_edit(){
		$("#form_ildingddy").form('clear');
		$('#form_ildingddy').removeClass('operant-add');
		func_initFrom();
		$("#form_ildingddy").form("open","${i18n.update }");
	}
	
	function func_button_resetForm(){
		var classStr = $('#form_ildingddy').attr("class");
		if(classStr.indexOf('operant-add')>0)
		{
			$("#form_ildingddy").form('reset');
		}
		else
		{
			func_initFrom();
		}
	}
	
	function func_initFrom()
	{
		var record = $("#grid_ildingddy").grid("getSelectedRecords")[0];
		record.editor=$("#gridLayout_editorHidden").fieldValue();
		var tempsj = record.dingdjssj;
		var tempsj1= tempsj.substring(0,10);
		var tempsj2 = tempsj.substring(tempsj.length-5,tempsj.length);
		var sj = tempsj1+" "+tempsj2;
		record.dingdjssj = sj;
		$("#form_ildingddy").form('fillRecord', $.extend({}, record));
	}
	</script>
	<style type="text/css">
	</style>
</t:html>