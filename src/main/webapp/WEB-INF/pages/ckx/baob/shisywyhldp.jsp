<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="实时延误要货令大屏配置">
<!-- 11458 -->
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 105px; } 
	#btn div.youi-button.active-0 {
		padding-right: 20px;
	}
</style>
</head>

<t:page i18n="" >
	<t:grid id="grid_shisywyhldp" caption="实时延误要货令" idKeys="yaohlh" load="" editable="false" 
	     showNum="false" back="NOT"   exportXls="false" scrollHeight="290" pageSize="15" >
		<t:fieldLayout id="yw" prefix="shis" columns="3">
			<t:fieldSelect property="dapsxsj" caption="大屏刷新时间(s)" defaultValue="50" width="150" convert="shuaxsj"/>
			<t:fieldText property="yanwbjsj" caption="延误报警时间(m)"  width="150" dataType="numeric" defaultValue="120" maxLength="3"/>
			<t:fieldText property="yanwbjsl" caption="延误报警数量"  width="150" defaultValue="15" dataType="text" maxLength="3"/>
			<t:fieldCheckboxGroup property="yaohllx" caption="要货令类型" width="200" src="/baob/queryYhllx.ajax" show="yaohllx" code="yaohllx"></t:fieldCheckboxGroup>
			<t:fieldCheckboxGroup property="yaohlzt" caption="要货令状态" convert="yaohlzt" width="360"></t:fieldCheckboxGroup>
             <t:fieldCheckboxGroup property="factory" convert="fac" caption="工厂" width="360"></t:fieldCheckboxGroup>
 			<t:fieldSelect property="cangkbh" caption="仓库编号"  src="/baob/queryCangkByUsercenter.ajax"  parents="usercenter"
 				show="VALUE" code="KEY" defaultValue="" width="150"/>
			<t:fieldText property="chanx" caption="生产线号"  width="150"  dataType="text" maxLength="5"/>
			<t:fieldText property="lingjbh" caption="零件编号"  width="150"  dataType="text" maxLength="10"/>
 			<t:fieldSelect property="jihy" caption="计划员组"  src="/baob/queryJihyByLingj.ajax"  parents="usercenter"
 				show="VALUE" code="KEY" defaultValue="${JIHUAY}" width="150"/>
			<t:fieldText property="gongysdm" caption="供应商"  width="150" expression="^[0-9A-Z]{6}[\\s0-9A-Z]{2}[0-9A-Z]{2}$" expressionMessage="请填写10位编号"  maxLength="10"/>
 			<t:fieldText property="chengysdm" caption="承运商"  width="150" expression="^[0-9A-Z]{6}[\\s0-9A-Z]{2}[0-9A-Z]{2}$" expressionMessage="请填写10位编号"  maxLength="10"/>			
		</t:fieldLayout>
		<t:buttons id="btn">
		    <t:button caption="大屏显示" name="show"></t:button>
			<t:button caption="保存配置" name="save"></t:button>
		</t:buttons>
	</t:grid>
	<input id="serachKey" name="serachKey" type="Hidden"></input>
	<form id="putform" method="post" name="putform" target="_blank">
	    <input id="putvalue" name="putvalue" type="hidden"></input>
	</form> 
</t:page>

<script type="text/javascript">



//$.sdcui.serverConfig.convertArray['yaohllx'] = {
//		'R1' : 'R1',
//		'R2' : 'R2',
//		'C1' : 'C1',
//		'CD' : 'CD'
//	};
$.sdcui.serverConfig.convertArray['yaohlzt'] = {
		'01' : '表达',
		'02' : '在途',
		'03' : '等待交付'
	};
//$.sdcui.serverConfig.convertArray['factory'] = {
 //         '0' : '新能源',
 //         '3' : '三厂',
 //         '1' : '一厂',
 //         '2' : '二厂'         
//};

//$.sdcui.serverConfig.convertArray['fac'] = $(fac);

$.sdcui.serverConfig.convertArray['fac']={}; 

<c:forEach items="${fac}" var="item">
$.sdcui.serverConfig.convertArray['fac']['${item.KEY}'] = '${item.VALUE}';
</c:forEach>
				
				

