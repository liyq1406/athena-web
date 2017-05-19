<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","146");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_146}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
			$(function(){
			    //form  
				$('#form_user_${pageId}').form({
				   onemoredemand:true,
				   onreload:true,
					fields:[
						{fieldType:'fieldText' ,property:'chanx',caption:'${i18n.xianh}',dataType:'letter_numeric',limitedLength:'5'},
						{fieldType:'fieldText' ,property:'peislb',caption:'${i18n.peislb}',dataType:'letter_numeric',limitedLength:'4'},
						{fieldType:'fieldText' ,property:'liush1',caption:'${i18n.kaislsh}',dataType:'letter_numeric',limitedLength:'9'},
						{fieldType:'fieldText' ,property:'liush2',caption:'${i18n.jiezlsh}',dataType:'letter_numeric',limitedLength:'9'},
						{fieldType:'fieldText' ,property:'shangxsj1',caption:'${i18n.shangxkssj}',dataType:'datetime',maskOptions:{mask:'9999-99-99 99:99:99'}},
						{fieldType:'fieldText' ,property:'shangxsj2',caption:'${i18n.shangxjzsj}',dataType:'datetime',maskOptions:{mask:'9999-99-99 99:99:99'}}
					  ]
				  }); 
                // grid
               $('#grid_user_${pageId}').grid({
					keyFields:['lingjbh'],
					id:'grid_user_${pageId}',
					src:'<%=request.getContextPath()%>/shouhuo/14601.do',
					cols:[
					   {property:'liush',caption:'${i18n.liush}'},
					   {property:'peislb',caption:'${i18n.peislb}'}
				     ],
				buttons:[
			   	 	{name:'search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
			   	 	    $('#grid_user_${pageId}').grid('clearRecords');
					    if(!$('#form_user_${pageId}').form("validateParam")){
 			                return;
	 		              }
						  var params = $('#form_user_${pageId}').form("getFormParam");
						   var starttime=new Date(($('#shangxsj1 input').val()).replace(/-/g,"/"));
		                   var endtime=new Date(($('#shangxsj2 input').val()).replace(/-/g,"/"));
		                   if(endtime<starttime){
		                      showPromptMsg('red','${i18n.datetime_invalid}');
		                      return false;
		                    }
				           params.push("currentPage=1");
						   //设置分页条件
						   $('#grid_user_${pageId}').grid("setQueryParams", params);
						   var  url = "<%=request.getContextPath()%>/shouhuo/14601.do";
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
							<td align="right">${i18n.xianh}</td>
							<td align="left"><div class="ui-field" id="chanx" ></div></td>
							<td align="right">${i18n.peislb}</td>
							<td align="left"><div class="ui-field" id="peislb"></div></td>
						</tr>
							<tr>
							<td align="right">${i18n.kaislsh}</td>
							<td align="left"><div class="ui-field" id="liush1" ></div></td>
							<td align="right">${i18n.jiezlsh}</td>
							<td align="left"><div class="ui-field" id="liush2"></div></td>
						</tr>
						<tr>
							<td align="right">${i18n.shangxkssj}</td>
							<td align="left"><div class="ui-field" id="shangxsj1" ></div></td>
							<td align="right">${i18n.shangxjzsj}</td>
							<td align="left"><div class="ui-field" id="shangxsj2"></div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div id="grid_user_${pageId}" ></div>
			<div id='prompt'>${i18n.prompt}</div>
		</div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>