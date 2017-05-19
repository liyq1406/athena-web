<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html>
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
	</head>
	
	<t:page i18n="i18n.xqjs.report.il18n_kucfx" >
		<t:grid id="grid_maoxqo" load="false" showNum="true" submit="NOT" reset="NOT" scrollHeight="100" idKeys="xuqbc"
		add="NOT" edit="NOT" remove="NOT" src="/ilorder/queryMaoxqo.ajax">
			<t:fieldLayout prefix="gridLayout" columns="3">
				<t:fieldSelect width="150" show="gonghms" code="xuqly" src="/ilorder/queryXuqlyIl.ajax" caption="${i18n.xuqly}" property="xuqly"></t:fieldSelect>
				<t:fieldHidden property="noxuqly" defaultValue="DKS"></t:fieldHidden>
			</t:fieldLayout>
			<t:gridCol property="xuqbc" type="link" caption="${i18n.xuqbc}" width="100"></t:gridCol>
			<t:gridCol property="xuqcfsj"  caption="${i18n.chaifsj}" width="150"></t:gridCol>
			<t:gridCol property="xuqly"  caption="${i18n.xuqly}" width="100"></t:gridCol>
			<t:gridCol property="xuqlymc"  caption="${i18n.xuqly}${i18n.shuom}" width="100"></t:gridCol>
			<t:gridCol property="beiz" caption="${i18n.beiz}" width="100"></t:gridCol>
		</t:grid>
		<t:buttons id="buttons_form">
			<t:button caption="${i18n.qued}" name="qued"></t:button>
		</t:buttons>
		<t:grid id="grid_maoxqt" idKeys="xuqbc" showNum="true" submit="NOT" reset="NOT" add="NOT" edit="NOT" remove="NOT" scrollHeight="100"
		src="/report/querySessionMaoxqIlKcfxbb.ajax" load="true" >
		<t:fieldLayout prefix="layout">
			<t:fieldHidden property="xuqbc"></t:fieldHidden>
			<t:fieldHidden property="isDel"></t:fieldHidden>
			<t:fieldHidden property="zhizlx"></t:fieldHidden>
		</t:fieldLayout>
			<t:gridCol property="xuqbc" type="link" caption="${i18n.xuqbc}" width="100"></t:gridCol>
			<t:gridCol property="xuqcfsj"  caption="${i18n.chaifsj}" width="150"></t:gridCol>
			<t:gridCol property="xuqly"  caption="${i18n.xuqly}" width="100"></t:gridCol>
			<t:gridCol property="xuqlymc"  caption="${i18n.xuqly}${i18n.shuom}" width="100"></t:gridCol>
			<t:gridCol property="beiz" caption="${i18n.beiz}" width="100"></t:gridCol>
		</t:grid>
		<t:buttons id="button_form">
			<t:button name="qux" caption="${i18n.qux}"></t:button>
			<t:button caption="库存计算" name="kcjs"></t:button>
		</t:buttons>
		
		
		
	<t:grid id="grid_lingj" caption="国产件库存信息"  load="false" showNum="true"   back="NOT"
		 src="/report/queryIlKuc.ajax"  remove="NOT" add="NOT" edit="NOT"  usePager="true"   >
		<t:fieldLayout prefix="record">
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" defaultValue="${usercenter}" convert="queryUserCenterMap" width="150"/>
			<t:fieldText property="lingjbh" caption="${i18n.lingjbh}" maxLength="10" width="150"/>
		</t:fieldLayout>
		
		<t:button caption="导出xls" name="download"></t:button>
		
		<t:gridCol property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap"></t:gridCol>
		<t:gridCol property="lingjbh" caption="${i18n.lingjbh}" width="150"></t:gridCol>
		<t:gridCol property="shiycj" caption="使用车间"></t:gridCol>
		<t:gridCol property="cangkdm" caption="仓库代码" width="150"></t:gridCol>
		<t:gridCol property="kucsl" caption="仓库库存数量" width="200"></t:gridCol>
		<t:gridCol property="cmj" caption="CMJ" width="200"></t:gridCol>
		<t:gridCol property="tians" caption="天数"></t:gridCol>
		<t:gridCol property="jihy" caption="计划员组"></t:gridCol>
	</t:grid>
	
	</t:page>
		
	<script type="text/javascript">
	
	/**
	*链接点击事件
	*/
	function link_xuqbc(event){
		var event = event||window.event;//原生态的事件处理 
		var element = event.srcElement || event.target;
		var rowDoc = $(element).parents('tr:first')[0];
		var record = $('#grid_maoxqo').grid('getRecord',rowDoc);//获取当前行对应的记录
		var xuqbc = record.xuqbc;
		/**
		 * form跳转模式提交
			window.open ('${ctx}/zygzbj/mxqMx.do?removeId=layout-north,layout-west,layout-south','毛需求明细','height=768,width=1024,top=0,left=0,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
		return false; */
         window.open ('${ctx}/kanbyhl/queryMX.do?removeId=layout-north,layout-west,layout-south&xuqbc='+xuqbc,
		'毛需求明细',
		'height=655,width=1268,top=0,left=0,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no, status=no');
        return false;
	}
	
	//生成选择radio
	function radioXuqbc(){
		return "<input name='selectXuqbcs' onclick='radioClick(this)' type='radio'/>";
	}
	
	//需求类型change事件
	function gridLayout_xuqly_change() {
		$('#grid_maoxqo').grid('reload');
	}
	
	//确定按妞事件
	function func_button_qued() {
		if(vali()) {
			//是否选中了版次
			var record = $('#grid_maoxqo').grid('getSelectedRecords');
			//选中的版次放到隐藏域
			$('#layout_xuqbc').fieldValue(record[0].xuqbc);
			$('#layout_isDel').fieldValue("0");
			$('#grid_maoxqt').grid('reload');
		}
	}
	
	//radio点击事件
	function radioClick(obj){
		var rowElemt = $(obj).parent('td:first').parent('tr:first');
		var xuqbc = rowElemt.find('td:eq(1)').text();
		//选中的版次放到隐藏域
		$('#layout_xuqbc').fieldValue(xuqbc);
	}
	
	//表单验证
	function vali() {
		//是否选中了版次
		var record = $('#grid_maoxqo').grid('getSelectedRecords');
		if(record.length == 0) {
			//请选择版次
			alert("${i18n.choose}");
			return false;
		}
		return true;
	}
	
	//取消按妞事件
	function func_button_qux() {
		if(qxvali()) {
			//是否选中了版次
			var record = $('#grid_maoxqt').grid('getSelectedRecords');
			//选中的版次放到隐藏域
			$('#layout_xuqbc').fieldValue(record[0].xuqbc);
			$('#layout_isDel').fieldValue("1");
			$('#grid_maoxqt').grid('reload');
		}
	}
	
	
	//取消按妞事件
	function func_button_kcjs() {
		
		//是否选中了版次
		
		
		var record = $('#grid_maoxqt').grid('getRecords');
		var i = 0, j = record.length;
		if(j == 0) {
			//请选择版次
			alert("请至少选择一条需求版次!");
			return false;
		}
		var param = [];
		for(;i < j; i++)
		{
			param.push('banc['+i+'].xuqbc='+record[i].xuqbc);
		}
		$.sdcui.ajaxUtil.ajax({
			url : "../report/iljs.ajax",
			data:param.join('&'),
			success : function(result) {
				 alert(result.result);
			}
		});
		
	}
	
	
	//取消表单验证
	function qxvali() {
		//是否选中了版次
		var record = $('#grid_maoxqt').grid('getSelectedRecords');
		if(record.length == 0) {
			//请选择版次
			alert("${i18n.choose}");
			return false;
		}
		return true;
	}
	
	
	
	//导出数据
	function func_button_download(){
		
		var usercenter = trim($('#record_usercenter').fieldValue());
		var lingjbh = trim($("#record_lingjbh").fieldValue());
		var record = {'usercenter':usercenter,'lingjbh':lingjbh};
		
		$.sdcui.pageUtils.goPage({
			url : '../report/downloadIlKuc.do',
			record : record,
			mode : 'form',
			beforeSubmit : function(){
				return true;
			}
	   });
	}
	
	
	</script>
	<style type="text/css">
	</style>
</t:html>