$.sdcui.serverConfig.convertArray['shuaxsj'] = {
		'20' : '20',
		'30' : '30',
		'40' : '40',
		'50' : '50',
		'60' : '60',
		'70' : '70',	
		'80' : '80',
		'90' : '90',
		'120': '120',
		'150': '150'
	};
	
	function func_button_save()
	{
	   var params = [];
	   params.push("dapsxsj="+$('#shis_dapsxsj input').val());
	   params.push("yanwbjsj="+$('#shis_yanwbjsj input').val());
	   params.push("yanwbjsl="+$('#shis_yanwbjsl input').val());
	   params.push("cangkbh="+$('#shis_cangkbh input').val());	   
	   params.push("chanx="+$('#shis_chanx input').val());
	   params.push("jihy="+$('#shis_jihy input').val());
	   params.push("gongysdm="+$('#shis_gongysdm input').val());
	   params.push("chengysdm="+$('#shis_chengysdm input').val());
	   params.push("lingjbh="+$('#shis_lingjbh input').val());

	   //校验  0012543
	   var yaohllx="";
	   $('#content_shis_yaohllx input[type="checkbox"]').each(function(){
	   	  if($(this).attr("checked"))
	   	  {
	   	  	yaohllx +=$(this).val()+",";
	   	  }
	   });
   		
	   /**
	   if($('#content_shis_yaohllx input[value=\"R1\"]').attr("checked")){
	   		yaohllx = yaohllx+"R1,";
	   }
	   if($('#content_shis_yaohllx input[value=\"R2\"]').attr("checked")){
	   		yaohllx = yaohllx+"R2,";
	   }
	   if($('#content_shis_yaohllx input[value=\"C1\"]').attr("checked")){
	   		yaohllx = yaohllx+"C1,";
	   }
	   if($('#content_shis_yaohllx input[value=\"CD\"]').attr("checked")){
	   		yaohllx = yaohllx+"CD,";
	   }
	   **/
	   yaohllx=yaohllx.substr(0,yaohllx.length-1);

	   var yaohlzt="";
	   if($('#content_shis_yaohlzt input[value=\"01\"]').attr("checked")){
	   		yaohlzt = yaohlzt+"01,";
	   }
	   if($('#content_shis_yaohlzt input[value=\"02\"]').attr("checked")){
	   		yaohlzt = yaohlzt+"02,";
	   }
	   //2015-9-28日新增
	   if($('#content_shis_yaohlzt input[value=\"03\"]').attr("checked")){
	   		yaohlzt = yaohlzt+"03,";
	   }
	   //2015-9-22日新增
	   var gongc="";
	   $('#content_shis_factory input[type="checkbox"]').each(function(){
	   	  if($(this).attr("checked"))
	   	  {
	   	  	gongc +=$(this).val()+",";
	   	  }
	   });
	   gongc=gongc.substr(0,gongc.length-1);	   
	   yaohlzt=yaohlzt.substr(0,yaohlzt.length-1);	   
	   params.push("yaohlzt="+yaohlzt);
	   params.push("yaohllx="+yaohllx);
	   //2015-9-22日新增
	   params.push("gongc="+gongc);

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
	function func_button_show(){
	   var params = [];
	   params.push("dapsxsj="+$('#shis_dapsxsj input').val());
	   params.push("yanwbjsj="+$('#shis_yanwbjsj input').val());
	   params.push("yanwbjsl="+$('#shis_yanwbjsl input').val());
	   params.push("cangkbh="+$('#shis_cangkbh input').val());	   
	   params.push("chanx="+$('#shis_chanx input').val());
	   params.push("jihy="+$('#shis_jihy input').val());
	   params.push("gongysdm="+$('#shis_gongysdm input').val());
	   params.push("chengysdm="+$('#shis_chengysdm input').val());
	   params.push("lingjbh="+$('#shis_lingjbh input').val());
	   
	   if($('#shis_dapsxsj input').val()=='' || parseInt($('#shis_dapsxsj input').val()) < 20 )
	   {
	   	  alert("大屏刷新时间不能为空，或者小于20");
	   	  return;
	   }
	   if($('#shis_yanwbjsj input').val()=='' || parseFloat($('#shis_yanwbjsj input').val()) < 0.1 )
	   {
	   	  alert("延误报警时间不能为空，或者小于低于1");
	   	  return;
	   }
	   if($('#shis_yanwbjsl input').val()=='' || parseInt($('#shis_yanwbjsl input').val()) < 1 )
	   {
	   	  alert("延误报警数量不能为空，或者小于1");
	   	  return;
	   }
	   
	   var yaohllx="";
	   $('#content_shis_yaohllx input[type="checkbox"]').each(function(){
	   	  if($(this).attr("checked"))
	   	  {
	   	  	yaohllx +=$(this).val()+"+";
	   	  }
	   });
	   /**
	   if($('#content_shis_yaohllx input[value=\"R1\"]').attr("checked")){
	   		yaohllx = yaohllx+"R1+";
	   }
	   if($('#content_shis_yaohllx input[value=\"R2\"]').attr("checked")){
	   		yaohllx = yaohllx+"R2+";
	   }
	   if($('#content_shis_yaohllx input[value=\"C1\"]').attr("checked")){
	   		yaohllx = yaohllx+"C1+";
	   }
	   if($('#content_shis_yaohllx input[value=\"CD\"]').attr("checked")){
	   		yaohllx = yaohllx+"CD+";
	   }
	   **/
	   yaohllx=yaohllx.substr(0,yaohllx.length-1);
	   if(yaohllx.length < 1)
	   {
	   	  alert("至少选中一个要货令类型");
	   	  return;
	   }
	   var yaohlzt="";
	   if($('#content_shis_yaohlzt input[value=\"01\"]').attr("checked")){
	   		yaohlzt = yaohlzt+"01+";
	   }
	   if($('#content_shis_yaohlzt input[value=\"02\"]').attr("checked")){
	   		yaohlzt = yaohlzt+"02+";
	   }
	   //2015-9-28日新增
	   if($('#content_shis_yaohlzt input[value=\"03\"]').attr("checked")){
	   		yaohlzt = yaohlzt+"03,";
	   }
	   if(yaohlzt.length < 1)
	   {
	   	  alert("至少选中一个要货令状态");
	   	  return;
	   }
	   yaohlzt=yaohlzt.substr(0,yaohlzt.length-1);	   
	   params.push("yaohlzt="+yaohlzt);
	   params.push("yaohllx="+yaohllx);
	   var usercenter = $('#serachKey').val();
	   params.push("usercenter="+usercenter);
	   var src="";
	   var num = 0;
	   $('#content_shis_factory input[type="checkbox"]').each(function(){
	   	  if($(this).attr("checked"))
	   	  {
	   	    num++;
	   	  	src +=$(this).val()+"+";
	   	  }
	   });
	   src = src.substr(0,src.length-1);
	   if(num <= 0 || num >2)
	   {
	   	  alert("您必须选择一个最多二个工厂");
	   	  return;
	   }
	   params.push("num="+num);
	   params.push("factory="+src);
	   var c = params.join('&');
	   var strWindowType = "top=0,left=0,toolbar=no,location=no,directories=no,menubar=no,scrollbars=no,resizable=yes,status=yes,fullscreen=yes";
	   $('#putvalue').val(c);
	   var obj = window ;
	   obj.value = c;
	   window.open("${ctx}/baob/showscreen.do?"+"inputvalue="+c,"cc",strWindowType);
	   //var a = window.open("${ctx}/baob/showscreen.do?"+"inputvalue="+c,"","");   
	  // $("#putform").attr("action","${ctx}/baob/showscreen.do");
	  // document.putform.submit();
	}
	
	$(function(){
	    $('#serachKey').val('${USERCENTER}');
	    $.sdcui.ajaxUtil.ajax({
		url : "${ctx}/baob/queryConfig.ajax",
			data : '',
			success : function(result) {
				//配置项表格赋值
				$('#shis_dapsxsj input').val(result.result[0].dapsxsj);
				$('#shis_yanwbjsj input').val(result.result[0].yanwbjsj);
				$('#shis_yanwbjsl input').val(result.result[0].yanwbjsl);
				$('#shis_cangkbh input').val(result.result[0].cangkbh);
				$('#shis_chanx input').val(result.result[0].chanx);		
				$('#shis_jihy input').val(result.result[0].jihy);		
				$('#shis_gongysdm input').val(result.result[0].gongysdm);	
				$('#shis_chengysdm input').val(result.result[0].chengysdm);
				$('#shis_lingjbh input').val(result.result[0].lingjbh);
				
				var ztlist = result.result[0].yaohlzt.split(',');
				var lxlist = result.result[0].yaohllx.split(',');
				var gclist = result.result[0].gongc.split(',');
				var i =0;
				var timer = setInterval(function(){
				$('#content_shis_yaohllx input[type="checkbox"]').each(function(i,obj){
					for(i=0;i<lxlist.length;i++){
						if(lxlist[i].substr(0,2) == $(this).val())
			  				{
			  					$(this).attr("checked",true);
			  				}
		  			}
					clearInterval(timer);
							 	
			  		});
			  		
				},500);
				/**
					if(lxlist[i].substr(0,2)== "R1")
					{
					   $('#content_shis_yaohllx input[value="R1"]').attr("checked",true);
					}
					if(lxlist[i].substr(0,2)== "R2")
					{
						$('#content_shis_yaohllx input[value="R2"]').attr("checked",true);
					}
					if(lxlist[i].substr(0,2)== "C1")
					{
						$('#content_shis_yaohllx input[value="C1"]').attr("checked",true);
					}
					if(lxlist[i].substr(0,2)== "CD")
					{
						$('#content_shis_yaohllx input[value="CD"]').attr("checked",true);
					}
					**/
				
				
				for(i=0;i<ztlist.length;i++){
				
					if(ztlist[i].substr(0,2)== "01")
					{
						$('#content_shis_yaohlzt input[value="01"]').attr("checked",true);
					}
					if(ztlist[i].substr(0,2)== "02")
					{
						$('#content_shis_yaohlzt input[value="02"]').attr("checked",true);
					}
					//2015-9-28日新增
					if(ztlist[i].substr(0,2)== "03")
					{
						$('#content_shis_yaohlzt input[value="03"]').attr("checked",true);
					}
				}
				//2015-9-22日新增
	  		    $('#content_shis_factory input[type="checkbox"]').each(function(){
	  		 	 for(i=0;i<gclist.length;i++){
	  		 	   if(gclist[i].substr(0,1) == $(this).val())
	  		 		{
	  		 			$(this).attr("checked",true);
	  		 		}
	  		 	 }
			    });
			}
		});
	})
</script>
</t:html>