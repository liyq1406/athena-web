<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","144");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_144 }</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
			$(function(){
				$('#grid_user_${pageId}').grid({
					keyFields:['zhijjjbgd'],
					id:'grid_user_${pageId}',
					src:'<%=request.getContextPath()%>/shouhuo/14401.do',
					cols:[
						{property:'zhijqdh',caption:'${i18n.zhijgzdh}'},
						{property:'lingjbh',caption:'${i18n.lingjbh}'},
						{property:'gongysdm',caption:'${i18n.gongysdm}'},
						{property:'chengysdm',caption:'${i18n.wulsbh}'},
						{property:'zhuangtxx',caption:'${i18n.zhijgzdzt}',internation:true},
						{property:'elh',caption:'${i18n.elh}'},
						{property:'cangkbh',caption:'${i18n.cangkbh}'},
						{property:'zhijz',caption:'${i18n.zhijz}'},
						{property:'create_time',caption:'${i18n.zhijsj}'}
					   ],
				buttons:[
				   	 	{name:'search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
				   	 	      $('#grid_user_${pageId}').grid('clearRecords');
						   	 	if(!$('#form_user_${pageId}').form("validateParam")){
									return;
								}
					   	 		var params = $('#form_user_${pageId}').form("getFormParam");
						        params.push("currentPage=1");
						        $('#grid_user_${pageId}').grid("setQueryParams", params);
								$('#grid_user_${pageId}').grid("load",params);
					    		return false;
						}}
						,{name:'back',caption:'${i18n.back}[F11]'}
						,{name:'return',caption:'${i18n.return}[F12]'}
					]
				});
		
				$('#form_user_${pageId}').form({
				    onreload:true,
					onemoredemand:true,
					fields:[
							{fieldType:'fieldText',property:'lingjbh',dataType:'letter_numeric',limitedLength:'10',caption:'${i18n.lingjbh}'},
							{fieldType:'fieldText',property:'elh',dataType:'elh',caption:'${i18n.elh}'},
							{fieldType:'fieldText',property:'gongysdm',dataType:'letter_numeric',limitedLength:'10',caption:'${i18n.gongysdm}'},
							{fieldType:'fieldText',property:'chengysdm',dataType:'letter_numeric',limitedLength:'10',caption:'${i18n.wulsbh}'},
							{fieldType:'fieldSelect',property:'cangkbh',caption:'${i18n.cangkbh}',includeNull:true,src:'<%=request.getContextPath()%>/common/wareHouse.do'},
							{fieldType:'fieldText',property:'zhijz',dataType:'text',maxLength:'4',caption:'${i18n.zhijz}'},
							{fieldType:'fieldText',property:'zhijqdh',dataType:'zhijgzdh',caption:'${i18n.zhijgzdh}'},
							{fieldType:'fieldSelect',property:'zhuangt',internation:true,includeNull:true,src:'<%=request.getContextPath()%>/common/zjgzdzt.do',caption:'${i18n.zhuangt}'}
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
							<td>${i18n.lingjbh}</td>
							<td><div class="ui-field" id="lingjbh"></div></td>
							<td>${i18n.elh}</td>
							<td><div class="ui-field" id="elh"></div></td>
						</tr>
						<tr>
							<td>${i18n.gongysdm}</td>
							<td><div class="ui-field" id="gongysdm"></div></td>
							<td>${i18n.wulsbh}</td>
							<td><div class="ui-field" id="chengysdm"></div></td>
						</tr>
						<tr>
							<td>${i18n.cangkbh}</td>
							<td><div class="ui-field" id="cangkbh"></div></td>
							<td>${i18n.zhijz}</td>
							<td><div class="ui-field" id="zhijz"></div></td>
						</tr>
						<tr>
							<td>${i18n.zhijgzdh}</td>
							<td><div class="ui-field" id="zhijqdh"></div></td>
							<td>${i18n.zhuangt}</td>
							<td><div class="ui-field" id="zhuangt"></div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div id="grid_user_${pageId}"></div>
		<div id='prompt'>${i18n.prompt}</div>
	  </div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>