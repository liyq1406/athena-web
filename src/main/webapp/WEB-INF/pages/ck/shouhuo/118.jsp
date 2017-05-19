<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","118");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_118}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
				$(function(){
					$('.hidden-item').hide();
					$('#grid_ua_${pageId}').hide();
					$('#grid_user_${pageId}').grid({
						keyFields:['uah','yaohlh'],
						id:'grid_user_${pageId}',
						enableCutPage:true,
						showCheckbox : true,
						src:'<%=request.getContextPath()%>/shouhuo/11801.do',
						cols:[
							{property:'yaohlh',caption:'${i18n.baozdykh}'},
							{property:'guojhm',caption:'${i18n.juszt}',internation:true}
					      ] 
					    ,buttons:[
				   	  	{name:'search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
				   	  	    $("#xuh input").val('');
				   	  		$('#grid_user_${pageId}').grid('clearRecords');
						   	  	if(!$('#form_user_${pageId}').form("validateParam")){
									return;
								}
								 $('#uth input').val('');
								 $('#uah input').val('');
						   	  	var params = $('#form_user_${pageId}').form("getFormParam");
						   	  	 params.push("currentPage=1");
								//设置分页条件
								$('#grid_user_${pageId}').grid("setQueryParams", params);
						   	  	 var url = "<%=request.getContextPath()%>/shouhuo/11801.do";
							 	 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
							 		if (showPromptRequestMsg(results)==true){
							 		     if(results.result.response == '0001'){
								 		     //加载返回数据
									         $('#uth input').val(results.result.parameter.uth);
									         $('#uah input').val(results.result.parameter.uah);
									         $('#grid_user_${pageId}').grid('parseResult',results);
									         if (results.result.parameter.list.length > 0){
													$('#grid_user_${pageId}').grid('focus');
												}
																	         
									         $('.hidden-item').show();
									     }
									  }
							      });
					    		return false;
						    }} 
						    ,{name:'shouh',caption:'${i18n.shouh}[F2]',keyboard:'F2',action:function(){
								if(!$('#form_user_${pageId}').form("validateParam")){
									return;
								}
						   	  	var params = $('#form_user_${pageId}').form("getFormParam");
						   	  	var url = "<%=request.getContextPath()%>/shouhuo/11703.do";
						 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
						 			if (showPromptRequestMsg(results)==true){
					 		             //加载返回数据
									     $('#grid_user_${pageId}').grid('clearRecords');
									     $('#grid_ua_${pageId}').grid('clearRecords');
									     $('.hidden-item').hide();
						                 $('#grid_ua_${pageId}').hide();
								        }
							    });
				    		return false;
					       }}
					 	  ,{name:'jus',caption:'${i18n.jus}[F3]',keyboard:'F3',action:function(){
								if(!$('#form_user_${pageId}').form("validateParam")){
									return;
								}
						   	  	var params = $('#form_user_${pageId}').form("getFormParam");
						   	  	var records=$('#grid_user_${pageId}').grid('getSelectedAll');
						   	  	if(records.length<1){
							   	  	showPromptMsg('red','${i18n.selectoneerror}');
							   	  	return false;
						   	  	}
						   	  	params=params.concat(records);
						   	  	 var url = "<%=request.getContextPath()%>/shouhuo/11704.do";
						 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
						 			if (showPromptRequestMsg(results)==true){
									  //  $('#grid_user_${pageId}').grid('clearRecords');
									  //  $('#grid_ua_${pageId}').grid('clearRecords');
									  $('#grid_user_${pageId}').grid('parseResult',results);
									    $('.hidden-item').hide();
						                $('#grid_ua_${pageId}').hide();
									  }
								 });
					    		return false;
					     }}  
					     ,{name:'checked',caption:'${i18n.checked}[F4]',keyboard:'F4',action:function(){
							 $('#grid_user_${pageId}').grid('selected');
				    		  return false;
					      }}
						 ,{name:'selectall',caption:'${i18n.selectall}[F5]',keyboard:'F5',action:function(){
				   	 		$('#grid_user_${pageId}').grid('selectedAll');
				    		return false;
						 }}
						,{name:'back',caption:'${i18n.back}[F11]'}
					    ,{name:'return',caption:'${i18n.return}[F12]'}
					]});
					//UA_grid
	                $('#grid_ua_${pageId}').grid({
						keyFields:['lingjbh','gongysdm','yanssl','biaoqh','liush','uth','uah','danw','lingjmc','gongysmc','lingjsl'],
						id:'grid_user_${pageId}',
						src:'<%=request.getContextPath()%>/shouhuo/11701.do',
						editSubmitSrc:'<%=request.getContextPath()%>/shouhuo/11702.do',
						cols:[
							{property:'weiz',caption:'${i18n.weizh}',width:50},
							{property:'zhengclsh',caption:'${i18n.zhengclsh}',width:50},
							{property:'uaxh',caption:'${i18n.baozxh}',width:50},
							{property:'lingjbh',caption:'${i18n.xinljbh}',dataType:'letter_numeric',limitedLength:'10',editor:'fieldText',afterenter:'refresh',width:50},
							{property:'lingjmc',caption:'${i18n.xinljmc}',width:50},
							{property:'lingjsl',caption:'${i18n.xinxs}',width:50},
							{property:'suifljh',caption:'${i18n.yuanljbh}',width:50},
						    {property:'shuifsl',caption:'${i18n.yuanxs}',width:50},
							{property:'gongysdm',caption:'${i18n.gongysdm}',editor:'fieldText',dataType:'letter_numeric',limitedLength:'10',afterenter:'refresh',width:50},
							{property:'gongysmc',caption:'${i18n.gongysmc}',width:50},
							{property:'yanssl',caption:'${i18n.yanssl}',editor:'fieldText',dataType:'dbnumber',afterenter:'refresh',width:50},
							{property:'danw',caption:'${i18n.danw}',width:50},
							{property:'flag',caption:'${i18n.xiugzt}',width:40}
					    ]
					 ,buttons:[
					 {name:'fanh',caption:'${i18n.return}[F8]',keyboard:'F8',action:function(){
						 $('#grid_ua_${pageId}').hide();
						 $('#grid_user_${pageId}').show();
						 $('.hidden-item').show();
						 msgClear();
					  }}
					]});
					
				 	$('#form_user_${pageId}').form({
				 	    onreload:true,
						fields:[
							{fieldType:'fieldText',property:'blh',dataType:'text',maxLength:'10',caption:'${i18n.jiaohdh}',notNull:true},
							{fieldType:'fieldHidden',property:'uth'},
							{fieldType:'fieldHidden',property:'wulgzlx',value:'2'},
							{fieldType:'fieldText',biaos:'enter',property:'xuh',dataType:'positive',caption:'${i18n.xuh}'}
						]
					}); 
	
				 	$("#xuh").bind('enter',function(event){
				 		//查找行并选中
				 		var  vxuh=$("#xuh input").val();
				 		var params = $('#grid_user_${pageId}').grid('getSelectedByRowNum',vxuh);
				 		
				 		if(params.length < 1){
							showPromptMsg('red','${i18n.selectederror}');
							return false;
						   }
						for(i=0;i<params.length;i++){
						    params[i]=params[i].toString().replace("list[0].","");
					    }
					    params.push("uth="+$('#uth input').val());
					    params.push("wulgzlx=2");
	 				    params.push("currentPage=1");
						//设置分页条件
						$('#grid_ua_${pageId}').grid("setQueryParams", params);
	 				     var url = "<%=request.getContextPath()%>/shouhuo/11701.do";
					 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
					 			if (showPromptRequestMsg(results)==true){
					 			      if(results.result.response == '0001'){
									         $('#grid_ua_${pageId}').show();
									         $('#grid_user_${pageId}').hide();
									         $('#grid_ua_${pageId}').grid('parseResult',results);
									         if (results.result.parameter.list.length > 0){
													$('#grid_ua_${pageId}').grid('focus');
												}			         
									         $('.hidden-item').hide();
								         }else{
								          $('#grid_user_${pageId}').show();
								         
								         }
							        }
					        });
			    		return false;
				 	});
			$(document).keyboardsupport({});
		});
		
		function refresh(results){
			$('#grid_ua_${pageId}').grid('parseResultRow',results.result.parameter);
		}
		</script>
	</head>
	<body>
		<div style="padding:20px;">
			<div id="title"></div>
			<div id="form_user_${pageId}" class="ui-fieldLayout">
				<table class="ui-grid" cellspacing="1" width="100%">
					<tbody >
						<tr>
							<td align="center">${i18n.jiaohdh}</td>
							<td align="left"><div class="ui-field" id="blh"></div></td>
							<td><div class="ui-field" id="uth"></div></td>
							<td><div class="ui-field" id="wulgzlx"></div></td>
						</tr>
						<tr class='hidden-item' id="xuh_div">
							<td align="right">${i18n.search}</td>
							<td align="left"><div class="ui-field" id="xuh" style="float:left"></div><span>${i18n.hangbz}</span></td>
                            <td></td>
						</tr>
					</tbody>
				</table>
			<div id="grid_user_${pageId}"></div>
			<div id="grid_ua_${pageId}"></div>
			<div id='prompt'>${i18n.prompt}</div>
		</div>
	</div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>