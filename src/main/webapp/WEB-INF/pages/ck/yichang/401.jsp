<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","401");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_401}</title>
<jsp:include page="../../common/js.jsp" />

<script type="text/javascript">
var row;           //行数据，用于动态添加行
var danw;
$(function(){
	$('#form_user_${pageId}').form({
		onreload:true,
 		fields:[
                {fieldType:'fieldText',property:'shengbdh',dataType:'text',maxLength:'10',caption:'${i18n.shengbdh}',notNull:true},
				{fieldType:'fieldText',property:'zhengclsh',dataType:'letter_numeric',limitedLength:'9',caption:'${i18n.zhengclsh}',notNull:false},
				{fieldType:'fieldText',biaos:'enter',property:'uch',dataType:'uch',caption:'${i18n.uch}',notNull:false},
				{fieldType:'fieldText',biaos:'enter',property:'lingjbh',dataType:'letter_numeric',limitedLength:'10',caption:'${i18n.lingjbh}',notNull:true},
				{fieldType:'fieldLabel',property:'lingjmc',maxLength:'20',caption:'${i18n.lingjmc}',notNull:true},
				{fieldType:'fieldText',property:'shenbsl',dataType:'dbnumber',caption:'${i18n.shenbsl}',notNull:true},
				{fieldType:'fieldSelect',biaos:'enter',property:'gongysdm',maxLength:'10',caption:'${i18n.gongysdm}',onselect:'flagchange()',onclose:'selectblur()',notNull:true},
				{fieldType:'fieldLabel',property:'gongysmc',maxLength:'35',caption:'${i18n.gongysmc}',notNull:true},
				{fieldType:'fieldSelect',property:'shengbd',onselect:'shenbd()',dataType:'text',maxLength:'9',caption:'${i18n.shengbd}',notNull:true},
				{fieldType:'fieldText',property:'shengbr',dataType:'shuzzm',maxLength:'10',caption:'${i18n.shengbr}',notNull:true,value:st_UserName},
				{fieldType:'fieldText',property:'pich',dataType:'shuzzm',maxLength:'12',caption:'${i18n.pich}',notNull:false},
				{fieldType:'fieldText',property:'elh',dataType:'elh',caption:'${i18n.elh}',notNull:false},
				//{fieldType:'fieldSelect',property:'buh',value:'N',realValue:'0',caption:'${i18n.zidbh}',notNull:false,src:'<%=request.getContextPath()%>/common/yesOrNo.do'},
				
				//0010509
				{fieldType:'fieldText',property:'yuany',maxLength:'25',caption:'${i18n.yuany}',notNull:false},				
				
				{fieldType:'fieldLabel',property:'chengysdmT',maxLength:'10',caption:'${i18n.chengysdm}',notNull:false},
				{fieldType:'fieldLabel',property:'chengysmc',maxLength:'35',caption:'${i18n.chengysmc}',notNull:false}
	 			]
 		});
	
	$('#grid_user_${pageId}').grid({
		keyFields:['rongqxh','rongqsl','zhizs','gongysdm','chengysbh','wuld'],
		id:'grid_user_${pageId}',
		showCheckbox:false,
		enableCutPage : false,
		showNum : false,
		cols:[
			{property:'shengbdh',caption:'${i18n.shengbdh}'},
			{property:'uch',caption:'${i18n.uch}'},
			{property:'lingjbh',caption:'${i18n.lingjbh}'},
			{property:'lingjmc',caption:'${i18n.lingjmc}'},
			{property:'gongysdm',caption:'${i18n.gongysdm}'},
			{property:'gongysmc',caption:'${i18n.gongysmc}'},
			{property:'elh',caption:'${i18n.elh}'},
			{property:'pich',caption:'${i18n.pich}'},
			{property:'shengbd',caption:'${i18n.shengbd}'},
			{property:'chengysdm',caption:'${i18n.chengysdm}'},
			{property:'chengysmc',caption:'${i18n.chengysmc}'}
  		   ],
		buttons:[
		    //F1申报
	   	 	{name:'shenb',caption:'${i18n.shenb}[F1]',keyboard:'F1',action:function(){
	   	 	 //参数校验
 		     if(!$('#form_user_${pageId}').form("validateParam")){
				return;	
 		       }
 		       
		 		//0010509
				if(!$('#yuany').fieldSelect('validateNotNull')){
		 			return;
		 		}  
 		         
 		     //提交数据
 			 var params = $('#form_user_${pageId}').form("getFormParam");
 		 	 params.push("danw="+danw);
 		 	 params.push("chengysdm="+ $('#form_user_${pageId}')[0].childNodes[0].value);
 			 var url = "<%=request.getContextPath()%>/yichang/40103.do";
 		     $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 if (showPromptRequestMsg(results)==true){
				 if (results.result.response == "0000"){
						 $('#form_user_${pageId}').form("resetFields");
						 $('#lingjbh input').attr("readonly",false);
						 $('#gongysdm input').attr("readonly",false);
						 $('#pich input').attr("readonly",false);
						 $('#elh input').attr("readonly",false);
					     $('#shengbd input').attr("readonly",false);
					     $('#shengbr input').val(st_UserName);
					     // $('#buh input').val('N');
					     //$('#buh input').attr('realValue','0');
					     row = results.result.parameter;
					     if (row && row != null){
			 					$('#grid_user_${pageId}').grid("addRow",row);
				 	    		return false;
			 				}
				    }
			     }
			 });
			}}
		　,{name:'back',caption:'${i18n.back}[F11]'}
          ,{name:'return',caption:'${i18n.return}[F12]'}
	]});
	//根据输入UC号带出 ,零件编号,零件名称，供应商编号，供应商名称，申报点，批次号，EL号
 	$('#uch').bind('enter',function (){
 		if(!$('#uch').fieldText('validateNotNull')){
 			return;
 		}
 		var params = [];
 		if($('#zhengclsh input').val()==""){
 			params.push("zhengclsh=aaa");
 		}else{
 			params.push("zhengclsh="+$('#zhengclsh input').val());
 		}
 		
 		params.push("uch="+$('#uch input').val());
			 var url = "<%=request.getContextPath()%>/yichang/40101.do";
			 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
				 if (showPromptRequestMsg(results)==true){
					 showPromptMsg('blue',$.sdcui.resource.i18n['C_UCHCGFH']);
					 //赋值
					 $('#lingjbh input').val(results.result.parameter.lingjbh).attr("readonly","readonly");
					 $('#lingjmc span').html(results.result.parameter.lingjmc);
					 $('#gongysdm input').val(results.result.parameter.gongysdm).attr("readonly","readonly");
					 $('#gongysdm input').attr('realvalue',results.result.parameter.gongysdm);
					 $('#gongysmc span').html(results.result.parameter.gongysmc);
					 $('#pich input').val(results.result.parameter.pich).attr("readonly","readonly");
					 $('#elh input').val(results.result.parameter.elh).attr("readonly","readonly");
					 $('#shengbd input').val(results.result.parameter.shengbd).attr("readonly","readonly");
					 $('#shengbd input').attr('realvalue',results.result.parameter.shengbd);
					 $('#chengysdmT span').html(results.result.parameter.chengysdm);
					 $('#form_user_${pageId}')[0].childNodes[0].value=results.result.parameter.chengysdm;
					 $('#chengysmc span').html(results.result.parameter.chengysmc);
					 
				 }
				 else {
					 $('#lingjbh input').attr("readonly",false);
					 $('#gongysdm input').attr("readonly",false);
					 $('#pich input').attr("readonly",false);
					 $('#elh input').attr("readonly",false);
				     $('#shengbd input').attr("readonly",false);
				 }
				 });
 	});
	//根据输入零件编号带出 零件名称
 	$('#lingjbh').bind('enter',function (){
 		$('#chengysdmT span').html('');
									 
		$('#chengysmc span').html('');
 	
 		if(!$('#lingjbh').fieldText('validateNotNull')){
 			return;
 		}
 		if(!$('#lingjbh').fieldText('validate')){
 			return;
 		}
 		
 		var params = $('#form_user_${pageId}').form("getFormParam");
 		
			 var url = "<%=request.getContextPath()%>/common/40104.do";
			 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
				 //showPromptMsg('blue',$.sdcui.resource.i18n['C_LINGJBHCHFH']);
					 //赋值
					 if (results.result.response == "0001"){
						 $('#lingjmc span').html(results.result.parameter.lingjmc)
						 danw=results.result.parameter.danw;
						 showPromptMsg('blue',$.sdcui.resource.i18n['C_LINGJBHCHFH']);
					 }else{
						 $('#lingjmc span').html("");
						 danw="";
						 showPromptMsg('red','${i18n.ljbhbcz}');
					 }
					 var  lingjbh = $('#lingjbh input').val();
				     $('#gongysdm').fieldSelect('resetUrl','<%=request.getContextPath()%>/common/40107.do'+st_Params+'&lingjbh='+lingjbh);
				     $('#shengbd').fieldSelect('resetUrl','<%=request.getContextPath()%>/yichang/40108.do'+st_Params+'&lingjbh='+lingjbh+'&loginname='+st_UserName);				     
				 });
 	 });
	  //rencong   0011540    供应商代码失去焦点时带出供应商名称
