<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","715");%>
<t:html i18n="i18n.kac.rucsb">
	<head>
		<title>${i18n.title_715 }</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
			var currentPage = 1;
			$(function(){//alert('${usercenter}');
				$('#grid_user_${pageId}').grid({
					keyFields:['blh','uth','usercenter','zuizsj','zuiwsj','xiehzt','cangkbh','daztbh','chengysdm','quybh','beiz1'],
					id:'grid_user_${pageId}',
					showCheckbox:true,
					
					enableCutPage:false,
					
					//src:'<%=request.getContextPath()%>/kac/yundRucsb!findBldsByParams.ajax',
					
					cols:[
						{property:'blh',caption:'${i18n.blh}'},
						{property:'zuiwsj',caption:'${i18n.zuiwsj}'},
						{property:'xiehzt',caption:'${i18n.xiehzt}'},
				        {property:'daztbh',caption:'${i18n.daztbh}'}
				   ],
				buttons:[
			   	 	//{name:'search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
			   	 	//   goSearch();
					//}}
					//,
					{name:'chakyd',caption:'查看运单[F1]',keyboard:'F1',action:function(){
						confirmSubmits();
					}}
					
					,{name:'checked',caption:'${i18n.checked}[F4]',keyboard:'F4',action:function(){
						$('#grid_user_${pageId}').grid('selected');
						hunzCheckBoxChange();
			    		return false;
					}}
			   	 	,{name:'selectall',caption:'${i18n.selectall}[F5]',keyboard:'F5',action:function(){
			   	 		$('#grid_user_${pageId}').grid('selectedAll');
			   	 		hunzCheckBoxChange();
			    		return false;
					}}
					
					/*,{name:'delete',caption:'${i18n.delete}[F6]',keyboard:'F6',action:function(){
						var records = $('#grid_user_${pageId}').grid('getSelectedAll');
						if(records.length == 0){
							$('#prompt span').css('color','red').text("${i18n.selectoneerror}");
							return false;
						}
                        $('#grid_user_${pageId}').grid('deleteCheckBoxedRow');
	 					if(0 == $('#grid_user_${pageId}').grid('getRecordAll').length){
	 					    msgClear();
	 					}
		 	    		return false;
					}}*/
					
					//,{name:'reeditkach',caption:'${i18n.reeditkach}[F7]',keyboard:'F7',action:function(){
					//	$("#kach > input")[0].disabled = false;
					//	$("#kach > input")[0].focus();
					//    showPromptMsg('blue','${i18n.reeditmsg}');
					//}}
					,{name:'quersb',caption:'${i18n.quersb}[F8]',keyboard:'F8',action:function(){
						confirmSubmit();
					}}
					
				　,{name:'back',caption:'${i18n.back}[F11]'}
		          ,{name:'return',caption:'${i18n.return}[F12]'}
				]
				});
				
				 $("#kach").bind('enter',function(event){
		   	 	  	 //$('#grid_user_${pageId}').grid('clearRecords');
		   	 		 if(!$('#form_user_${pageId}').form("validateParam")){
			     		return;
			     	   }
				     var  tch = $("#kach input").val();
				     if(tch == ""){
					       showPromptMsg('red','${i18n.kachwk}');
					       return false;
				      }
				     if(!/^([A-Z]|[0-9]){7,8}$/.test(tch)){
				     	showPromptMsg('red','${i18n.kachbpp}');
						return false;
				     }
					 showPromptMsg('blue','${i18n.continueOp}');
				     //if( blh !="" && tch !=""){
				     //	 showPromptMsg('red','${i18n.BLH_TCH}');
				     //	 return false;
				     //}
				     
		   	 		//var params=[];
				    //params.push("blh="+blh);
		   	 		//params.push("currentPage=1");
					//设置分页条件
					//$('#grid_user_${pageId}').grid("setQueryParams", params);
					//加载数据
					//$('#grid_user_${pageId}').grid("load",params);
					//alert($("#kach > input")[0].disabled);
					
					$("#kach > input")[0].disabled = true;
					$("#quybh > input")[0].disabled = true;
					
					$('.field-tabed').removeClass('field-tabed').blur();  //移除样式
					$("#blh > input").addClass('field-tabed').focus();
					
					goSearchUrl("yundRucsb!findBldsByKachQjp.ajax");
					//$("#blh > input")[0].focus();
		    		return false;
				});
				
				 $("#blh").bind('enter',function(event){
		   	 		 if(!$('#form_user_${pageId}').form("validateParam")){
			     		return;
			     	   }
				     var  tch = $("#kach input").val();
				     if(tch == ""){
					       showPromptMsg('red','${i18n.kachwk}');
					       return false;
				      }
				     if(!/^([A-Z]|[0-9]){7,8}$/.test(tch)){
				     	showPromptMsg('red','${i18n.kachbpp}');
						return false;
				     }
				     var  blh = $("#blh input").val();
				     if(blh == ""){
					       showPromptMsg('red','${i18n.blhwk}');
					       return false;
				      }
				     if(!/^([A-Z]|[0-9])+$/.test(blh)){
				     	showPromptMsg('red','${i18n.blhbpp}');
						return false;
				     }
				     
				    var allrecs = $('#grid_user_${pageId}').grid('getRecordAll');
				    
				    var needSearch = true;
				    for(var i=0;i<allrecs.length;i++){
				    	var str = allrecs[i].split('=');
				    	//alert(str[1]+'\n'+allrecs[i].length);
				    	if(blh == str[1]){
				    		needSearch = false;
				    		//var selrecs = $('#grid_user_${pageId}').grid('getSelectedAll');
				    		//for(var j=0;j<selrecs.length;j++){
				    			
				    		//}
				    		var ckbx = $('td.blh[value="'+blh+'"]').parent().find('td.checkbox > input')[0];
				    		//alert(ckbx[0].length+'\n'+ckbx[0].outerHTML);
				    		if(ckbx.checked){
					     		showPromptMsg('red','${i18n.blhcf}');
					     		$("#blh > input").val('');
					    		return false;
				    		}else{
				    			ckbx.checked = true;
				    		}
				    	}
				    }
				    
				    if(needSearch){
						goSearch();
					}else{
						showPromptMsg('blue','${i18n.searchover}');
						$("#blh > input").val('');
						return false;
					}
				});
				  //V4_039 卡车号限长输入8位 如 HBA12345  
				$('#form_user_${pageId}').form({
					onemoredemand:true,
					onreload:true,
					fields:[
						{fieldType:'fieldSelect' , property:'quybh',caption:'${i18n.quybh}'
						,includeNull:false,src:'<%=request.getContextPath()%>/kac/yundRucsb!getQuybhSelect.ajax'
						,value:'${quybh}'},
						{fieldType:'fieldText',biaos:'enter',property:'kach',dataType:'text',maxLength:'8',caption:'${i18n.kach}'},
						{fieldType:'fieldText',biaos:'enter',property:'blh',dataType:'text',maxLength:'10',caption:'${i18n.blh}'}
						,{fieldType:'fieldText',property:'usercenter',type:'hidden',caption:'${i18n.usercenter}',value:'${usercenter}'}
				    ]
				});
				
				$(document).keyboardsupport({});
									$('.field-tabed').removeClass('field-tabed').blur();  //移除样式
				$("#kach > input").addClass('field-tabed').focus();
			});
			
			function goSearch(){
				//$('#grid_user_${pageId}').grid('clearRecords');
				   	 	if(!$('#form_user_${pageId}').form("validateParam")){
				     		return;
				     	}
					    var  blh = $("#blh input").val();
					    var  tch = $("#kach input").val();
					    //if( blh !="" && tch !=""){
					    // 	showPromptMsg('red','${i18n.BLH_TCH}');
					    // 	return false;
					    //  }
					    var params = $('#form_user_${pageId}').form("getFormParam");
			   	 		//params.push("currentPage=1");
			   	 		
						//alert(params[0]+"\n"+params[0].length+"\n"+params.length);return;
			   	 		
			   	 		//旧方法
						//设置分页条件
						//$('#grid_user_${pageId}').grid("setQueryParams", params);
						//加载数据
						//$('#grid_user_${pageId}').grid("load",params);
						
						var paramStr = '';
						for(var i=0;i<params.length;i++){
							if(i==0){
								paramStr = paramStr + '?';
							}else{
								paramStr = paramStr + '&';
							}
							paramStr = paramStr + params[i];
						}//alert(paramStr);
						
					    showPromptMsg('blue','${i18n.searching}');
						$.ajax({
							url:"yundRucsb!findBldsByParamsQjp.ajax"+paramStr,
				            cache:false,
							success:function (result){
								//alert(result.bls);
									//alert(result.msg.length);
								
								var yundmxs = result.bls;
								var searchoverBool = true;
								if(yundmxs.length <= 0){
									if(typeof(result.msg) != 'undefined'){
										showPromptMsg('red',result.msg);
					   					$("#blh input").val('');
									}else{
										showPromptMsg('red','${i18n.emptyResult}');
										$("#blh > input").val('');
									}
									searchoverBool = false;
									return false;
								}
								//var bools = false;
								//var daztTemp = ''
								for(var i = 0;i<yundmxs.length;i++){
									
									$('#grid_user_${pageId}').grid("addRow",yundmxs[i]);
									//$('#grid_user_${pageId}').grid('focus');
									//$('#grid_user_${pageId}').grid('selected');
									
								}
								var ckboxs = 
					$('#grid_user_${pageId} > div.grid-content > table.grid-table > tbody > tr.grid-row > td.checkbox > input');
								for(var j = 0;j < yundmxs.length;j++){
									ckboxs[ckboxs.length - 1 - j].checked = true;
								}
								if(searchoverBool){
										ckboxs.bind('change',function(event){
											hunzCheckBoxChange();
										});
									//for(var i=0;i<ckboxs.length;i++){
										//alert(ckboxs[i].outerHTML);
										//ckboxs[i].onChange = 'javascript:alert();';
										//ckboxs[i].fireEvent("onchange");
									//}
					    			showPromptMsg('blue','${i18n.searchover}');
									//$('#grid_user_${pageId}').grid('selectedAll');
								}
								hunzCheckBoxChange();
								$("#blh > input")[0].value = '';
							}
						});
			    		return false;
			}
			
			function goSearchUrl(urlstr){
				if(!$('#form_user_${pageId}').form("validateParam")){
					return;
				}
				var  blh = $("#blh input").val();
				var  tch = $("#kach input").val();
				
				var params = $('#form_user_${pageId}').form("getFormParam");
				
				var paramStr = '';
				for(var i=0;i<params.length;i++){
					if(i==0){
						paramStr = paramStr + '?';
					}else{
						paramStr = paramStr + '&';
					}
					paramStr = paramStr + params[i];
				}
						
				showPromptMsg('blue','${i18n.searching}');
				$.ajax({
					url:urlstr+paramStr,
					cache:false,
					success:function (result){
								
						var yundmxs = result.bls;
						var searchoverBool = true;
						if(yundmxs.length <= 0){
							showPromptMsg('red','${i18n.emptyResult}');
							searchoverBool = false;
						}
									
						for(var i = 0;i<yundmxs.length;i++){
										
							$('#grid_user_${pageId}').grid("addRow",yundmxs[i]);
										
						}
						if(searchoverBool){
							var ckboxs = 
							$('#grid_user_${pageId} > div.grid-content > table.grid-table > tbody > tr.grid-row > td.checkbox > input');
							for(var i=0;i<ckboxs.length;i++){
												
								ckboxs.bind('change',function(event){
									hunzCheckBoxChange();
								});
							}
							showPromptMsg('blue','${i18n.searchover}');
							//$('#grid_user_${pageId}').grid('selectedAll');
							hunzCheckBoxChange();
						}
					}
				});
				
				return false;
			}
			
			function confirmSubmit(){
				var params = $('#form_user_${pageId}').form("getFormParam");
						var records = $('#grid_user_${pageId}').grid('getSelectedAll');//alert(records.length);
						if(records.length == 0){
							$('#prompt span').css('color','red').text("${i18n.selectoneerror}");
							return false;
						}
						//alert(params+"\n"+params.length);
						params = params.concat(records);
						//alert(params+"\n"+params.length);
						//return false;
						var url = "<%=request.getContextPath()%>/kac/71501.ajax";
						$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
							  //if (showPromptRequestMsg(results)==true){
							       //$('#grid_user_${pageId}').grid('parseResult',results);
							  //    }
							  //alert(results+'\n'+results.length+'\n'+results.message);
							  /*
							  var obj = results;
				
								var props = "";
								for(var p in obj){
									if(typeof(obj[p])=="function"){
									}else{
										props = p + "=" + obj[p] +"\n";
									}
								}
								alert(props);
							  */
							  if(typeof(results.message) != 'undefined'){
								  if(results.message=='0'){
								  	showPromptMsg('blue','${i18n.rucsbcg}');
			   	 	   				$('#grid_user_${pageId}').grid('clearRecords');
									$("#kach > input")[0].disabled = false;
									$("#quybh > input")[0].disabled = false;
					   				$("#blh input").val('');
					    			$("#kach input").val('');
								  }else{
								  	if(typeof(results.messageContent) != 'undefined'){
								  		showPromptMsg('red',results.messageContent);
								  	}else{
								  		showPromptMsg('red','${i18n.rucsbsb}');
								  	}
								  }
								  
							}
						 });
			    		return false;
			}
			function confirmSubmits(){
						window.location.href="<%=request.getContextPath()%>/kac/715000.do"+st_Params+"&currentPage="+1;
			}
			
			//复选框选择事件，通过查询大站台确定是否是混装状态
			function hunzCheckBoxChange(){
				var params = $('#form_user_${pageId}').form("getFormParam");
				var records = $('#grid_user_${pageId}').grid('getSelectedAll');//alert(records.length);
				if(records.length == 0){
					$('#prompt span').css('color','red').text("${i18n.selectoneerror}");
					return false;
				}
				params = params.concat(records);
				var url = "<%=request.getContextPath()%>/kac/yundRucsb!queryHunzFlagQjp.ajax";
				$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
					if(typeof(results.messageColor) != 'undefined' 
							&& typeof(results.messageContent) != 'undefined'){
						showPromptMsg(results.messageColor,results.messageContent);
					}else{
						showPromptMsg('red','${i18n.hunzflagyc}');
					}
				});
				return false;
			}
		</script>
	</head>
	
	<body>
		<div style="padding:20px;">
			<div id="title"></div>
			<div id="form_user_${pageId}" class="ui-fieldLayout">
				<table class="ui-grid" cellspacing="1" width="100%">
					<tbody>
						<tr>
							<td>${i18n.quybh}</td>
							<td><div class="ui-field" id="quybh"></div></td>
						</tr>
						<tr>
							<td>${i18n.kach}</td>
							<td><div class="ui-field" id="kach"></div></td>
						</tr>
						<tr>
							<td>${i18n.blh }</td>
							<td><div class="ui-field" id="blh"></div></td>
						</tr>
						<tr style="display:none"><!-- 隐藏域添加方法，form中需要同步添加 -->
							<td>${i18n.usercenter }</td>
							<td><div class="ui-field" id="usercenter"></div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div id="grid_user_${pageId}"></div>
		   <div id='prompt'>${i18n.prompt}</div>
		 </div>
		 <!--div style="display:none">
		 	<input id="record_usercenter" type="text"/>
		 	<input id="record_blh" type="text"/>
		 	<input id="record_uth" type="text"/>
		 	<input id="record_zuizsj" type="text"/>
		 	<input id="record_cangkbh" type="text"/>
		 	<input id="record_chengysdm" type="text"/>
		 	<input id="record_zuiwsj" type="text"/>
		 	<input id="record_xiehzt" type="text"/>
		 	<input id="record_daztbh" type="text"/>
		 </div-->
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>