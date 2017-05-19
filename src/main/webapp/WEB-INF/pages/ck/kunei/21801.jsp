<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","21801");%>
<t:html i18n="i18n.ck">
<head>
<title>${i18n.title_21201}</title>
<jsp:include page="../../common/js.jsp" />
<script type="text/javascript">
		$(function(){
			$('#form_user_${pageId}').form({
				fields:[
			    	{fieldType:'fieldHidden',property:'renwbh'},
					{fieldType:'fieldHidden',property:'pandfs'},
					{fieldType:'fieldLabel',property:'lingjbh'},
					{fieldType:'fieldLabel',property:'lingjmc'},
					{fieldType:'fieldLabel',property:'danw'},
					{fieldType:'fieldLabel',property:'usxh'},
					{fieldType:'fieldLabel',property:'ucrl'},
					{fieldType:'fieldLabel',property:'usrl'},
					{fieldType:'fieldLabel',property:'cangkbh'},
					{fieldType:'fieldLabel',property:'lilkcsl'},
					{fieldType:'fieldLabel',property:'lingjsl'},
					{fieldType:'fieldLabel',property:'zickbh'}
					]
			 	});
			
			$('#form_cjus_${pageId}').form({
				fields:[
					{fieldType:'fieldText',property:'xuh',dataType:'integer',maxLength:'2',caption:'${i18n.xuh}',notNull:true},
					{fieldType:'fieldText',property:'lingjxlh',caption:'${i18n.lingjxlh}',dataType:'text',biaos:'enter'},
					{fieldType:'fieldText',property:'ucgs',dataType:'integer',maxLength:'5',caption:'${i18n.ucgs}',notNull:true},
					{fieldType:'fieldLabelInput',property:'baozzt',caption:'${i18n.zhuangt}',notNull:true},
					{fieldType:'fieldLabel',property:'cangkzck'},
					{fieldType:'fieldText',property:'kuwbh',dataType:'letter_numeric',limitedLength:'6',caption:'${i18n.cangkdz}',notNull:false},
					{fieldType:'fieldText',property:'pandr',maxLength:'16',caption:'${i18n.pandr}',notNull:true}
					]
			 	});
			
			$('#grid_user_${pageId}').grid({
				keyFields:['gongysdm','gongysmc'],
				id:'grid_user_${pageId}',
				enableCutPage:false,
				cols:[
				{property:'gongysdm',caption:'${i18n.gongysdm}'},
		  		{property:'gongysmc',caption:'${i18n.gongysmc}'}
			],
			});
			$('#grid_xlh_${pageId}').grid({
				keyFields:['lingjxlh'],
				id:'grid_xlh_${pageId}',
				showCheckbox:true,
				src:'<%=request.getContextPath()%>/kunei/21807.do',
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
			 		if(!$('#form_cjus_${pageId}').form("validateParam")){
		 				return;	
			 		}
			 		//判断供应商序号是否在指定范围
			 		var records = $('#grid_user_${pageId}').grid('getSelectedByRowNum',$('#xuh input').val());
			 		if (records.length < 1){
			 			showPromptMsg('red','${i18n.selecterror}')
						return false;
			 		}
			 		var record = $('#grid_xlh_${pageId}').grid('getRecordAll');
	                if(record.length < 1){
	                    showPromptMsg('red',$.sdcui.resource.i18n['C_F_QRXLHMX']);
	                    return false;
	                }
			 		//去掉List[0];
					for(i=0;i<records.length;i++){
						records[i]=records[i].toString().replace("list[0].","");
					}
			 		//滚动盘点维护-创建US-US入库
			 		var params = $('#form_user_${pageId}').form("getFormParam");
					var cjusParams = $('#form_cjus_${pageId}').form('getFormParam');
					params = params.concat(cjusParams);
					params=params.concat(records);
	                	var url = "<%=request.getContextPath()%>/kunei/21802.do";
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
				$('#renwbh input').val(result.result.parameter.renwbh);
				$('#pandfs input').val(result.result.parameter.pandfs);
				$('#lingjbh span').html(result.result.parameter.lingjbh);
				$('#lingjmc span').html(result.result.parameter.lingjmc);
				$('#lingjmc span').html(result.result.parameter.lingjmc);
				$('#danw span').html(result.result.parameter.danw);
				$('#usxh span').html(result.result.parameter.usxh);
				$('#ucrl span').html(result.result.parameter.ucrl);
				$('#usrl span').html(result.result.parameter.usrl);
				$('#cangkbh span').html(result.result.parameter.cangkbh);
				$('#zickbh span').html(result.result.parameter.zickbh);
				$('#pandr input').val(result.result.parameter.pandr);
				$('#lilkcsl span').html(result.result.parameter.lilkcsl);
				$('#lingjsl span').html(result.result.parameter.lingjsl);
				//包装状态为库存
				$('#cangkzck span').html(result.result.parameter.cangkbh+result.result.parameter.zickbh);
				$('#baozzt input').val("4");
				$('#baozzt span').html($.sdcui.resource.i18n['C_USZT4']);
				//加载grid
				$('#grid_user_${pageId}').grid('parseResult',result.result);
				 var params = [];
	                params.push('renwbh=' + result.result.parameter.renwbh);
	                params.push('lingjbh=' + result.result.parameter.lingjbh);
    				$('#grid_xlh_${pageId}').grid("setQueryParams", params);
				$('#xuh input').addClass('field-tabed').focus();  
				/* if (result.result.parameter.list.length > 0){
					$('#grid_user_${pageId}').grid('focus');
				} */
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
						<td><div class="ui-field" id="lingjbh"></div></td>
						<td>${i18n.lingjmc}:</td>
						<td><div class="ui-field" id="lingjmc"></div></td>
						<td>${i18n.lingjdw}:</td>
						<td><div class="ui-field" id="danw"></div></td>
						<td>${i18n.cangk}:</td>
						<td><div class="ui-field" id="cangkbh"></div></td>
					</tr>
					<tr>
						<td>${i18n.usxh}:</td>
						<td><div class="ui-field" id="usxh"></div></td>
						<td>${i18n.uchl}:</td>
						<td><div class="ui-field" id="ucrl"></div></td>
						<td>${i18n.ushl}:</td>
						<td><div class="ui-field" id="usrl"></div></td>
						<td>${i18n.zick}:</td>
						<td><div class="ui-field" id="zickbh"></div></td>
					</tr>
					<tr>
						<td>${i18n.yussl}:</td>
						<td><div class="ui-field" id="lilkcsl"></div></td>
						<td>${i18n.sjljsl}:</td>
						<td><div class="ui-field" id="lingjsl"></div>
							<div class="ui-field" id="pandfs"></div>
							<div class="ui-field" id="renwbh"></div></td>
					</tr>
				</tbody>
			</table>
		</div>
		<br />
		<div id="grid_user_${pageId}"></div>
		<br />
		<div id="form_cjus_${pageId}" class="ui-fieldLayout">
			<table class="ui-grid" cellspacing="1" width="100%">
				<tbody>
					<tr>
						<td>${i18n.gongys}${i18n.xuh}:</td>
						<td><div class="ui-field" id="xuh"></div></td>
						<td>${i18n.lingjxlh}:</td>
						<td><div class="ui-field" id="lingjxlh"></div></td>
						<td>${i18n.ucgs}:</td>
						<td><div class="ui-field" id="ucgs"></div></td>
						<td>${i18n.zhuangt}:</td>
						<td><div class="ui-field" id="baozzt"></div></td>
					</tr>
					<tr>
						<td>${i18n.zickbh}:</td>
						<td><div class="ui-field" id="cangkzck"></div></td>
						<td>${i18n.kuw}:</td>
						<td><div class="ui-field" id="kuwbh"></div></td>
						<td>${i18n.pandr}:</td>
						<td><div class="ui-field" id="pandr"></div></td>
						<td></td>
						<td></td>
					</tr>
				</tbody>
			</table>
		</div>
		<br />
		<div>
		    <div id="grid_xlh_${pageId}"></div>
		    <br>
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