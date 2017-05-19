<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","606");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_606}</title>
<jsp:include page="../../common/js.jsp" />
<jsp:include page="../../common/print.jsp" />
<script type="text/javascript">
var paramsQuery;
var currentPage = 1;
$(function(){
	$('#form_user_${pageId}').form({
		onreload:true,
 		fields:[
                //{fieldType:'fieldText',property:'gongysdm',dataType:'shuzzm',maxLength:'10',caption:'${i18n.gongys}',notNull:true},
                //{fieldType:'fieldText',property:'chengysdm',maxLength:'10',dataType:'shuzzm',caption:'${i18n.wuls}',notNull:true},
                {fieldType:'fieldLabel',property:'wuld',value:st_Rongqcbh},
                 {fieldType:'fieldHidden',property:'danjbh'},
                {fieldType:'fieldText',property:'rongqxh',dataType:'letter_numeric',limitedLength:'5',caption:'${i18n.rongqxh}',notNull:true},
                {fieldType:'fieldText',property:'rongqsl',dataType:'plusinteger',caption:'${i18n.baofsl}',notNull:true},
                {fieldType:'fieldText',property:'zaiy',maxLength:'25',caption:'${i18n.baofeiyy}',notNull:true}
	 			]
 		});
	$('#grid_user_${pageId}').grid({
		keyFields:['rongqxh','gongysdm','chengysdm','wuld','rongqsls'],
		id:'grid_user_${pageId}',
		showCheckbox:true,
		//翻页查询交易
		src:'<%=request.getContextPath()%>/rongqi/60604.do',
		cols:[
		//{property:'gongysdm',caption:'${i18n.gongys}'},
  		//{property:'chengysdm',caption:'${i18n.wuls}'},
  		{property:'wuld',caption:'${i18n.rongqiq}'},
  		{property:'rongqxh',caption:'${i18n.rongqxh}'},
  		{property:'rongqsl',caption:'${i18n.baofsl}'},
  		{property:'zaiy',caption:'${i18n.baofeiyy}'}
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
 			 		params.push('danjbh='+$('#danjbh input').val());
 			 		params.push('zhuangt=1');
 			 		$('#grid_user_${pageId}').grid("setQueryParams", params);
 			 		var url = "<%=request.getContextPath()%>/rongqi/60601.do";
 					 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
 						 if (showPromptRequestMsg(results)==true){
 							//加载返回数据
 								$('#grid_user_${pageId}').grid('parseResult',results)
 								$('#danjbh input').val(results.result.parameter.danjbh);
 								if (results.result.response == "0000"){
 									//$('#gongysdm input').attr("readonly","readonly");
 									//$('#chengysdm input').attr("readonly","readonly");
 									$('#rongqxh input').val('').focus();
 									$('#rongqsl input').val('');
 								}
 								else{
 									//$('#gongysdm input').attr("readonly",false);
 									//$('#chengysdm input').attr("readonly",false);
 								}
 						 }
 						 });
 				}},
 				//F2 删除
 				{name:'btn_delete',caption:'${i18n.delete}[F2]',keyboard:'F2',action:function(){
 					//获取选择行
 			 		var params = $('#grid_user_${pageId}').grid('getSelectedAll');
 					if(params.length < 1){
 						showPromptMsg('red','${i18n.selectoneerror}')
 						return false;
 					}
 					//打开提示框是否删除
 					if(confirm($.sdcui.resource.i18n['C_remove'])){
 					params.push('danjbh='+$('#danjbh input').val());
 					params.push('zhuangt=1');
 					params.push("currentPage="+$('#grid_user_${pageId}').grid('getCurrentPage'));
 			 		var url = "<%=request.getContextPath()%>/rongqi/60602.do";
 					 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
 						 if (showPromptRequestMsg(results)==true){
 							 $('#grid_user_${pageId}').grid("parseResult",results)
 						 }
 						 });
 					}
 				}},
 				//F4 单选
 				{name:'getSelected',caption:'${i18n.checked}[F4]',keyboard:'F4',action:function(){
 					$('#grid_user_${pageId}').grid('selected');
 					return false;
 				}},
 				//F5 打印
 				{name:'btn_print',caption:'${i18n.jieslr}[F5]',keyboard:'F5',action:function(){
	 					if($('#danjbh input').val()=="")
	 					{
	 					showPromptMsg('red','${i18n.danjbhbnwk}')
	 					return;
	 					}
	 					var params = [];
	 					params.push("usercenter="+st_UserCenter);
	 					params.push("danjbh="+$('#danjbh input').val());
			 			var url = "<%=request.getContextPath()%>/rongqi/60603.do";
			 			 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 				 if (showPromptRequestMsg(results)==true){
			 					 $('#grid_user_${pageId}').grid('parseResult',results)
			 					   if (results.result.response == "0000"){
			 						   var params2 = [];
			 					 		params2.push("usercenter="+st_UserCenter);
			 					 		params2.push("danjbh="+$('#danjbh input').val());
			 					 		var url2 = "<%=request.getContextPath()%>/rongqi/63002.do";
			 					 		g_isSub=0;
			 					 		doprint(630,params2,url2);
			 							$('#form_user_${pageId}').form("resetFields");
			 							$('#grid_user_${pageId}').grid('clearRecords');
			 							$('#danjbh input').val("");
			 							$('#wuld span').html(st_Rongqcbh);
			 							//$('#gongysdm input').attr("readonly",false);
			 							//$('#chengysdm input').attr("readonly",false);
			 					  } 
			 					 
			 				 }
			 				 });	
			 				 		return false;
 				}},
 				//F11 返回上一页
 				{name:'btn_back',caption:'${i18n.back}[F11]',keyboard:'F11'},
 				//F12 返回主页
 				{name:'btn_return',caption:'${i18n.return}[F12]',keyboard:'F12'}
 				]
	});
	/*
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
	*/
	$(document).keyboardsupport({});
});
/**
  *进入606页面后进行查询
  */
 $(document).ready(function(){
    var params =[] ;
    params.push("wuld="+st_Rongqcbh);	
    var url = "<%=request.getContextPath()%>/rongqi/60604.do";
    $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
	  if (showPromptRequestMsg(results)==true){
	        if(results.result.response != 'C_1403'){
			     //设置分页
				 params.push("currentPage=1");
				 $('#grid_user_${pageId}').grid("setQueryParams", params);
		         //加载返回数据
		         $("#danjbh input").val(results.result.parameter.danjbh);
    	         $('#grid_user_${pageId}').grid('parseResult',results);
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
<!-- <input id="danjbh" type="Hidden"></input> -->
<div id="form_user_${pageId}" class="ui-fieldLayout">
<table class="ui-grid" cellspacing="1" width="100%" >
		  <tr>
		  <!--  
		<td class="field-label">${i18n.gongys}：</td>
		<td class="field-container"><div class="ui-field" id="gongysdm"></div></td>		
		
		<td class="field-label">${i18n.wuls}：</td>
		<td class="field-container"><div class="ui-field" id="chengysdm"></div></td>
		-->
		
		   <td class="field-label">${i18n.rongqiq}：</td>
		   <td class="field-container"><div class="ui-field" id="wuld"></div></td>
		   <td class="field-label">${i18n.rongqxh}：</td>
		   <td class="field-container"><div class="ui-field" id="rongqxh"></div></td>		 
		   <td class="field-label">${i18n.baofsl}：</td>
		   <td class="field-container"><div class="ui-field" id="rongqsl"></div></td>
		   <td class="field-label">${i18n.baofeiyy}：</td>
		   <td class="field-container"><div class="ui-field" id="zaiy"></div></td>		
		    <td class="field-container"><div class="ui-field" id="danjbh"></div></td>		
		</tr>
</table>

<div id="grid_user_${pageId}" class='hidden-item'></div>
		</div>

<div id='prompt'>${i18n.prompt}</div>

</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>