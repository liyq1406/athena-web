<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","640");%>
<t:html i18n="i18n.ck">
<head>
<title>${i18n.title_640}</title>
<jsp:include page="../../common/js.jsp" />
<script type="text/javascript">
//0010495
var paramsQuery;
var currentPage = 1;
var djbh='';
$(function(){
	$('#form_user_${pageId}').form({
		onreload:true,
		onemoredemand:true,
 		fields:[
                {fieldType:'fieldLabel',property:'wuld',value:st_Rongqcbh},
				{fieldType:'fieldText',property:'rongqxh',maxLength:'5',caption:'${i18n.rongqxh}',notNull:true},
				{fieldType:'fieldText',property:'rongqsl',maxLength:'6',caption:'${i18n.jiessl}',notNull:true},
				{fieldType:'fieldText',property:'gongysdm',dataType:'shuzzm',maxLength:'10',caption:'${i18n.gongcbh}',notNull:false}
				]
 		});
	$('#grid_user_${pageId}').grid({
		keyFields:['rongbgmxid','wuld','rongqsl','rongqxh','gcbh'],
		id:'grid_user_${pageId}',
		pageSize:'10',
		showCheckbox:true,
		//翻页查询交易
		src:'<%=request.getContextPath()%>/rongqi/64001.do',
		cols:[
		{property:'rongqxh',caption:'${i18n.rongqxh}'},
  		{property:'rongqsl',caption:'${i18n.rongqsl}'},
		{property:'gcbh',caption:'${i18n.gongcbh}'},
		{property:'gongysmc',caption:'${i18n.gongcmc}'},
		{property:'rongbgmxid',width:'0'}
  		]
	});

	//F1增加
 	$('#btn_ok').bind('click',function(){
 		 //参数校验
 		if(!$('#form_user_${pageId}').form("validateParam")){
				return;	
 		}
 		//提交数据
 		var params = $('#form_user_${pageId}').form("getFormParam");
 		params.push("usercenter="+st_UserCenter); 	
 		params.push("danjbh="+djbh); 	
 		$('#grid_user_${pageId}').grid("setQueryParams", params);
 		var url = "<%=request.getContextPath()%>/rongqi/64002.do";
		 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 if (showPromptRequestMsg(results)==true){
			 	    if(results.result.parameter.danjbh!=''){
	   	            	 djbh=results.result.parameter.danjbh; 
	   	            } 
			  		$("#rongqxh input").val('');
			  		$("#rongqsl input").val('');
			  		$('#gongysdm input').attr("disabled",true);	
			  
			 		
					//$('#grid_user_${pageId}').grid('clearRecords');
					//加载返回数据
					$('#grid_user_${pageId}').grid('parseResult',results);
					$('.rongbgmxid').hide();
					$('#rongqxh input').focus();
								
			 }
			 });
			 return false;
 	}); 
 	//F2删除
	$('#btn_delete').bind('click',function(){
		//获取选择行
 		var params = $('#grid_user_${pageId}').grid('getSelectedAll');
 		var params1 = $('#form_user_${pageId}').form("getFormParam");
 		
 		
		if(params.length < 1){
			showPromptMsg('red','${i18n.selectoneerror}')
			return false;
		}
		//打开提示框是否删除
		if(confirm($.sdcui.resource.i18n['C_remove'])){
		//先提交选中行，然后再重新加载			
		params.push("currentPage="+$('#grid_user_${pageId}').grid('getCurrentPage'));				       
        params.push("wuld="+st_Rongqcbh);	
        params.push("danjbh="+djbh); 
        params = params.concat(params1);
        $('#grid_user_${pageId}').grid("setQueryParams", params);  	
		var url = "<%=request.getContextPath()%>/rongqi/64003.do";
		 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 if (showPromptRequestMsg(results)==true){
			 	 djbh=results.result.parameter.danjbh; 
				 $('#grid_user_${pageId}').grid('parseResult',results);
				  $('.rongbgmxid').hide();
			 }
			 });
		}
		return false;
	}); 
	//F3删除全部
	$('#btn_deleteAll').bind('click',function(){
		//打开提示框是否删除
		if(confirm($.sdcui.resource.i18n['C_remove'])){
		//先提交选中行，然后再重新加载
		var params = $('#form_user_${pageId}').form("getFormParam");
		params.push("usercenter="+st_UserCenter); 	
		params.push("danjbh="+djbh); 
		//params.push("danjbh="+$('#danjbh input').val());		
		var url = "<%=request.getContextPath()%>/rongqi/64004.do";
		 	$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
				 if (showPromptRequestMsg(results)==true){
				     djbh=results.result.parameter.danjbh; 
					 $('#grid_user_${pageId}').grid('parseResult',results);
					 $('#gongysdm input').attr("disabled",false);	
				 }
			 });
		}
		return false;
	}); 
 	//F4 选中
 	$('#getSelected').bind('click',function(){
 		$('#grid_user_${pageId}').grid('selected');
			return false;
 	});
 	
	//F5 结束录入
	$('#btn_print').bind('click',function(){
			var params = [];
			params.push("usercenter="+st_UserCenter);
			params.push("danjbh="+djbh); 
			var url = "<%=request.getContextPath()%>/rongqi/64005.do";
			 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
				 if (showPromptRequestMsg(results)==true){
					   if (results.result.response == "0000"){
					       djbh='';
					  	   $("#rongqxh input").val('');
					  	   $("#rongqsl input").val('');
					  	   $("#gongysdm input").val('');
					       $('#gongysdm input').attr("disabled",false);
					       $('#grid_user_${pageId}').grid('parseResult',results);
					   } 
		         }
		 }); 		
 		return false;
	}); 
	$(document).keyboardsupport({});
	});
