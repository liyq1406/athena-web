<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html>
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
	</head>
	<t:page i18n="i18n.xqjs.zygzbj.zygz">
	${i18n.ljh}:${lingjbh}
	<t:grid id="grid_jizx" caption="${i18n.jizxlb}" showNum="true" idKeys="tch" dataFormId="form_jizx"
	src="/zygzbj/queryJizxlb.ajax" add="NOT" remove="NOT" scrollHeight="120">
	<t:fieldLayout prefix="gridLayout" columns="3" height="25">
		<t:fieldHidden property="lingjbh"></t:fieldHidden>
		<t:fieldText  property="tcno" caption="TC${i18n.hao}" width="150" maxLength="17"></t:fieldText>
		<t:fieldCalendar format="yyyy-MM-dd" property="zuixyjddsj" width="150" caption="${i18n.jiaofsj}"></t:fieldCalendar>
		<t:fieldSelect property="usercenter" width="150" convert="queryUserCenterMap" caption="${i18n.usercenter}"></t:fieldSelect>
	</t:fieldLayout>
	<t:gridCol property="tcno" type="link" caption="TC${i18n.hao}"></t:gridCol>
	<t:gridCol property="lingjzl" caption="${i18n.lingjzl}"></t:gridCol>
	<t:gridCol property="zuiswld" caption="${i18n.wuld}"></t:gridCol>
	<t:gridCol property="zuixyjddsj" caption="${i18n.jiaofsj}"></t:gridCol>
	<t:gridCol property="lujdm" caption="${i18n.yunslx}"></t:gridCol>
	</t:grid>
	<t:grid id="grid_weifylj" caption="${i18n.weifylj}" showNum="true" submit="NOT" reset="NOT" idKeys="usercenter"
	src="/zygzbj/queryWeifylj.ajax" add="NOT" edit="NOT" remove="NOT" scrollHeight="120">
	<t:fieldLayout prefix="gridLayout">
		<t:fieldHidden property="lingjbh"></t:fieldHidden>
		<t:fieldHidden property="usercenter"></t:fieldHidden>
		<t:fieldHidden property="yaohlzt" defaultValue="01"></t:fieldHidden>
	</t:fieldLayout>
	<t:gridCol property="lingjbh" type="link" caption="${i18n.ljh}"></t:gridCol>
	<t:gridCol property="lingjmc" caption="${i18n.ljmc}"></t:gridCol>
	<t:gridCol property="yaohsl" caption="${i18n.lingjzl}"></t:gridCol>
	<t:gridCol property="gongysdm" caption="${i18n.gongysdm}"></t:gridCol>
	<t:gridCol property="gongysmc" caption="${i18n.gongysmc}"></t:gridCol>
	</t:grid>
	<t:form id="form_jizx" action="/zygzbj/updateJiaofsj.ajax" dialog="true" idKeys="tcno">
		<t:fieldLayout prefix="jizx">
			<t:fieldHidden property="tcno"></t:fieldHidden>
			<t:fieldCalendar property="zuixyjddsj" format="yyyy-MM-dd" notNull="true" caption="${i18n.jiaofsj}"/>
			<t:fieldText property="lujdm" maxLength="10" notNull="true"  caption="${i18n.yunslx}"/>
		</t:fieldLayout>
	</t:form>
	</t:page>
	<script type="text/javascript"> 
	/**
	*TC号链接点击事件
	*/
	function link_tcno(event){
		var event = event||window.event;//原生态的事件处理 
		var element = event.srcElement || event.target;
		var rowDoc = $(element).parents('tr:first')[0];
		var record = $('#grid_jizx').grid('getRecord',rowDoc);//获取当前行对应的记录
		var usercenter = $('#gridLayout_usercenter').fieldValue();
		var lingjbh = $('#gridLayout_lingjbh').fieldValue();
		/**
		 * form跳转模式提交
		 */
		$.sdcui.pageUtils.goPage({
			url:'/zygzbj/initJzx.do?lingjbh='+lingjbh+'&usercenter='+usercenter,//url
			record:record,//
			mode:'form',
			beforeSubmit:function(){
				return true;
			}
		});
		return false;
	}
	
	//修改按钮
	function func_button_edit() {
		
		$('#form_jizx').form("clear");//清除弹出窗口的数据
		
		$('#form_jizx').removeClass('operant-add');//增加的operant为1，修改的operant为2
		
		var record = $("#grid_jizx").grid("getSelectedRecords")[0];//选中的行的数据
		
		$('#form_jizx').form('fillRecord', $.extend({
			jizx : '--'
		}, record));
		
		$("#form_jizx").form("open");
		
	}
	
	/**
	*零件号链接点击事件
	*/
	function link_lingjbh(event){
		var event = event||window.event;//原生态的事件处理 
		var element = event.srcElement || event.target;
		var rowDoc = $(element).parents('tr:first')[0];
		var record = $('#grid_weifylj').grid('getRecord',rowDoc);//获取当前行对应的记录
		/**
		 * form跳转模式提交
		 */
		$.sdcui.pageUtils.goPage({
			url:'/zygzbj/initJzx.do',//url
			record:record,//
			mode:'form',
			beforeSubmit:function(){
				return true;
			}
		});
		return false;
	}
	</script>
	<style type="text/css"></style>
</t:html>