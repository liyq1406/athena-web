<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","10402");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_10402 }</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
		var temp = [];
		temp.push("elh="+'<%=request.getParameter("elh")%>');
		temp.push("cangkbh="+st_Cangkbh);
			$(function(){
				$('#form_user_${pageId}').form({
					fields:[
						{fieldType:'fieldHidden',property:'uth'},
						{fieldType:'fieldLabelInput',property:'lingjbh',caption:'${i18n.lingjbh}'},
						//{fieldType:'fieldText',biaos:'enter',property:'lingjbh',dataType:'letter_numeric',limitedLength:'10',notNull:true,caption:'${i18n.lingjbh}', onclick:'changeValue()'},
						{fieldType:'fieldLabelInput',property:'yaohlh'},
						{fieldType:'fieldLabelInput',property:'lingjmc',dataType:'laiy',maxLength:'40',caption:'${i18n.lingjmc}'},
						{fieldType:'fieldLabelInput',property:'gongysdm',caption:'${i18n.gongysdm}'},
						//{fieldType:'fieldText',biaos:'enter',property:'gongysdm',dataType:'letter_numeric',limitedLength:'10',notNull:true,caption:'${i18n.gongysdm}',onclick:'changegongysmc()'},
						{fieldType:'fieldLabelInput',property:'gongysmc',dataType:'laiy',maxLength:'70',caption:'${i18n.gongysmc}'},
						{fieldType:'fieldText',property:'jusljs',dataType:'plusinteger',notNull:true,caption:'${i18n.jussl}'},
						{fieldType:'fieldText',property:'uaxh',dataType:'text',maxLength:'5',notNull:true,caption:'${i18n.uaxh}'},
						{fieldType:'fieldText',property:'ucxh',dataType:'text',maxLength:'5',caption:'${i18n.ucxh}'},
						{fieldType:'fieldText',property:'uchl',dataType:'dbnumber',notNull:true,caption:'${i18n.uchl}'},
						{fieldType:'fieldText',property:'ucgs',dataType:'positive',maxLength:'5',notNull:true,caption:'${i18n.ucgs}'},
						{fieldType:'fieldText',property:'shixrq',dataType:'date',maskOptions:{mask:'9999-99-99'},caption:'${i18n.shixq}'},
						{fieldType:'fieldText',property:'pich',dataType:'text',maxLength:'12',caption:'${i18n.pich}'},
                        {fieldType:'fieldSelect',property:'jus',src:'<%=request.getContextPath()%>/common/jusyy.do',caption:'${i18n.jusyy}'},
						{fieldType:'fieldLabelInput',property:'jusyy',dataType:'text',maxLength:'200',notNull:true,caption:'${i18n.jusyy}'},
						{fieldType:'fieldText',property:'uah',dataType:'text',maxLength:'12',notNull:true,caption:'${i18n.uah}'},
						{fieldType:'fieldText',property:'uch',dataType:'text',maxLength:'12',caption:'${i18n.uch}'},
						{fieldType:'fieldLabelInput',property:'caozy',defaultValue:'${userName}'},
						{fieldType:'fieldText',property:'yansy',notNull:true,dataType:'laiy',maxLength:'10',caption:'${i18n.yansy}'},
						{fieldType:'fieldText',biaos:'enter',property:'shijljbh',dataType:'letter_numeric',caption:'${i18n.shijljbh}',limitedLength:'10'},
						{fieldType:'fieldText',property:'suifljmc',caption:'${i18n.lingjmc}',limitedLength:'40'}							
									
					
					]
				});
				var display=[];
			   $("#jus .value").bind("keydown",function(event){
			 		if(event.keyCode == 13){
			 			var v =  $("#jus input").attr("realValue");
			 			if(v != ""){
			 				var flag = true;
				 			for(var i = 0 ; i < display.length ; i++){
				 				if(display[i] == v){
				 					display.splice(i,1);	
				 					flag = false;
				 					break;
				 				}
				 			}
					 		if(flag) display.push(v);
					 		$('#jusyy span').html(display.join(','));
					 		$('#jusyy input').val(display.join(','));
			 			}
			 		}
			 	});
			 	
			 	
			 	//按零件编号查询
			 	$('#shijljbh').bind('enter',function (){
			 		if(!$('#shijljbh').fieldText('validateNotNull')){
			 			return;
			 		}	 		
			 		var params = [];
			 		params.push("lingjbh="+$('#shijljbh input').val());
			 		
					var url = "<%=request.getContextPath()%>/common/querySjljmc.do";
						 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
                                     if (showPromptRequestMsg(results)==true){
						 			       if(results.result.response=="0001"){
							 			          $('#suifljmc input').val(results.result.parameter.suifljmc);
							                 }
							            }											 
							 });
			 	});
			 	
			 	
				$('#btn_submit').bind('click',function(){
					if(!$('#form_user_${pageId}').form("validateParam")){
							return;
					}
					if('' == $('#jusyy input').val()){
					 showPromptMsg('red','${i18n.jusyybnwk}');
							return;
					}
					var params = $('#form_user_${pageId}').form("getFormParam");
					params.push("elh="+'<%=request.getParameter("elh")%>');
		       	    var url = "<%=request.getContextPath()%>/shouhuo/10304.do";
			        $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
				     if (showPromptRequestMsg(results)==true){
				        //var strJSON=JSON.stringify(results);
						//$('#putvalue').val(strJSON);
						//$("#putform").attr("action","<%=request.getContextPath()%>/shouhuo/P10401.do"+st_Params+'&'+temp.join('&'));
						$("#putform").attr("action","<%=request.getContextPath()%>/shouhuo/104.do"+st_Params+'&'+temp.join('&'));
						document.putform.submit(); 
				        }
				        return false;
				     });	
				});
				

			 //按零件编号查询
		 <%-- 	$('#lingjbh').bind('enter',function(){   
				var lingjbh=$('#lingjbh input').val();
				var params=[];
				params.push("lingjbh="+lingjbh);
				var url = "<%=request.getContextPath()%>/shouhuo/10308.do";
				$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
				if (showPromptRequestMsg(results)==true){
					if(results.result.response == '0001'){
						   $('#lingjmc span').html(results.result.parameter.lingjmc);
						   $('#lingjmc input').val(results.result.parameter.lingjmc);
						   msgClear();
					  }else{
						    showPromptMsg('red','${i18n.wuclj}');
				      }
				    }
				   });
				   return false;
		 	});  --%>
			 
		 //按供应商编号查询
		 <%-- 	$('#gongysdm').bind('enter',function(){   
				var gongysdm=$('#gongysdm input').val();
				var params=[];
				params.push("gongysdm="+gongysdm);
				var url = "<%=request.getContextPath()%>/shouhuo/10309.do";
				$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
					if (showPromptRequestMsg(results)==true){
						if(results.result.response == '0001'){
							  $('#gongysmc span').html(results.result.parameter.gongysmc);  
							  $('#gongysmc input').val(results.result.parameter.gongysmc);  
							   msgClear();
						  }else{
							  showPromptMsg('red','${i18n.wucgys}');
					      }
					    }
				});
				 return false;
			});  --%>
		 	$('#btn_back').bind('click',function(){
	     	    var params=[];
	    		params.push("uah="+$('#uah input').val());
	    		params.push("uth="+$('#uth input').val());
	    		params.push("elh="+'<%=request.getParameter("elh")%>');
	    		var url = "<%=request.getContextPath()%>/shouhuo/10303.do";
				 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
				 			if (showPromptRequestMsg(results)==true){
				 		          if(results.result.response != 'C_1403'){	
									//加载返回数据
									var strJSON=JSON.stringify(results);
									$('#putvalue').val(strJSON);
									$("#putform").attr("action","<%=request.getContextPath()%>/shouhuo/P10401.do"+st_Params+'&'+ params.join('&')+'&'+temp.join('&'));
		    			    		document.putform.submit();
		    			    	 }
							 }
				 	});
			}); 

			$(document).keyboardsupport({});
		});	
			//页面加载后，查询数据为界面赋值
		    $(document).ready(function(){
		    	var parameter = ${result.result.parameter};
					//加载返回数据
                    $('#uth input').val(parameter.uth);
					$('#lingjbh input').val(parameter.lingjbh);
					$('#lingjbh span').html(parameter.lingjbh);
					$('#gongysdm input').val(parameter.gongysdm);
					$('#gongysdm span').html(parameter.gongysdm);
					$('#jusljs input').val(parameter.jusljs);
                    $('#uah input').val(parameter.uah);
                    $('#uaxh input').val(parameter.uaxh);
                    $('#ucxh input').val(parameter.ucxh);
                    $('#uchl input').val(parameter.uchl);
                    $('#ucgs input').val(parameter.ucgs);
                    $('#yaohlh input').val(parameter.yaohlh);
                    $('#yaohlh span').html(parameter.yaohlh);
                    $('#pich span').html(parameter.pich);
                    $('#pich input').val(parameter.pich);
                    $('#lingjmc input').val(parameter.lingjmc);
                    $('#lingjmc span').html(parameter.lingjmc);
                    $('#gongysmc input').val(parameter.gongysmc);
                    $('#gongysmc span').html(parameter.gongysmc);
                    $('#yansy input').val(parameter.yansy);
                    $('#caozy input').val('${userName}');
                    $('#caozy span').html('${userName}');
					$('#shixrq input').val(parameter.shixrq);
				
			});
		</script>
	</head>
	<body>
		<div style="padding:20px;">
			<div id="title"></div>
			<form id="putform" method="post" name="putform">
				<input id="putvalue" name="putvalue" type="Hidden"></input>
			</form> 
			<form name="myForm" action="" method="post">
			<div id="form_user_${pageId}" class="ui-fieldLayout">
				<table class="ui-grid" cellspacing="1" width="100%">
					<tbody>
						<tr>
							<td>${i18n.lingjbh}</td>
							<td><div class="ui-field" id="lingjbh"></div></td>
							<td>${i18n.lingjmc}</td>
							<td><div class="ui-field" id="lingjmc"></div></td>
							<td>${i18n.gongysdm}</td>
							<td><div class="ui-field" id="gongysdm"></div></td>
							<td>${i18n.gongysmc}</td>
							<td><div class="ui-field" id="gongysmc"></div></td>
						</tr>
						<tr>
							<td>${i18n.uaxh}</td>
							<td><div class="ui-field" id="uaxh"></div></td>
							<td>${i18n.ucxh}</td>
							<td><div class="ui-field" id="ucxh"></div></td>
							<td>${i18n.uchl}</td>
							<td><div class="ui-field" id="uchl"></div></td>
							<td>${i18n.ucgs}</td>
							<td><div class="ui-field" id="ucgs"></div></td>
						</tr>
						<tr>
						    <td>${i18n.uah}</td>
							<td><div class="ui-field" id="uah"></div></td>
							<td>${i18n.uch}</td>
							<td><div class="ui-field" id="uch"></div></td>
							<td>${i18n.shixq}</td>
							<td><div class="ui-field" id="shixrq"></div></td>
							<td>${i18n.pich}</td>
							<td><div class="ui-field" id="pich"></div></td>
						</tr>
						<tr>
						    <td>${i18n.caozy}</td>
							<td><div class="ui-field" id="caozy"></div></td>
							<td>${i18n.yansy}</td>
							<td><div class="ui-field" id="yansy"></div></td>
							<td>${i18n.jussl}</td>
							<td><div class="ui-field" id="jusljs"></div></td>
							 <td>${i18n.yaohlh}</td>
							<td><div class="ui-field" id="yaohlh"></div></td> 
						</tr>
						<tr>
							<td>${i18n.jusyy}</td>
							<td colspan="2"><div class="ui-field" style="float: left;" id="jus"></div> <div id="jusyy"  class="ui-field" style="float: left"></div></td>
						</tr>
						
						<tr>
						    <td>${i18n.shijljbh}</td>
							<td><div class="ui-field" style="float: left" id="shijljbh"></div></td> 
							
							<td>${i18n.lingjmc}</td>
							<td><div class="ui-field" id="suifljmc"></div></td> 							
						</tr>
					</tbody>
				</table>
				<div class="ui-field" id="uth"></div>
			</div>
			</form>
			<div>
			<table class="ui-grid" cellspacing="1" width="100%">
				<tbody>
					<tr>
						<td align="right">
						 <div>
							<span id="btn_submit" class="ui-button">${i18n.ok }[F1]</span>
							<span id="btn_back" class="ui-button">${i18n.back }[F11]</span>
							<span id="btn_return" class="ui-button">${i18n.return }[F12]</span></div>
						 <td>
					</tr>
					</tbody>
				</table> 
			</div>
		<div id='prompt'>${i18n.prompt}</div>
	</div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>