// 	 $('#gongysdm').blur(function (){
// 		if(!$('#gongysdm').fieldText('validateNotNull')){
// 			return;
// 		}
//		if(!$('#gongysdm').fieldText('validate')){
// 			return;
// 		}
	
//	var params = $('#form_user_${pageId}').form("getFormParam");
 		
//		 var url = "<%=request.getContextPath()%>/common/40105.do";
//		 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
					 //赋值
//				 if (results.result.response == "0001"){
//						 $('#gongysmc span').html(results.result.parameter.gongysmc);
//					 }else{
//					 $('#gongysmc span').html("");
//					 }
//				 });
//				 $.ajax({					    
//                                    url:"<%=request.getContextPath()%>/common/40106.do",
//								    type:'post', //数据发送方式 
//								    dataType:'json', //接受数据格式 
//								    data:params.join('&'),
//									success:function(result2){
									
//									 if (result2.result.response == "0001"){
//										var cm = result2.result.parameter.chengysdm;
//										 $("#chengysdmT").fieldLabel("setValue",cm);
//										 $('#form_user_${pageId}')[0].childNodes[0].value=cm;
										 
//										 $('#chengysdmT span').html(result2.result.parameter.chengysdm);
										 
//										 $('#chengysmc span').html(result2.result.parameter.chengysmc);
																		
