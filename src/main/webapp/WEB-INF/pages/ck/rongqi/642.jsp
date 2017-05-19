<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","642");%>
<t:html i18n="i18n.ck">
<head>
<title>${i18n.title_642}</title>
<jsp:include page="../../common/js.jsp" />
<script type="text/javascript">
var paramsQuery;
var currentPage = 1;
var rongqfhdh='';
var flag='0';
$(function(){
	$('#form_user_${pageId}').form({
		onreload:true,
		onemoredemand:true,
 		fields:[
                {fieldType:'fieldLabel',property:'wuld',value:st_Rongqcbh},
                {fieldType:'fieldText',property:'chengys',dataType:'shuzzm',maxLength:'10',caption:'${i18n.fanhs}',notNull:true},
                {fieldType:'fieldText',property:'danjbh',dataType:'shuzzm',maxLength:'10',caption:'${i18n.rongqbbq}',notNull:false},
				{fieldType:'fieldText',property:'rongqxh',caption:'${i18n.rongqxh}',dataType:'letter_numeric',limitedLength:'5',notNull:false},
				{fieldType:'fieldText',property:'rongqsl',dataType:'plusinteger',maxLength:'6',caption:'${i18n.jiessl}',notNull:false},
				{fieldType:'fieldText',property:'gongysdm',dataType:'shuzzm',maxLength:'10',minLength:'10',caption:'${i18n.gongcbh}',notNull:false},
				//0010495
				{fieldType:'fieldText',property:'tch',notNull:true,dataType:'text',includeNull:false,maxLength:'8',caption:'${i18n.kch}'}						
				]
 		});
	$('#grid_user_${pageId}').grid({
		keyFields:['liush','rongqxh','rongqsl','rongqfhdh'],
		id:'grid_user_${pageId}',
		showCheckbox:true,
		//翻页查询交易
		src:'<%=request.getContextPath()%>/rongqi/64201.do',
		editSubmitSrc:'<%=request.getContextPath()%>/rongqi/63406.do?usercenter='+st_UserCenter,
		cols:[
		{property:'rongqbh',caption:'${i18n.rongqbgdh}'},
		{property:'rongqxh',caption:'${i18n.rongqxh}'},
  		{property:'rongqsl',caption:'${i18n.rongqsl}'},
  		{property:'gongysdm',caption:'${i18n.gongcbh}'},	
  		{property:'gongysmc',caption:'${i18n.gongcmc}'},	
		{property:'fanhs',caption:'${i18n.fanhs}'},	
		{property:'fanhsmc',caption:'${i18n.fanhsmc}'},
		{property:'caozy',caption:'${i18n.caozy}'},	
		{property:'create_time',caption:'${i18n.create_time}'},	
		{property:'liush',width:'0'},
		{property:'rongqfhdh',width:'0'}
  		]
	});

	//F1按容器型号增加
 	$('#anrqxh').bind('click',function(){
 		if(""==$('#rongqxh input').val()){
 				showMsg("${i18n.C_642_02}");
				return false;
		}		
		
 		//参数校验
 		if(!$('#form_user_${pageId}').form("validateParam")){
				return;	
 		}
 		 		
 		if(""!=$('#rongqxh input').val()){
 				if(!$('#gongysdm').fieldText('validateNotNull')){
			 			return;
			 	}	
			 	if(!$('#rongqsl').fieldText('validateNotNull')){
			 			return;
			 	}	
		}
		
		$("#danjbh input").val('');
 		
 		/*
 		if(""==$('#rongqsl input').attr("realValue")){
 		
 		}else{
	 		if(!$('#tch').fieldText('validateNotNull')){
				return;
			} 
 		}
 		*/
 		
 		
		//单据类型赋值
		//$('#danjlx input').val($('#zhuangtsx input').attr("realValue"));
 		//提交数据
 		var params = $('#form_user_${pageId}').form("getFormParam");
 		params.push("usercenter="+st_UserCenter); 		
 		params.push("rongqfhdh="+rongqfhdh); 
 		$('#grid_user_${pageId}').grid("setQueryParams", params);
 		var url = "<%=request.getContextPath()%>/rongqi/64202.do";
		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 if (showPromptRequestMsg(results)==true){
				//加载返回数据
				$('#grid_user_${pageId}').grid('parseResult',results);
			    
				if (results.result.response == "0000"){
				    if(results.result.parameter.rongqfhdh!=''){
	   	            	 rongqfhdh=results.result.parameter.rongqfhdh; 
	   	            } 
					$("#chengys input").attr("disabled",true);
					$('#tch input').attr("disabled",true);
					$('.rongqfhdh').hide(); 
					$('.liush').hide(); 
					 
					$("#rongqxh input").val('');
					//0011516 保留承运商
					//$("#gongysdm input").val('');
					$("#rongqsl input").val('');
					$("#danjbh input").val('');
					
					$('#rongqxh input').focus();		
				}	
								
			 }
		});
 	}); 
 	
 	//F2按容器包裹单号增加
 	$('#anrqbgdh').bind('click',function(){
 	
		if(""==$('#danjbh input').val()){
 			showMsg("${i18n.C_642_01}");
			return false;
		}
		
 		 //参数校验
 		if(!$('#form_user_${pageId}').form("validateParam")){
				return;	
 		} 		
 		
 		if(""!=$('#danjbh input').val()){
			 	if(!$('#tch').fieldText('validateNotNull')){
			 			return;
			 	}	
		} 		
 		/*
 		if(""==$('#rongqsl input').attr("realValue")){
 		
 		}else{
	 		if(!$('#tch').fieldText('validateNotNull')){
				return;
			} 
 		}
 		*/
 		
 		$("#rongqxh input").val('');
 		
		//单据类型赋值
		//$('#danjlx input').val($('#zhuangtsx input').attr("realValue"));
 		//提交数据
 		var params = $('#form_user_${pageId}').form("getFormParam");
 		params.push("usercenter="+st_UserCenter); 		
 		params.push("rongqfhdh="+rongqfhdh); 
 		$('#grid_user_${pageId}').grid("setQueryParams", params);
 		var url = "<%=request.getContextPath()%>/rongqi/64202.do";
		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 if (showPromptRequestMsg(results)==true){
				//加载返回数据
				$('#grid_user_${pageId}').grid('parseResult',results);
			    
				if (results.result.response == "0000"){
				    if(results.result.parameter.rongqfhdh!=''){
	   	            	 rongqfhdh=results.result.parameter.rongqfhdh; 
	   	            } 
					$("#chengys input").attr("disabled",true);
					$('#tch input').attr("disabled",true);
					$('.rongqfhdh').hide(); 
					$('.liush').hide(); 
					 
					$("#rongqxh input").val('');
					//0011516 保留承运商
					//$("#gongysdm input").val('');
					$("#rongqsl input").val('');
					$("#danjbh input").val('');					
					
					$('#danjbh input').focus();
					
				}	
								
			 }
		});
 	}); 
 	
 	//F3删除
	$('#btn_delete').bind('click',function(){
		//获取选择行
 		var params = $('#grid_user_${pageId}').grid('getSelectedAll');
		if(params.length < 1){
			showPromptMsg('red','${i18n.selectoneerror}');
			return false;
		}
		//打开提示框是否删除
		if(confirm($.sdcui.resource.i18n['C_remove'])){
		params.push("currentPage="+$('#grid_user_${pageId}').grid('getCurrentPage'));
		params.push("rongqfhdh="+rongqfhdh); 	
		
			/*去掉List[0];
			for(i=0;i<params.length;i++){
				params[i]=params[i].toString().replace("liush","xuh");
			}
			*/
		
			
		var url = "<%=request.getContextPath()%>/rongqi/64203.do";
		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 if (showPromptRequestMsg(results)==true){
				 rongqfhdh=results.result.parameter.rongqfhdh; 			 
				 $('#grid_user_${pageId}').grid('parseResult',results);
				 
				 $('.rongqfhdh').hide(); 
				 $('.liush').hide(); 
				 
				 $("#chengys input").attr("disabled",false);
				 $('#tch input').attr("disabled",false);
				 //$("#tch input").val('');
				 //$("#chengys input").val('');
			 }
		});
		}
		return false;
	}); 
	//F4删除全部
	$('#btn_deleteAll').bind('click',function(){
		//打开提示框是否删除
		if(confirm($.sdcui.resource.i18n['C_remove'])){
		//先提交选中行，然后再重新加载
		var params = $('#form_user_${pageId}').form("getFormParam");
		params.push("rongqfhdh="+rongqfhdh); 		
		var url = "<%=request.getContextPath()%>/rongqi/64204.do";
		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 if (showPromptRequestMsg(results)==true){
			 	 rongqfhdh=results.result.parameter.rongqfhdh;
				 $('#grid_user_${pageId}').grid('parseResult',results);
				 //$("#tch input").val('');
				// $("#chengys input").val('');
				 $("#rongqsl input").val('');
				 $("#rongqxh input").val('');
				 //rongqfhdh='';
				 $("#chengys input").attr("disabled",false);
				 $('#tch input').attr("disabled",false);
				 
				 
				 
				 $('.rongqfhdh').hide(); 
				 $('.liush').hide(); 
			 }
		});
		}
		return false;
	}); 
 	//F5 选中
 	$('#getSelected').bind('click',function(){
 		$('#grid_user_${pageId}').grid('selected');
			return false;
 	});
	//F6 按激光打印确认返还huxy_13142
	$('#btn_print').bind('click',function(){
			var params = [];
			params.push("usercenter="+st_UserCenter);
			params.push("rongqfhdh="+rongqfhdh); 
			params.push("flag="+'1');
			var chengys = $('#chengys input').val();			
							
			var url = "<%=request.getContextPath()%>/rongqi/64205.do";
			$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
				 if (showPromptRequestMsg(results)==true){	
					 if (results.result.response == "0000"){	
					 	 window.location.href="<%=request.getContextPath()%>/rongqi/64206.do?usercenter="+st_UserCenter+"&fanhdh="+rongqfhdh+"&chengys="+chengys+"&cangkbh="+st_Cangkbh+st_Params;			       
					 
						 $('#grid_user_${pageId}').grid('parseResult',results);
						 $('.rongqfhdh').hide(); 
						 
						 $("#tch input").val('');
						 $("#chengys input").val('');
						 $("#rongqsl input").val('');
						 $("#rongqxh input").val('');
						 rongqfhdh='';
						 $("#chengys input").attr("disabled",false);
						 $('#tch input').attr("disabled",false);
						} 
		         }
		    }); 		
 		    return false;
	}); 
	
	//F7 高速行打印确认返还 huxy_13142
	$('#btn_print1').bind('click',function(){
			var params = [];
			params.push("usercenter="+st_UserCenter);
			params.push("rongqfhdh="+rongqfhdh); 
			params.push("flag="+'2');
			var chengys = $('#chengys input').val();			
			var url = "<%=request.getContextPath()%>/rongqi/64205.do";
			$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
				 if (showPromptRequestMsg(results)==true){	
					 if (results.result.response == "0000"){
					      $("#rongqxh input").val('');
					  	  $("#chengys input").val('');
					  	  $("#gongysdm input").val('');
					  	  $("#rongqsl input").val('');
					  	  $("#danjbh input").val('');
					  	  $("#tch input").val('');
					  	  
					      $('#chengys input').attr("disabled",false);
					      $('#tch input').attr("disabled",false);
					 	  $('#grid_user_${pageId}').grid('parseResult',results);
					} 
		         }
		    }); 		
 		    return false;
	}); 
	
	$(document).keyboardsupport({});
	});
