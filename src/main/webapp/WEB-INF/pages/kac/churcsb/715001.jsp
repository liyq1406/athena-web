<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","715001");%>
<t:html i18n="i18n.kac.rucsb">
	<head>
		<title>查看运单</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
		var paramsQuery;
		var currentPage = 1;
		
		$(function(){
			
			$('#form_user_${pageId}').form({
				onreload:true,
				fields:[					
					//{fieldType:'fieldText',property:'usercenter'}
				]
			});
			
				 
		$('#grid_user_${pageId}').grid({
			keyFields:['YUNDH'],
			id:'grid_user_${pageId}',
			showCheckbox:true,
			src:'<%=request.getContextPath()%>/kac/715001.do',
			cols:[
						{property:'YUNDH',caption:'运单号'},
						{property:'DAZTBH',caption:'大站台编号'},
						{property:'KACH',caption:'卡车号'},
				        {property:'SHENGBSJ',caption:'运单生成时间'},
				        {property:'ZHUANGTMC',caption:'运单状态'}	
		    ],    
			buttons:[
			//单选
			{name:'getSelected',caption:'${i18n.checked}[F4]',keyboard:'F4',action:function(){
				msgClear();
				$('#grid_user_${pageId}').grid('selected');
				return false;
			}}
			//全选
			,{name:'selectedAll',caption:'${i18n.selectall}[F5]',keyboard:'F5',action:function(){
				msgClear();
				$('#grid_user_${pageId}').grid('selectedAll');
				return false;
			}}
			//删除
			,{name:'delete',caption:'${i18n.delete}[F6]',keyboard:'F6',action:function(){
						//数据验证
						
				 		if(!$('#form_user_${pageId}').form("validateParam")){
				 			return false;
				 		}
						var records = $('#grid_user_${pageId}').grid('getSelectedAll');
						if(records.length < 1){
							showPromptMsg('red','${i18n.selecterror}')
							return false;
						}
						//alert(1111);
						//打开提示框是否删除
						if(confirm($.sdcui.resource.i18n['C_remove']) != true){
							return false;
						}
						//先提交选中行，然后再重新加载
						var params = $('#grid_user_${pageId}').grid('getQueryParams')
						params = params.concat(records);
						var url = "<%=request.getContextPath()%>/kac/yundSC.do";
				 		$('#form_user_${pageId}').form("submitUrl", params, url, function(result){
						 		if(typeof(result.messageColor) != 'undefined' 
									&& typeof(result.messageContent) != 'undefined'){
								showPromptMsg(result.messageColor,result.messageContent);
								}else{
								showPromptMsg('blue','操作成功！');
								}
				 			 if (showPromptRequestMsg(result)==true){
								//加载返回数据
								$('#grid_user_${pageId}').grid('parseResult',result)
							 }
						});
						return false;
					}} 
		    ,{name:'back',caption:'${i18n.back}[F11]'}
		    
			]
				
			});
		
	
		
			$(document).keyboardsupport({});
			});
		
		
		 	 //从跳转页面返回
               $(document).ready(function(){
            	//alert('test');
            	//var searchKeyValue = $('#searchKey').val();
            	//var records = searchKey.params;  
            	var params=[];
				params.push("currentPage="+currentPage);
				params.push("pagesize="+10);
				//params = params.concat(st_Params);   				
   				
				var url = "<%=request.getContextPath()%>/kac/715001.do";
		 		$('#form_user_${pageId}').form("submitUrl", params, url, function(result){
		 			 if (showPromptRequestMsg(result)==true){
						$('#grid_user_${pageId}').grid('parseResult',result);
						
	                     //返回gird查询
                        //var params = searchKey.params;
                        //设置分页条件
					    $('#grid_user_${pageId}').grid("setQueryParams", params);
                        $('#grid_user_${pageId}').grid("load",params);
					 }
					});
               });
            	   
               /*
                $('#grid_user_${pageId}').grid("load",params);
                 });
		 	  */
		 	 
		</script>
	</head>
	
	<body>
		<div style="padding:20px;">
			<div id="title"></div>
				<input id="searchKey" name="searchKey" type="Hidden"></input>
			<div id="form_user_${pageId}" class="ui-fieldLayout">
				<table class="ui-grid" cellspacing="1" width="100%">
					<tbody>
						<tr style="display:none"><!-- 隐藏域添加方法，form中需要同步添加 -->
							<td>${i18n.usercenter }</td>
							<td><div class="ui-field" id="usercenter"></div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div id="grid_user_${pageId}"></div>
		   <div id='prompt'>${i18n.prompt}</div>
		 </div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html> 
 
 <%-- <%@ page language="java" pageEncoding="UTF-8"%>
<%request.setAttribute("pageId","715001");%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<t:html i18n="i18n.ck">
	<head>
		<title>查看运单</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
	        //返回界面初始值
            var searchKey = {};
			$(function(){
				$('#grid_user_${pageId}').grid({
					keyFields:['YUNDH'],
					id:'grid_user_${pageId}',
					showCheckbox:true,
					//查询交易
					src:'<%=request.getContextPath()%>/kac/chaKanYD.do',
					cols:[
						{property:'YUNDH',caption:'运单号'},
						{property:'DAZTBH',caption:'大站台编号'},
						{property:'KACH',caption:'卡车号'},
						{property:'SHENGBSJ',caption:'运单生成时间'},
						{property:'ZHUANGT',caption:'运单状态'}	
					],
					buttons:[
						//F4单选
						{name:'checked',caption:'${i18n.checked}[F4]',keyboard:'F4',action:function(){
								$('#grid_user_${pageId}').grid('selected');
								msgClear();
								return false;
						}},
						//F5全选
                        {name:'selectall',caption:'${i18n.selectall}[F5]',keyboard:'F5',action:function(){
                                $('#grid_user_${pageId}').grid('selectedAll');
                                msgClear();
                                return false;
                        }},
	                    //删除
						{name:'delete',caption:'${i18n.delete}[F6]',keyboard:'F6',action:function(){
						//数据验证
						
				 		if(!$('#form_user_${pageId}').form("validateParam")){
				 			return false;
				 		}
						var records = $('#grid_user_${pageId}').grid('getSelectedAll');
						if(records.length < 1){
							showPromptMsg('red','${i18n.selecterror}')
							return false;
						}
						alert(1111);
						//打开提示框是否删除
						if(confirm($.sdcui.resource.i18n['C_remove']) != true){
							return false;
						}
						//先提交选中行，然后再重新加载
						var params = $('#grid_user_${pageId}').grid('getQueryParams')
						params = params.concat(records);
						var url = "<%=request.getContextPath()%>/kac/yundSC.do";
				 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
				 			 if (showPromptRequestMsg(results)==true){
								//加载返回数据
								$('#grid_user_${pageId}').grid('parseResult',results)
							 }
						});
						return false;
					}} ,
                        //F12返回
                        {name:'return',caption:'${i18n.return}[F12]'}
						
					]				
				});
				
			 	$('#form_user_${pageId}').form({
			 	    onreload:true,
			 	});
               

			 	$(document).keyboardsupport({});
			});
			 //从跳转页面返回
            $(document).ready(function(){
             var params = searchKey.params;
                $('#grid_user_${pageId}').grid("load",params);
                }
            );
			
		</script>
	</head>
	<body>
		<div style="padding:20px;">
			<div id="title"></div>
			<input id="searchKey" name="searchKey" type="Hidden"></input>
			<div id="form_user_${pageId}" class="ui-fieldLayout">
			</div>
			<div id="grid_user_${pageId}"></div>
			<div id='prompt'>${i18n.prompt}</div> 
		</div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>--%>
 
 