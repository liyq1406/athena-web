<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="同步-集配-跟踪">

<!-- 
	实时延误要货令 11472
	 hj
 -->
 
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 105px; } </style>
</head>

<t:page i18n="" >
	<t:grid id="grid_shisywyhl" caption="实时延误要货令" idKeys="lingjbh" load="" editable="false" 
	showNum="true" back="NOT"   exportXls="true"
		 src="/baob/queryshisywyhl.ajax"  add="NOT" edit="NOT" remove="NOT"
		  scrollHeight="290" pageSize="15">
		<t:fieldLayout id="lj" prefix="shis" columns="3">
			<t:fieldSelect property="usercenter" caption="用户中心" width="150" defaultValue="${USERCENTER}" convert="queryUserCenterMap"/>
			<t:fieldText property="lingjbh" caption="零件编号"  width="150" dataType="text" maxLength="10"/>
			<t:fieldText property="gongysdm" caption="供应商编号"  width="150" expression="^[0-9A-Z]{6}[\\s0-9A-Z]{2}[0-9A-Z]{2}$" expressionMessage="请填写10位编号"/>
<%--  			<t:fieldCalendar property="zuiwsj" caption="最晚到货时间" width="150" format="yyyy-MM-dd HH:mm:ss"></t:fieldCalendar> --%>
 			<t:fieldCalendar property="zuiwsj_from"    caption="最晚到货时间从" width="150" format="yyyy-MM-dd HH:mm:ss"></t:fieldCalendar>
			<t:fieldCalendar property="zuiwsj_to"   caption="至" width="150" format="yyyy-MM-dd HH:mm:ss"></t:fieldCalendar>
 			<t:fieldSelect property="jihy" caption="计划员组"  src="/baob/queryJihyByLingj.ajax"  parents="usercenter"
 				show="VALUE" code="KEY" defaultValue="${JIHUAY}" width="150"/>
 			<t:fieldText property="chengysdm" caption="承运商"  width="150" expression="^[0-9A-Z]{6}[\\s0-9A-Z]{2}[0-9A-Z]{2}$" expressionMessage="请填写10位编号"  maxLength="10"/>
 			<t:fieldText property="keh" caption="客户"  width="150" dataType="text" maxLength="6"/>
 			<t:fieldCheckboxGroup property="yaohllx1" caption="要货令类型" width="200" src="/baob/queryYhllx.ajax" show="yaohllx" code="yaohllx"></t:fieldCheckboxGroup>
 			<t:fieldText property="chanx" caption="产线"  width="150" dataType="text" maxLength="5"/>
 			<!-- 12898 -->
 			<t:fieldHidden property="yaohlzt"></t:fieldHidden>
 			<t:fieldCheckboxGroup property="yaohlzt1" caption="要货令状态" width="250"  convert="yaohlzt" show="yaohlzt" code="yaohlzt"/>
 			<t:fieldHidden property="yaohllx"></t:fieldHidden>
 	 		<!-- huxy_12905 13506-->
 	 		<t:fieldSelect property="shiflsk" caption="是否临时卡" convert="shiflsk" width="70"/>	
 	 		<t:fieldSelect property="beiz3" caption="是否发送供应商" convert="shiflsk" defaultValue="1" width="70"/>			
		</t:fieldLayout>
		<t:buttons id="btn">
		<t:button caption="保存配置" name="save"></t:button>
		</t:buttons>
		<t:gridCol  property="usercenter" caption="用户中心"  />
		<t:gridCol  property="lingjbh" caption="零件编号"  />
		<t:gridCol  property="lingjmc" caption="零件名称"  />
		<t:gridCol  property="keh" caption="客户" width="70"  />
		<t:gridCol  property="mudd" caption="目的地" width="70"  />
		<t:gridCol  property="yaohllx" caption="要货令类型" width="70"  />
		<!-- V4_025 -->
		<t:gridCol  property="chanx" caption="产线" width="70"  />
		<t:gridCol  property="yaohlzt" caption="要货令状态" width="70"  />
		<t:gridCol  property="yaohlh" caption="要货令号" width="70" />
		<t:gridCol  property="zuiwdhrq" caption="最晚到货日期" width="50" />
		<t:gridCol  property="shik" caption="时刻" width="70" />
		<t:gridCol  property="gongysdm" caption="供应商代码" width="60" />
		<t:gridCol  property="gongysmc" caption="供应商名称" width="95" />
		<t:gridCol  property="chengysdm" caption="承运商代码" width="95" />
		<t:gridCol  property="chengysmc" caption="承运商名称" width="95" />
		<t:gridCol  property="jihy" caption="计划员" width="60" />
		<t:gridCol  property="yaohsl" caption="数量" width="60" />
		<t:gridCol  property="yancyy" caption="延误原因" width="95" />
		
		<!-- huxy_13506 -->
		<t:gridCol  property="shiflsk" caption="是否临时卡" width="70"  />
		<t:gridCol  property="beiz3" caption="是否发送供应商" width="70"  />
		<t:gridCol  property="" caption="" />
	</t:grid>
