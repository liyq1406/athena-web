<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","149");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_149 }</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
			$(function(){
				$('#grid_user_${pageId}').grid({
					keyFields:['gaibzgzdh','shiftb','chulbs','classh','dingdh'],
					id:'grid_user_${pageId}',
					showCheckbox:true,
					src:'<%=request.getContextPath()%>/shouhuo/14901.do',
					cols:[
						{property:'dingdh',caption:'${i18n.dingdh}'},
						{property:'classh',caption:'${i18n.classh}'},
						{property:'create_time',caption:'${i18n.create_time}'},
						{property:'sftbxx',caption:'${i18n.shifjp}',internation:true},
						{property:'clbsxx',caption:'${i18n.chulbs}',internation:true}
				    ],
				buttons:[
			   	 	{name:'search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
			   	 	        $('#grid_user_${pageId}').grid('clearRecords');
				   	 		var params = $('#form_user_${pageId}').form("getFormParam");
				   	 		params.push("currentPage=1");
							//设置分页条件
							$('#grid_user_${pageId}').grid("setQueryParams", params);
				   	 		 var  url = "<%=request.getContextPath()%>/shouhuo/14901.do";
						     $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
								 if (showPromptRequestMsg(results)==true){
										//加载返回数据
										$('#grid_user_${pageId}').grid('parseResult',results);
										 if (results.result.parameter.list.length > 0){
												$('#grid_user_${pageId}').grid('focus');
											}
								    }
						     });
				    		return false;  	 
					}}
	
					,{name:'add',caption:'${i18n.add}[F2]',keyboard:'F2',action:function(){
					        //$('#grid_user_${pageId}').grid('clearRecords');
							if(!$('#form_user_${pageId}').form("validateParam")){
								return;
							  }
							var params = $('#form_user_${pageId}').form("getFormParam");
						     var  url = "<%=request.getContextPath()%>/shouhuo/14902.do";
						     $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
								 if (showPromptRequestMsg(results)==true){
										//加载返回数据
										$('#grid_user_${pageId}').grid('parseResult',results);
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
					,{name:'delete',caption:'${i18n.delete}[F6]',keyboard:'F6',action:function(){
						var params = $('#grid_user_${pageId}').grid('getSelectedAll');
						if(params.length < 1){
					       showPromptMsg('red','${i18n.selectoneerror}')
					       return false;
					       }
						var url = "<%=request.getContextPath()%>/shouhuo/14903.do";
						$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
				 		    if (showPromptRequestMsg(results)==true){
									//加载返回数据
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
					url:'<%=request.getContextPath()%>/shouhuo/14902.do',
					fields:[
						{fieldType:'fieldText',property:'dingdh',notNull:true,caption:'${i18n.dingdh}',dataType:'text',maxLength:'8'},
						{fieldType:'fieldText',property:'classh',caption:'${i18n.classh}',dataType:'letter_numeric',limitedLength:'4'},
						{fieldType:'fieldSelect',property:'shiftb',caption:'${i18n.shifjp}',notNull:true,includeNull:true,src:'<%=request.getContextPath()%>/common/yesOrNo.do'}
					]
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
							<td>${i18n.dingdh}</td>
							<td><div class="ui-field" id="dingdh"></div></td>
							<td>${i18n.classh}</td>
							<td><div class="ui-field" id="classh"></div></td>
							<td>${i18n.shifjp}</td>
							<td><div class="ui-field" id="shiftb"></div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div id="grid_user_${pageId}"></div>
		<div id='prompt'>${i18n.prompt}</div>
	  </div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>