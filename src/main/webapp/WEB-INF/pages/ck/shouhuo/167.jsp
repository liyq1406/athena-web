<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","167");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_167 }</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
			$(function(){
				$('#grid_user_${pageId}').grid({
					keyFields:['liush'],
					id:'grid_user_${pageId}',
					showCheckbox:true,
					src:'<%=request.getContextPath()%>/shouhuo/16701.do',
					cols:[
						{property:'blh',caption:'${i18n.jiaofd}'},
						{property:'chengysdm',caption:'${i18n.chengysdm}'},
						{property:'yundh',caption:'${i18n.xiehzt}'},
						{property:'songhr',caption:'${i18n.jiaofsj}'},
						{property:'fanxydh',caption:'${i18n.tch}'},
						{property:'baozzt',caption:'${i18n.shiftb}'},
						{property:'beiz',caption:'${i18n.guzlx}'}

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
				   	 	 var url = "<%=request.getContextPath()%>/shouhuo/16701.do";
				 		   $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
				 			if (showPromptRequestMsg(results)==true){
								 //加载grid
								 $('#grid_user_${pageId}').grid('parseResult',results);
								  if (results.result.parameter.list.length > 0){
												$('#grid_user_${pageId}').grid('focus');
									 }
							    }
						  });
			    		return false;
					}},
				 	{name:'checked',caption:'${i18n.checked}[F4]',keyboard:'F4',action:function(){
						$('#grid_user_${pageId}').grid('selected');
			    		return false;
					}},
					{name:'selectall',caption:'${i18n.selectall}[F5]',keyboard:'F5',action:function(){
			   	 		$('#grid_user_${pageId}').grid('selectedAll');
			    		return false;
					}},
					{name:'delete',caption:'${i18n.delete}[F6]',keyboard:'F6',action:function(){
						var params = $('#grid_user_${pageId}').grid('getSelectedAll');
						if(params.length < 1){
					       showPromptMsg('red','${i18n.selectoneerror}')
					       return false;
					       }
						var  param = $('#form_user_${pageId}').form("getFormParam");
						params = params.concat(param);
				 		var url = "<%=request.getContextPath()%>/shouhuo/16702.do";
				 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
				 			 if (showPromptRequestMsg(results)==true){
								//判断是否要改包装
								$('#grid_user_${pageId}').grid('parseResult',results);
								}
							});

					    		return false;
					}}
					,{name:'back',caption:'${i18n.back}[F11]'}
					,{name:'return',caption:'${i18n.return}[F12]'}
				]});
		
				$('#form_user_${pageId}').form({
					onreload:true,
					fields:[
						{fieldType:'fieldText',property:'blh',dataType:'text',maxLength:'10',caption:'${i18n.jiaofd}'},
						 {fieldType:'fieldSelect',property:'flag',caption:'${i18n.gzlx}',internation:true,includeNull:true,src:'<%=request.getContextPath()%>/common/gzlx167.do'},       
						{fieldType:'fieldText',property:'qissj',dataType:'datetime',caption:'${i18n.jfqssj}',maskOptions:{mask:'9999-99-99 99:99:99'}},
						{fieldType:'fieldText',property:'zhongzsj',dataType:'datetime',caption:'${i18n.jfzzsj}',maskOptions:{mask:'9999-99-99 99:99:99'}}
					]
				});
				
				$(document).keyboardsupport({});

			});
			 /**
			  *进入167页面后进行查询
			  */
			 $(document).ready(function(){
		    var params =[] 	
		    params.push("currentPage=1");	
	        var url = "<%=request.getContextPath()%>/shouhuo/16701.do";
		    $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			  if (showPromptRequestMsg(results)==true){
			        $('#grid_user_${pageId}').grid('parseResult',results);
					  if (results.result.parameter.list.length > 0){
							$('#grid_user_${pageId}').grid('focus');
						 }
					$('#grid_user_${pageId}').grid("setQueryParams", params); 
			         }
		        msgClear();
	       });
	  		return false;
		 
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
							<td width="20%">${i18n.jiaofd}:</td>
							<td><div class="ui-field" id="blh"></div></td>
							<td width="20%">${i18n.guzlx}:</td>
							<td><div class="ui-field" id="flag"></div></td>
						</tr>
							<tr>
							<td width="20%">${i18n.jfqssj}:</td>
							<td><div class="ui-field" id="qissj"></div></td>
							<td width="20%">${i18n.jfzzsj}:</td>
							<td><div class="ui-field" id="zhongzsj"></div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div id="grid_user_${pageId}"></div>
	    	<div id='prompt'>${i18n.prompt}</div>
	    </div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>