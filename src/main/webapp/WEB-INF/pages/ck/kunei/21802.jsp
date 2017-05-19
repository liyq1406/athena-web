<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","21802");%>
<t:html i18n="i18n.ck">
<head>
<title>${i18n.title_21202}</title>
<jsp:include page="../../common/js.jsp" />
<script type="text/javascript">
		$(function(){
			$('#form_user_${pageId}').form({
				fields:[
						{fieldType:'fieldHidden',property:'cangkbh'},
						{fieldType:'fieldHidden',property:'renwbh'},
						{fieldType:'fieldHidden',property:'pandfs'},
						{fieldType:'fieldLabel',property:'lingjbh'},
						{fieldType:'fieldLabel',property:'lingjmc'},
						{fieldType:'fieldLabel',property:'danw'},
						{fieldType:'fieldLabel',property:'ush'},
						{fieldType:'fieldLabel',property:'usxh'},
						{fieldType:'fieldLabel',property:'ucrl'},
						{fieldType:'fieldLabel',property:'gongysdm'},
						{fieldType:'fieldLabel',property:'kuwbh'},
						{fieldType:'fieldLabelInput',property:'baozzt'},
						{fieldType:'fieldLabel',property:'lilkcsl'},
						{fieldType:'fieldLabel',property:'lingjsl',caption:'${i18n.shijussl}'},
						{fieldType:'fieldLabel',property:'yuanucgs'},
						{fieldType:'fieldText',property:'lingjxlh',caption:'${i18n.lingjxlh}',dataType:'text',biaos:'enter'},
						{fieldType:'fieldText',property:'ucgs',dataType:'integer',maxLength:'5',caption:'${i18n.shijucgs}',notNull:true},
						{fieldType:'fieldText',property:'pandr',maxLength:'16',caption:'${i18n.pandr}',notNull:true}
					]
			 	});
			 $('#grid_xlh_${pageId}').grid({
				keyFields:['lingjxlh'],
				id:'grid_xlh_${pageId}',
				showCheckbox:true,
				src:'<%=request.getContextPath()%>/kunei/21807.do',
				enableCutPage:true,
				cols:[
		  		{property:'lingjxlh',caption:'${i18n.lingjxlh}'}
			],
			buttons:[
				   	{name:'checked',caption:'${i18n.checked}[F4]',keyboard:'F4',action:function(){
						$('#grid_xlh_${pageId}').grid('selected');
			    		return false;
					}}
					,{name:'selectall',caption:'${i18n.selectall}[F5]',keyboard:'F5',action:function(){
			   	 		$('#grid_xlh_${pageId}').grid('selectedAll');
			    		return false;
					}}
					,{name:'delete',caption:'${i18n.delete}[F6]',keyboard:'F6',action:function(){
						var params = $('#grid_xlh_${pageId}').grid('getSelectedAll');
						if(params.length < 1){
					       showPromptMsg('red','${i18n.selectoneerror}')
					       return false;
					       }
						params.push("renwbh="+$('#renwbh input').val());
						params.push("lingjbh="+$('#lingjbh span').html());
						params.push("ush="+$('#ush span').html());
						var url = "<%=request.getContextPath()%>/kunei/21806.do";
						$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
				 		    if (showPromptRequestMsg(results)==true){
				 		    	 if(results.result.response == '0000'){
									//加载返回数据
									$('#grid_xlh_${pageId}').grid('parseResult',results);
					                    $('#lingjsl span').html(results.result.parameter.lingjsl);
					                    showMsg("${i18n.deletesucc}");
								}
				 		    }	 
				          });
		    		 return false;
			 	   }}
				]});
			//零件序列号回车事件
		 	$('#lingjxlh').bind('enter',function(){
		 	  //验证
		 		if(!$('#lingjxlh').fieldText('validateNotNull')){
		 			return;
		 		}
		 		
		 		   	 	//modified by xss for 0010670		 		
			 			var xlh = $('#lingjxlh input').val();			 				 											
			   	 		var len = xlh.length;
						if(len!=14){						    
						    showPromptMsg('red','${i18n.ljwsbzq}');
							return ;
						}							
						var code =xlh.substring(13);
			   	 			
			   	 		var params = [];
			   	 		params.push("lingjbh="+$('#lingjbh span').html() );
			   	 		params.push("lingjxlh="+xlh.substring(0,13) );		   	 		
			   	 		params.push("code="+code);	 		   
	   
					 		$.ajax({					    
                                    url:"<%=request.getContextPath()%>/shouhuo/11505.do",
								    type:'post', //数据发送方式 
								    dataType:'json', //接受数据格式 
								    data:params.join('&'),
									success:function(results){
									//alert( result.result.parameter.list[0].value);
									//var msg = result.result.parameter.list[0].value;								 
									 
									if (showPromptRequestMsg(results)!=true){
							            showMsg("${i18n.P21801_01}");						     	
							     	    return false;
						     	    }else{						     	    			   	 		
										var params2 = $('#form_user_${pageId}').form("getFormParam");
										params2.push("lingjxlh="+$('#lingjxlh input').val());									
							 			var url1 = "<%=request.getContextPath()%>/kunei/21805.do";
								 		$('#form_user_${pageId}').form("submitUrl", params2, url1, function(results1){
								 			 if (showPromptRequestMsg(results1)==true){
									 				$('#grid_xlh_${pageId}').grid('parseResult',results1);
									 				$('#lingjsl span').html(results1.result.parameter.lingjsl);
								 				}
										}); 						     	    						     	    
						     	    }									 
								 }								
								});			
		 	});	
			//提交
		 	$('#btn_submit').bind('click',function(){
		 		//参数校验
		 		if(!$('#form_user_${pageId}').form("validateParam")){
	 				return;	
		 		}
		 		var params = $('#form_user_${pageId}').form("getFormParam");
                var url = "<%=request.getContextPath()%>/kunei/21804.do";
    		 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
    		 			 if (showPromptRequestMsg(results)==true){
    		 			 	if (results.result.response=="0000" && !results.result.respdesc){
	    		 			 	//操作成功--返回
	 			 				history.back();
    		 			 	}
						 }
    				});
		 	}); 

			$(document).keyboardsupport({});
		});

		//页面加载后，查询数据为界面赋值
		$(document).ready(function(){
			//加载返回数据
			if ('${result}' != ''){
				var result = JSON.parse('${result}');
				$('#cangkbh input').val(result.result.parameter.cangkbh);
				$('#renwbh input').val(result.result.parameter.renwbh);
				$('#pandfs input').val(result.result.parameter.pandfs);
				$('#lingjbh span').html(result.result.parameter.lingjbh);
				$('#lingjmc span').html(result.result.parameter.lingjmc);
				$('#danw span').html(result.result.parameter.danw);
				$('#ush span').html(result.result.parameter.ush);
				$('#usxh span').html(result.result.parameter.usxh);
				$('#ucrl span').html(result.result.parameter.ucrl);
				$('#gongysdm span').html(result.result.parameter.gongysdm);
				$('#kuwbh span').html(result.result.parameter.kuwbh);
				$('#baozzt span').html($.sdcui.resource.i18n[result.result.parameter.baozztxx]);
				$('#baozzt input').val(result.result.parameter.baozzt);
				$('#lilkcsl span').html(result.result.parameter.lingjsl);
				$('#yuanucgs span').html(result.result.parameter.ucgs);
				$('#pandr input').val(result.result.parameter.pandr)
				$('#lilkcsl span').html(result.result.parameter.lilkcsl);
				$('#lingjsl span').html(result.result.parameter.lingjsl);
				$('#grid_xlh_${pageId}').grid('parseResult',result.result);
				 var params = [];
	                params.push('renwbh=' + result.result.parameter.renwbh);
	                params.push('lingjbh=' + result.result.parameter.lingjbh);
	                 params.push('ush=' + result.result.parameter.ush);
    				$('#grid_xlh_${pageId}').grid("setQueryParams", params);
				$('#xuh input').addClass('field-tabed').focus();  
				//显示错误消息
				showPromptRequestMsg(result.result);
			}
		});
		</script>
