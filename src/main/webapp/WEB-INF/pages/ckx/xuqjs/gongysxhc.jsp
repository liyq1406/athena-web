<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="${i18n.gongysxhc}">

<!-- 
	 供应商小火车
	 @author zbb
	 @date 2015-11-20
 -->
 
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
</head>

<t:page i18n="i18n.ckx.xuqjs.i18n_gongysxhc">
	<t:grid id="grid_gongysxhc" caption="${i18n.gongysxhc}" idKeys="usercenter,gongysbh,xiaohcbh,shengcxbh" dataFormId="form_gongysxhc" remove="NOT" scrollHeight="240" pageSize="10" back="NOT"
		src="/xuqjs/queryGongysxhc.ajax" load="false" clickRowEvent="grid_gongysxhc_click" showNum="true">
		<t:fieldLayout prefix="record_gongysxhc" columns="3">
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" defaultValue="${usercenter}" convert="queryUserCenterMap" width="150"/>
			<t:fieldText property="gongysbh" caption="${i18n.gongysbh}" dataType="text" maxLength="20" minLength="5" width="150"/>
			<t:fieldText property="shengcxbh" caption="${i18n.shengcxbh}" dataType="text" maxLength="20" minLength="5" width="150"/>
			<t:fieldText property="xiaohcbh" caption="${i18n.xiaohcbh}" dataType="text" maxLength="5" width="150"/>			
			<t:fieldSelect property="ishunt" caption="${i18n.ishunt}" convert="querySFHT"  width="150"/>
			<t:fieldSelect property="biaos" caption="${i18n.biaos}" convert="biaos" defaultValue="1"  width="150"/>
		</t:fieldLayout>
		
		<t:button caption="${i18n.invalidate}" name="del" active="1"/>
		
		<t:gridCol property="usercenter" caption="${i18n.usercenter}" convert="usercenter" width="100"/>
		<t:gridCol property="gongysbh" caption="${i18n.gongysbh}" width="150"/>
		<t:gridCol property="shengcxbh" caption="${i18n.shengcxbh}" width="150"/>
		<t:gridCol property="xiaohcbh" caption="${i18n.xiaohcbh}" width="150"/>
		<t:gridCol property="qistc" caption="${i18n.qistc}"   width="150"/>
		<t:gridCol property="hebtc" caption="${i18n.hebtc}"   width="150"/>
		<t:gridCol property="ishunt" caption="${i18n.ishunt}" convert="querySFHT" width="150"/>	
		<t:gridCol property="biaos" caption="${i18n.biaos}" convert="biaos" width="100" />
		
	</t:grid>

	<t:form dialog="true" id="form_gongysxhc" action="/xuqjs/saveGongysxhc.ajax" width="500" idKeys="usercenter,gongysbh,xiaohcbh,shengcxbh" reset="NOT" submit="NOT">
		<t:fieldLayout prefix="record1" showLabel="true" >
				<t:fieldSelect width="140" property="usercenter" caption="${i18n.usercenter}"  convert="queryUserCenterMap" defaultValue="${usercenter}" notNull="true" />
				<t:fieldText width="140" property="gongysbh" caption="${i18n.gongysbh}" maxLength="10" minLength="10" expression="(^[0-9A-Z]{6}[\s0-9A-Z]{2}[0-9A-Z]{2}$)" 
				expressionMessage="${i18n.gongysbh_ex_mes}" notNull="true" />
				<t:fieldText width="140" property="shengcxbh" caption="${i18n.shengcxbh}" dataType="text" maxLength="20" minLength="5" notNull="true" />
				<t:fieldText width="140" property="xiaohcbh" caption="${i18n.xiaohcbh}" dataType="text" maxLength="5" notNull="true"/>
				<t:fieldText width="140" property="qistc" caption="${i18n.qistc}" expression="^(0|[1-9][0-9]*)$" expressionMessage="${i18n.shuzgscw}" maxLength="5" />
				<t:fieldText width="140" property="hebtc" caption="${i18n.hebtc}" expression="^(0|[1-9][0-9]*)$" expressionMessage="${i18n.shuzgscw}" maxLength="5" />
				<t:fieldSelect property="ishunt" caption="${i18n.ishunt}" convert="querySFHT" defaultValue="N" notNull="true" width="140"/>
				<t:fieldSelect width="140" property="biaos" caption="${i18n.biaos}" convert="biaos" defaultValue="1" notNull="true"/>
		</t:fieldLayout>
		<t:button caption="${i18n.submit_zdy}" name="submit_zdy"></t:button>
	</t:form>
	
