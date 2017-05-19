<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","141");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_141 }</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
			$(function(){
				$('#form_user_${pageId}').form({
				    onemoredemand:true,
					fields:[
						{fieldType:'fieldText',property:'blh',dataType:'text',maxLength:'10',caption:'${i18n.blh}'},
						{fieldType:'fieldText',property:'tch',dataType:'laiy',maxLength:'11',caption:'${i18n.tch}'},
						{fieldType:'fieldText',property:'caozy',dataType:'laiy',maxLength:'11',caption:'${i18n.username}'}
						
					]
				});
				
				  // grid
               $('#grid_user_${pageId}').grid({
                    keyFields:['blh','tch','uth'],
					id:'grid_user_${pageId}',
					showCheckbox:true,
					src:'<%=request.getContextPath()%>/shouhuo/14102.do',
					cols:[
						{property:'blh',caption:'${i18n.blh}'},
						{property:'tch',caption:'${i18n.tch}'},
						{property:'uth',caption:'${i18n.uth}'}
				   ]
				   ,buttons:[
				   //查询 F1
				    {name:'search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
					     $('#grid_user_${pageId}').grid('clearRecords');
		                    //参数校验
				 		 if(!$('#form_user_${pageId}').form("validateParam")){
					            return;
		 		           }
					  	 var params = $('#form_user_${pageId}').form("getFormParam");	
						 params.push("currentPage=1");
						 //设置分页条件
						  $('#grid_user_${pageId}').grid("setQueryParams", params);
						   var url = "<%=request.getContextPath()%>/shouhuo/14102.do";
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
                        var params2=$('#form_user_${pageId}').form("getFormParam");
					    params=params.concat(params2);
						var url = "<%=request.getContextPath()%>/shouhuo/14101.do";
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
							<td>${i18n.blh }:</td>
							<td><div class="ui-field" id="blh"></div></td>
							<td>${i18n.tch }:</td>
							<td><div class="ui-field" id="tch"></div></td>
							<td>${i18n.username}:</td>
							<td><div class="ui-field" id="caozy"></div></td>
						</tr>
					</tbody>
				</table>
			</div>
		<div id="grid_user_${pageId}"></div>
		<div id='prompt'>${i18n.prompt}</div>
	</div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>