//									  }else{
//									  	 showPromptMsg('red',$.sdcui.resource.i18n[result2.result.response]);
//									  }	
//									 }							
//								});
// 	 });

//rencong   0011540   根据供应商代码 回车带出供应商名称
//	 $('#gongysdm').bind('enter',function (){
//		if(!$('#gongysdm').fieldSelect('validateNotNull')){
// 			return;
// 		}
//		if(!$('#gongysdm').fieldSelect('validate')){
// 			return;
// 		}
 		
//		var params = $('#form_user_${pageId}').form("getFormParam");
 		
//			 var url = "<%=request.getContextPath()%>/common/40105.do";
//			 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
					 //赋值
//					 if (results.result.response == "0001"){
//						 $('#gongysmc span').html(results.result.parameter.gongysmc);
//					 }else{
//						 $('#gongysmc span').html("");
//					 }
//				 });
//				  $.ajax({					    
//                                   url:"<%=request.getContextPath()%>/common/40106.do",
//								    type:'post', //数据发送方式 
//								    dataType:'json', //接受数据格式 
//								    data:params.join('&'),
//									success:function(result2){
									
//									 if (result2.result.response == "0001"){
//										var cm = result2.result.parameter.chengysdm;
//										 $("#chengysdmT").fieldLabel("setValue",cm);
//										 $('#form_user_${pageId}')[0].childNodes[0].value=cm;
//									 
//										 $('#chengysdmT span').html(result2.result.parameter.chengysdm);
										 
