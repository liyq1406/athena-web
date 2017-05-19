<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","22301");%>
<t:html i18n="i18n.ck">
<head>
<!-- V4_030 12978-->
<title>${i18n.title_22301}</title>
<jsp:include page="../../common/js.jsp" />
<script type="text/javascript">
		$(function(){
			$('#form_user_${pageId}').form({
				fields:[
					{fieldType:'fieldLabel',property:'pingjh'},
					{fieldType:'fieldLabel',property:'shengqr'},
					{fieldType:'fieldLabel',property:'shengqbm'},
					{fieldType:'fieldLabel',property:'keh'},				
					{fieldType:'fieldLabel',property:'lingjbh'},
					{fieldType:'fieldLabel',property:'lingjmc'},
					{fieldType:'fieldLabel',property:'danw'},
					{fieldType:'fieldLabel',property:'usxh'},
					{fieldType:'fieldLabel',property:'usrl'},
					{fieldType:'fieldText',property:'tuihsl',dataType:'dbnumber',notNull:true}
					]
			 	});
			
			$('#form_cjus_${pageId}').form({
				fields:[
					{fieldType:'fieldText',property:'xuh',dataType:'integer',maxLength:'2',caption:'${i18n.xuh}',notNull:true},
					{fieldType:'fieldText',biaos:'enter',property:'lingjxlh',maxLength:'14',caption:'${i18n.lingjxlh}',notNull:true}
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
			$('#grid_cjus_${pageId}').grid({
				keyFields:['lingjxlh'],
				id:'grid_cjus_${pageId}',
				showCheckbox:true,
				src:'<%=request.getContextPath()%>/kunei/22309.do',
				cols:[
		  		{property:'lingjxlh',caption:'${i18n.lingjxlh}'}
			],
			});
			$('#lingjxlh').bind('enter',function(){
				if(!$('#form_cjus_${pageId}').form("validateParam")){
	 				return;	
		 		}
		 		var params = $('#form_user_${pageId}').form("getFormParam");
				var cjusParams = $('#form_cjus_${pageId}').form('getFormParam');
		 		//判断供应商序号是否在指定范围
		 		var     xuh = $('#xuh input').val();
		 		if('' == xuh)
		 		{
		 			showPromptMsg('red','${i18n.selecterror}')
					return false;
		 		}
		 		var records = $('#grid_user_${pageId}').grid('getSelectedByRowNum',$('#xuh input').val());
		 		if (records.length < 1){
		 			showPromptMsg('red','${i18n.selectorOutofRange}')
					return false;
		 		}
		 		//去掉List[0];
				for(i=0;i<records.length;i++){
					records[i]=records[i].toString().replace("list[0].","");
				}
				
				params = params.concat(cjusParams);
				params=params.concat(records);
				
				var xlh = $('#lingjxlh input').val();			 				 											
			   	var len = xlh.length;
				if(len!=14){						    
						    showPromptMsg('red','${i18n.ljwsbzq}');
							return ;
				}							
				var code =xlh.substring(13);
			   	 			
			   	var param = [];
			   	param.push("lingjbh="+$('#lingjbh span').html() );
			   	param.push("lingjxlh="+xlh.substring(0,13) );		   	 		
			   	param.push("code="+code);	
			   	 		
				
				$.ajax({					    
                             url:"<%=request.getContextPath()%>/shouhuo/11505.do",
							 type:'post', //数据发送方式 
							 dataType:'json', //接受数据格式 
							 data:param.join('&'),
							 success:function(results){							 
									 
							 if (showPromptRequestMsg(results)!=true){
							            showMsg("${i18n.P21801_01}");						     	
							     	    return false;
						     }else{						     	    			   	 		
									var params2 = $('#form_user_${pageId}').form("getFormParam");
									params2.push("lingjxlh="+$('#lingjxlh input').val());									
							 		var url1 = "<%=request.getContextPath()%>/kunei/22302.do";
								 	$('#form_user_${pageId}').form("submitUrl", params2, url1, function(result){
								 			 if (showPromptRequestMsg(result)==true){
									 				$('#grid_cjus_${pageId}').grid('parseResult',result);
								 				}
										}); 						     	    						     	    
						     	    }									 
								 }								
				 });		
								
			});
			$('#btn_getSelected').bind('click',function(){
				  $('#grid_cjus_${pageId}').grid('selected');
                  msgClear();
                  return false;
			});
			$('#btn_selectAll').bind('click',function(){
				  $('#grid_cjus_${pageId}').grid('selectedAll');
                  msgClear();
                  return false;
			});
                        
			$('#btn_delete').bind('click',function(){
				var params = $('#grid_cjus_${pageId}').grid('getSelectedAll');
				if(params.length < 1){
					showPromptMsg('red','${i18n.selectoneerror}');
					return false;
				}
				params.push("lingjbh="+$('#lingjbh span').html() );
				var url = "<%=request.getContextPath()%>/kunei/22306.do";
    		 	$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
    		 			if (showPromptRequestMsg(results)==true){
								$('#grid_cjus_${pageId}').grid('parseResult',results);
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
		 		//去掉List[0];
				for(i=0;i<records.length;i++){
					records[i]=records[i].toString().replace("list[0].","");
				}
		 		var params = $('#form_user_${pageId}').form("getFormParam");
				var cjusParams = $('#form_cjus_${pageId}').form('getFormParam');
				params = params.concat(cjusParams);
				params=params.concat(records);
				//var params4=[];
				//params4.push("pingjh="+$('#pingjh input').val());
				//params4.push("shengqr="+$('#shengqr input').val());
				//params4.push("shengqbm="+$('#shengqbm input').val());
				//params4.push("keh="+$('#keh input').val());
				//params=params.concat(params4);
                var url = "<%=request.getContextPath()%>/kunei/22303.do";
    		 	$('#form_user_${pageId}').form("submitUrl", params, url, function(result1){
    		 			 if (showPromptRequestMsg(result1)==true){
    		 				if (result1.result.response=="0000" && !result1.result.respdesc){
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
				$('#lingjbh span').html(result.result.parameter.lingjbh);
				$('#lingjmc span').html(result.result.parameter.lingjmc);
				$('#danw span').html(result.result.parameter.danw);
				$('#usxh span').html(result.result.parameter.usxh);
				$('#usrl span').html(result.result.parameter.usrl);
				
				$('#pingjh span').html(result.result.parameter.pingjh);
				$('#shengqr span').html(result.result.parameter.shengqr);
				$('#shengqbm span').html(result.result.parameter.shengqbm);
				$('#keh span').html(result.result.parameter.keh);
				
				//pingjh = result.result.parameter.pingjh;
				//shengqr = result.result.parameter.shengqr;
				//shengqbm = result.result.parameter.shengqbm;
				//keh = result.result.parameter.keh;

				
				var params3 = $('#form_user_${pageId}').form("getFormParam");
				params3.push("lingjxlh="+$('#lingjxlh input').val());	
				$('#grid_cjus_${pageId}').grid("setQueryParams", params3);
				//加载grid
				$('#grid_user_${pageId}').grid('parseResult',result.result);
				$('#xuh input').addClass('field-tabed').focus();  
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
							<td>${i18n.pingjh}:</td>
							<td><div class="ui-field" id="pingjh"></div></td>
							<td>${i18n.shenqr}:</td>
							<td><div class="ui-field" id="shengqr"></div></td>
							<td>${i18n.shenqbm}:</td>
							<td><div class="ui-field" id="shengqbm"></div></td>
							<td>${i18n.keh}:</td>
							<td><div class="ui-field" id="keh"></div></td>
					</tr>
					
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
					</tr>
					<tr>
						<td>${i18n.usxh}:</td>
						<td><div class="ui-field" id="usxh"></div>
						</td>
						<td>${i18n.uchl}:</td>
						<td><div class="ui-field" id="usrl"></div>
						</td>
						<td>${i18n.tuiksl}:</td>
						<td><div class="ui-field" id="tuihsl"></div>
						</td>
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
					</tr>
				</tbody>
			</table>
		</div>
		<br />

		<div>
			<table class="ui-grid" cellspacing="1" width="100%">
				<tbody>
					<tr>
						<td><div>
								<span id="btn_submit" class="ui-button">${i18n.qued}[F3]</span>
								<span id="btn_getSelected"  class="ui-button">${i18n.checked}[F4]</span>
								<span id="btn_selectAll"  class="ui-button">${i18n.selectall}[F5]</span>
								<span id="btn_delete" class="ui-button">${i18n.delete}[F6]</span>
								<span id="btn_back" class="ui-button">${i18n.back}[F11]</span>
								<span id="btn_return" class="ui-button">${i18n.return}[F12]</span>
							</div>
						<td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="grid_cjus_${pageId}"></div>
		<br />
		<br>
		<div id='prompt'>${i18n.prompt}</div>
	</div>
</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>