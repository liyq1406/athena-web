<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","501");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_501}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
		    var list=[];
			$(function(){
				$('#grid_user_${pageId}').grid({
					id:'grid_user_${pageId}',
					enableCutPage:false,
					//查询交易
					src:'<%=request.getContextPath()%>/shenbao/50101.do',
					cols:[
						{property:'jizxh',caption:'${i18n.jizxh}'},
						{property:'kach',caption:'${i18n.kach}'},
						{property:'yundh',caption:'${i18n.yundh}'},
						{property:'sij',caption:'${i18n.sij}'}
				       ],
				buttons:[
			   	 	{name:'shenb',caption:'${i18n.shenb}[F1]',keyboard:'F1',action:function(){
			   	 		//参数校验
			 		if(!$('#form_user_${pageId}').form("validateParam")){
			 			return;
			 		}
			 		var params = $('#form_user_${pageId}').form("getFormParam");
			 		  var url = "<%=request.getContextPath()%>/shenbao/50101.do";
				 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
					 		var  tch=$('#jizxh input').val();
					 		var  kch=$('#kach input').val();
					 		var  sj=$('#sij input').val();
					 		var  ydh=$('#yundh input').val();
				 			if (showPromptRequestMsg(results)==true){ 
				 				list.push({jizxh:tch,kach:kch,yundh:ydh,sij:sj});
										var records= {
												result : {
													total : list.length,
													rows : list
												}
											};
							     $('#grid_user_${pageId}').grid("parseRecords",records);	
							     $('#form_user_${pageId}').form("clearValue");
							     $('#jiesr span').html(st_UserName);
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
							{fieldType:'fieldLabel',property:'jiesr',caption:'${i18n.jiesr}',value:st_UserName},
							{fieldType:'fieldSelect',property:'wulid',caption:'${i18n.wuld}',notNull:true,src:'<%=request.getContextPath()%>/common/wulidian.do?leix=A'},
							{fieldType:'fieldText',property:'jizxh',dataType:'text',caption:'${i18n.jizxh}',maxLength:'11',notNull:true},
							{fieldType:'fieldText',property:'kach',caption:'${i18n.kach}',dataType:'laiy',maxLength:'11',notNull:true},
							{fieldType:'fieldText',property:'yundh',dataType:'text',maxLength:'17',caption:'${i18n.yundh}',notNull:true},
							{fieldType:'fieldText',property:'sij',dataType:'laiy',maxLength:'10',caption:'${i18n.sij}',notNull:true}
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
							<td>${i18n.jiesr}:</td>
							<td><div class="ui-field" id="jiesr"></div></td>
							<td>${i18n.wuld}:</td>
							<td><div class="ui-field" id="wulid"></div></td>
							<td>${i18n.jizxh}:</td>
							<td><div class="ui-field" id="jizxh"></div></td>
							<!--<td>${i18n.daoxsj}:</td>
							<td><div class="ui-field" id="daoxsj"></div></td>-->
						</tr>
						<tr>
							<td>${i18n.kach}:</td>
							<td><div class="ui-field" id="kach"></div></td>
							<td>${i18n.yundh}:</td>
							<td><div class="ui-field" id="yundh"></div></td>
							<td>${i18n.sij}:</td>
							<td><div class="ui-field" id="sij"></div></td>
						</tr>
						
					</tbody>
				</table> 
			</div>
			<div id="grid_user_${pageId}"></div>
			<div id='prompt'>${i18n.prompt}</div> 
		</div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>