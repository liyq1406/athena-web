<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","116");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_116 }</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
			$(function(){
				$('#form_user_${pageId}').form({
					onreload:true,
					fields:[
						{fieldType:'fieldText',property:'pich',dataType:'text',maxLength:'12',notNull:true,caption:'${i18n.pich}'},
						{fieldType:'fieldText',property:'lingjbh',biaos:'enter',dataType:'letter_numeric',limitedLength:'10',notNull:true,caption:'${i18n.lingjbh}'},
						{fieldType:'fieldSelect',property:'chanx',caption:'${i18n.chanx}',notNull:true},
						{fieldType:'fieldText',property:'shifsl',dataType:'positive',notNull:true,caption:'${i18n.shijrl}'},
						{fieldType:'fieldText',property:'daygs',dataType:'plusinteger',notNull:true,caption:'${i18n.dayzs}',maxLength:'2'},
						{fieldType:'fieldHidden',property:'lingjmc'},
						{fieldType:'fieldHidden',property:'usxh',caption:'${i18n.usxh}'},
						{fieldType:'fieldHidden',property:'lingjbh1'},
						{fieldType:'fieldLabel',property:'usrl',caption:'${i18n.baozrl}'},
						{fieldType:'fieldHidden',property:'zickbh'}
					]
				});
				//零件编号回车事件
				$('#lingjbh').bind('enter',function(){
				   if(!$('#lingjbh').fieldText('validate')){ //校验零件编号
					    return ;
					}
				   var params = [];
				   params.push("lingjbh="+$("#lingjbh input").val());
				   var url = "<%=request.getContextPath()%>/shouhuo/11601.do";
				   $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
						  if (showPromptRequestMsg(results)==true){
						       if(results.result.response =="0001"){
									//加载返回数据
									$('#lingjbh1 input').val(results.result.parameter.lingjbh);
									$('#lingjmc input').val(results.result.parameter.lingjmc);
									$('#usxh input').val(results.result.parameter.usxh);
									$('#usrl span').html(results.result.parameter.usrl);
									$('#shifsl input').val(results.result.parameter.usrl);
									$('#zickbh input').val(results.result.parameter.zickbh);
									$('#chanx').fieldSelect('resetUrl','<%=request.getContextPath()%>/common/shengcx.do'+st_Params+'&lingjbh='+$("#lingjbh input").val() +'&cangkbh='+st_Cangkbh);
									$('#pich input').focus();
							   }
							 
							 }
					 });
				   return  false;
			 	});
			 	
				$('#btn_submit').bind('click',function(){
				      if(!$('#form_user_${pageId}').form("validateParam")){
						     return;
					     }
				      var lingjbh= $('#lingjbh input').val();
					  if( lingjbh!= $('#lingjbh1 input').val()){
					       $('#form_user_${pageId}').form('resetFields');
					       $('#lingjbh input').val(lingjbh);
					   var params = [];
					   params.push("lingjbh="+$("#lingjbh input").val());
					   var url = "<%=request.getContextPath()%>/shouhuo/11601.do";
					   $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
							  if (showPromptRequestMsg(results)==true){
							       if(results.result.response =="0001"){
										//加载返回数据
										$('#lingjbh1 input').val(results.result.parameter.lingjbh);
										$('#lingjmc input').val(results.result.parameter.lingjmc);
										$('#usxh input').val(results.result.parameter.usxh);
										$('#usrl span').html(results.result.parameter.usrl);
										$('#shifsl input').val(results.result.parameter.usrl);
										$('#zickbh input').val(results.result.parameter.zickbh);
										$('#chanx').fieldSelect('resetUrl','<%=request.getContextPath()%>/common/shengcx.do'+st_Params+'&lingjbh='+$("#lingjbh input").val() +'&cangkbh='+st_Cangkbh);
										$('#pich input').focus();
								   } 
							 }
							 if(results.result.response =="0001"){
							    showMsg("${i18n.ljgz}");
							 }
						 });
					   return  false;
					  }else{
					    var params = $('#form_user_${pageId}').form("getFormParam");
					    var url = "<%=request.getContextPath()%>/shouhuo/11602.do";
			 		    $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
				 			if (showPromptRequestMsg(results)==true){ 
				 			   $('#form_user_${pageId}').form('resetFields');
				 			}
					     });
			    		return false;
					  }
					
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
						    <td>${i18n.lingjbh}</td>
							<td><div class="ui-field" id="lingjbh"></div></td>
							<td>${i18n.pich}</td>
							<td><div class="ui-field" id="pich"></div></td>
							<td>${i18n.chanx}</td>
							<td><div class="ui-field" id="chanx"></div></td>
						</tr>
						<tr>
							<td>${i18n.baozrl}</td>
							<td><div class="ui-field" id="usrl"></div></td>
							<td>${i18n.shijrl}</td>
							<td><div class="ui-field" id="shifsl"></div></td>
							<td>${i18n.dayzs}</td>
							<td><div class="ui-field" id="daygs"></div></td>
						</tr>
						<tr>
					       	<td colspan="5"></td>
							<td align="right"><div>
							<span id="btn_submit" class="ui-button">${i18n.ok}[F2]</span>
							<span id="btn_back" class="ui-button">${i18n.back}[F11]</span>
							<span id="btn_return" class="ui-button">${i18n.return}[F12]</span>
				            </div></td>
						</tr>
					</tbody>
				</table>
				<div class="ui-field" id="usxh"></div>
				<div class="ui-field" id="lingjmc"></div>
				<div class="ui-field" id="zickbh"></div>
				<div class="ui-field" id="lingjbh1"></div>
			</div>
		<div id='prompt'>${i18n.prompt}</div>
	  </div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>