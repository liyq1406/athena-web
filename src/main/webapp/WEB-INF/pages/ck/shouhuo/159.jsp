<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","159");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_159}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
			$(function(){
			    //form  
				$('#form_user_${pageId}').form({
				    onreload:true,
					fields:[
					{fieldType:'fieldText' , property:'uth' ,biaos:'enter',caption:'${i18n.uth}',dataType:'uth',notNull:true},
					{fieldType:'fieldText' , property:'ulh' ,biaos:'enter',caption:'${i18n.ulh}',dataType:'ulh',notNull:true},
					{fieldType:'fieldText' , property:'elh' ,biaos:'enter',dataType:'elh',caption:'${i18n.elh}',notNull:true},
					{fieldType:'fieldText' , property:'ush' ,biaos:'enter',caption:'${i18n.ush}',dataType:'ush',notNull:true},
					{fieldType:'fieldText' , property:'uch' ,biaos:'enter',caption:'${i18n.uch}',dataType:'uch1',notNull:true}
					]
				}); 
              
		//点击UT号回车事件
		 $("#uth").bind('enter',function(event){
			 	if(!$('#uth').fieldText('validate')){ //校验UT号
						     return ;
				  }
			 	var params = [];
				params.push("uth="+$("#uth input").val());
				var url = "<%=request.getContextPath()%>/shouhuo/15901.do";
			 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 			 if (showPromptRequestMsg(results)==true){
			 			     if(results.result.response != 'C_1403'){
				 				//加载返回数据
								var strJSON=JSON.stringify(results);
								$('#putvalue').val(strJSON);
								$("#putform").attr("action","<%=request.getContextPath()%>/shouhuo/P15901.do"+st_Params);
	    			    		document.putform.submit();
    			    		 }
						 }
					});
					return false;
		  });  
	     //点击UL号回车事件
		 $("#ulh").bind('enter',function(event){
		        if(!$('#ulh').fieldText('validate')){ //校验UL号
						     return ;
				  }
			 	var params=[];
			 	params.push("ulh="+$("#ulh input").val());
				var url = "<%=request.getContextPath()%>/shouhuo/15902.do";
			 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 			 if (showPromptRequestMsg(results)==true){
			 			    	if(results.result.response != 'C_1403'){
					 				//加载返回数据
									var strJSON=JSON.stringify(results);
									$('#putvalue').val(strJSON);
									$("#putform").attr("action","<%=request.getContextPath()%>/shouhuo/P15902.do"+st_Params);
		    			    		document.putform.submit();
		    			    	 }
						 }
					});
					return false;
		 });  
		//点击EL号回车事件
		 $("#elh").bind('enter',function(event){
			 if(!$('#elh').fieldText('validate')){ //校验EL号
							     return ;
				}
			 	var params=[];
			 	params.push("elh="+$("#elh input").val()); 
				var url = "<%=request.getContextPath()%>/shouhuo/15903.do";
			 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 			 if (showPromptRequestMsg(results)==true){
			 			   	 if(results.result.response != 'C_1403'){
					 				//加载返回数据
									var strJSON=JSON.stringify(results);
									$('#putvalue').val(strJSON);
									$("#putform").attr("action","<%=request.getContextPath()%>/shouhuo/P15903.do"+st_Params);
		    			    		document.putform.submit();
	    			    	   }
						 }
					});
					return false;
			}); 
			 	
		//点击US号回车事件
		 $("#ush").bind('enter',function(event){
				 if(!$('#ush').fieldText('validate')){ //校验US号
						return ;
				   }
			 	var params=[];
			 	params.push("ush="+$("#ush input").val());
				var url = "<%=request.getContextPath()%>/shouhuo/15904.do";
			 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 			 if (showPromptRequestMsg(results)==true){
			 			 		if(results.result.response != 'C_1403'){
					 				//加载返回数据
									var strJSON=JSON.stringify(results);
									$('#putvalue').val(strJSON);
									$("#putform").attr("action","<%=request.getContextPath()%>/shouhuo/P15904.do"+st_Params);
		    			    		document.putform.submit();
		    			    	  }
						 }
					});
					return false;
			 });  
		//点击UC号回车事件
		 $("#uch").bind('enter',function(event){
		 	//11527 UC号有9位的，有10位的，不需自动补齐
				// if(!$('#uch').fieldText('validate')){ //校验UC号
					//	return ;
				  //}
			 	var params=[];
			 	var uch=$("#uch input").val();
			 	params.push("uch="+uch);
				var url = "<%=request.getContextPath()%>/shouhuo/15905.do";
			 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 			 if (showPromptRequestMsg(results)==true){
			 			    if(results.result.response != 'C_1403'){
				 				//加载返回数据
								var strJSON=JSON.stringify(results);
								$('#putvalue').val(strJSON);
								$("#putform").attr("action","<%=request.getContextPath()%>/shouhuo/P15905.do"+st_Params);
	    			    		document.putform.submit();
	    			    	  }
						 }
					});
					return false;
			 	});
			 	
		 	 	<%-- $('#btn_return').bind('click',function(){
                         window.location.href="<%=request.getContextPath()%>/index_ck.jsp"+st_Params;
					  return true;
                        });  --%>	 	
          
			  $(document).keyboardsupport({});
		});
		</script>
		
	</head>
	<body>
	<div style="padding:20px;">
		<div id="title"></div>
			<form id="putform" method="post" name="putform">
				<input id="putvalue" name="putvalue" type="Hidden"></input>
			</form> 
			<div id="form_user_${pageId}" class="ui-fieldLayout">
				<table class="ui-grid" cellspacing="1" width="100%" align="center"  >
					<tbody >
						<tr>
							<td align="right" width="50%">${i18n.uth}</td>
							<td align="left" width="50%"><div class="ui-field" id="uth" ></div></td>
						</tr>
						<tr>
							<td align="right" width="50%">${i18n.ulh}</td>
							<td align="left" width="50%"><div class="ui-field" id="ulh" ></div></td>
						</tr>
						<tr>
							<td align="right" width="50%">${i18n.elh}</td>
							<td align="left" width="50%"><div class="ui-field" id="elh" ></div></td>
						</tr>
						<tr>
							<td align="right" width="50%">${i18n.ush}</td>
							<td align="left" width="50%"><div class="ui-field" id="ush" ></div></td>
						</tr>
						<tr>
							<td align="right" width="50%">${i18n.uch}</td>
							<td align="left" width="50%"><div class="ui-field" id="uch" ></div></td>
						</tr>
						<tr>
							<td align="center" colspan="2"><div><span id="btn_back" class="ui-button">${i18n.back}[F11]</span><span id="btn_return" class="ui-button">${i18n.return}[F12]</span></div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div id='prompt'>${i18n.prompt}</div>
		</div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>