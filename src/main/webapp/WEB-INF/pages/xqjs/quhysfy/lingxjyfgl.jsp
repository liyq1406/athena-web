<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="零星件运费管理">

 
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 75px; } </style>
</head>

<t:page i18n="">
	<t:grid id="grid_lingxjyfgl" caption="零星件运费管理" 
	        idKeys="usercenter,gongysdm,chengysdm,lingjbh,baozxh,ruksj,lxjlb" 
	        editable="true"  
	        back="NOT" 
	        scrollHeight="335" 
	        pageSize="15"
	        src="/qhysfy/queryLxjfygl.ajax" 
	        load="false" 
	        saveRowsSrcs="/qhysfy/savesLxjfygl.ajax"
	        showNum="true"
	        	afterSaveRowsEvent="afterSaveRows"
	        showEditorAddName="editorAdd" 
			showEditorRemoveName="editorRemove"
	        >
		
		<t:fieldLayout id="lingxjfygl" prefix="layout" columns="4">
			<t:fieldSelect property="usercenter" caption="用户中心" convert="queryUserCenterMap" defaultValue="${usercenter}"  width="110"/>			
			<t:fieldText property="gongysdm" caption="供应商代码" maxLength="10" minLength="10" width="110"/>
			<t:fieldText property="chengysdm" caption="承运商代码" maxLength="10" minLength="10" width="110"/>
			<t:fieldText property="lingjbh" caption="零件编号" maxLength="10" minLength="10" dataType="text" width="110"/>
		    <t:fieldCalendar property="qisruksj" caption="入库时间" format="yyyy-MM-dd" width="110"/>
 			<t:fieldCalendar property="jisruksj" caption="至" format="yyyy-MM-dd" width="110"/>
 			<t:fieldSelect property="biaos" caption="标识" convert="biaos" defaultValue="1" width="110"/>
 			<t:fieldSelect property="shenhzt" caption="审核状态" convert="shenhzt"  width="150"/>
 			<t:fieldSelect property="lxjlb" caption="零星件类型" src="/qhysfy/queryPostLxjlb.ajax"  code="key"   show="value" width="150"/>
		</t:fieldLayout>
		
		<t:button caption="下载模板" name="mobxz" active="0"/>
			
		<t:gridCol property="usercenter" caption="用户中心" editor="fieldSelect" 
		           convert="queryUserCenterMap" defaultValue="${usercenter}" editorOptions="{'notNull':true}"></t:gridCol>
		<t:gridCol property="chengysdm" caption="承运商代码" editor="fieldText" width="90" 
		           editorOptions="{'maxLength':'10','minLength':'10','expression':exp,'expressionMessage':'只能输入大写字母或数字,固定长度10位,7,8位能输入空格','notNull':true}"></t:gridCol>
		<t:gridCol property="gongysdm" caption="供应商代码" editor="fieldText" width="90" 
		           editorOptions="{'maxLength':'10','minLength':'10','expression':exp,'expressionMessage':'只能输入大写字母或数字,固定长度10位,7,8位能输入空格'}"></t:gridCol>
		
		<t:gridCol property="lingjbh" caption="零件编号" editor="fieldText" width="90" 
		           editorOptions="{'maxLength':'10','minLength':'10','dataType':'text'}"/>

		<t:gridCol property="xinlxfy" caption="零星费用" editor="fieldText" width="90" 
		           editorOptions="{'expression':'^[1-9][0-9]{0,6}(?:\.[0-9]{1,6})?$|0\.[0-9]{1,6}$|^0$','expressionMessage':'只能输入0-9999999.999999之间的数字','notNull':true}"/>
		<t:gridCol property="ruksj" caption="入库时间" editor="fieldCalendar" width="90" 
		           editorOptions="{'format':'yyyy-MM-dd','notNull':true}"/>

		<t:gridCol property="lxjlb" convert="queryLxjlb" caption="零星件类型" width="90" editor="fieldSelect" 
		          editorOptions="{'notNull':true}"/>
		 <t:gridCol property="shenhzt" caption="审核状态" convert="shenhzt"  width="90" ></t:gridCol>
		 <t:gridCol property="biaos" caption="标识" width="90" editor="fieldSelect" 
		           convert="biaos" defaultValue="1" editorOptions="{'notNull':true}"/>
		<t:gridCol property="" caption=" "></t:gridCol>
	</t:grid>
	<t:file action="/qhysfy/importAth_uploadlxjfygl.do" size="50">
		<t:fileparam sheet="lxjfyglMob" keys="usercenter,gongysdm,chengysdm,lingjbh,baozxh,ruksj" table="{dbSchemal3}ck_rukmx" 
		             dateColumns="ruksj" dateFormats="yyyy-MM-dd" datasourceId="1"/>
	</t:file>		
</t:page>

<script type="text/javascript">

var exp = '^[0-9A-Z]{6}[\\s0-9A-Z]{2}[0-9A-Z]{2}$';

$.sdcui.serverConfig.convertArray['shenhzt'] = {
		'1' : '未审核',
		'2' : '已审核'
	};

//标识
$.sdcui.serverConfig.convertArray['biaos'] = {
        '1' : '有效',
        '0' : '无效'
};

//空格查询
function grid_lingxjyfgl_beforeSubmit() {
	$("#layout_gongysdm").fieldValue(trim($("#layout_gongysdm").fieldValue()));
	$("#layout_chengysdm").fieldValue(trim($("#layout_chengysdm").fieldValue()));
	$("#layout_lingjbh").fieldValue(trim($("#layout_lingjbh").fieldValue()));
	$("#layout_baozxh").fieldValue(trim($("#layout_baozxh").fieldValue()));
	$("#layout_qisruksj").fieldValue(trim($("#layout_qisruksj").fieldValue()));
	$("#layout_jisruksj").fieldValue(trim($("#layout_jisruksj").fieldValue()));
	$("#layout_biaos").fieldValue(trim($("#layout_biaos").fieldValue()));
	
	//比较时间大小 结束时间必须大于开始时间
	if($("#layout_qisruksj").fieldValue()!="" && $("#layout_jisruksj").fieldValue()!=""){
		var qisruksj = new Date(($("#layout_qisruksj").fieldValue()).replace(/-/g,"/")); //起始日期 （将格式2014-10-12转换成2014/10/12）
		var jisruksj = new Date(($("#layout_jisruksj").fieldValue()).replace(/-/g,"/")); //结束日期（将格式2014-10-22转换成2014/10/22）
		if(qisruksj > jisruksj){
			alert("最大入库时间必须大于最小入库时间");
			return false;
		}
	}else if($("#layout_qisruksj").fieldValue()=="" && $("#layout_jisruksj").fieldValue()=="" ){
	}else{
		alert("若根据入库时间筛选，请将时间段填写完整！");
		return false;
	}
	return true;
}

//行编辑保存后的方法
function afterSaveRows(result){
	if(false == result.success){
		return false;
	}
	$('#grid_lingxjyfgl').grid('reload');
	return true;
}

//导出模板
function func_button_mobxz(){
	
	$.sdcui.pageUtils.goPage({
		url : '../qhysfy/downloadlxjfyglMob.do',
		mode : 'form',
		beforeSubmit : function(){
			return true;
		}
   });
}
</script>

</t:html>