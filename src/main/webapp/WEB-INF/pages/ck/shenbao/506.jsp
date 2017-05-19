<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","506");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_506}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
			$(function(){
			$('#form_user_${pageId}').form({
				   onreload:true,
			 	   onemoredemand:true,
			 		fields:[
			 		        {fieldType:'fieldSelect',property:'wulid',caption:'${i18n.wuld}',includeNull:true,src:'<%=request.getContextPath()%>/common/wulidian.do?leix=A'},
	                     	{fieldType:'fieldText',property:'qissj',caption:'${i18n.qissbsj}',dataType:'date',maskOptions:{mask:'9999-99-99'}},
	                        {fieldType:'fieldText',property:'zhongzsj',caption:'${i18n.jiezsbsj}',dataType:'date',maskOptions:{mask:'9999-99-99'}},
	                        {fieldType:'fieldText',property:'jizxh',caption:'${i18n.jizxh}',dataType:'text',maxLength:'11'},
			 		]
			 	});
			
			$('#grid_user_${pageId}').grid({
					keyFields:['wulid'],
			 	    id:'grid_user_${pageId}',
					src:'<%=request.getContextPath()%>/shenbao/50601.do',
					cols:[
							{property:'wulid',caption:'${i18n.wuld}'},
							{property:'daoxsj',caption:'${i18n.daoxsj}'},
							{property:'jizxh',caption:'${i18n.jizxh}'},
							{property:'kach',caption:'${i18n.kach}'},
							{property:'yundh',caption:'${i18n.yundh}'},
							{property:'sij',caption:'${i18n.sij}'},
							{property:'jiesr',caption:'${i18n.jiesr}'}
				        ],
				buttons:[
			   	 	{name:'search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
			   	 	//参数校验
			   	 	 $('#grid_user_${pageId}').grid('clearRecords');
					 	if(!$('#form_user_${pageId}').form("validateParam")){
					 			return;
					 		}
				 	   var starttime=new Date(($('#qissj input').val()).replace(/-/g,"/"));
                       var endtime=new Date(($('#zhongzsj input').val()).replace(/-/g,"/"));
                       if(endtime<starttime){
                              showPromptMsg('red','${i18n.datetime_invalid}');
                               return false;
                          }
				 		var params = $('#form_user_${pageId}').form("getFormParam");
				 		params.push("currentPage=1");
						//设置分页条件
						$('#grid_user_${pageId}').grid("setQueryParams", params);
						//加载数据
						$('#grid_user_${pageId}').grid("load",params);
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
						   <td>${i18n.wuld}:</td>
							<td><div class="ui-field" id="wulid"></div></td>
							 <td>${i18n.zhongxsbsj}:</td>
							<td><div class="ui-field" style="float:left" id="qissj"></div><div style="float:left" >至</div><div style="float:left" class="ui-field"  id="zhongzsj" ></div> </td>
							<td>${i18n.jizxh}:</td>
							<td><div class="ui-field" id="jizxh"></div></td>
						</tr>
					</tbody>
				</table> 
			</div>
			<div id="grid_user_${pageId}"></div>
			<div id='prompt'>${i18n.prompt}</div> 
		</div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>