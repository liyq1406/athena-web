<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","126");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_126 }</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
			$(function(){
				$('#grid_user_${pageId}').grid({
					keyFields:['uah'],
					id:'grid_user_${pageId}',
					src:'<%=request.getContextPath()%>/shouhuo/12601.do',
					cols:[
						{property:'yaohlh',caption:'${i18n.yaohlh}'},
						{property:'lingjbh',caption:'${i18n.lingjbh}'},
						{property:'lingjmc',caption:'${i18n.lingjmc}'},
						{property:'gongysdm',caption:'${i18n.gongysdm}'},
						{property:'gongysmc',caption:'${i18n.gongysmc}'},
						{property:'lingjsl',caption:'${i18n.lingjsl}'},
						{property:'uaxh',caption:'${i18n.uaxh}'},
						{property:'ucxh',caption:'${i18n.ucxh}'},
				  		{property:'ucgs',caption:'${i18n.ucgs}'},
				  		{property:'danw',caption:'${i18n.danw}'}
					],
				buttons:[
			   	 	{name:'select',caption:'${i18n.daohtzdcx}[F1]',keyboard:'F1',action:function(){
			   	 	 $('#grid_user_${pageId}').grid('clearRecords');
				   	 	if(!$('#form_user_${pageId}').form("validateParam")){
				   	 	 $('#grid_user_${pageId}').grid('clearRecords');
				   	 	 $('#chengysdm span').html("");
						 $('#tch span').html("");
							return;
						}
						var params = $('#form_user_${pageId}').form("getFormParam");
						params.push("currentPage=1");
						//设置分页条件
						$('#grid_user_${pageId}').grid("setQueryParams", params);
					    var url = "<%=request.getContextPath()%>/shouhuo/12601.do";
				 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
				 			if (showPromptRequestMsg(results)==true){
				 		 $('#chengysdm span').html(results.result.parameter.chengysdm);
						 $('#tch span').html(results.result.parameter.tch);
						 //加载grid
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
				]
				});
				
			 	$('#form_user_${pageId}').form({
			 	    onreload:true,
					fields:[
						{fieldType:'fieldText',property:'blh',dataType:'text',maxLength:'10',notNull:true,caption:'${i18n.blh}'},
						{fieldType:'fieldLabel',property:'chengysdm',caption:'${i18n.chengysdm}'},
						{fieldType:'fieldLabel',property:'tch',caption:'${i18n.tch}'}
					]
				}); 
		 /**
		  *进入126页面后进行查询
		  */
		 $(document).ready(function(){
		    var params =[];
	        var url = "<%=request.getContextPath()%>/shouhuo/12602.do";
		    $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			  if (showPromptRequestMsg(results)==true){
			       $("#blh input").val(results.result.parameter.blh);
			       $("#chengysdm span").html(results.result.parameter.chengysdm);
	    	       $("#tch span").html(results.result.parameter.tch);
			       $('#grid_user_${pageId}').grid('parseResult',results);
			       params = $('#form_user_${pageId}').form("getFormParam");
			       $('#grid_user_${pageId}').grid("setQueryParams", params);
			     }
			       msgClear();
			     });
			     return false;
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
							<td>${i18n.blh }:</td>
							<td><div class="ui-field" id="blh"></div></td>
							<td>${i18n.chengysdm }:</td>
							<td><div class="ui-field" id="chengysdm"></div></td>
							<td>${i18n.tch }:</td>
							<td><div class="ui-field" id="tch"></div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div id="grid_user_${pageId}"></div>
		  <div id='prompt'>${i18n.prompt}</div>
	    </div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>