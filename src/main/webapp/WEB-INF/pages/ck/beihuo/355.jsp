<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","355");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_355}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
       var paramsQuery;
       var currentPage = 1;
			$(function(){
				$('#grid_user_${pageId}').grid({
					id:'grid_user_${pageId}',
					defaultColWidth : 60,
					//查询交易
					src:'<%=request.getContextPath()%>/beihuo/35501.do',
					cols:[
						{property:'ush',caption:'${i18n.ush}',width:'40'},
						{property:'lingjbh',caption:'${i18n.lingjh}',width:'40'},
						{property:'usljsl',caption:'${i18n.usljsl}',width:'40'},
						{property:'danw',caption:'${i18n.lingjdw}',width:'40'},
						{property:'usucxh',caption:'${i18n.usucxh}',width:'40'},
						{property:'zickbh',caption:'${i18n.zick}',width:'40'},
						{property:'kuwbh',caption:'${i18n.kuwbh}',width:'40'},
						{property:'elh',caption:'${i18n.elh}',width:'40'},
						{property:'yaohlh',caption:'${i18n.yaohlh}',width:'40'},
				  		{property:'shangxxh',caption:'${i18n.shangxxh}',width:'40',internation:true},
				  		{property:'xiaohd',caption:'${i18n.xiaohd}',width:'40'},
				  		{property:'yaohsl',caption:'${i18n.yaohsl}',width:'40'},
				  		{property:'beihsl',caption:'${i18n.beihsl}',width:'40'},
				  		{property:'shifsl',caption:'${i18n.shifsl}',width:'40'}
					],
					buttons:[
						//F1查询
				   	 	{name:'search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
				   	 	  //参数校验
			              if(!$('#form_user_${pageId}').form("validateParam")){
			                    $('#grid_user_${pageId}').grid('clearRecords');
			                    return false;
			                }
			   	 		
                        var params = $('#form_user_${pageId}').form("getFormParam");                            
                        params.push('currentPage=1');
                        //设置分页条件
			           $('#grid_user_${pageId}').grid("setQueryParams", params);
			           var url = "<%=request.getContextPath()%>/beihuo/35501.do";
			  			 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			  			 if (showPromptRequestMsg(results)==true){
			  				 $('#grid_user_${pageId}').grid('parseResult',results);
			  				 $('#zickbh span').html(results.result.parameter.zickbh);
			  				 $('#keh span').html(results.result.parameter.keh);
			  				 $('#bhsj span').html(results.result.parameter.bhsj);
			  				 $('#baozzsl span').html(results.result.parameter.baozzsl);
			  				 $('#chuksl span').html(results.result.parameter.chuksl);
			  				 $('#weicsl span').html(results.result.parameter.weicsl);
			  			 }
			  			 });
						}},
						 //重新加载
                        {name:'back',caption:'${i18n.back}[F11]'},
                        //F12返回
                        {name:'return',caption:'${i18n.return}[F12]'}
					]
				});
				
			 	$('#form_user_${pageId}').form({
			 	    onreload:true,
			 		fields:[
					
						{fieldType:'fieldText',property:'beihdh',dataType:'beihdh',caption:'${i18n.beihdh}',notNull:true},
						{fieldType:'fieldSelect',property:'beihdbs',caption:'${i18n.beihdbs}',internation:true,value:$.sdcui.resource.i18n['C_SAOMZT_0'],realValue:'0',src:'<%=request.getContextPath()%>/common/beihdbs.do'},
						{fieldType:'fieldLabel',property:'zickbh',caption:'${i18n.zick}'},
						{fieldType:'fieldLabel',property:'keh',caption:'${i18n.keh}'},
						{fieldType:'fieldLabel',property:'bhsj',caption:'${i18n.beihsj}'},
						{fieldType:'fieldLabel',property:'baozzsl',caption:'${i18n.baozzsl}'},
						{fieldType:'fieldLabel',property:'chuksl',caption:'${i18n.yisgs}'},
						{fieldType:'fieldLabel',property:'weicsl',caption:'${i18n.weicsl}'}

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
							<td>${i18n.beihdh}:</td>
							<td><div class="ui-field" id="beihdh"></div></td>
							<td>${i18n.beihdbs}:</td>
							<td><div class="ui-field" id="beihdbs"></div></td>
							
						</tr>
						<tr>
							<td>${i18n.zick}:</td>
							<td><div class="ui-field" id="zickbh"></div></td>
							<td>${i18n.keh}:</td>
							<td><div class="ui-field" id="keh"></div></td>
							<td>${i18n.beihsj}:</td>
							<td><div class="ui-field" id="bhsj"></div></td>
						</tr>
							<tr>
							<td>${i18n.baozzsl}:</td>
							<td><div class="ui-field" id="baozzsl"></div></td>
							<td>${i18n.yisgs}:</td>
							<td><div class="ui-field" id="chuksl"></div></td>
							<td>${i18n.weicsl}:</td>
							<td><div class="ui-field" id="weicsl"></div></td>
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