<%@ page language="java" pageEncoding="UTF-8"%>
<%request.setAttribute("pageId","32601");%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_326}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">

		
		var list="";
			$(function(){
				$('#grid_user_${pageId}').grid({
					keyFields:['yicsbdh'],
					id:'grid_user_${pageId}',
					//查询交易
					src:'<%=request.getContextPath()%>/beihuo/32601.do',
					cols:[
						{property:'lux',caption:'${i18n.lux}'},
						{property:'lingjbh',caption:'${i18n.lingjh}'},
						{property:'lingjmc',caption:'${i18n.lingjmc}'},
						{property:'shipsl',caption:'${i18n.shipsl}'},
				  		{property:'danw',caption:'${i18n.lingjdw}'},
				  		{property:'zhixsl',caption:'${i18n.zhixsl}'},
				  		{property:'weiwcsl',caption:'${i18n.weiwcl}'},
				  		{property:'jiaofsj',caption:'${i18n.jiaofsj}'},
				  		{property:'jihy',caption:'${i18n.jihyxm}'}
				  		//{property:'keh',caption:'${i18n.keh}'}
					],
					buttons:[
						//F3备货
						{name:'beih',caption:'${i18n.beih}[F3]',keyboard:'F3',action:function(){
						    if(list==""){
								return;
							}
							//参数校验
					 		if(!$('#form_user_${pageId}').form("validateParam")){
					 			return;
					 		}
					 		var params = $('#form_user_${pageId}').form("getFormParam");
					 		params.push('beihybh=${userName}');
					 		$('#form_user_${pageId}').form('submit',params,function(results){
					 			if(showPromptRequestMsg(results)){
					        		 
					        	  $('#yidbsl').html(results.result.parameter.yidbsl);
							      $('#yaohlgs').html(results.result.parameter.yaohlgs);	
							      
						 			//刷新列表数据
		                            $('#grid_user_${pageId}').grid('parseResult',results);
		                            list=results.result.parameter.list;
		                          }
					 			});
					 			
					        
					         
							 return true;
						}},
						 //重新加载
                        {name:'back',caption:'${i18n.back}[F11]'},
                        //F12返回
                        {name:'return',caption:'${i18n.return}[F12]'}
					]				
				});
				
			 	$('#form_user_${pageId}').form({
					         
			 		//确认出库交易
			 		url:'<%=request.getContextPath()%>/beihuo/32602.do',
			 		onreload:true,
			 		fields:[
							{fieldType:'fieldLabel',property:'dingdh',caption:'${i18n.diaodh}'},
							{fieldType:'fieldLabel',property:'shij',value:CurrentTime()},
							{fieldType:'fieldLabel',property:'keh',caption:'${i18n.keh}'},
							{fieldType:'fieldLabel',property:'cangkbh',value:st_Cangkbh}
			 		]});

			 	$(document).keyboardsupport({});
			 	 $(document).ready(function(){
					//加载返回数据
					if ('${result}' != ''){
							var result = JSON.parse('${result}');
							$('#grid_user_${pageId}').grid('parseResult',result.result);
							$('#keh span ').html(result.result.parameter.keh);
							$('#dingdh span').html(result.result.parameter.dingdh);
							$('#yidbsl').html(result.result.parameter.yidbsl);
							$('#yaohlgs').html(result.result.parameter.yaohlgs);
							var params=[];
				    		params.push("dingdh="+result.result.parameter.dingdh);
				    		params.push('beihybh=${userName}');
				    		list=result.result.parameter.list;
				    		//设置分页条件
						    $('#grid_user_${pageId}').grid("setQueryParams", params);
					  }
				});   

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
							<td>${i18n.diaobdh}:</td>
							<td><div class="ui-field" id="dingdh"></div></td>
							<td>${i18n.shij}:</td>
							<td><div class="ui-field" id="shij"></div></td>
							<td>${i18n.cangkbh}:</td>
							<td><div class="ui-field" id="cangkbh"></div></td>
							<td>${i18n.keh}:</td>
							<td><div class="ui-field" id="keh"></div></td>
						    <td>${i18n.yidbsl}:</td>
							<td><div class="ui-field" id="yidbsl"></div></td>
							<td>${i18n.yaohlgs}:</td>
							<td><div class="ui-field" id="yaohlgs"></div></td>
							
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