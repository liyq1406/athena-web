<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","127");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_127 }</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
			$(function(){
				$('#form_user_${pageId}').form({
				    onreload:true,
					fields:[
						{fieldType:'fieldText',property:'uth',biaos:'enter',dataType:'daohdh',notNull:true,caption:'${i18n.uth}'},
						{fieldType:'fieldText',property:'ulh',biaos:'enter',dataType:'ulh'},
						{fieldType:'fieldText',property:'elh',biaos:'enter',dataType:'elh',caption:'${i18n.elh}'},
						{fieldType:'fieldHidden',property:'uth2'},
						{fieldType:'fieldHidden',property:'elh2'},
						{fieldType:'fieldHidden',property:'ulh2'}
					 ]
				}); 
				
			 	$('#btn_submit').bind('click',function(){
			 	       if( $('#ulh input').val() !="" && $('#elh input').val() !=""){
					     	showPromptMsg('red','${i18n.ULH_ELH}');
					     	return false;
					      }
					 
			 		if(!$('#form_user_${pageId}').form("validateParam")){
			 			$("#div_uth").hide();
					    $("#div_ulh").hide();
					    $("#div_elh").hide();
						return;
					  }
					if($('#uth input').val() != $('#uth2 input').val()){
					   showPromptMsg('red','${i18n.qxcx}');
					     	return false;
					}
					if($('#ulh input').val() != $('#ulh2 input').val()){
					   showPromptMsg('red','${i18n.qxcx}');
					     	return false;
					}
					if($('#elh input').val() != $('#elh2 input').val()){
					    showPromptMsg('red','${i18n.qxcx}');
					     	return false;
					}
			 		var params = $('#form_user_${pageId}').form("getFormParam");
			 		var url = "<%=request.getContextPath()%>/shouhuo/12701.do";
			 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 			if (showPromptRequestMsg(results)==true){
			 			     if (results.result.response == "0000"){
					 			    $('#form_user_${pageId}').form('clearValue');
					 			 }
					 			    $("#div_uth").hide();
								    $("#div_ulh").hide();
								    $("#div_elh").hide();
			 			}
					});
		    		return false;
			 	});
			 	
			 	 $('#uth').bind('enter',function(event){
			 	    $('#ulh input').val('');
					$('#elh input').val('');
					$('#uth2 input').val('');
					$('#ulh2 input').val('');
					$('#elh2 input').val('');
					$("#div_uth").hide();
					$("#div_ulh").hide();
					$("#div_elh").hide();
				 	if(!$('#uth').fieldText('validate')){
					 	
					 	   return ;
				 	  } 
				 	var params = [];
				 	params.push("uth="+$("#uth input").val());
				 	params.push("cangkbh="+st_Cangkbh);
				     var url = "<%=request.getContextPath()%>/shouhuo/12702.do";
				 	 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
				 			if (showPromptRequestMsg(results)==true){
									//赋值
                                  	 if (results.result.response == "0000"){
										 $("#chengysdm").html(results.result.parameter.chengysdm);
										 $("#chengysmc").html(results.result.parameter.chengysmc);
										 $("#tch").html(results.result.parameter.tch); 
										 $("#blh").html(results.result.parameter.blh);
										 $("#xiehzt").html(results.result.parameter.xiehzt);
										 $('#uth2 input').val($("#uth input").val());	
										 $("#div_uth").show();
										 $("#div_ulh").hide();
										 $("#div_elh").hide();
									 }
								}
						});
                       return false;
					});	
			 			
			 	 $('#ulh').bind('enter',function(event){
			 	    $('#uth input').val('');
					$('#elh input').val('');
					$('#uth2 input').val('');
					$('#ulh2 input').val('');
					$('#elh2 input').val('');
					$("#div_uth").hide();
					$("#div_ulh").hide();
					$("#div_elh").hide();
				 	if(!$('#ulh').fieldText('validate')){
					 	
					 	   return ;
				 	} 
				 	var params=[];
				 	params.push("ulh="+$("#ulh input").val());
				 	params.push("cangkbh="+st_Cangkbh);
				 	var  url = "<%=request.getContextPath()%>/shouhuo/12703.do";
				    $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
				 			if (showPromptRequestMsg(results)==true){
				 			         if (results.result.response == "0000"){
											 //赋值
											 $('#uth input').val(results.result.parameter.uth);
											 $('#uth2 input').val(results.result.parameter.uth);
											 $('#ulh2 input').val($("#ulh input").val());
											 $("#gongysdm").html(results.result.parameter.gongysdm);
											 $("#gongysmc").html(results.result.parameter.gongysmc);
											 $("#chuangjrq").html(results.result.parameter.chuangjrq); 
											 $("#blh1").html(results.result.parameter.blh1);
											 $("#maoz").html(results.result.parameter.maoz);	
											 $("#div_ulh").show();
											 $("#div_uth").hide();
											 $("#div_elh").hide();
									     }
								}
						});
                       return false;
					});		

			 	$('#elh').bind('enter',function(event){
			 	$('#uth input').val('');
				$('#ulh input').val('');
				$('#uth2 input').val('');
				$('#ulh2 input').val('');
				$('#elh2 input').val('');
				$("#div_uth").hide();
				$("#div_ulh").hide();
				$("#div_elh").hide();
				if(!$('#elh').fieldText('validate')){
				   
				 	   return ;
				 	} 
				 	var params=[];
				 	params.push("elh1="+$("#elh input").val());
				 	params.push("cangkbh="+st_Cangkbh);
				 	var  url = "<%=request.getContextPath()%>/shouhuo/12704.do";
				    $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
				 		if (showPromptRequestMsg(results)==true){
				 		    if (results.result.response == "0000"){
								 //赋值
								 $('#uth input').val(results.result.parameter.uth1);
								 $('#uth2 input').val(results.result.parameter.uth1);
								 $('#elh2 input').val($("#elh input").val());
								 $("#gongysdm1").html(results.result.parameter.gongysdm1);
								 $("#shixrq").html(results.result.parameter.shixrq);
								 $("#pich").html(results.result.parameter.pich);
								 $("#danw").html(results.result.parameter.danw);
								 $("#gongysmc1").html(results.result.parameter.gongysmc1);
								 $("#lingjbh").html(results.result.parameter.lingjbh);
								 $("#lingjmc").html(results.result.parameter.lingjmc);
								 $("#lingjsl").html(results.result.parameter.lingjsl);
								 $("#uth1").html(results.result.parameter.uth1);
								 $("#ulh1").html(results.result.parameter.ulh1);
								 $("#elh1").html(results.result.parameter.elh1);
								 $("#uaxh").html(results.result.parameter.uaxh);
								 $("#uarl").html(results.result.parameter.uarl);
								 $("#utrq").html(results.result.parameter.utrq);
								 $("#blh2").html(results.result.parameter.blh);
								 $("#zhuangtxx").html($.sdcui.resource.i18n[results.result.parameter.zhuangtxx]);
								 $("#div_elh").show();
								 $("#div_uth").hide();
								 $("#div_ulh").hide();
								}
						}
					});
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
							<td>${i18n.uth}:</td>
							<td><div class="ui-field" id="uth"></div></td>
							<td>${i18n.ulh }:</td>
							<td><div class="ui-field" id="ulh"></div></td>
							<td>${i18n.elh }:</td>
							<td><div class="ui-field" id="elh"></div></td>
						</tr>
						<tr>
						  <td><div class="ui-field" id="uth2"></div></td>
							<td><div class="ui-field" id="ulh2"></div></td>
							<td><div class="ui-field" id="elh2"></div></td>
						</tr>
						<tr>
							<td colspan="5"></td>
							<td>
							   <div align="right">
									<span id="btn_submit" class="ui-button">${i18n.delete }[F2]</span>
									<span id="btn_back" class="ui-button">${i18n.back}[F11]</span>
									<span id="btn_return" class="ui-button">${i18n.return }[F12]</span>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div id="div_uth" style="padding-top: 20px; display: none">
				<table width="100%" class="table" >
					<tbody>
						<tr>
							<td>${i18n.chengysdm }:</td>
							<td><span id="chengysdm"></span></td>
							<td>${i18n.chengysmc }:</td>
							<td><span id="chengysmc"></span></td>
							<td>${i18n.tch }:</td>
							<td><span id="tch"></span></td>
						</tr>
						<tr>
							<td>${i18n.blh }:</td>
							<td><span id="blh"></span></td>
							<td>${i18n.xiehzt }:</td>
							<td colspan="3"><span id="xiehzt"></span></td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<div id="div_ulh" style="padding-top: 20px; display: none ">
				<table width="100%" class="table">
					<tbody>
						<tr>
							<td>${i18n.blh }:</td>
							<td><span id="blh1"></span></td>
							<td>${i18n.gongysdm }:</td>
							<td><span id="gongysdm"></span></td>
							<td>${i18n.gongysmc }:</td>
							<td><span id="gongysmc"></span></td>
						</tr>
						<tr>
							<td>${i18n.blscsj}:</td>
							<td><span id="chuangjrq"></span></td>
							<td>${i18n.zhongl}:</td>
							<td colspan="3"><span id="maoz"></span></td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<div id="div_elh" style="padding-top: 20px; display: none ">
				<table width="100%" class="table">
					<tbody>
						<tr>
							<td>${i18n.uth}:</td>
							<td><span id="uth1"></span></td>
							<td>${i18n.ulh}:</td>
							<td><span id="ulh1"></span></td>
							<td>${i18n.elh}:</td>
							<td><span id="elh1"></span></td>
							<td>${i18n.blh}:</td>
							<td><span id="blh2"></span></td>
						</tr>
						<tr>
							<td>${i18n.gongysdm}:</td>
							<td><span id="gongysdm1"></span></td>
							<td>${i18n.gongysmc}:</td>
							<td><span id="gongysmc1"></span></td>
							<td>${i18n.lingjbh}:</td>
							<td><span id="lingjbh"></span></td>
							<td>${i18n.lingjmc}:</td>
							<td><span id="lingjmc"></span></td>
						</tr>
						<tr>
							<td>${i18n.lingjsl}:</td>
							<td><span id="lingjsl"></span></td>
							<td>${i18n.danw}:</td>
							<td><span id="danw"></span></td>
							<td>${i18n.rongqlx}:</td>
							<td><span id="uaxh"></span></td>
							<td>${i18n.rongqsl }:</td>
							<td><span id=uarl></span></td>
						</tr>
						<tr>
							<td>${i18n.pich }:</td>
							<td><span id="pich"></span></td>
							<td>${i18n.shixq }:</td>
							<td><span id="shixrq"></span></td>
							<td>${i18n.zhuangt }:</td>
							<td><span id="zhuangtxx"></span></td>
						    <td>${i18n.utscsj}:</td>
							<td><span id="utrq"></span></td>
						</tr>
					</tbody>
				</table>
			</div>
		<div id='prompt'>${i18n.prompt}</div>
	  </div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>