</t:page>

<script type="text/javascript">
	//标识位
	$.sdcui.serverConfig.convertArray['usercenter'] = {
		'UL' : 'UL',	
		'VD' : 'VD'
	};
	//标识位
	$.sdcui.serverConfig.convertArray['biaos'] = {
		'1' : '${i18n.youx}',
		'0' : '${i18n.wux}'
	};
	
	//是否混托
	//$.sdcui.serverConfig.convertArray['ishunt'] = {		
	//	'Y' : '${i18n.shi}',
	//	'N' : '${i18n.fou}'
	//};
	
	//初始化页面
	$(document).ready(function() {
		//查询页面子表隐藏
// 		$('#grid_xiaohccx').parent().parent().hide();
		//弹出页面标识不可编辑
		$('#record1_biaos').addClass("disabled");
	});
	

	//空格查询
	function grid_gongysxhc_beforeSubmit() {
		$("#record_gongysxhc_xiaohcbh").fieldValue(trim($("#record_gongysxhc_xiaohcbh").fieldValue()));
		$("#record_gongysxhc_gongysbh").fieldValue(trim($("#record_gongysxhc_gongysbh").fieldValue()));
		$("#record_gongysxhc_xiaohcmc").fieldValue(trim($("#record_gongysxhc_xiaohcmc").fieldValue()));
	}
	
	
	/**小火车列表行改变事件*/
	function grid_gongysxhc_click(record, rowIndex) {//grid标签里加clickRowEvent="grid_xiaohc_click" 
		//$("#record_gongysxhc_usercenter").fieldValue(record.usercenter);//用户中心
		//$("#record_gongysxhc_gongysbh").fieldValue(record.gongysbh);	//生产线编号
		//$("#record_gongysxhc_shengcxbh").fieldValue(record.shengcxbh);	//生产线编号
		//$("#record_gongysxhc_xiaohcbh").fieldValue(record.xiaohcbh);	//小火车编号
		//$("#record_gongysxhc_biaos").fieldValue(record.biaos);	//小火车编号
	}

	//修改按钮
	function func_button_edit() {
		
		$('#form_gongysxhc').form("clear");//清除弹出窗口的数据
		
		$('#form_gongysxhc').removeClass('operant-add');//增加的operant为1，修改的operant为2
		
		var record = $("#grid_gongysxhc").grid("getSelectedRecords")[0];//选中的行的数据
		
		//替换错误的空格
		record.gongysbh = record.gongysbh.replace(/ /g," ");
		
		$('#form_gongysxhc').form('fillRecord', $.extend({}, record));
		
		$("#form_gongysxhc").form("open","修改");
		
	}

	
	//监听标识
	function record1_biaos_change() {
		var biaos = $('#record1_biaos').fieldValue();
		//无效可以改为有效
		if('0' == biaos){
			$('#record1_biaos').removeClass("disabled");
			$('#record1_biaos input:first').removeAttr("disabled");
		}else{
			$('#record1_biaos').addClass("disabled");
			$('#record1_biaos input:first').attr("disabled",true);
		}
		return true;
	}
	
	
	//失效按钮
	function func_button_del(){
		if(confirm("${i18n.quersx}")){
			var record = $("#grid_gongysxhc").grid("getSelectedRecords");
			
			var params = [];
			params.push("usercenter="+record[0].usercenter);	//用户中心
			params.push("shengcxbh="+record[0].shengcxbh);
			params.push("gongyshb="+record[0].gongysbh);		//供应商编号
			params.push("xiaohcbh="+record[0].xiaohcbh);		//小火车编号
			
			if('1' == record[0].biaos){
				 $.sdcui.ajaxUtil.ajax({
			 	 	   url:"../xuqjs/removeGongysxhc.ajax",
			 	 	   data:params.join('&'),
			 	       success:function (result){
			 	    	    $("#grid_gongysxhc").grid("reload");
			 	       }
			     	});
			}else{
				alert("数据已失效");
			}
		}else{
			return false;
		}
		
 	}
	
	//关闭弹出窗口
	function form_gongysxhc_afterSubmit() {
		$('#grid_gongysxhc').grid('reload');
		$("#form_gongysxhc").grid("close"); 
	}
	//提交创建或者修改form
	function func_button_submit_zdy(){
		$('#form_gongysxhc').form('submit');				
	}	
	function preSaveEvent(){		
		$('#form_xiaohc').form('submit');
		return false;
	}
	
	//页面初始化
	function initPage(){		
		
	}
</script>

</t:html>