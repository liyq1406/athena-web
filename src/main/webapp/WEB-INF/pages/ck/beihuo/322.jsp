<%@ page language="java" pageEncoding="UTF-8"%>
<%request.setAttribute("pageId","322");%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_322}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
			$(function(){
				$('#grid_user_${pageId}').grid({
					keyFields:['liush','ush','shangxxh','shifsl'],
					id:'grid_user_${pageId}',
					//行提交用表单参数
					params:[],
					src:'<%=request.getContextPath()%>/beihuo/32201.do',
					editSubmitSrc:'<%=request.getContextPath()%>/beihuo/32202.do',
					cols:[
						{property:'lingjbh',caption:'${i18n.lingjh}'},
						{property:'yaohlh',caption:'${i18n.yaohlh}'},
				  		{property:'ush',caption:'${i18n.ush}',editor:'fieldText',dataType:'ush',bind:'yush',notNull:true},
				  		{property:'usxh',caption:'${i18n.usxh}'},
				  		{property:'ucxh',caption:'${i18n.ucxh}'},
				  		{property:'shangxxh',caption:'${i18n.shangxbz}',editor:'fieldText',dataType:'letter_numeric',limitedLength:'5'},
				  		{property:'yaohsl',caption:'${i18n.yaohsl}'},
				  		{property:'danw',caption:'${i18n.lingjdw}'},
				  		{property:'shifsl',caption:'${i18n.shifsl}',editor:'fieldText',dataType:'dbnumber'}
					],
					buttons:[
						//F3确认
						{name:'ok',caption:'${i18n.ok}[F3]',keyboard:'F3',action:function(){
							//参数校验
					 		if(!$('#form_user_${pageId}').form("validateParam")){
					 			return;
					 		}
					 		var params = $('#form_user_${pageId}').form("getFormParam");
					 		params.push('beihybh=${userName}');
					 		params.push('cangkbh=' + st_Cangkbh);
					 		$('#form_user_${pageId}').form('submit',params,function(results){
							  if (showPromptRequestMsg(results)==true){
							     if(results.result.response !="C_1403"){
						             $('#grid_user_${pageId}').grid('clearRecords');
				                   }
				                 }
					 		});
						}},
						 //重新加载
                        {name:'back',caption:'${i18n.back}[F11]',keyboard:'F11'},
                        //F12返回
                        {name:'return',caption:'${i18n.return}[F12]'}
					]
				});
				
			 	$('#form_user_${pageId}').form({
			 		onreload:true,
			 		url:'<%=request.getContextPath()%>/beihuo/32203.do',
					fields:[
						{fieldType:'fieldText',biaos:'enter',property:'beihdh',dataType:'beihdh',notNull:true,caption:'${i18n.beihdh}'}
					]
				}); 
			 	
			 	//按备货单号查询
 			 	$('#beihdh').bind('enter',function(){
		 			//参数校验
			 		if(!$('#form_user_${pageId}').form("validateParam")){
			 			$('#grid_user_${pageId}').grid('clearRecords');
			 			return;
			 		}
			 		var params = $('#form_user_${pageId}').form("getFormParam");
			 		params.push('beihybh=${userName}');
			 		params.push('cangkbh=' + st_Cangkbh);
	                params.push('currentPage=1');

	                //设置分页条件
				    $('#grid_user_${pageId}').grid("setQueryParams", params);

			 		$('#grid_user_${pageId}').grid("load",params);
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
							<td>${i18n.beihdh}:</td>
							<td><div class="ui-field" id="beihdh"></div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<br></br>
			<div id="grid_user_${pageId}"></div>
			<br></br>
			<div id='prompt'>${i18n.prompt}</div> 
		</div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>