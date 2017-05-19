<%@ page language="java" pageEncoding="UTF-8"%>
<%request.setAttribute("pageId","357");%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_357}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
			$(function(){
				$('#grid_user_${pageId}').grid({
					keyFields:['ush'],
					id:'grid_user_${pageId}',
					//查询交易
					src:'<%=request.getContextPath()%>/beihuo/35701.do',
					cols:[
					
					  	{property:'yaohlh',caption:'${i18n.yaohlh}',width:'50'},
					  	{property:'weiz',caption:'${i18n.weizh}',width:'50'},
					  	{property:'zhengclsh',caption:'${i18n.zhengclsh}',width:'50'},
					  	{property:'lingjbh',caption:'${i18n.lingjbh}',width:'50'},
						{property:'lingjmc',caption:'${i18n.lingjmc}',width:'50'},
						{property:'gongysdm',caption:'${i18n.gongysdm}',width:'50'},
						{property:'gongysmc',caption:'${i18n.gongysmc}',width:'50'},
						{property:'lingjsl',caption:'${i18n.shul}',width:'50'},
						{property:'kucsl',caption:'${i18n.kucsl}',width:'50'},
						{property:'danw',caption:'${i18n.lingjdw}',width:'50'}
					],
					buttons:[
                       //F1查询
                       {name:'search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
                           //参数校验
                            $('#grid_user_${pageId}').grid('clearRecords');
                            if(!$('#form_user_${pageId}').form("validateParam")){
			     		          return;
			     	           }
                           var params = $('#form_user_${pageId}').form("getFormParam");
                           params.push('currentPage=1');
                           //设置分页条件
				           $('#grid_user_${pageId}').grid("setQueryParams", params);
		                   $('#grid_user_${pageId}').grid("load",params);
                       }},
                       //确认
						{name:'btn_quer',caption:'${i18n.quer}[F2]',keyboard:'F2',action:function(){
					 		 //参数校验
					 		if(!$('#form_user_${pageId}').form("validateParam")){
									return;	
					 		} 		
					 		//验证操作员
					 		if(!$('#caozy').fieldText('validateNotNull')){
					 			return;
					 		} 
					 		 //提交数据
					 		var params = $('#form_user_${pageId}').form("getFormParam");
					 		params.push("flag=0");
					 		var url = "<%=request.getContextPath()%>/beihuo/35703.do";
							 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
								 if (showPromptRequestMsg(results)==true){
									 $('#grid_user_${pageId}').grid("parseResult",results)
									
								 }
								 });
					         return false;
						}},
						//强制备货
						{name:'btn_qzbh',caption:'${i18n.qzbh}[F3]',keyboard:'F3',action:function(){
							 //参数校验
					 		if(!$('#form_user_${pageId}').form("validateParam")){
									return;	
					 		} 		 
					 		//验证操作员
					 		if(!$('#caozy').fieldText('validateNotNull')){
					 			return;
					 		} 
					 		 //提交数据
					 		var params = $('#form_user_${pageId}').form("getFormParam");
					 		params.push("flag=1");
					 		var url = "<%=request.getContextPath()%>/beihuo/35702.do";
							 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
								 if (showPromptRequestMsg(results)==true){
									 $('#grid_user_${pageId}').grid("parseResult",results)
									
								 }
								 });
							return false;
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
	                    {fieldType:'fieldText',property:'yaohlh',caption:'${i18n.yaohlh}',dataType:'yaohlh',notNull:true},
						{fieldType:'fieldText',property:'caozy',dataType:'laiy',maxLength:'11',caption:'${i18n.caozy}',value:st_UserName}
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
						    <td>${i18n.yaohlh}:</td>
							<td><div class="ui-field" id="yaohlh"></div></td>
							<td>${i18n.caozy}:</td>
							<td><div class="ui-field" id="caozy"></div></td>
						</tr>
					</tbody>
				</table> 
			</div>
			<div id="grid_user_${pageId}"></div>
			<div id='prompt'>${i18n.prompt}</div> 
		</div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>