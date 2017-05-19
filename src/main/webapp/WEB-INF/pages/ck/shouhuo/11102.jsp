<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","11102");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_111 }</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
			$(function(){
				$('#grid_user_${pageId}').grid({
					keyFields:['jusgzdh'],
					id:'grid_user_${pageId}',
					showCheckbox:true,
					src:'<%=request.getContextPath()%>/shouhuo/11102.do',
					submitURL:'<%=request.getContextPath()%>/shouhuo/11103.do',
					cols:[
						{property:'jusgzdh',caption:'${i18n.jusgzdh}'},
				  		{property:'lingjbh',caption:'${i18n.lingjbh}'},
						{property:'lingjmc',caption:'${i18n.lingjmc}'},
					 	{property:'jusljs',caption:'${i18n.lingjsl}'},
						{property:'chengysdm',caption:'${i18n.chengysdm}'},
						{property:'chengysmc',caption:'${i18n.chengysmc}'},
						{property:'gongysdm',caption:'${i18n.gongysdm}'},
						{property:'xiehd',caption:'${i18n.shouhzt}'},
						{property:'caozy',caption:'${i18n.caozy}'},
						{property:'create_time',caption:'${i18n.gengzdscrq}'}
				    ],
				buttons:[
			   	 	{name:'checked',caption:'${i18n.checked}[F4]',keyboard:'F4',action:function(){
			   	 			$('#grid_user_${pageId}').grid('selected');
					}}
				   	 ,{name:'selectall',caption:'${i18n.selectall}[F5]',keyboard:'F5',action:function(){
				   	 		$('#grid_user_${pageId}').grid('selectedAll');
					}}
					,{name:'ok',caption:'${i18n.ok}[F3]',keyboard:'F3',action:function(){
						var records = $('#grid_user_${pageId}').grid('getSelectedAll');
						if( records.length < 1){
							showPromptMsg('red','${i18n.selectoneerror}');
						    return false;
						  }
						var params = $('#form_user_${pageId}').form("getFormParam");
						params=params.concat(records);
						var url = "<%=request.getContextPath()%>/shouhuo/11103.do";
						 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
								 if (showPromptRequestMsg(results)==true){
								     $("#grid_user_${pageId}").grid('parseResult',results)
								    }
						 });
						 return false;
					}}
					,{name:'back',caption:'${i18n.back}[F11]'}
					,{name:'return',caption:'${i18n.return}[F12]'}
				]});
				
				$('#form_user_${pageId}').form({
		 		fields:[
		 		   	{fieldType:'fieldLabel',property:'chengysdm'},
		 			{fieldType:'fieldLabel',property:'chengysmc'},
		 			{fieldType:'fieldHidden',property:'jusdh'}
		 		]
		 	});

				
			//页面加载后，查询数据为界面赋值
			$(document).ready(function(){
				//加载返回数据
					$('#chengysdm span').html('${result.result.parameter.chengysdm}');
					$('#chengysmc span').html('${result.result.parameter.chengysmc}');
					$('#jusdh input').val('${result.result.parameter.jusdh}');
					//加载返回数据
					$('#grid_user_${pageId}').grid('parseResult',${result});
				    var params= $('#form_user_${pageId}').form("getFormParam");
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
							<td>${i18n.chengysdm}:</td>
							<td><div class="ui-field" id="chengysdm"></div></td>
							<td>${i18n.chengysmc}:</td>
							<td><div class="ui-field" id="chengysmc"></div></td>
							<td><div class="ui-field" id="jusdh"></div></td>
						</tr>
					</tbody>
				</table> 
			</div>
			<div id="grid_user_${pageId}"></div>
		<div id='prompt'>${i18n.prompt}</div>
	  </div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>