/**
 *进入640页面后进行查询
 */
$(document).ready(function(){
   var params =[] ;
   params.push("wuld="+st_Rongqcbh);	
   params.push("usercenter="+st_UserCenter);
   var url = "<%=request.getContextPath()%>/rongqi/64001.do";
   $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
  	
	  if (showPromptRequestMsg(results)==true){
	   		
	        if(results.result.response != 'C_1403'){//有数据的情况
			     //设置分页
				 params.push("currentPage=1");
				 $('#grid_user_${pageId}').grid("setQueryParams", params);
   	             $('#grid_user_${pageId}').grid('parseResult',results);
   	             
   	             
   	             if(results.result.parameter.list!=''){  
   	             	 $('.rongbgmxid').hide(); 	             
	   	             var gcbh = results.result.parameter.list[0].gcbh;
	   	             $('#gongysdm input').val(gcbh);
	   	             $('#gongysdm input').attr("disabled",true); 
	   	             
	   	              if(results.result.parameter.danjbh!=''){
	   	            	 djbh=results.result.parameter.danjbh; 
	   	              } 	              	             
   	             }
   	              
  	         }
        }
       //msgClear();
       return false;
     });
		
});
</script>
</head>
<body>
<div id="title"></div>
<div id="form_user_${pageId}" class="ui-fieldLayout" >
<table class="ui-grid" cellspacing="1" width="100%" >
<tbody>
	<tr>
		<td class="field-label">${i18n.rongqiq}：</td>
		<td class="field-container"><div class="ui-field" id="wuld" ></div></td>			
		
		<td class="field-label">${i18n.rongqxh}：</td>
		<td class="field-container"><div class="ui-field" id="rongqxh"></div></td>
	</tr>
	<tr>
		<td class="field-label">${i18n.rongqisl}：</td>
		<td class="field-container"><div class="ui-field" id="rongqsl"></div></td>
		<td class="field-label">${i18n.gongcbh}：</td>
		<td class="field-container"><div class="ui-field" id="gongysdm"></div></td>		
	</tr>
</tbody>
</table>
<br/>
<div align="right">		
	<span id="btn_ok"  class="ui-button">${i18n.add}[F1]</span>
	<span id="btn_delete"  class="ui-button">${i18n.delete}[F2]</span>
	<span id="btn_deleteAll"  class="ui-button">${i18n.qbdelete}[F3]</span>	
	<span id="getSelected"  class="ui-button">${i18n.checked}[F4]</span>
	<span id="btn_print"  class="ui-button">${i18n.jieslr}[F5]</span>
	<span id="btn_back"  class="ui-button">${i18n.back}[F11]</span>	
	<span id="btn_return"  class="ui-button">${i18n.return}[F12]</span>
   </div>
   <br/>
<div id="grid_user_${pageId}" class='hidden-item'></div>
</div>
<div id='prompt'>${i18n.prompt}</div>
</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>