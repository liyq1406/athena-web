<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="${i18n.chelpd_title}" >
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
		<style type="text/css">
		 .youi-fieldLayout table td.contral.label-col {     width: 125px; } 
		</style>
	</head>

	<t:page i18n="i18n.kac.kacckx">
		<t:grid id="grid_chelpd" caption="${i18n.chelpd_title}"  showNum="true" showCheckbox="true" 
		load="false" scrollHeight="350" src="/kac/queryQueue.ajax"   dataFormId="form_queue"   pageSize="15"
		idKeys="usercenter,yundh,kach,editor,edit_time" remove="NOT" back="NOT" add="NOT" edit="NOT" >
			<t:fieldLayout prefix="layout"  columns="3">

			   <t:fieldHidden property="usercenter" defaultValue="${usercenter}" caption="用户中心" />
				<t:fieldSelect property="quybh" caption="${i18n.quybh }" src="/kac/queryPostDengdqy.ajax" notNull="true" parents="usercenter" code="quybh" show="quybh"  width="120"  ></t:fieldSelect>
				<t:fieldSelect property="daztbh" caption="${i18n.daztbh}"  width="120" src="/kac/queryPostDazt.ajax" notNull="true" parents="usercenter,quybh" code="daztbh" show="daztbh"/>
				<t:fieldSelect property="paidzt" caption="${i18n.paidzt}"  convert="paidzt"  width="120"></t:fieldSelect>
				<t:fieldSelect property="paidsx" caption="${i18n.paidsx}"  convert="paidsx"  width="120"></t:fieldSelect>
				<t:fieldText property="chewbh" caption="${i18n.chewbh}" maxLength="10" width="120" defaultValue="${chewbh}"></t:fieldText>
				<t:fieldText property="chengysbh" caption="${i18n.chengys}" maxLength="10" width="120"></t:fieldText>
			</t:fieldLayout>
			<t:button caption="${i18n.top}" name="top"></t:button>
			<t:button caption="指定车位" name="zhidcw"></t:button>
			<t:gridCol property="usercenter" convert="usercenter" caption="${i18n.usercenter}" width="60"></t:gridCol>
			<t:gridCol property="yundh" caption="${i18n.yundh}" width="150"></t:gridCol>
			<t:gridCol property="kach" caption="${i18n.kach}" width="150"></t:gridCol>
			<t:gridCol property="chengysbh" caption="${i18n.chengys}" width="150"></t:gridCol>
			<t:gridCol property="chengysmc" caption="${i18n.chengysmc}" width="200"></t:gridCol>
			<t:gridCol property="quybh" caption="${i18n.quybh }" width="120"></t:gridCol>
			<t:gridCol property="daztbh" caption="${i18n.daztbh}" width="100"></t:gridCol>
			<t:gridCol property="paidxh" caption="${i18n.paidxh}" width="100"></t:gridCol>
			<t:gridCol property="paidzt" caption="${i18n.paidzt}" convert="paidzt" width="75"></t:gridCol>
			<t:gridCol property="paidsx" caption="${i18n.paidsx}" convert="paidsx" width="75"></t:gridCol>
			<t:gridCol property="chewbh" caption="${i18n.chewbh}" width="150" ></t:gridCol>
		</t:grid>
		
		<t:form dialog="true" reset="NOT"   submit="NOT"   id="form_zhidcw" caption="指定车位" width="600" >
         	<t:fieldGrid property="chewList" mode="reload"  caption="车位信息"  column="6" width="600" parentsAlias="daztbh">
				<t:grid id="grid_chew" load="false" idKeys="chewbh,chewsx,chewzt" showNum="true" 
					src="/kac/queryChew.ajax" submit="NOT" usePager="false"  reset="NOT" add="NOT"
					edit="NOT" remove="NOT"  width="600">
					<t:fieldLayout prefix="chew"> 
						<t:fieldLabel property="usercenter" caption="${i18n.usercenter }"     width="75"></t:fieldLabel>
						 <t:fieldHidden property="yundh"  ></t:fieldHidden>
					    <t:fieldLabel property="quybh" width="100" caption="${i18n.quybh }" ></t:fieldLabel>
					    <t:fieldLabel property="daztbh" width="100" caption="${i18n.daztbh }"  ></t:fieldLabel>
						<t:fieldLabel property="kach" width="100" caption="${i18n.kach }" ></t:fieldLabel>
						<t:fieldLabel property="paidsx" width="75" caption="${i18n.paidsx}"  ></t:fieldLabel>
					</t:fieldLayout>
					<t:gridCol property="chewbh" caption="${i18n.chewbh }" width="150"></t:gridCol>
					<t:gridCol property="chewsx" caption="${i18n.chewsx }" convert="chewsx" width="150"></t:gridCol>
					<t:gridCol property="chewzt" caption="${i18n.chewzt }" convert="chewzt" width="150"></t:gridCol>
					<t:gridCol property="jiz" align="center" renderer="createRadio" caption="${i18n.xuanz}"  width="100"></t:gridCol>
					
					<t:button caption="提交" name="sub" ></t:button>
					<t:button caption="关闭" name="guanb" ></t:button>
				</t:grid>
			</t:fieldGrid>
	</t:form>
	
</t:page>
	
