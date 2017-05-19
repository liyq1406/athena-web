<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","140");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_140 }</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
			$(function(){
				$('#grid_user_${pageId}').grid({
					keyFields:['elh','gongysdm','lingjbh','pich','baozzt','uth','uah','blh'],
					id:'grid_user_${pageId}',
					showCheckbox:true,
					src:'<%=request.getContextPath()%>/shouhuo/14001.do',
					cols:[
						{property:'usercenter',caption:'${i18n.usercenter}'},
						{property:'blh',caption:'${i18n.blh}'},
						{property:'xiehzt',caption:'${i18n.xiehd}'},
						{property:'tch',caption:'${i18n.tch}'},
						{property:'yujddsj',caption:'${i18n.yujddsj}'},
						{property:'lingjbh',caption:'${i18n.lingjbh}'},
						{property:'gongysdm',caption:'${i18n.gongysdm}'},
						{property:'chengysdm',caption:'${i18n.chengysdm}'},
						{property:'yicm',caption:'${i18n.yicm}'}
				     ],
				buttons:[
			   	 	{name:'search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
			   	     	$('#grid_user_${pageId}').grid('clearRecords');
			   	        if(!$('#blh').fieldText('validate')){ //校验bl号
							  return ;
						   }
				   	 		var params = [];
				   	 		params.push("blh="+$('#blh input').val());
				   	 		params.push("currentPage=1");
							//设置分页条件
							$('#grid_user_${pageId}').grid("setQueryParams", params);
				   	 	    var url = "<%=request.getContextPath()%>/shouhuo/14001.do";
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
					{name:'save',caption:'${i18n.save}[F3]',keyboard:'F3',action:function(){
				 		/* //验证Grid的输入格式
				 		if (!$('#grid_user_${pageId}').grid("validate")){
				 			return false;
				 		}
				 		var params = $('#grid_user_${pageId}').grid('getValueChangedAll');
				 		params.push("blh="+$('#blh input').val()); */
						if(!$('#gongysdm').fieldText('validate')){ //校验供应商编号
							  return ;
						   }
						var params = $('#grid_user_${pageId}').grid('getSelectedAll');
						if(params.length < 1){
					       showPromptMsg('red','${i18n.selectoneerror}')
					       return false;
					       }
						params.push("gongysdm="+$('#gongysdm input').val());
						params.push("blh="+$('#blh input').val());
				 		var url = "<%=request.getContextPath()%>/shouhuo/14002.do";
				 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
				 			 if (showPromptRequestMsg(results)==true){
								//判断是否要改包装
								$('#grid_user_${pageId}').grid('parseResult',results);
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
					}}
					,{name:'back',caption:'${i18n.back}[F11]'}
					,{name:'return',caption:'${i18n.return}[F12]'}
				]});
		
				$('#form_user_${pageId}').form({
					onreload:true,
					fields:[
						{fieldType:'fieldText',property:'blh',dataType:'text',maxLength:'10',caption:'${i18n.blh}'},
						{fieldType:'fieldText',property:'gongysdm',caption:'${i18n.gongysdm}',dataType:'letter_numeric',limitedLength:'10'}
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
							<td width="20%">${i18n.blh}:</td>
							<td><div class="ui-field" id="blh"></div></td>
							<td width="20%">${i18n.gongysdm}:</td>
							<td><div class="ui-field" id="gongysdm"></div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div id="grid_user_${pageId}"></div>
	    	<div id='prompt'>${i18n.prompt}</div>
	    </div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>