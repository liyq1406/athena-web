<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","504");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_504}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
		    var list=[];
			$(function(){
				$('#grid_user_${pageId}').grid({
					id:'grid_user_${pageId}',
					enableCutPage : false,//是否允许分页
					//查询交易
					src:'<%=request.getContextPath()%>/shenbao/50401.do',
					cols:[
						{property:'jizxh',caption:'${i18n.jizxh}'},
						{property:'newjzxh',caption:'${i18n.tidjzxh}'},
						{property:'caozsj',caption:'${i18n.jiufsj}'},
						{property:'caozy',caption:'${i18n.caozy}'}
			        ],
				buttons:[
			   	 	{name:'qued',caption:'${i18n.qued}[F2]',keyboard:'F2',action:function(){
			   	 	//参数校验
			 		if(!$('#form_user_${pageId}').form("validateParam")){
			 			return;
			 		}
			 		var params = $('#form_user_${pageId}').form("getFormParam");
			 		var url = "<%=request.getContextPath()%>/shenbao/50401.do";
				 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
				 			if (showPromptRequestMsg(results)==true){ 
				 				list.push({
				 				          caozsj:results.result.parameter.caozsj,
				 				           jizxh:results.result.parameter.jizxh,
				 				         newjzxh:results.result.parameter.newjzxh,
				 				        caozy:results.result.parameter.caozy});
				 				           
										var records= {
												result : {
													total : list.length,
													rows : list
												}
											};
							     $('#grid_user_${pageId}').grid("parseRecords",records);	
							     $('#form_user_${pageId}').form("clearValue");
							     $("#jizxh input").focus();
				 			    }
			 			});
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
							{fieldType:'fieldText',property:'jizxh',caption:'${i18n.yuanjzxh}',dataType:'text',maxLength:'11',notNull:true},
							{fieldType:'fieldText',property:'newjzxh',caption:'${i18n.tidjzxh}',dataType:'text',maxLength:'11',notNull:true},
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
							<td>${i18n.yuanjzxh}:</td>
							<td><div class="ui-field" id="jizxh"></div></td>
							<td>${i18n.tidjzxh}:</td>
							<td><div class="ui-field" id="newjzxh"></div></td>
						</tr>
					</tbody>
				</table> 
			</div>
			<div id="grid_user_${pageId}"></div>
			<div id='prompt'>${i18n.prompt}</div> 
		</div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>