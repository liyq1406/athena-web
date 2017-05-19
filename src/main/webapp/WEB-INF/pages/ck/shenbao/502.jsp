<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","502");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_502}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
			$(function(){
			var list=[];
			$('#grid_user_${pageId}').grid({
					id:'grid_user_${pageId}',
					enableCutPage : false,//是否允许分页
					//查询交易
					//src:'<%=request.getContextPath()%>/shenbao/50201.do',
					keyFields:['zhuangt'],
					cols:[
						    {property:'wulid',caption:'${i18n.wuld}'},
							{property:'caozsj',caption:'${i18n.shengbrq}'},
							{property:'jizxh',caption:'${i18n.jizxh}'},
							{property:'kongxq',caption:'${i18n.kongxq}'},
							{property:'shengbr',caption:'${i18n.shengbr}'}
			        ],
				buttons:[
			   	 	{name:'shenb',caption:'${i18n.shenb}[F1]',keyboard:'F1',action:function(){
			   	 	//参数校验
			 		if(!$('#form_user_${pageId}').form("validateParam")){
			 			return;
			 		}
			 		var params = $('#form_user_${pageId}').form("getFormParam");
			 		var url = "<%=request.getContextPath()%>/shenbao/50201.do";
				 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
				 			if (showPromptRequestMsg(results)==true){ 
				 				list.push({wulid:results.result.parameter.wulid,
				 				          caozsj:results.result.parameter.caozsj,
				 				           jizxh:results.result.parameter.jizxh,
				 				           kongxq:results.result.parameter.kongxq,
				 				         shengbr:results.result.parameter.shengbr});
				 				           
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
			 		onemoredemand:true,
			 		fields:[
							{fieldType:'fieldText',property:'jizxh',caption:'${i18n.jizxh}',dataType:'text',maxLength:'11',notNull:true},
							{fieldType:'fieldSelect',property:'kongxq',caption:'${i18n.kongxq}',notNull:true,src:'<%=request.getContextPath()%>/common/wulidian.do?leix=E'}
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
							<td>${i18n.kongxq}:</td>
							<td><div class="ui-field" id="kongxq"></div></td>
						</tr>
					</tbody>
				</table> 
			</div>
			<div id="grid_user_${pageId}"></div>
			<div id='prompt'>${i18n.prompt}</div> 
		</div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>