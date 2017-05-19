<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","169");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_169 }</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
			$(function(){
				$('#grid_user_${pageId}').grid({
					id:'grid_user_${pageId}',
					keyFields:['blh','uth','uah','yaohlh'],
					showCheckbox:true,
					src:'<%=request.getContextPath()%>/shouhuo/16901.do',
					cols:[
						{property:'blh',caption:'${i18n.blh}'},
						{property:'uth',caption:'${i18n.uth}'},
						{property:'uah',caption:'${i18n.uah}'},
						{property:'yaohlh',caption:'${i18n.yaohlh}'},
						{property:'elh',caption:'${i18n.elh}'},
						{property:'lingjbh',caption:'${i18n.lingjbh}'},
						{property:'lingjsl',caption:'${i18n.lingjsl}'},
						{property:'leix',caption:'${i18n.leix}'},
						{property:'zhuangt',caption:'${i18n.zhuangt}',internation:true}

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
				   	 	 var url = "<%=request.getContextPath()%>/shouhuo/16901.do";
				 		   $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
				 			if (showPromptRequestMsg(results)==true){
								 //加载grid
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
					,{name:'print',caption:'${i18n.print}[F8]',keyboard:'F8',action:function(){
						var params = $('#form_user_${pageId}').form("getFormParam");
						var records = $('#grid_user_${pageId}').grid('getSelectedAll');
						if(records.length == 0){
							$('#prompt span').css('color','red').text("${i18n.selectoneerror}");
							return false;
						}
						params = params.concat(records);
						var url = "<%=request.getContextPath()%>/shouhuo/16902.do";
						$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
							  if (showPromptRequestMsg(results)==true){
							       //$('#grid_user_${pageId}').grid('parseResult',results);
							      }
						 });
			    		return false;
					}}
					,{name:'back',caption:'${i18n.back}[F11]'}
					,{name:'return',caption:'${i18n.return}[F12]'}
				]});
		
				$('#form_user_${pageId}').form({
					onreload:true,
					onemoredemand:true,
					fields:[
					   
						{fieldType:'fieldText',property:'blh',dataType:'text',maxLength:'10',caption:'${i18n.blh}'},  
						{fieldType:'fieldText',property:'uth',dataType:'uth',caption:'${i18n.uth}'},  
						{fieldType:'fieldText',property:'yaohlh',dataType:'yaohlh',caption:'${i18n.yaohlh}'},
						{fieldType:'fieldText',property:'elh',dataType:'elh',caption:'${i18n.elh}'}	
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
							<td width="20%">${i18n.uth}:</td>
							<td><div class="ui-field" id="uth"></div></td>
						</tr>
						<tr>
							<td width="20%">${i18n.yaohlh}:</td>
							<td><div class="ui-field" id="yaohlh"></div></td>
							<td width="20%">${i18n.elh}:</td>
							<td><div class="ui-field" id="elh"></div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div id="grid_user_${pageId}"></div>
	    	<div id='prompt'>${i18n.prompt}</div>
	    </div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>