</head>
<body>
	<div style="padding: 20px;">
		<div id="title"></div>
		<div id="form_user_${pageId}" class="ui-fieldLayout">
			<table class="ui-grid" cellspacing="1" width="100%">
				<tbody>
					<tr>
						<td>${i18n.lingjbh}:</td>
						<td><div class="ui-field" id="lingjbh"></div>
						</td>
						<td>${i18n.lingjmc}:</td>
						<td><div class="ui-field" id="lingjmc"></div>
						</td>
						<td>${i18n.lingjdw}:</td>
						<td><div class="ui-field" id="danw"></div>
						</td>
					<tr>
						<td>${i18n.ush}:</td>
						<td><div class="ui-field" id="ush"></div>
						</td>
						<td>${i18n.usxh}:</td>
						<td><div class="ui-field" id="usxh"></div>
						</td>
						<td>${i18n.uchl}:</td>
						<td><div class="ui-field" id="ucrl"></div>
						</td>
					</tr>
					<tr>
					   
						<td>${i18n.gongysdm}:</td>
						<td><div class="ui-field" id="gongysdm"></div>
						</td>
						<td>${i18n.cangkdz}:</td>
						<td><div class="ui-field" id="kuwbh"></div>
						</td>
						<td>${i18n.zhuangt}:</td>
						<td><div class="ui-field" id="baozzt"></div>
							<div class="ui-field" id="cangkbh"></div>
							<div class="ui-field" id="pandfs"></div>
							<div class="ui-field" id="renwbh"></div>
						</td>
					</tr>
				</tbody>
			</table>
			<br>
			<table class="ui-grid" cellspacing="1" width="100%">
				<tbody>
					<tr>
						<td>${i18n.yuanussl}:</td>
						<td><div class="ui-field" id="lilkcsl"></div>
						</td>
						<td>${i18n.shijussl}:</td>
						<td><div class="ui-field" id="lingjsl"></div>
						</td>
					</tr>
					<tr>
						<td>${i18n.yuanucgs}:</td>
						<td><div class="ui-field" id="yuanucgs"></div>
						</td>
						<td>${i18n.shijucgs}:</td>
						<td><div class="ui-field" id="ucgs"></div>
						</td>
					</tr>
					<tr>
						<td>${i18n.lingjxlh}:</td>
						<td><div class="ui-field" id="lingjxlh"></div>
						<td>${i18n.pandr}:</td>
						<td><div class="ui-field" id="pandr"></div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<br>
		<div>
		    <div id="grid_xlh_${pageId}"></div>
			<table class="ui-grid" cellspacing="1" width="100%">
				<tbody>
					<tr>
						<td><div>
								<span id="btn_submit" class="ui-button">${i18n.qued}[F3]</span>
								<span id="btn_back" class="ui-button">${i18n.back}[F11]</span>
								<span id="btn_return" class="ui-button">${i18n.return}[F12]</span>
							</div>
						<td>
					</tr>
				</tbody>
			</table>
		</div>
		<br>
		<div id='prompt'>${i18n.prompt}</div>
	</div>
</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>