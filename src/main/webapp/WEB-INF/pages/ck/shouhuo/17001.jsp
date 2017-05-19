<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","17001");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_170}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
			$(function(){
				$('#form_user_${pageId}').form({
			 		fields:[
			 		   	{fieldType:'fieldLabel',property:'ush'},
			 			{fieldType:'fieldLabel',property:'lingjbh'},
			 			{fieldType:'fieldLabel',property:'usxh'},
			 			{fieldType:'fieldLabel',property:'lingjsl'}
			 		]
			 	});
			 //grid
               $('#grid_user_${pageId}').grid({
					id:'grid_user_${pageId}',
					src:'<%=request.getContextPath()%>/shouhuo/17003.do',
					cols:[
						{property:'lingjxlh',caption:'${i18n.lingjxlh}'}
					]
				,buttons:[
	                     {name:'back',caption:'${i18n.back}[F11]'}
                        ,{name:'return',caption:'${i18n.return}[F12]'}
				          ]});  
			
		
		//页面加载后，查询数据为界面赋值
		$(document).ready(function(){
				var params=[];
	    		params.push("ush=${result.result.parameter.ush}");
	    		params.push("lingjbh=${result.result.parameter.lingjbh}");
				$('#grid_user_${pageId}').grid('parseResult',${result})
				$('#ush span').html('${result.result.parameter.ush}');
				$('#usxh span').html('${result.result.parameter.usxh}');
				$('#lingjbh span').html('${result.result.parameter.lingjbh}');
				$('#lingjsl span').html('${result.result.parameter.lingjsl}');
				//设置分页条件
				$('#grid_user_${pageId}').grid("setQueryParams", params);
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
							<td>${i18n.biaoqh}:</td>
							<td><div class="ui-field" id="ush"></div></td>
							<td>${i18n.lingjbh}:</td>
							<td><div class="ui-field" id="lingjbh"></div></td>
						</tr>
						<tr>
							<td>${i18n.usxh}:</td>
							<td><div class="ui-field" id="usxh"></div></td>
							<td>${i18n.lingjsl}:</td>
							<td><div class="ui-field" id="lingjsl"></div></td>
						</tr>
					</tbody>
				</table> 
			</div>
			<div id="grid_user_${pageId}" ></div>
			<div id='prompt'>${i18n.prompt}</div>
		</div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>