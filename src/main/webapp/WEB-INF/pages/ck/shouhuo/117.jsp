<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","117");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_117 }</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
		    var yaohlh =null;
			$(function(){
			  	$('#grid_user_${pageId}').grid({
					keyFields:['lingjbh','gongysdm','yanssl','biaoqh','liush','uth','uah','danw','lingjmc','gongysmc','lingjsl','chengysdm'],
					id:'grid_user_${pageId}',
					src:'<%=request.getContextPath()%>/shouhuo/11701.do',
					editSubmitSrc:'<%=request.getContextPath()%>/shouhuo/11702.do',
					cols:[
						{property:'weiz',caption:'${i18n.weizh}',width:50},
						{property:'zhengclsh',caption:'${i18n.zhengclsh}',width:80},
						{property:'uaxh',caption:'${i18n.baozxh}',width:70},
						{property:'lingjbh',caption:'${i18n.xinljbh}',dataType:'letter_numeric',limitedLength:'10',editor:'fieldText',afterenter:'refresh',width:70},
						{property:'lingjmc',caption:'${i18n.xinljmc}',width:70},
						{property:'lingjsl',caption:'${i18n.xinxs}',width:70},
						{property:'suifljh',caption:'${i18n.yuanljbh}',width:70},
						{property:'shuifsl',caption:'${i18n.yuanxs}',width:70},
						{property:'gongysdm',caption:'${i18n.gongysdm}',editor:'fieldText',dataType:'letter_numeric',limitedLength:'10',afterenter:'refresh',width:70},
						{property:'gongysmc',caption:'${i18n.gongysmc}',width:70},
						{property:'yanssl',caption:'${i18n.yanssl}',editor:'fieldText',dataType:'dbnumber',afterenter:'refresh',width:70},
						{property:'danw',caption:'${i18n.danw}',width:70}
				    ],
				buttons:[
			   	  	{name:'search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
			   	        	$('#grid_user_${pageId}').grid('clearRecords');
					   	  	if(!$('#form_user_${pageId}').form("validateParam")){
					   	  		return;
							  }
					   	  	var params = $('#form_user_${pageId}').form("getFormParam");
					   	  	 params.push("currentPage=1");
							//设置分页条件
							$('#grid_user_${pageId}').grid("setQueryParams", params);
                             var url = "<%=request.getContextPath()%>/shouhuo/11701.do";
			 		         $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
						 			if (showPromptRequestMsg(results)==true){
						 			       if(results.result.response=="0001"){
						 			         $('#uth input').val(results.result.parameter.uth);
									         $('#uah input').val(results.result.parameter.uah);
									         $('#chengysdm input').val(results.result.parameter.chengysdm);
									         $('#grid_user_${pageId}').grid('parseResult',results);
									        if (results.result.parameter.list.length > 0){
													$('#grid_user_${pageId}').grid('focus');
												}
									         yaohlh=$('#yaohlh input').val();
									  }else{
									       $('#form_user_${pageId}').form('clearValue');
									       $('#wulgzlx input').val('1');
									       
									  }
								    }
							 });
					    	return false;
					    }} 
					    ,{name:'shouh',caption:'${i18n.shouh}[F2]',keyboard:'F2',action:function(){
					    //承运商不能为空校验
					    if(!$('#chengysdm').fieldText('validateNotNull')){
					 			return;
					 	  }
						if(!$('#form_user_${pageId}').form("validateParam")){
							return;
						  }
				   	  	var params = $('#form_user_${pageId}').form("getFormParam");
				   	  	if($('#yaohlh input').val() !=yaohlh){
						var url = "<%=request.getContextPath()%>/shouhuo/11701.do";
			 		    $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
						 			if (showPromptRequestMsg(results)==true){
						 			       if(results.result.response=="0001"){
							 			          $('#uth input').val(results.result.parameter.uth);
										          $('#uah input').val(results.result.parameter.uah);
												  var url1 = "<%=request.getContextPath()%>/shouhuo/11703.do";
												  var params1 = $('#form_user_${pageId}').form("getFormParam");
												  g_isSub = 0 ;
							   	  	              $('#form_user_${pageId}').form("submitUrl", params1, url1, function(results){
										            if (showPromptRequestMsg(results)==true){}
										          });
							                 }
							            }
						           });
                     }else{
				   	  	 	var url = "<%=request.getContextPath()%>/shouhuo/11703.do";
				   	  	 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
								  if (showPromptRequestMsg(results)==true){
								       $('#grid_user_${pageId}').grid('parseResult',results);
								     }
						 });
					  }
			    	return false;
				}} 
				   	  
		
				 ,{name:'jus',caption:'${i18n.jus}[F3]',keyboard:'F3',action:function(){
				         //承运商不能为空校验
					    if(!$('#chengysdm').fieldText('validateNotNull')){
					 			return;
					 	  }
						if(!$('#form_user_${pageId}').form("validateParam")){
							return;
						  }
					    var params = $('#form_user_${pageId}').form("getFormParam");
						if($('#yaohlh input').val() !=yaohlh){
						var url = "<%=request.getContextPath()%>/shouhuo/11701.do";
			 		    $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
						 			if (showPromptRequestMsg(results)==true){
						 			       if(results.result.response=="0001"){
							 			          $('#uth input').val(results.result.parameter.uth);
										          $('#uah input').val(results.result.parameter.uah);
												  var url1 = "<%=request.getContextPath()%>/shouhuo/11704.do";
												  var params1 = $('#form_user_${pageId}').form("getFormParam");
												  g_isSub = 0 ;
							   	  	              $('#form_user_${pageId}').form("submitUrl", params1, url1, function(results){
										            if (showPromptRequestMsg(results)==true){}
										          });
							                 }
							            }
						           });
                     }else{
				   	  	 var url = "<%=request.getContextPath()%>/shouhuo/11704.do";
				   	  	 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
							  if (showPromptRequestMsg(results)==true){
							       $('#grid_user_${pageId}').grid('parseResult',results);
							     }
						 });
					  }
			    	return false;
				}} 
				 ,{name:'back',caption:'${i18n.back}[F11]'}
				 ,{name:'return',caption:'${i18n.return}[F12]'}
				
				]});
		
				$('#form_user_${pageId}').form({
				    onreload:true,
					url:'<%=request.getContextPath()%>/shouhuo/11701.do',
					fields:[
                        {fieldType:'fieldText',property:'yaohlh',dataType:'baozdykh',notNull:true,caption:'${i18n.baozdykh}'},						
						{fieldType:'fieldText',property:'tch',dataType:'laiy',maxLength:'11',caption:'${i18n.songhr}'},
						{fieldType:'fieldText',property:'chengysdm',dataType:'text',maxLength:'10',caption:'${i18n.chengysdm}'},
						{fieldType:'fieldHidden',property:'uth'},
						{fieldType:'fieldHidden',property:'uah'},
						{fieldType:'fieldHidden',property:'wulgzlx',value:'1'}
					]
				});
				
				$(document).keyboardsupport({});
			});
			
			function refresh(results){
				$('#grid_user_${pageId}').grid('parseResultRow',results.result.parameter);
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
						    <td>${i18n.baozdykh}</td>
							<td><div class="ui-field" id="yaohlh"></div></td>
							<td>${i18n.songhr}</td>
							<td><div class="ui-field" id="tch"></div></td>
							<td>${i18n.chengysdm}</td>
							<td><div class="ui-field" id="chengysdm"></div></td>
						</tr>
						<tr>
							<td><div class="ui-field" id="uth"></div></td>
							<td><div class="ui-field" id="uah"></div></td>
							<td><div class="ui-field" id="wulgzlx"></div></td>
							<td colspan="3"></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div id="grid_user_${pageId}"></div>
		<div id='prompt'>${i18n.prompt}</div>
	</div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>