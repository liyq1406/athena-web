<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","715");%>
<t:html i18n="i18n.kac.rucsb">
	<head>
		<title>${i18n.title_716 }</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
			var bool = true;
			var djbool = true;
			var kcflag = 0; //卡车号验证标记
			$(function(){//alert('${usercenter}');
				$('#grid_user_${pageId}').grid({
					keyFields:['usercenter','zhuangt','danjbh','danjlx','kach','chae'],//,'yundh','quybh','daztbh','duiycmqy'
				
					id:'grid_user_${pageId}',
					showCheckbox:true,
					enableCutPage:false,
					
					cols:[
						//{property:'yundh',caption:'${i18n.yundh}'},
						//{property:'duiycmqy',caption:'${i18n.duiycmqy}'},
						{property:'danjbh',caption:'${i18n.danjbh}'},
						{property:'danjlx',caption:'${i18n.danjlx}'}
				   ],
				buttons:[
			   	 	
					{name:'checked',caption:'${i18n.checked}[F4]',keyboard:'F4',action:function(){
						$('#grid_user_${pageId}').grid('selected');
			    		return false;
					}}
					,{name:'quercc',caption:'${i18n.quercc}[F8]',keyboard:'F8',action:function(){
						confirmSubmit();
					}}
				　,{name:'back',caption:'${i18n.back}[F11]'}
		          ,{name:'return',caption:'${i18n.return}[F12]'}
				]
				});
				//12861
				 $("#kach").bind('enter',function(event){
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
					
					$("#kach > input")[0].disabled = true;
					$("#quybh > input")[0].disabled = true;
					
					$('.field-tabed').removeClass('field-tabed').blur();  //移除样式
					$("#danjbh > input").addClass('field-tabed').focus();
					
					goSearch();
					//执行过卡车回车验证则标记为1
					kcflag = 1;
		    		return false;
				});
				
				 $("#danjbh").bind('enter',function(event){
				 	if(!$('#form_user_${pageId}').form("validateParam") || !djbool){
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
				     
				     var  blh = $("#danjbh input").val();
				     if(blh == ""){
					       showPromptMsg('red','${i18n.danjbhbnwk}');
					       return false;
				      }
				     if(!/^([A-Z]|[0-9])+$/.test(blh)){
				     	showPromptMsg('red','${i18n.danjbhbpp}');
						return false;
				     }
				     
				     
				    var allrecs = $('#grid_user_${pageId}').grid('getRecordAll');
				    
				    var needSearch = true;
				    for(var i=0;i<allrecs.length;i++){
				    	var str = allrecs[i].split('=');
				    	if(blh == str[1]){
				    		needSearch = false;
				    		var ckbx = $('td.danjbh[value="'+blh+'"]').parent().find('td.checkbox > input')[0];
				    		if(ckbx.checked){
					     		showPromptMsg('red','${i18n.danjhcf}');
					    		return false;
				    		}else{
				    			if(!ckbx.disabled){
				    				ckbx.checked = true;
				    			}else{
						     		showPromptMsg('red','${i18n.oneotherarea}');
						    		return false;
				    			}
				    		}
				    	}
				    }
				    
				    if(needSearch){
				    	/*
						showPromptMsg('red','${i18n.noMatchedResult}');
				    	*/
						goSearchDanj();
					}else{
						showPromptMsg('blue','${i18n.searchover}');
					}
					$("#danjbh > input").val('');
					return false;
				});
				 //V4_039 卡车号限长输入8位 如 HBA12345  
				$('#form_user_${pageId}').form({
					onemoredemand:true,
					onreload:true,
					fields:[
						{fieldType:'fieldSelect' , property:'quybh',caption:'${i18n.quybh}'
						,includeNull:false,src:'<%=request.getContextPath()%>/kac/yundRucsb!getQuybhSelect.ajax'
						,value:'${quybh}'},
						{fieldType:'fieldText',biaos:'enter',property:'kach',dataType:'text',maxLength:'8',caption:'${i18n.kach}'}
						,{fieldType:'fieldText',biaos:'enter',property:'danjbh',dataType:'text',limitedLength:'9',caption:'${i18n.danjbh}'}
						,{fieldType:'fieldText',property:'usercenter',type:'hidden',caption:'${i18n.usercenter}',value:'${usercenter}'}
				    ]
				});
				
				$(document).keyboardsupport({});
				
				$('.field-tabed').removeClass('field-tabed').blur();  //移除样式
				$("#kach > input").addClass('field-tabed').focus();
			});
			
			function goSearch(){
				if(!$('#form_user_${pageId}').form("validateParam")){
					return;
				}
				
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
					url:"yundRucsb!getYundRongqfkdByKach.ajax"+paramStr,
					cache:false,
					success:function (result){
						var msgColor = result.msgColor;
						var message = result.message;
						showPromptMsg(msgColor,message);
						if(msgColor == 'red'){
							bool = false;
							djbool = false;
							return false;
						}
						
						/*
						var rqfkds = result.rqfkds;
								
						for(var i = 0;i<rqfkds.length;i++){
										
							$('#grid_user_${pageId}').grid("addRow",rqfkds[i]);
										
						}
						*/
						
						/*
						var refreshPrompt = false;
						var currentArea = $('#quybh').fieldValue();
						
				    	var trs = $('td.duiycmqy[value!="'+currentArea+'"]').parent();
				    	trs = trs.find('td.duiycmqy[value!="null"]').parent();
				    	if(trs.length > 0){
					    	var boxes = trs.find('td.checkbox > input');
					    	for(var i=0;i<boxes.length;i++){
					    		boxes[i].disabled = 'true';
					    	}
					    	refreshPrompt = true;
					    }
					    if(refreshPrompt){
					    	trs = $('td.duiycmqy[value="'+currentArea+'"]').parent();
					    	if(trs.length > 0){
						    	message = message + '${i18n.someotherarea}';
								showPromptMsg(msgColor,message);
							}else{
								msgColor = 'red';
								message = '${i18n.allotherarea}';
								showPromptMsg(msgColor,message);
								return false;
							}
						}
						*/
						bool = true;
						djbool = true;
					}
				});
				
				return false;
			}
			
			function goSearchDanj(){
				if(!$('#form_user_${pageId}').form("validateParam")){
					return;
				}
				
				//判断卡车号是否回车验证过了
				if(kcflag==0){ 
					showPromptMsg("red","请输入卡车号并回车确认");
					return false;
				}
				
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
					url:"yundRucsb!getRongqfkdByDanjbh.ajax"+paramStr,
					cache:false,
					success:function (result){
						var msgColor = result.msgColor;
						var message = result.message;
						showPromptMsg(msgColor,message);
						if(msgColor == 'red'){
							bool = false;
							return false;
						}
						
						var rqfkds = result.rqfkds;
								
						for(var i = 0;i<rqfkds.length;i++){
										
							$('#grid_user_${pageId}').grid("addRow",rqfkds[i]);
										
						}
						var ckboxs = 
							$('#grid_user_${pageId} > div.grid-content > table.grid-table > tbody > tr.grid-row > td.checkbox > input');
						for(var j = 0;j < rqfkds.length;j++){
							ckboxs[ckboxs.length - 1 - j].checked = true;
						}
						
						bool = true;
					}
				});
				
				return false;
			}
			
			function confirmSubmit(){
				if(bool){
					var params = $('#form_user_${pageId}').form("getFormParam");
						var records = $('#grid_user_${pageId}').grid('getSelectedAll');
						if(records.length == 0){
							showPromptMsg('red','${i18n.weixzdj}');
							return false;
						}
						
						params = params.concat(records);
						//return false;
						var url = "<%=request.getContextPath()%>/kac/71601.ajax";
						$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
							var msgColor = results.msgColor;
							var message = results.message;
							showPromptMsg(msgColor,message);
							if(msgColor == 'blue'){
			   	 	   				$('#grid_user_${pageId}').grid('clearRecords');
									$("#kach > input")[0].disabled = false;
									$("#quybh > input")[0].disabled = false;
					   				$("#danjbh input").val('');
					    			$("#kach input").val('');
							}
						 });
				}
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
							<td>${i18n.danjbh}</td>
							<td><div class="ui-field" id="danjbh"></div></td>
						</tr>
						<tr style="display:none"><!-- 隐藏域添加方法，form中需要同步添加 -->
							<td>${i18n.usercenter }</td>
							<td><div class="ui-field" id="usercenter"></div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<%--
			 --%>
			<div id="grid_user_${pageId}"></div>
		   <div id='prompt'>${i18n.prompt}</div>
		 </div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>