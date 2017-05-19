<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","503");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_503}</title>
		<jsp:include page="../../common/js.jsp" />
		<jsp:include page="../../common/print.jsp" />
		<script type="text/javascript">
		var list=[];
			$(function(){
			 	$('#form_user_${pageId}').form({
			 		onemoredemand:true,
			 		fields:[
							{fieldType:'fieldText',property:'jizxh',caption:'${i18n.jizxh}',dataType:'text',maxLength:'11',notNull:true},
							{fieldType:'fieldText',property:'fanxkch',caption:'${i18n.fanxkch}',dataType:'laiy',maxLength:'11',notNull:true},
							{fieldType:'fieldText',property:'fanxydh',caption:'${i18n.fanxydh}',dataType:'text',maxLength:'17',notNull:true},
							{fieldType:'fieldText',property:'kacsj',caption:'${i18n.kacsj}',dataType:'laiy',maxLength:'10',notNull:true},
							{fieldType:'fieldText',property:'fanxr',caption:'${i18n.fanxr}',dataType:'laiy',maxLength:'10',notNull:true}
			 		]
			 	});
			 	$('#grid_user_${pageId}').grid({
					id:'grid_user_${pageId}',
					enableCutPage : false,//是否允许分页
					//查询交易
					cols:[
							{property:'jizxh',caption:'${i18n.jizxh}'},
							{property:'caozsj',caption:'${i18n.shengbrq}'},
							{property:'shengbr',caption:'${i18n.shengbr}'},
							{property:'kach',caption:'${i18n.kach}'},
							{property:'fanxydh',caption:'${i18n.fanxydh}'},
							{property:'kacsj',caption:'${i18n.kacsj}'},
							{property:'fanxkch',caption:'${i18n.fanxkch}'}
			        ],
				buttons:[
			   	 	{name:'shenb',caption:'${i18n.shenb}[F1]',keyboard:'F1',action:function(){
			   	 	//参数校验
			 		if(!$('#form_user_${pageId}').form("validateParam")){
			 			return;
			 		}
			 		var params = $('#form_user_${pageId}').form("getFormParam");
			 		var url = "<%=request.getContextPath()%>/shenbao/50301.do";
				 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
				 			if (showPromptRequestMsg(results)==true){ 
				 				list.push({
				 					//sij:results.result.parameter.sij,
				 				          caozsj:results.result.parameter.caozsj,
				 				           jizxh:results.result.parameter.jizxh,
				 				         fanxydh:results.result.parameter.fanxydh,
				 				         fanxkch:results.result.parameter.fanxkch,
				 				            kach:results.result.parameter.kach,
				 				           kacsj:results.result.parameter.kacsj,
				 				         shengbr:results.result.parameter.shengbr});
				 				           
										var records= {
												result : {
													total : list.length,
													rows : list
												}
											};
							       $('#grid_user_${pageId}').grid("parseRecords",records);	
							       g_isSub = 0;
									var param=[];
									param.push("usercenter="+st_UserCenter);
									param.push("jizxh="+$('#jizxh input').val());
							        $('#form_user_${pageId}').form("clearValue");
							        $("#jizxh input").focus();
									var url1="<%=request.getContextPath()%>/shenbao/50305.do";
							        doprint(st_PageId,param,url1);
							        return false;
				 			    }
			 			});
                      return false;
				      }}
					 ,{name:'back',caption:'${i18n.back}[F11]'}
				   	 ,{name:'return',caption:'${i18n.return}[F12]'}
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
							<td>${i18n.jizxh}:</td>
							<td><div class="ui-field" id="jizxh"></div></td>
							<td>${i18n.kach}:</td>
							<td><div class="ui-field" id="fanxkch"></div></td>
							<td>${i18n.kacsj}:</td>
							<td><div class="ui-field" id="kacsj"></div></td>
						</tr>
						<tr>
						    <td>${i18n.fanxydh}:</td>
							<td><div class="ui-field" id="fanxydh"></div></td>
						    <td>${i18n.fanxr}:</td>
						    <td><div class="ui-field" id="fanxr"></div></td>
						</tr>
					</tbody>
				</table> 
			</div>
			<div id="grid_user_${pageId}"></div>
			<div id='prompt'>${i18n.prompt}</div> 
		</div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>