<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","165");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_165}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
		$(function(){
		$('#form_div_${pageId}').hide();
			$('#form_user_${pageId}').form({
		 		fields:[
		 		     {fieldType:'fieldText',property:'chengysdm',dataType:'letter_numeric',caption:'${i18n.chengysdm}',notNull:true,limitedLength:'10'},
                     {fieldType:'fieldText',property:'dingdh',caption:'${i18n.dingdh}',dataType:'text',notNull:true,maxLength:'9'},  
                     {fieldType:'fieldText',biaos:'enter',property:'lingjbh',dataType:'letter_numeric',notNull:true,caption:'${i18n.lingjh}',limitedLength:'10'},
                     {fieldType:'fieldText',property:'uags',caption:'${i18n.uabzgs}',dataType:'plusinteger',maxLength:'6'},  
                     {fieldType:'fieldText',property:'lingjsl',dataType:'dbnumber',caption:'${i18n.shouhsl}'}
		 		]
		 	});
			$('#form_div_${pageId}').form({
		 		fields:[
		 		     {fieldType:'fieldLabel',property:'yaohlgs',caption:'${i18n.keyhlsl}'},
		 		     {fieldType:'fieldLabel',property:'gongysdm1',caption:'${i18n.gongysdm}'},
                     {fieldType:'fieldLabel',property:'uaxh',caption:'${i18n.uaxh}'},
		 		     {fieldType:'fieldLabel',property:'uarl',caption:'${i18n.uarl}'},
		 		     {fieldType:'fieldLabel',property:'ucxh',caption:'${i18n.ucxh}'},
		 		     {fieldType:'fieldLabel',property:'ucrl',caption:'${i18n.ucrl}'},
		 		     {fieldType:'fieldHidden',property:'gongysdm'}
		 		     
		 		]
		 	});
		 	//零件编号回车事件
		  $("#lingjbh").bind('enter',function(event){
			  //验证
			  if(!$('#form_user_${pageId}').form("validateParam")){
				 return;
				}
		 	 //验证承运商是否存在
 		 	 var params = $('#form_user_${pageId}').form("getFormParam");
		  	 var url = "<%=request.getContextPath()%>/common/60304.do";
 		   	 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
				if ('0001' != results.result.response){
					    showPromptMsg('red',$.sdcui.resource.i18n['C1_LURU_01']);
					    return false;
				   }else{
						params.push("flag=0");
					    g_isSub = 0;
				        var url2 = "<%=request.getContextPath()%>/shouhuo/16501.do";
		 		        $('#form_user_${pageId}').form("submitUrl", params, url2, function(results){
			 			     if(results.result.response =='C_165_0019' && confirm("${i18n.shifqzsh}")){
							        var params1=$('#form_user_${pageId}').form("getFormParam");
							        params1.push("flag=1");
				                    g_isSub = 0;
				                  $('#form_user_${pageId}').form("submitUrl", params1, url2, function(results){
						        	if (showPromptRequestMsg(results)==true){
						       	     if(results.result.response == '0001'){
						       	       $('#chengysdm input').attr("disabled",true);
						       	       $('#dingdh input').attr("disabled",true);
						       	       $('#lingjbh input').attr("disabled",true);
						       	       $('#yaohlgs span').html(results.result.parameter.yaohlgs);
						       	       $('#gongysdm1 span').html(results.result.parameter.gongysdm);
						       	       $('#gongysdm input').val(results.result.parameter.gongysdm);
						       	       $('#uaxh span').html(results.result.parameter.uaxh);
						       	       $('#uarl span').html(results.result.parameter.uarl);
						       	       $('#ucxh span').html(results.result.parameter.ucxh);
						       	       $('#ucrl span').html(results.result.parameter.ucrl);
						       	       $('#form_div_${pageId}').show();
						       	    }
						       	  }
				                });
						   }else if(results.result.response =='0001'){
						    var params1=$('#form_user_${pageId}').form("getFormParam");
							        params1.push("flag=0");
				                    g_isSub = 0;
				                  $('#form_user_${pageId}').form("submitUrl", params1, url2, function(results){
						        	if (showPromptRequestMsg(results)==true){
						       	     if(results.result.response == '0001'){
						       	       $('#chengysdm input').attr("disabled",true);
						       	       $('#dingdh input').attr("disabled",true);
						       	       $('#lingjbh input').attr("disabled",true);
						       	       $('#yaohlgs span').html(results.result.parameter.yaohlgs);
						       	       $('#gongysdm1 span').html(results.result.parameter.gongysdm);
						       	       $('#gongysdm input').val(results.result.parameter.gongysdm);
						       	       $('#uaxh span').html(results.result.parameter.uaxh);
						       	       $('#uarl span').html(results.result.parameter.uarl);
						       	       $('#ucxh span').html(results.result.parameter.ucxh);
						       	       $('#ucrl span').html(results.result.parameter.ucrl);
						       	       $('#form_div_${pageId}').show();
						       	    }
						       	  }
				                });

						   }else{
						     showPromptMsg('red',$.sdcui.resource.i18n[results.result.response]);
						   }
			           });
                   };
                 });
    		 return false;
		  });

		//F3申报
		$('#btn_shenb').bind('click',function(){
		      if(!$('#uags').fieldText('validateNotNull')){
					 			return;
					 	  }
		     if(!$('#lingjsl').fieldText('validateNotNull')){
					 			return;
					 	  }
		       //验证
			  if(!$('#form_user_${pageId}').form("validateParam")){
				 return;
				}
			 var params=$('#form_user_${pageId}').form("getFormParam");
		     var param1=$('#form_div_${pageId}').form("getFormParam");
		     params=params.concat(param1);	 	  
		     if($('#yaohlgs span').html()>= $('#uags input').val() || ( $('#yaohlgs span').html() < $('#uags input').val() && confirm($.sdcui.resource.i18n['C_165_0004'])) ){
		      	 var url = "<%=request.getContextPath()%>/shouhuo/16502.do";
		       		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
 					if (showPromptRequestMsg(results)==true){
	 			      if(results.result.response == "0000"){
		                 $('#form_user_${pageId}').form("clearValue");
		                 $('#form_div_${pageId}').form("clearValue");
		                 $('#form_div_${pageId}').hide();
		                 $('#chengysdm input').attr("disabled",false);
		       	         $('#dingdh input').attr("disabled",false);
		       	         $('#lingjbh input').attr("disabled",false);
		       	         $('#dingdh input').val(results.result.parameter.dingdh);
		       	         $('#chengysdm input').val(results.result.parameter.chengysdm);
		       	          
		       	         var param2=[];
						 param2.push("uth="+results.result.parameter.uth);
						 param2.push("blh="+results.result.parameter.blh);
						 param2.push("list[0].uth="+results.result.parameter.uth);
						    var url2 = "<%=request.getContextPath()%>/shouhuo/10102.do";
						    g_isSub = 0;
							$('#form_user_${pageId}').form("submitUrl", param2, url2, function(results){
								  if (showPromptRequestMsg(results)==true){

								      }
							 });
					     }	
					   }
				 });		
		     }
		      return false;
		   });
			  
			$(document).keyboardsupport({});
		});
		</script>
	</head>
	<body>
		<div style="padding:20px;">
			<div id="title"></div>
			<div id="form_user_${pageId}" class="ui-fieldLayout">
	 			<table class="ui-grid" cellspacing="1" width="100%">
					<tbody>
						<tr>
						    <td>${i18n.chengysdm}:</td>
							<td><div class="ui-field" id="chengysdm"></div></td>
							<td>${i18n.dingdh}:</td>
							<td><div class="ui-field" id="dingdh"></div></td>
							<td>${i18n.lingjbh}:</td>
							<td><div class="ui-field" id="lingjbh"></div></td>
						</tr>
						<tr>
						     <td>${i18n.uabzgs}:</td>
							<td><div class="ui-field" id="uags"></div></td>
							<td>${i18n.shouhsl}:</td>
							<td><div class="ui-field" id="lingjsl"></div></td>
							<td  colspan="2" align='right'>
						<div>
							<span id="btn_back" class="ui-button">${i18n.back }[F11]</span>
							<span id="btn_return" class="ui-button">${i18n.return }[F12]</span>
						</div>
						</td>
						</tr>
					</tbody>
				</table> 
			</div>
			<br>
			<div id="form_div_${pageId}" class="ui-fieldLayout">
 			<table class="ui-grid" cellspacing="1" width="100%">
				<tbody>
					<tr>
						<td>${i18n.keyhlsl}</td>
						<td><div class="ui-field" id="yaohlgs"></div></td>
						<td>${i18n.gongysdm}</td>
						<td><div class="ui-field" id="gongysdm1"></div></td>
						<td>${i18n.uaxh}:</td>
						<td><div class="ui-field" id="uaxh"></div></td>
						<td><div class="ui-field" id="gongysdm"></div></td>
						<td></td>
					</tr>
					<tr>
					   <td>${i18n.uarl}:</td>
						<td><div class="ui-field" id="uarl"></div></td>
					    <td>${i18n.ucxh}:</td>
						<td><div class="ui-field" id="ucxh"></div></td>
						<td>${i18n.ucrl}:</td>
						<td><div class="ui-field" id="ucrl"></div></td>
						<td align='left' >
						<div>
							<span id="btn_shenb" class="ui-button">${i18n.shenb}[F3]</span>
						</div>
						</td>
					</tr>
				</tbody>
			</table> 
		</div>
          <div id='prompt'>${i18n.prompt}</div>
		</div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>