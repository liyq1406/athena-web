<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","168");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_168 }</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
			$(function(){
				$('#grid_user_${pageId}').grid({
					id:'grid_user_${pageId}',
					src:'<%=request.getContextPath()%>/shouhuo/16801.do',
					cols:[
						{property:'blh',caption:'${i18n.blh}'},
						{property:'yaohlh',caption:'${i18n.yaohlh}'},
						{property:'uah',caption:'${i18n.uah}'},
						{property:'lingjbh',caption:'${i18n.lingjbh}'},
						{property:'lingjmc',caption:'${i18n.lingjmc}'},
						{property:'lingjsl',caption:'${i18n.lingjsl}'},
						{property:'elh',caption:'${i18n.elh}'},
						{property:'gongysdm',caption:'${i18n.gongysdm}'},
						{property:'uaxh',caption:'${i18n.uaxh}'},
						{property:'ucxh',caption:'${i18n.ucxh}'},
						{property:'pich',caption:'${i18n.pich}'}

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
				   	 	 var url = "<%=request.getContextPath()%>/shouhuo/16801.do";
				 		   $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
				 			if (showPromptRequestMsg(results)==true){
								 //加载grid
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
					onemoredemand:true,
					fields:[
					    {fieldType:'fieldText',property:'yaohlh',dataType:'yaohlh',caption:'${i18n.yaohlh}'},
						{fieldType:'fieldText',property:'blh',dataType:'text',maxLength:'10',caption:'${i18n.blh}'}	
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
							<td width="20%">${i18n.yaohlh}:</td>
							<td><div class="ui-field" id="yaohlh"></div></td>
							<td width="20%">${i18n.blh}:</td>
							<td><div class="ui-field" id="blh"></div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div id="grid_user_${pageId}"></div>
	    	<div id='prompt'>${i18n.prompt}</div>
	    </div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>