<script type="text/javascript">
$(document).ready(function(){
	var s = $('#layout_chewbh').fieldValue();
	if(s!=""){
		$("#grid_chelpd").grid('reload');
	}
});
$('#form_zhidcw').find('div .form-buttons').hide();
	//排队状态
	$.sdcui.serverConfig.convertArray['paidzt'] = {
		'0' : '排队',
		'1' : '准入'
	};
	
	//排队属性
	$.sdcui.serverConfig.convertArray['paidsx'] = {
		'1' : '非专用',
		'2' : '专用',
		'3' : '通用',
		'4' : '急件'
	};
	//车位属性
	$.sdcui.serverConfig.convertArray['chewsx'] = {
		'1' : '非专用',
		'2' : '专用',
		'3' : '通用',
		'4' : '急件'
	};
	//车位状态
	$.sdcui.serverConfig.convertArray['chewzt'] = {
		'0' : '空闲',
		'1' : '占用'
	};
	
	
	
	/**
	*列渲染事件,创建Radio	
	*/
	function createRadio(){
		return "<input  name='jiz' onclick='radioClick()' type='radio' value='1'/>";
	}
	function radioClick(){
		var radios = document.getElementsByName("jiz");
		var params = [];
		var param = {};
		for ( var i = 0; i < radios.length; i++) {
			if (radios[i].checked == true) {
				var rowElemt = $(radios[i]).parent('td:first').parent('tr:first');
				$(rowElemt).find('< td').addClass('selected');
			}
		}

	}
    /*
	*置顶
	*/
	function func_button_top(){
	    var params = [];
		var param = $('#grid_chelpd').grid('getSelectedRecords');//获取选中的车辆排队信息,仅可为一条
		if(param.length != 1){
		   alert("请选中一条仅且一条数据，进行置顶操作！");
			return false;
		}
		var zhuangt = param[0].paidzt;
		if( 1==zhuangt){
		  alert("只能对排队状态的数据进行置顶操作！");
		  return false;
		}
		params.push('pd.usercenter='+param[0].usercenter);//车辆排队用户中心
		params.push('pd.yundh='+param[0].yundh);//运单号
		params.push('pd.quybh='+param[0].quybh);//区域编号
		params.push('pd.daztbh='+param[0].daztbh);//大站台
		params.push('pd.editor='+param[0].editor);
		params.push('pd.edit_time='+param[0].edit_time);
		params.push('pd.paidzt='+zhuangt);
		 $.sdcui.ajaxUtil.ajax({
             url:"../kac/chelpdTop.ajax",//请求url
             data:params.join('&'),//传递参数
            	success:function (result){//回调函数
            		alert(result.result);//弹出提示结果
            		$('#grid_chelpd').grid('reload');//刷新grid
            	
             }
     	});
	}
   /*
	*指定车位
	*/
	function func_button_zhidcw(){
	    var params = [];
		var param = $('#grid_chelpd').grid('getSelectedRecords');//获取选中的车辆排队信息,仅可为一条
		if(param.length != 1){
		   alert("请选中一条仅且一条数据，进行指定操作！");
			return false;
		}
		var zhuangt = param[0].paidzt;
		if( 1==zhuangt){
		  alert("只能对排队状态的数据进行指定操作！");
		  return false;
		}
		 $("#chew_yundh").fieldValue(param[0].yundh);//运单号
		 $("#chew_quybh").fieldValue(param[0].quybh);//区域编号
		 $("#chew_daztbh").fieldValue(param[0].daztbh);//大站台
		 if('1'==param[0].paidsx){
		  $("#chew_paidsx").fieldValue("普通");//排队属性
		 }else if('2'==param[0].paidsx){
		   $("#chew_paidsx").fieldValue("专用");//排队属性
		 }else if('3'==param[0].paidsx){
		   $("#chew_paidsx").fieldValue("通用");//排队属性
		 }else if('4'==param[0].paidsx){
		   $("#chew_paidsx").fieldValue("急件");//排队属性
		 }
		 $("#chew_kach").fieldValue(param[0].kach);//卡车号
		 $('#form_zhidcw').form('open');
		 params.push('pd.usercenter='+param[0].usercenter);//车辆排队用户中心
		 params.push('pd.daztbh='+param[0].daztbh);//大站台
		 $('#grid_chew').grid('reload');//刷新grid
	}
   //提交事件
   function func_button_sub(){
	var params=[];
    var param1 = $("#form_zhidcw").form('getFormRecord'); 
	var param = $('#grid_chew').grid('getSelectedRecords');//获取选中的车位信息,仅可为一条   
	if(param.length != 1){
		   alert("请选中一条仅且一条数据，进行指定车位操作！");
			return false;
		}
	params.push('pd.chewbh='+param[0].chewbh);
	params.push('pd.chewsx='+param[0].chewsx);
	params.push('pd.usercenter='+param1.usercenter);
	params.push('pd.yundh='+param1.yundh);
	params.push('pd.kach='+param1.kach);
	 $.sdcui.ajaxUtil.ajax({
         url:"../kac/zhidcw.ajax",//请求url
         data:params.join('&'),//传递参数
        	success:function (result){//回调函数
        		alert(result.result);//弹出提示结果
        		$('#grid_chelpd').grid('reload');//刷新grid
        	
         }
 	});
   }
   
   function func_button_guanb(){
	   $('#form_zhidcw').form('close');
   }
</script>
</t:html>