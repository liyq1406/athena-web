<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="${i18n.title}">

<!-- 
	
	 @author denggq
	 @date 2012-4-12
 -->
 
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 75px; } </style>
</head>

<t:page i18n="i18n.ckx.xuqjs.i18n_quhys">
	<t:grid id="grid_jinjjyfgl" caption="" 
	idKeys="usercenter,gongysdm,chengysdm,ruksj" 
	back="NOT" 
	remove="NOT" 
	scrollHeight="335" 
	pageSize="15"
	src="/qhysfy/queryRukmxJij.ajax" 
	load="false" 
	showNum="true" 
	editable="true" 
	afterSaveRowsEvent="afterSaveRows"
	saveRowsSrcs="../qhysfy/updateRukmxJinjj.ajax"
	showEditorAddName="editorAdd" 
	showEditorRemoveName="editorRemove"
>
		
		<t:fieldLayout   prefix="record_jinjjyfgl" columns="4">
			<t:fieldSelect property="usercenter" caption="用户中心"   defaultValue="${usercenter}" convert="queryUserCenterMap" width="110"/>
			<t:fieldText property="gongysdm" caption="供应商代码"  maxLength="10" minLength="10" width="110"/>
			<t:fieldText property="chengysdm" caption="承运商代码"  maxLength="10" minLength="10" width="110" />
			<t:fieldSelect property="biaos" caption="${i18n.biaos}" convert="biaos" defaultValue="1" width="150"/>
			<t:fieldCalendar  property="qisruksj" format="yyyy-MM-dd" caption="入库日期" width="130" ></t:fieldCalendar>
			<t:fieldCalendar property="jisruksj" format="yyyy-MM-dd" caption="至" width="130" ></t:fieldCalendar>
			<t:fieldHidden property="danjlx" defaultValue="2"> </t:fieldHidden>
		
			<t:fieldSelect property="shenhzt" caption="审核状态" convert="shenhzt"  width="150"/>
		</t:fieldLayout>
		

		
		<t:gridCol property="usercenter" caption="用户中心" editor="fieldSelect" 
		           convert="queryUserCenterMap" defaultValue="${usercenter}" editorOptions="{'notNull':true}"></t:gridCol>
		<t:gridCol property="chengysdm" caption="承运商代码" editor="fieldText" width="90" 
		           editorOptions="{'maxLength':'10','minLength':'10','expression':exp,'expressionMessage':'只能输入大写字母或数字,固定长度10位,7,8位能输入空格','notNull':true}"></t:gridCol>
	
		<t:gridCol property="gongysdm" caption="供应商代码" editor="fieldText" width="90" 
		           editorOptions="{'maxLength':'10','minLength':'10','expression':exp,'expressionMessage':'只能输入大写字母或数字,固定长度10位,7,8位能输入空格','notNull':true}"></t:gridCol>

		<t:gridCol  property="lingjsl" editor="fieldText" caption="趟次"  width="70" 
		   editorOptions="{'expression':'^(0|[1-9][0-9]{0,8})$','expressionMessage':'只能输入0-999999999之间的整数值','notNull':true}"></t:gridCol>
	

		<t:gridCol  property="xinjjfy" caption="运输费用"  width="70" ></t:gridCol>
			<t:gridCol property="ruksj" caption="入库时间" editor="fieldCalendar" width="150" 
		           editorOptions="{'format':'yyyy-MM-dd','notNull':true}"/>
	    <t:gridCol property="biaos" caption="${i18n.biaos}" convert="biaos" editor="fieldSelect" defaultValue="1" editorOptions="{'notNull':true}"/>
		<t:gridCol property="shenhzt" caption="审核状态" convert="shenhzt"  width="90" ></t:gridCol>
		<t:gridCol property="" caption=""/>
	</t:grid>	
</t:page>


<script type="text/javascript">

$.sdcui.serverConfig.convertArray['shenhzt'] = {
		'1' : '未审核',
		'2' : '已审核'
};

var exp = '^[0-9A-Z]{6}[\\s0-9A-Z]{2}[0-9A-Z]{2}$';

//标识
$.sdcui.serverConfig.convertArray['biaos'] = {
	'1' : '${i18n.youx}',
	'0' : '${i18n.wux}'
};

//行编辑保存后的方法
function afterSaveRows(result){

	if(false == result.success){
		return false;
	}
	$('#grid_jinjjyfgl').grid('reload');
	
	return true;
}







//提交创建或者修改form
function func_button_tijiao(){
			


	 var params = [];
	 
	 params.push("danjmc="+$("#danjmc").val());
	 params.push("usercenter="+$("#record_yushen_usercenter").fieldValue());
	 params.push("gongysdm="+$("#record_yushen_gongysdm").fieldValue());
	 params.push("chengysdm="+$("#record_yushen_chengysdm").fieldValue());
	 params.push("lingjbh="+$("#record_yushen_lingjbh").fieldValue());
	 params.push("baozxh="+$("#record_yushen_baozxh").fieldValue());
	 params.push("qisruksj="+$("#record_yushen_qisruksj").fieldValue());
	 params.push("jisruksj="+$("#record_yushen_jisruksj").fieldValue());
	 params.push("danjlx="+$("#record_yushen_danjlx").fieldValue());
	 $.sdcui.ajaxUtil.ajax({
			url : '../qhysfy/saveyushen.ajax',
			data:params.join('&'),
			success:function(result){
				if(typeof result.success=="undefined"||result.success!==false){
					$.sdcui.pageUtils.goPage({
						url : '../qhysfy/quhysfy.do',
						mode : 'form',
						beforeSubmit : function(){
							return true;
						}
				   });
				}
			}
	   });
}	

//导出数据
function func_button_download(){
	var usercenter = trim($('#record_yushen_usercenter').fieldValue());
	var gongysdm = trim($('#record_yushen_gongysdm').fieldValue());
	var chengysdm = trim($("#record_yushen_chengysdm").fieldValue());
	var lingjbh = trim($('#record_yushen_lingjbh').fieldValue());
	var baozxh = $('#record_yushen_baozxh').fieldValue();
	var lingjlx = $('#record_yushen_lingjlx').fieldValue();
	var qisruksj = $('#record_yushen_qisruksj').fieldValue();
	var jisruksj = $('#record_yushen_jisruksj').fieldValue();
	var danjh = $('#record_yushen_danjh').fieldValue();
	var shenhzt = $('#record_yushen_shenhzt').fieldValue();
	var danjlx = $('#record_yushen_danjlx').fieldValue();
	var record = {'usercenter':usercenter,'gongysdm':gongysdm,'chengysdm':chengysdm,'lingjbh':lingjbh,'baozxh':baozxh,'lingjlx':lingjlx,'qisruksj':qisruksj,'jisruksj':jisruksj,'danjh':danjh,'shenhzt':shenhzt,'danjlx':danjlx};
	$.sdcui.pageUtils.goPage({
		url : '../qhysfy/downloadYunsfyhz.do',
		record : record,
		mode : 'form',
		beforeSubmit : function(){
			return true;
		}
   });
}
</script>

</t:html>