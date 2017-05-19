<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","603");%>
<t:html i18n="i18n.ck">
<head>
<title>${i18n.title_603}</title>
<jsp:include page="../../common/js.jsp" />
<jsp:include page="../../common/print.jsp" />
<script type="text/javascript">
var paramsQuery;
var currentPage = 1;
$(function(){
	$('#form_user_${pageId}').form({
		onreload:true,
 		fields:[				
                {fieldType:'fieldSelect',notNull:true,property:'diaoruwld',caption:'${i18n.fankongq}',src:'<%=request.getContextPath()%>/common/getrongqc.do?temp=2&rongqcbh='+st_Rongqcbh},
                {fieldType:'fieldLabel',property:'wuld',value:st_Rongqcbh},
				{fieldType:'fieldText',property:'rongqxh',dataType:'letter_numeric',limitedLength:'5',caption:'${i18n.rongqxh}',notNull:true},
				{fieldType:'fieldText',property:'rongqsl',dataType:'plusinteger',caption:'${i18n.shenbsl}',notNull:true},
				{fieldType:'fieldText',biaos:'enter',property:'gongysdm',dataType:'shuzzm',maxLength:'10',caption:'${i18n.gongysdm}',notNull:true},
				{fieldType:'fieldLabel',property:'gongysmc',dataType:'letter_numeric',limitedLength:'10',caption:'${i18n.gongysmc}',notNull:true},
				{fieldType:'fieldText',biaos:'enter',property:'chengysdm',dataType:'shuzzm',maxLength:'10',caption:'${i18n.chengysdm}',notNull:false},
				{fieldType:'fieldLabel',property:'wulsmc',caption:'${i18n.wulsmc}'},
				{fieldType:'fieldHidden',property:'danjbh'}
	 			]
 		});
	$('#grid_user_${pageId}').grid({
		keyFields:['rongqxh','rongqsl','chengysdm','gongysdm','diaorwld'],
		id:'grid_user_${pageId}',
		showCheckbox:true,
		//翻页查询交易
		src:'<%=request.getContextPath()%>/rongqi/60302.do',
		cols:[
		{property:'rongqxh',caption:'${i18n.rongqxh}'},
  		{property:'rongqsl',caption:'${i18n.rongqsl}'},
  		{property:'chengysdm',caption:'${i18n.chengysdm}'}
  		//{property:'gongysdm',caption:'${i18n.gongysdm}'}
  		],
  		buttons:[
  				//F1 确认
 				{name:'btn_ok',caption:'${i18n.ok}[F1]',keyboard:'F1',action:function(){
 			 		 //参数校验
 			 		if(!$('#form_user_${pageId}').form("validateParam")){
 							return;	
 			 		}
 			 		 //提交数据
 			 		var params = $('#form_user_${pageId}').form("getFormParam");
 					params.push("currentPage="+currentPage);
 					params.push("danjbh="+$('#danjbh input').val());
 					$('#grid_user_${pageId}').grid("setQueryParams", params);
 			 		var url = "<%=request.getContextPath()%>/rongqi/60301.do";
 					 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
 						 if (showPromptRequestMsg(results)==true){
 							//加载grid
 								$('#grid_user_${pageId}').grid("parseResult",results)
 								$('#danjbh input').val(results.result.parameter.danjbh);
 								if (results.result.response == "0000"){
 									$('#gongysdm input').attr("disabled",true);
 	 								$('#chengysdm input').attr("disabled",true);
 	 								$('#diaoruwld input').attr("disabled",true);
 								    $('#rongqxh input').val('').focus();
 								    $('#rongqsl input').val(''); 								
 								 
 								}
 						 }
 						 });
 					 return false;
 				}},
 				//F2 删除
 				{name:'btn_delete',caption:'${i18n.delete}[F2]',keyboard:'F2',action:function(){
 			 		//是否选中
 					var records = $('#grid_user_${pageId}').grid('getSelectedAll');
 					if(records.length < 1){
 						showPromptMsg('red','${i18n.selectoneerror}')
 						return false;
 					}
 					var params = $('#grid_user_${pageId}').grid('getSelectedAll');
 					params.push("danjbh="+ $('#danjbh input').val());
 					params.push("wuld="+ $('#wuld span').html());
 					params.push("zhuangtsx=1");
 					params.push("currentPage="+$('#grid_user_${pageId}').grid('getCurrentPage'));
 					var url = "<%=request.getContextPath()%>/rongqi/60305.do";
 					 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
 						 if (showPromptRequestMsg(results)==true){
 							//加载grid
 								$('#grid_user_${pageId}').grid("parseResult",results)
 								
 						 }
 						 });
 				}},
 				//F3 打印 结束录入
 				{name:'btn_print',caption:'${i18n.jieslr}[F3]',keyboard:'F3',action:function(){
	 			 		if($('#danjbh span').html()==""){
	 			 			showPromptMsg('red',$.sdcui.resource.i18n['C_danjbh']);
	 			 			return;
	 			 		}
	 			 		var params = [];
	 					params.push("usercenter="+st_UserCenter);
	 					params.push("danjbh="+$('#danjbh input').val());
	 					var url = "<%=request.getContextPath()%>/rongqi/60306.do";
	 			 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
	 				 		if (showPromptRequestMsg(results)==true){
	 					 		$('#grid_user_${pageId}').grid('parseResult',results)
	 					   if (results.result.response == "0000"){
	 						  <%--  var params2 = [];
	 							params2.push("usercenter="+st_UserCenter);
	 							params2.push("danjbh='"+ $('#danjbh span').html()+"'");
	 							var url2 = "<%=request.getContextPath()%>/rongqi/63002.do";
	 							var pageid='630';
	 							g_isSub=0;
	 							doprint(pageid,params2,url2); --%>
	 							$('#form_user_${pageId}').form("resetFields");
	 							$('#grid_user_${pageId}').grid('clearRecords');
	 							$('#danjbh input').html("");
	 							$('#wuld span').html(st_Rongqcbh);
	 							$('#gongysdm input').attr("disabled",true);
	 							$('#chengysdm input').attr("disabled",false);
	 							$('#diaoruwld input').attr("disabled",false);
	 					  } 
	 					 
	 				 }
	 				 });						
	 				 return false;
 				}},
 				//单选
 				{name:'getSelected',caption:'${i18n.checked}[F4]',keyboard:'F4',action:function(){
 					$('#grid_user_${pageId}').grid('selected');
 					return false;
 				}}
 				//全选
 				,{name:'selectedAll',caption:'${i18n.selectall}[F5]',keyboard:'F5',action:function(){
 					msgClear();
 					$('#grid_user_${pageId}').grid('selectedAll');
 					return false;
 				}},
			 	//返回上一页
				{name:'btn_back',caption:'${i18n.back}[F11]',keyboard:'F11'},
				//返回主页
				{name:'btn_return',caption:'${i18n.return}[F12]',keyboard:'F12'}
 				]
	});
 	$('#gongysdm input').bind('blur',function(){
 		var gongys=$('#gongysdm input').val();
 		 if(!$('#gongysdm input').attr("readonly")){
 			if(gongys.toUpperCase()=="DPCA"){
 	 			$('#chengysdm input').val('DPCA');
 			}else{
 				$('#chengysdm input').val('');
 			}
 		 }
 		
 	});
	//根据输入供应商编号带出 供应商名称
 	$('#gongysdm').bind('enter',function (){
 		if($('#gongysdm input').val()=="000000"){
 			return 			
 		}
 		if(!$('#gongysdm').fieldText('validateNotNull')){
 			return;
 		}
 		if($('#gongysdm input').val().toUpperCase()=="DPCA"){
 			 $('#gongysmc span').html('DPCA');
 			}else{
 				 var params = $('#form_user_${pageId}').form("getFormParam"); 		 		
 				 var url = "<%=request.getContextPath()%>/common/60303.do";
 				 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
 					 if (results.result.response == "0001"){
 						 $('#gongysmc span').html(results.result.parameter.gongysmc)
 					 }else{
 						 $('#gongysmc span').html("")
 					 }
 					 
 					 });
 			}
 		
 	});
 	
	//根据输入物流商编号带出 物流商名称
 	$('#chengysdm').bind('enter',function (){
 		if($('#chengysdm input').val()=="000000"){
 			return 			
 		}
 		if(!$('#chengysdm').fieldText('validateNotNull')){
 			return;
 		}
 		if($('#chengysdm input').val().toUpperCase()=="DPCA"){
 			$('#wulsmc span').html('DPCA');
 		}else{
 			var params = $('#form_user_${pageId}').form("getFormParam"); 	 		
			var url = "<%=request.getContextPath()%>/common/60304.do";
			$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
				 if (results.result.response == "0001"){
					 $('#wulsmc span').html(results.result.parameter.chengysmc);
				 }else{
					 $('#wulsmc span').html("")
				 }				 
				});
 		}
 		
 	});
 	$(document).keyboardsupport({});
});
/**
  *进入603页面后进行查询
  */
 $(document).ready(function(){
	//设置供应商编号不可输入
	$("#gongysdm input").attr('disabled',true);
	//供应商编号赋值
	$('#chengysdm input').change(function(){
		$("#gongysdm input").val($('#chengysdm input').val());
	});
	//供应商编号赋值
	$('#chengysdm input').bind('input propertychange',function(){
		$("#gongysdm input").val($('#chengysdm input').val());
	});
    var params =[] ;
    params.push("wuld="+st_Rongqcbh);	
    //params.push("zhuang=1");	
    var url = "<%=request.getContextPath()%>/rongqi/60302.do";
    $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
	  if (showPromptRequestMsg(results)==true){
	        if(results.result.response != 'C_1403'){
			     //设置分页
				 params.push("currentPage=1");
				 params.push("danjbh="+results.result.parameter.danjbh);
				 $('#grid_user_${pageId}').grid("setQueryParams", params);
		         //加载返回数据
		         $("#danjbh input").val(results.result.parameter.danjbh);
		         $("#diaoruwld input").val(results.result.parameter.diaoruwld);
		         $("#diaoruwld input").attr('realValue',results.result.parameter.diaoruwld);
    	         $("#gongysdm input").val(results.result.parameter.gongysdm);
    	         $('#chengysdm input').val(results.result.parameter.chengysdm);
    	         $('#gongysmc span').html(results.result.parameter.gongysmc);
    	         $('#wulsmc span').html(results.result.parameter.chengysmc);
    	         $('#grid_user_${pageId}').grid('parseResult',results);
    	         if(
    	        		 $('#gongysdm input').val()!="" &&
    	        		 $('#chengysdm input').val()!="" &&
    	        		 $('#diaoruwld input').val()!=""
    	             ){	    	        	 
	    	        	 $('#gongysdm input').attr("disabled",true);
						 $('#chengysdm input').attr("disabled",true);
						 $('#diaoruwld input').attr("disabled",true);
						 $('#rongqxh input').val('').focus();
    	         }
   	         }
         }
        msgClear();
      });
 		return false;
 });
