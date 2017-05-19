<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","115");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_115 }</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
			var count = 0;
			var chengp = {
					result : {
						total : count,
						rows : []
					}
			};
			$(function(){
				$('#grid_user_${pageId}').grid({
					keyFields:['lingjxlh'],
					id:'grid_user_${pageId}',
					showCheckbox:true,
					enableCutPage:false,
					src:'<%=request.getContextPath()%>/shouhuo/11501.do',
					cols:[
						{property:'lingjxlh',caption:'${i18n.xulh}'}
				    ],
				buttons:[
                   {name:'checked',caption:'${i18n.checked}[F4]',keyboard:'F4',action:function(){
                        msgClear();
						$('#grid_user_${pageId}').grid('selected');
			    		return false;
					}}
					,{name:'selectall',caption:'${i18n.selectall}[F5]',keyboard:'F5',action:function(){
					    msgClear();
						$('#grid_user_${pageId}').grid('selectedAll');
			    		return false;
					}}
					,{name:'delete',caption:'${i18n.delete}[F6]',keyboard:'F6',action:function(){
					    msgClear();
						var rows = $('#grid_user_${pageId}' + ' tr').has('input:checked');
						if(rows.length<1){
							showPromptMsg('red','${i18n.selectoneerror}');
							return;
						}
						for(var i= 0 ; i < chengp.result.rows.length ; i ++){
							for(var j = 0 ; j < rows.length ; j++){
								if(chengp.result.rows[i].lingjxlh == $(rows[j]).attr('id')){
			   	 					chengp.result.rows.splice(i,1);
			   	 					$('#grid_user_${pageId}').grid('parseRecords',chengp);
			   	 				  }
							   }
		   	 			   }
						return false;
					}}
					,{name:'print',caption:'${i18n.print}[F8]',keyboard:'F8',action:function(){
				    	if(chengp.result.rows.length < $('#usrl span').html()){
		   	 			    if(confirm($.sdcui.resource.i18n['C_LJBZWM']) != true){
		   	 			           return false; 
						 	  }
				   	 	 }
						var params = $('#form_user_${pageId}').form("getFormParam");
						var record = $('#grid_user_${pageId}').grid('getRecordAll');
						if(record.length<1){
						    showPromptMsg('red','${i18n.dysb}');
							return ;
						}
						var postParams = [];
						params = params.concat(record);
						var url = "<%=request.getContextPath()%>/shouhuo/11502.do";
				 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
							   if (showPromptRequestMsg(results)==true){
									   $('#kuwbh span').html(results.result.parameter.kuwbh);
									   $('#grid_user_${pageId}').grid('parseRecords',results);
									   $('#ush span').html(results.result.parameter.ush);
									   //$("#lingjbh input").attr("disabled",false);
									    count =0;
									    chengp = {
												result : {
													total : count,
													rows : []
												}
										};
								   }
						 });
				      return  false;
					}}
					,{name:'back',caption:'${i18n.back}[F11]'}
					,{name:'return',caption:'${i18n.return}[F12]'}
				]});
				$('#form_user_${pageId}').form({
					onreload:true,
					url:'<%=request.getContextPath()%>/shouhuo/11501.do',
					fields:[
						{fieldType:'fieldText',property:'pich',dataType:'text',maxLength:'12',caption:'${i18n.pich}',notNull:true},
						{fieldType:'fieldSelect',property:'chanx',caption:'${i18n.chanx}',notNull:true},
						{fieldType:'fieldText',biaos:'enter',property:'lingjbh',dataType:'letter_numeric',limitedLength:'10',caption:'${i18n.lingjbh}',notNull:true},
						{fieldType:'fieldLabel',property:'usxh',caption:'${i18n.rongqxh}'},
						{fieldType:'fieldLabel',property:'usrl',caption:'${i18n.rongqrl}'},
						{fieldType:'fieldLabel',property:'kuwbh',caption:'${i18n.kuw}'},
						{fieldType:'fieldText',biaos:'enter',property:'lingjxlh',dataType:'text',caption:'${i18n.xulh}',notNull:true},
						{fieldType:'fieldLabel',property:'ush',caption:'${i18n.ush}'},
						{fieldType:'fieldHidden',property:'lingjmc'},
						{fieldType:'fieldHidden',property:'zickbh'}
					]
				});
				
				
				$('#lingjbh').bind('enter',function(){
				var lingjbh=$("#lingjbh input").val()
				 $('#form_user_${pageId}').form('resetFields');
				 $('#grid_user_${pageId}').grid('clearRecords');
				  $('#lingjbh input').val(lingjbh);
					if(!$('#lingjbh').fieldText('validate')){ //校验零件编号
					    return ;
					}
				 var params = [];
				 params.push("lingjbh="+$("#lingjbh input").val());
				var url = "<%=request.getContextPath()%>/shouhuo/11501.do";
				$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
						  if (showPromptRequestMsg(results)==true){
						        if(results.result.response =='0001'){
									//加载返回数据
									$('#lingjmc input').val(results.result.parameter.lingjmc);
									$('#usxh span').html(results.result.parameter.usxh);
									$('#usrl span').html(results.result.parameter.usrl);
									$('#zickbh input').val(results.result.parameter.zickbh);
									$("#lingjbh input").attr("disabled",true);
									count =0;
								    chengp = {
											result : {
												total : count,
												rows : []
											}
									};
									var url2 =  "<%=request.getContextPath()%>/shouhuo/11508.do";
									g_isSub = 0;
									$('#form_user_${pageId}').form("submitUrl", params, url2, function(results){
						                if(results.result.response =='0001'){
									     
									    }    
									    $('#chanx').fieldSelect('resetUrl','<%=request.getContextPath()%>/common/shengcx.do'+st_Params+'&lingjbh='+$("#lingjbh input").val() +'&cangkbh='+st_Cangkbh);
									 });
								}
						     }
					});
				   return  false;
			 	});
				$('#lingjxlh').bind('enter',function(){	
				           msgClear();
					   	 	if(!$('#form_user_${pageId}').form("validateParam")){
								return;
							}
			   	 			var flag = true;
			   	 			var xlh = $('#lingjxlh input').val();			   	 			
			   	 			for(var i= 0 ; i < chengp.result.rows.length ; i ++){
			   	 				if(chengp.result.rows[i].lingjxlh == xlh){
			   	 					$('#prompt span').css('color','red').text('${i18n.onlyone}');
			   	 					$('#lingjxlh input').val('');
			   	 					return ;
			   	 				}
			   	 			}
			   	 			
			   	 		//modified by xss for 0010670
			   	 		var len = xlh.length;
						if(len!=14){						    
						    showPromptMsg('red','${i18n.ljwsbzq}');
							return ;
						}	
						
						var code =xlh.substring(13);
			   	 			
			   	 		var params = [];
			   	 		params.push("lingjbh="+$('#lingjbh input').val());
			   	 		params.push("lingjxlh="+xlh.substring(0,13));
			   	 		
			   	 		params.push("xlh="+xlh);//modified by xss for 0011259
			   	 		
			   	 		params.push("code="+code);
			   	 		
	   	 				 var url = "<%=request.getContextPath()%>/shouhuo/11505.do";
						 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
							  if (showPromptRequestMsg(results)==true){
							       if(xlh && flag){
					   	 				chengp.result.total = chengp.result.total + 1;
					   	 				chengp.result.rows.push({'lingjxlh':xlh});
										$('#grid_user_${pageId}').grid('parseRecords',chengp);
										flag = true;
					   	 			}
					   	 			if(chengp.result.rows.length == $('#usrl span').html()){
					   	 			    if(confirm($.sdcui.resource.i18n['C_LJBZYM']) == true){
					   	 			           g_isSub = 0 ;
					   	 			           $('#btn_print').click();
									 	  }
					   	 			}
							     }else{
							        if(results.result.response=='ljxlh_invalid'){
							              showMsg("${i18n.ljxlh_invalid}");
							        }							        							     
							     }
							         
							         $('#lingjxlh input').val('');
							     
							     
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
						    <td>${i18n.lingjbh}</td>
							<td><div class="ui-field" id="lingjbh"></div></td>
							<td>${i18n.pich}</td>
							<td><div class="ui-field" id="pich"></div></td>
							<td>${i18n.chanx}</td>
							<td><div class="ui-field" id="chanx"></div></td>
						</tr>
						<tr>
							<td>${i18n.rongqxh}</td>
							<td><div class="ui-field" id="usxh"></div></td>
							<td>${i18n.rongqrl}</td>
							<td><div class="ui-field" id="usrl"></div></td>
							<td>${i18n.kuw}</td>
							<td><div class="ui-field" id="kuwbh"></div></td>
						</tr>
						<tr>
						<td>${i18n.xulh}</td>
						<td><div class="ui-field" id="lingjxlh"></div></td>
						<td>${i18n.ush}</td>
						<td><div class="ui-field" id="ush"></div></td>
						<td></td>
						<td></td>
						</tr>
					</tbody>
				</table>
				<div class="ui-field" id="lingjmc"></div>
				<div class="ui-field" id="zickbh"></div>
			</div>
			<div id="grid_user_${pageId}"></div>
		<div id='prompt'>${i18n.prompt}</div>
	  </div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>