</t:page>

<script type="text/javascript">
$.sdcui.serverConfig.convertArray['yaohlzt'] = {
		'01' : '表达',
		'02' : '在途',
		'03' : '等待交付'
	};
	
$.sdcui.serverConfig.convertArray['shiflsk'] = {
		'1' : 'Y',
		'0' : 'N'
	};
	//空格查询
	function grid_shisywyhl_beforeSubmit() {
	//2016.4.5 rencong
		var params = [];
		var yaohllx="";
	   $('#shis_yaohllx1 input[type="checkbox"]').each(function(){
	   	  if($(this).attr("checked"))
	   	  {
	   	  	yaohllx +=$(this).val()+",";
	   	  }
	   });
	   
	   yaohllx=yaohllx.substr(0,yaohllx.length-1);
	   if(yaohllx.length < 1)
	   {
	   	  alert("至少选中一个要货令类型");
	   	  return false;
	   }
	   $("input[name='yaohllx']").val(yaohllx);
	   //12898
	   var yaohlzt = "";
	   	$('#shis_yaohlzt1 input[type="checkbox"]').each(function(){
	   	  if($(this).attr("checked"))
	   	  {
	   	  	yaohlzt +=$(this).val()+",";
	   	  }
	   });
	   yaohlzt=yaohlzt.substr(0,yaohlzt.length-1);
	   if(yaohlzt.length < 1)
	   {
	   	  alert("至少选中一个要货令状态");
	   	  return false;
	   }
	   $("input[name='yaohlzt']").val(yaohlzt);
		if($("#shis_zuiwsj_from").fieldValue()!="" && $("#shis_zuiwsj_to").fieldValue() != ""){
		}else if($("#shis_zuiwsj_from").fieldValue()=="" && $("#shis_zuiwsj_to").fieldValue() == "" ){
		}else{
			alert("若根据时间筛选，请将时间段填写完整。");
			return false;
		}
		return true;
	}
	//2016.4.6  rencong  新增配置按 钮
	function func_button_save()
	{
	   var params = [];
	   var yaohllx="";
	   $('#shis_yaohllx1 input[type="checkbox"]').each(function(){
	   	  if($(this).attr("checked"))
	   	  {
	   	  	yaohllx +=$(this).val()+",";
	   	  }
	   });
	   yaohllx=yaohllx.substr(0,yaohllx.length-1);
	   params.push("yaohllx="+yaohllx);
	   
	   $.sdcui.ajaxUtil.ajax({
		url : "${ctx}/baob/saveConfig.ajax",
			data : params.join('&'),
			success : function(result) {
				if(result.result == "success"){
					alert("success");
				}else{
					alert(result.result.message);
				}
			}
		});
	   }


$(function(){
	    $('#serachKey').val('${USERCENTER}');
	    //13506
	    $('#content_shis_yaohlzt1 input[type="checkbox"]').attr("checked",true);
	    $.sdcui.ajaxUtil.ajax({
		url : "${ctx}/baob/queryConfig.ajax",
			data : '',
			success : function(result) {
				//配置项表格赋值				
				var lxlist = result.result[0].yaohllx.split(',');
				var i =0;
				var timer = setInterval(function(){
				$('#shis_yaohllx1 input[type="checkbox"]').each(function(i,obj){
					for(i=0;i<lxlist.length;i++){
						if(lxlist[i].substr(0,2) == $(this).val())
			  				{
			  					$(this).attr("checked",true);
			  				}
		  			}
					clearInterval(timer);
							 	
			  		});
			  		
				},500);

			}
		});
	})
	
</script>

</t:html>