</script>
</head>
<body>
<!--主体内容开始-->
<div id="title"></div>
<!--  <input id="danjbh" type="Hidden"></input>-->
<div id="form_user_${pageId}" class="ui-fieldLayout">
		<table class="ui-grid" cellspacing="1" width="100%" >
      <tr>
	  	<td class="field-label">${i18n.fankongq}：</td>
		<td class="field-container"><div class="ui-field" id="diaoruwld"></div></td>
		<td class="field-label">${i18n.rongqiq}：</td>
		<td class="field-container"><div class="ui-field" id="wuld"></div></td>
		<td class="field-label">${i18n.rongqxh}：</td>
		<td class="field-container"><div class="ui-field" id="rongqxh"></div></td>
      </tr>
       <tr>
		<td class="field-label">${i18n.rongqgys}：</td>
		<td class="field-container"><div class="ui-field" id="gongysdm"></div></td>
		<td class="field-label">${i18n.gongysmc}：</td>
		<td class="field-container"><div class="ui-field" id="gongysmc"></div></td>
		<td class="field-label">${i18n.shenbsl}：</td>
		<td class="field-container"><div class="ui-field" id="rongqsl"></div></td>
      </tr>
      <tr>
		<td class="field-label">${i18n.rongqwls}：</td>
		<td class="field-container"><div class="ui-field" id="chengysdm"></div></td>
		<td class="field-label">${i18n.wulsmc}：</td>
		<td class="field-container"><div class="ui-field" id="wulsmc"></div></td>
		<td ><div class="ui-field" id="danjbh"></div></td>
		<td class="field-container"></td>
	 </tr>	     
  </table>
   <div id="grid_user_${pageId}" class='hidden-item'></div>
</div>		
<div id='prompt'>${i18n.prompt}</div>
</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>