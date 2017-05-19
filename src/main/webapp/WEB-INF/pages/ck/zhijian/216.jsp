<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","216");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_216}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
		var sUsh;
		$(function(){
			$('#form_user_${pageId}').form({
				//onemoredemand:true,
				onreload:true,
		 		fields:[
				{fieldType:'fieldLabel',property:'cangkbh',caption:'${i18n.cangkbh}',value:st_Cangkbh}, 	
				{fieldType:'fieldText',property:'ush',dataType:'ush',caption:'${i18n.biaoqh}'},
				{fieldType:'fieldText',property:'lingjbh',caption:'${i18n.lingjbh}',dataType:'letter_numeric',limitedLength:'10'},
				{fieldType:'fieldText',property:'kehbh',caption:'${i18n.keh}',dataType:'letter_numeric',limitedLength:'5',limitedLength2:'9'},
		 		]
		 	});

			$('#grid_user_${pageId}').grid({
				keyFields:['liush','ush'],
				id:'grid_user_${pageId}',
				showCheckbox:false,
				src:'<%=request.getContextPath()%>/zhijian/21504.do',
				cols:[
				{property:'ush',caption:'${i18n.biaoqh}'},
		  		{property:'lingjbh',caption:'${i18n.lingjbh}'},
		  		{property:'lingjmc',caption:'${i18n.lingjmc}'},
		  		{property:'cangkbh',caption:'${i18n.cangkbh}'},
		  		{property:'kehbh',caption:'${i18n.keh}'},
		  		{property:'lingjsl',caption:'${i18n.shul}'},
		  		{property:'zhuangtxx',caption:'${i18n.zhuangt}',internation:true},
		  		{property:'caozsj',caption:'${i18n.caozsj}'},
		  		{property:'caozy',caption:'${i18n.caozr}'}
			],
		 	buttons:[
		 	//查询
			{name:'search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
				//参数校验
		 		if(!$('#form_user_${pageId}').form("validateParam")){
		 			$('#grid_user_${pageId}').grid('clearRecords');
	 				return;	
		 		}
				//查询并显示数据
		 		var params = $('#form_user_${pageId}').form("getFormParam");
		 		params.push("currentPage=1");
				//设置分页条件
				$('#grid_user_${pageId}').grid("setQueryParams", params);
				//加载数据
				$('#grid_user_${pageId}').grid("load",params);
	    		return false;
			}}
			//重新加载
			,{name:'back',caption:'${i18n.back}[F11]'}
			//返回
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
							<td>${i18n.cangkbh}:</td>
							<td><div class="ui-field" id="cangkbh"></div></td>
							<td>${i18n.biaoqh}:</td>
							<td><div class="ui-field" id="ush"></div></td>
							<td>${i18n.lingjbh}:</td>
							<td><div class="ui-field" id="lingjbh"></div></td>
							<td>${i18n.keh}(${i18n.xianb}):</td>
							<td><div class="ui-field" id="kehbh"></div></td>
						</tr>
					</tbody>
				</table> 
			</div>
			<br/>
			<div id="grid_user_${pageId}"></div>
			<br/>
          <div id='prompt'>${i18n.prompt}</div>
		</div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>