//										 $('#chengysmc span').html(result2.result.parameter.chengysmc);
																		
//									  }else{
//									  	 showPromptMsg('red',$.sdcui.resource.i18n[result2.result.response]);
//									  }	
//									 }							
//								});
// 	 });
 	$(document).keyboardsupport({});
});

function flagchange(){
/*
	if(!$('#gongysdm').fieldSelect('validateNotNull')){
			return;
	}
	*/

		var params = $('#form_user_${pageId}').form("getFormParam");
		
		 var url = "<%=request.getContextPath()%>/common/40105.do";
		 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){		
			 if (results.result.response == "0001"){		
				 $('#gongysmc span').html(results.result.parameter.gongysmc);				  		 
				 //$('#shengbd input').attr("readonly",false);
				 //$('#shengbd input').attr('disabled', false);		
			 }else{
				 $('#gongysmc span').html("")
			 }
			 
			 
			 });			 
			 
			 	 
							//0011351
							 $.ajax({					    
                                    url:"<%=request.getContextPath()%>/common/40106.do",
								    type:'post', //数据发送方式 
								    dataType:'json', //接受数据格式 
								    data:params.join('&'),
									success:function(result2){
									//alert( result.result.parameter.list[0].value);
									//var msg = result.result.parameter.list[0].value;
									
									 if (result2.result.response == "0001"){
										var cm = result2.result.parameter.chengysdm;
										//alert(cm);
										 $("#chengysdmT").fieldLabel("setValue",cm);
										 $('#form_user_${pageId}')[0].childNodes[0].value=cm;
										 
										 $('#chengysdmT span').html(result2.result.parameter.chengysdm);
										 
										 $('#chengysmc span').html(result2.result.parameter.chengysmc);
																		
									  }else{
									  	 showPromptMsg('red',$.sdcui.resource.i18n[result2.result.response]);
									  }	
									 }							
								});
			 
			 
}
function shenbd(){
	if(!$('#lingjbh').fieldText('validateNotNull')){
			return;
		}
		/*
		if(!$('#gongysdm').fieldSelect('validateNotNull')){
			return;
		}	
		*/	
 		
 		/*
		if(!$('#shengbd').fieldSelect('validateNotNull')){
			return;
		  }
		  */
		var params = $('#form_user_${pageId}').form("getFormParam");
		
		 var url = "<%=request.getContextPath()%>/common/40106.do";
		 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 if (results.result.response == "0001"){
				 //赋值
//				 $('#chengysdm span').html(results.result.parameter.chengysdm)
				//0010183 78001H  P2传到后台的值少了一个空格//
				 var cm = results.result.parameter.chengysdm;
				 $("#chengysdmT").fieldLabel("setValue",cm);
				 $('#form_user_${pageId}')[0].childNodes[0].value=cm;
				 $('#chengysmc span').html(results.result.parameter.chengysmc);
			 }
			 else
				 {
				 $('#chengysdmT span').html("")
				 $('#form_user_${pageId}')[0].childNodes[0].value="";
				 $('#chengysmc span').html("")
				 }
			 });
}

//rencong   0011540    供应商代码回车和失去焦点时带出供应商名称
function selectblur(){
	if(!$('#gongysdm').fieldSelect('validateNotNull')){
 			return;
 		}
		if(!$('#gongysdm').fieldSelect('validate')){
 			return;
 		}
 		
		var params = $('#form_user_${pageId}').form("getFormParam");
 		
			 var url = "<%=request.getContextPath()%>/common/40105.do";
			 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
					 //赋值
					 if (results.result.response == "0001"){
						 $('#gongysmc span').html(results.result.parameter.gongysmc);
					 }else{
						 $('#gongysmc span').html("");
					 }
				 });
				  $.ajax({					    
                                    url:"<%=request.getContextPath()%>/common/40106.do",
								    type:'post', //数据发送方式 
								    dataType:'json', //接受数据格式 
								    data:params.join('&'),
									success:function(result2){
									
									 if (result2.result.response == "0001"){
										var cm = result2.result.parameter.chengysdm;
										 $("#chengysdmT").fieldLabel("setValue",cm);
										 $('#form_user_${pageId}')[0].childNodes[0].value=cm;
										 
										 $('#chengysdmT span').html(result2.result.parameter.chengysdm);
										 
										 $('#chengysmc span').html(result2.result.parameter.chengysmc);
																		
									  }else{
									  	 showPromptMsg('red',$.sdcui.resource.i18n[result2.result.response]);
									  }	
									 }							
 	 });
}



                /*从跳转页面返回 0011351
                $(document).ready(function(){
                 	$('#shengbd input').attr("readonly",true);
                 	 $('#shengbd input').attr('disabled', true);
                });
                */

