<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="${i18n.ticxxsj}">

<!-- 
	 未来几日剔除休息时间
	 @author denggq
	 @date 2012-4-6
 -->
 
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 120px; } </style>

		
</head>

<t:page i18n="i18n.ckx.xuqjs.i18n_ticxxsj" >
	<t:grid id="grid_ticxxsj" caption="${i18n.ticxxsj}" 
		idKeys="usercneter,chanxck,ri"
		src="/xuqjs/querySgjsTicxxsj.ajax" 
		load="false" 
		showNum="true"
		add="NOT"
		back="NOT"
		edit="NOT"
		remove="NOT"
		scrollHeight="320" 
		pageSize="15"
		>
		<t:fieldLayout prefix="record0" columns="3">
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" defaultValue="${usercenter}" convert="queryUserCenterMap" width="150"/>
			<t:fieldCustom property="leix" caption="${i18n.chanxck }" width="120" ></t:fieldCustom>
			<t:fieldHidden caption="${i18n.lxLength}" property="lxLength"/>
			<t:fieldHidden caption="${i18n.chanxck}" property="chanxck"/>
			<t:fieldCalendar property="gongzr" caption="${i18n.gongzr}" format="yyyy-MM-dd" width="150"/>
		</t:fieldLayout>
		
<%-- 		<t:button caption="${i18n.calculate}" name="ticxxsj"></t:button> --%>
		
		<t:gridCol property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap"></t:gridCol>
		<t:gridCol property="chanxck" caption="${i18n.chanxck}" width="150"></t:gridCol>
		<t:gridCol property="riq" caption="${i18n.riq}"></t:gridCol>
		<t:gridCol property="shunxh" caption="${i18n.shunxh}" width="60"></t:gridCol>
		<t:gridCol property="shijdkssj" caption="${i18n.shijdkssj}" width="150"></t:gridCol>
		<t:gridCol property="shijdjssj" caption="${i18n.shijdjssj}" width="150"></t:gridCol>
		<t:gridCol property="shijcd" caption="${i18n.shijcd}" width="100"></t:gridCol>
		<t:gridCol property="gongzr" caption="${i18n.gongzr}"></t:gridCol>
		<t:gridCol property="" caption=""/>
	</t:grid>
	
</t:page>

<script type="text/javascript">

	//生成交付日历
	function func_button_ticxxsj(){
		$.sdcui.ajaxUtil.ajax({
			url : '../xuqjs/calculateTicxxsj.ajax',
			success : function(result) {
				return true;
			}
		});
	}
	
	function parseLeixOfOptions(){
		var leix = {shengcxbh:5,shengcxName:'${i18n.shengcx}',cangkbh:3,cangkName:'${i18n.cangk}',xiehztbh:4,xiehztName:'${i18n.zhantbz}'};
		var htmls = [];
		var s = '<option value="" selected></option>';
		htmls.push(s);
		var s1 = '<option value="'+leix.shengcxbh+'" >'+leix.shengcxName+'</option>';
		htmls.push(s1);
		var s2 = '<option value="'+leix.cangkbh+'">'+leix.cangkName+'</option>';
		htmls.push(s2);
		var s3 = '<option value="'+leix.xiehztbh+'">'+leix.xiehztName+'</option>';
		htmls.push(s3);
		return htmls.join('');
	}
</script>
<script type="text/javascript">
		
		function initPage(){
			//产线仓库自定义框
			leixInit();
		}
		
		function leixInit(){
			var LeixElement = $('#record0_leix');
			if(!LeixElement.hasClass('loaded')){
				$('#record0_leix').html('<select id="leix" onchange="leixchange()">'+parseLeixOfOptions()+'</select><input id="leixbh" size="14" onkeyup="checkLength(this)"/>');
				$('#record0_leix').addClass('loaded').fieldCustom({
					property:'leix',
					setValue:function(value){
					},
					getValue:function(){
						var value = this.element.find('select').val()+this.element.find('input').val();
						return value;
					},
					clear:function(){
						this.element.find('select,input').val('');
					}
				});

			}
		}
		function leixchange(){
			checkLength('#leixbh');
		}
		function checkLength(obj){
			var value = $(obj).val().toUpperCase();
			var length=5;
			$("select option:selected ").each(function (i,obj){
				if("leix" == obj.parentNode.id){
					if("" != obj.value ){
						length = obj.value;		 
					}
					//如果是leix 则找到该属性 ，则跳出循环
					return false;
				}
			});
			
			if(value.length >= length){	
				value = value.substr(0,length);	
			}
			$(obj).val(value);	
		}
		
		function checkValueLength(value){
			var leix = $("select option");
			for(i = 0 ; i < leix.length ; i ++){
				if(value.length == leix[i].value){
					$('#record0_chanxck').fieldValue(value);
					return true;
				}
			}
			alert("${i18n.qingsrzqbh}");
			return false;
		}
		function grid_ticxxsj_beforeSubmit(){
			 $('#record0_chanxck').fieldValue('');
			 $('#record0_lxLength').fieldValue('');
			 var leix = $("select option:selected");			 
			 var leixbh = trim($("#leixbh").val());
			 if(null != leixbh && undefined != leixbh && "" != leixbh ){
				 if("" != leix[0].value &&leix[0].value != leixbh.length){
					 alert("${i18n.shur}"+leix[0].value+"${i18n.weizf}");
					 return false;
				 }else {
					 checkValueLength(leixbh);
				 }
			 }
			 $('#record0_lxLength').fieldValue(leix[0].value);
			 return true;
		}
		
</script>
</t:html>