/**
 *进入642页面后进行查询
 */
$(document).ready(function(){
   var params =[] ;
   params.push("wuld="+st_Rongqcbh);	
   params.push("usercenter="+st_UserCenter);
   var url = "<%=request.getContextPath()%>/rongqi/64201.do";
   $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
	  if (showPromptRequestMsg(results)==true){
	        if(results.result.response != 'C_1403'){
			     //设置分页
				 params.push("currentPage=1");
				 //params.push("rongqfhdh="+results.result.parameter.rongqfhdh);
				 $('#grid_user_${pageId}').grid("setQueryParams", params);
   	             $('#grid_user_${pageId}').grid('parseResult',results);
   	             
   	             	
   	             $('.rongqfhdh').hide(); 
				 $('.liush').hide(); 
   	             
   	             if(results.result.parameter.rongqfhdh!=''){
	   	             rongqfhdh=results.result.parameter.rongqfhdh; 
	   	         }
	   	         
	   	         if(results.result.parameter.tch!=''){
	   	         	$("#tch input").val(results.result.parameter.tch);
	   	         	$('#tch input').attr("disabled",true);
	   	         }
	   	         
	   	         if(results.result.parameter.chengys!=''){
	   	         	$("#chengys input").val(results.result.parameter.chengys);
	   	         	$('#chengys input').attr("disabled",true);
	   	         }
	   	          
  	         }
        }
       msgClear();
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
		
		<td class="field-label">${i18n.fanhs}：</td>
		<td class="field-container"><div class="ui-field" id="chengys"></div></td>
		
	</tr>
	<tr>
		<td class="field-label">${i18n.rongqisl}：</td>
		<td class="field-container"><div class="ui-field" id="rongqsl"></div></td>
		<td class="field-label">${i18n.gongcbh}：</td>
		<td class="field-container"><div class="ui-field" id="gongysdm"></div></td>		
	</tr>
	<tr>
		<td class="field-label">${i18n.rongqbbq}：</td>
		<td class="field-container"><div class="ui-field" id="danjbh"></div></td>		
		
		<td class="field-label">${i18n.kch}：</td>
		<td class="field-container"><div class="ui-field" id="tch"></div></td>	
	</tr>
</tbody>
</table>
<br/>
<!-- huxy_13142 -->
<div align="right">		
	<span id="anrqxh"  class="ui-button">${i18n.anrqxh}[F1]</span>
	<span id="anrqbgdh"  class="ui-button">${i18n.anrqbgdh}[F2]</span>
	
	<span id="btn_delete"  class="ui-button">${i18n.delete}[F3]</span>
	<span id="btn_deleteAll"  class="ui-button">${i18n.qbdelete}[F4]</span>	
	<span id="getSelected"  class="ui-button">${i18n.checked}[F5]</span>
	<span id="btn_print"  class="ui-button">${i18n.jgdyqrfh}[F6]</span>
	<span id="btn_print1"  class="ui-button">${i18n.gshdqrfh}[F7]</span>
	<span id="btn_back"  class="ui-button">${i18n.back}[F11]</span>	
	<span id="btn_return"  class="ui-button">${i18n.return}[F12]</span>
   </div>
   <br/>
<div id="grid_user_${pageId}" class='hidden-item'></div>
</div>
<div id='prompt'>${i18n.prompt}</div>
</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>