</script>

</head>
<body>
<div style="padding:20px;">
<!--主体内容开始-->
<div id="title"></div>
<div id="form_user_${pageId}" class="ui-fieldLayout" >
<input type="hidden" id="chengysdm" name="chengysdm" value = "">
	<table class="ui-grid" cellspacing="1" width="100%">
	     <tr>
			<td class="field-label">${i18n.shengbdh}：</td>
			<td class="field-container"><div class="ui-field" id="shengbdh"></div></td>
			<td class="field-label">${i18n.zhengclsh}：</td>
			<td class="field-container"><div class="ui-field" id="zhengclsh"></div></td>
			<td class="field-label"></td>
			<td class="field-container"></td>
	      </tr>
	      <tr>
			<td class="field-label">${i18n.uch}：</td>
			<td class="field-container"><div class="ui-field" id="uch"></div></td>
			<td class="field-label">${i18n.lingjbh}：</td>
			<td class="field-container"><div class="ui-field" id="lingjbh"></div></td>
			<td class="field-label">${i18n.lingjmc}：</td>
			<td class="field-container"><div class="ui-field" id="lingjmc"></div></td>
	      </tr>
	
		  <tr>
		     <td class="field-label" colspan="6" height="20px"><label>   </label></td>
		  </tr>
	
	      <tr>
			<td class="field-label">${i18n.shenbsl}：</td>
			<td class="field-container"><div class="ui-field" id="shenbsl"></div></td>
			<td class="field-label">${i18n.gongysdm}：</td>
			<td class="field-container"><div class="ui-field" id="gongysdm"></div></td>
			<td class="field-label">${i18n.gongysmc}：</td>
			<td class="field-container"><div class="ui-field" id="gongysmc"></div></td>
	      </tr>
	      <tr>
			
			<td class="field-label">${i18n.shengbd}：</td>
			<td class="field-container"><div class="ui-field" id="shengbd"></div></td>
			<td class="field-label">${i18n.shengbr}：</td>
			<td class="field-container"><div class="ui-field" id="shengbr"></div></td>
			<td class="field-label">${i18n.pich}：</td>
			<td class="field-container"><div class="ui-field" id="pich"></div></td>
			</tr>
	      <tr>
			<td class="field-label">${i18n.elh}：</td>
			<td class="field-container"><div class="ui-field" id="elh"></div></td>
			<!--<td class="field-label">${i18n.zidbh}：</td>
			<td class="field-container"><div class="ui-field" id="buh"></div></td>-->
			<td class="field-label">${i18n.yuany}：</td>
			<td class="field-container" colspan="1"><div class="ui-field" id="yuany"></div></td>
		</tr>
	    <tr>
			<td class="field-label">${i18n.chengysdm}：</td>
			<td class="field-container"><div class="ui-field" id="chengysdmT"></div></td>
			<td class="field-label">${i18n.chengysmc}：</td>
			<td class="field-container"><div class="ui-field" id="chengysmc"></div></td>
			<td class="field-label"></td>
			<td class="field-container" colspan="1"></td>
		</tr>
	</table>	
 </div>
<div id="grid_user_${pageId}" class='hidden-item'></div>	    
<div id='prompt'>${i18n.prompt}</div>
</div>	    
</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>