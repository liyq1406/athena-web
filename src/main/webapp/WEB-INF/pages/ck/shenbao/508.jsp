<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","508");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_508}</title>
		<jsp:include page="../../common/js.jsp" />
		<jsp:include page="../../common/print.jsp" />
		<script type="text/javascript">
			$(function(){
			 	$('#form_user_${pageId}').form({
			 		onreload:true,
			 	    onemoredemand:true,
			 		fields:[
			 		        {fieldType:'fieldSelect',property:'wulid',includeNull:true,caption:'${i18n.wuld}',src:'<%=request.getContextPath()%>/common/wulidian.do?leix=E'},
	                     	{fieldType:'fieldText',property:'qissj',caption:'${i18n.qissbsj}',dataType:'date',maskOptions:{mask:'9999-99-99'}},
	                        {fieldType:'fieldText',property:'zhongzsj',caption:'${i18n.jiezsbsj}',dataType:'date',maskOptions:{mask:'9999-99-99'}},
	                        {fieldType:'fieldText',property:'jizxh',caption:'${i18n.jizxh}',dataType:'text',maxLength:'11'}
			 		]
			 	});
			 	
			  $('#grid_user_${pageId}').grid({
					keyFields:['jizxh'],
			 	    id:'grid_user_${pageId}',
			 	    showCheckbox:true,
					checkedOnlyOne:true,
					src:'<%=request.getContextPath()%>/shenbao/50801.do',
					cols:[  
					        {property:'jizxh',caption:'${i18n.jizxh}'},
							{property:'edit_time',caption:'${i18n.fanxsj}'},
							{property:'fanxr',caption:'${i18n.fanxr}'},
							{property:'fanxkch',caption:'${i18n.kach}'},
							{property:'fanxydh',caption:'${i18n.fanxydh}'},
							{property:'sij',caption:'${i18n.sij}'}
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
				      ,{name:'checked',caption:'${i18n.checked}[F4]',keyboard:'F4',action:function(){
						$('#grid_user_${pageId}').grid('selected');
			    		return false;
					  }}
					 ,{name:'day',caption:'${i18n.print}[F8]',keyboard:'F8',action:function(){
					    var params = $('#grid_user_${pageId}').grid('getSelectedAll');
						if(params.length != 1){
							$('#prompt span').css('color','red').text("${i18n.selecterror}");
							return false;
						}
		                for(var i=0;i<params.length;i++){
							params[i]=params[i].toString().replace("list[0].","");
						}
						params.push("usercenter="+st_UserCenter);
				        $('#form_user_${pageId}').form("clearValue");
						var url1="<%=request.getContextPath()%>/shenbao/50305.do";
				        doprint("503",params,url1);
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
							 <td>${i18n.fanxsbsj}:</td>
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