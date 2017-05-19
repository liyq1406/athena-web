<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","156");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_156}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
			$(function(){
			    //form  
				$('#form_user_${pageId}').form({
				    onreload:true,
					fields:[
					    //{fieldType:'fieldSelect' , property:'yaohlzt',caption:'${i18n.yaohlzt}',internation:true,includeNull:true,src:'<%=request.getContextPath()%>/common/yaohlzt.do'},
						{fieldType:'fieldText' , property:'yaohlh',caption:'${i18n.baozdykh}',dataType:'baozdyk',notNull:true}
						
					]
				}); 
                // grid
               $('#grid_user_${pageId}').grid({
					id:'grid_user_${pageId}',
					keyFields:['yaohlh'],
					src:'<%=request.getContextPath()%>/shouhuo/15601.do',
					cols:[
					{property:'yaohlh',caption:'${i18n.baozdykh}',width:50},
					{property:'weiz',caption:'${i18n.weizh}',width:50},
					{property:'zhengclsh',caption:'${i18n.zhengclsh}',width:50},
					{property:'lingjbh',caption:'${i18n.lingjbh}',width:50},
					{property:'lingjmc',caption:'${i18n.lingjmc}',width:50},
					{property:'gongysdm',caption:'${i18n.gongysdm}',width:50},
					{property:'gongysmc',caption:'${i18n.gongysmc}',width:50},
					{property:'chengysdm',caption:'${i18n.chengysdm}',width:50},
					{property:'chengysmc',caption:'${i18n.chengysmc}',width:50},
					{property:'baozxh',caption:'${i18n.baozxh}',width:50},
					{property:'usxh',caption:'${i18n.baozrl}',width:50},
					{property:'zhengcsxsj',caption:'${i18n.shangxsj}',width:80},
					{property:'lingjsl',caption:'${i18n.lingjsl}',width:50},
					{property:'yaohlztxx',caption:'${i18n.yaohlzt}',internation:true,width:50},
					{property:'danw',caption:'${i18n.danw}',width:50}

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
						   var  url = "<%=request.getContextPath()%>/shouhuo/15601.do";
						   $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
								 if (showPromptRequestMsg(results)==true){
									//加载返回数据
									$('#grid_user_${pageId}').grid('parseResult',results);
									 if (results.result.parameter.list.length > 0){
												$('#grid_user_${pageId}').grid('focus');
											}
								 }
						 });
				    		return false;  	 
					}}
			  	   ,{name:'print',caption:'${i18n.print}[F8]',keyboarad:'F8',action:function(){
			  	        if(!$('#form_user_${pageId}').form("validateParam")){
 			                return;
	 		              }
				       var params=[];
						params.push("cangkbh="+st_Cangkbh);
						params.push("usercenter="+st_UserCenter);
						params.push("list[0].yaohlh="+$('#yaohlh input').val());
						var url = "<%=request.getContextPath()%>/shouhuo/14702.do";
						$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
							  if (showPromptRequestMsg(results)==true){
							      
							      }
							      return false;
						 });
				   }}	
				  ,{name:'back',caption:'${i18n.back}[F11]'}
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
					<tbody >
						<tr>
							 <td align="right">${i18n.baozdykh}</td>
							 <td align="left"><div class="ui-field" id="yaohlh" ></div></td>
							<%--<td align="right">${i18n.yaohlzt}</td>
							<td align="left"><div class="ui-field" id="yaohlzt" ></div></td> --%>
						</tr>
					</tbody>
				</table>
			</div>
			<div id="grid_user_${pageId}" ></div>
			<div id='prompt'>${i18n.prompt}</div>
		</div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>