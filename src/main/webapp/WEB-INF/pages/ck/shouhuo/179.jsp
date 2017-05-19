<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","179");%>
<!-- V4_022 -->
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_179 }</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
			$(function(){
				$('#grid_user_${pageId}').grid({
					keyFields:['ush','str1','str2'],
					id:'grid_user_${pageId}',
					showCheckbox:true,
					src:'<%=request.getContextPath()%>/shouhuo/17901.do',
					editSubmitSrc:'<%=request.getContextPath()%>/shouhuo/17902.do',
					cols:[
						{property:'cangkbh',caption:'${i18n.cangkbh}'},
						{property:'lingjbh',caption:'${i18n.lingjbh}'},
						{property:'blh',caption:'${i18n.blh}'},
						{property:'uth',caption:'${i18n.uth}'},
						{property:'ush',caption:'${i18n.ush}'},
						{property:'elh',caption:'${i18n.elh}'},
						{property:'danw',caption:'${i18n.danw}'},
						{property:'lingjsl',caption:'${i18n.shul}'},
						{property:'creator',caption:'${i18n.caozy}'},
						{property:'rukrq1',caption:'${i18n.rukrq}'},
						{property:'str1',caption:'${i18n.juanlh}',editor:'fieldText',notNull:false,dataType:'juanlh',biaos:'notsubmit',maxLength:'20'},
						{property:'str2',caption:'${i18n.guigph}',editor:'fieldText',notNull:false,dataType:'juanlh',maxLength:'20'}
				    ],
				buttons:[
			   	 	{name:'search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
					   	 	if(!$('#form_user_${pageId}').form("validateParam")){
						   	 	$('#grid_user_${pageId}').grid('clearRecords');
								return;
							}
				   	 		var params = $('#form_user_${pageId}').form("getFormParam");
				   	 		params.push("currentPage=1");
				   	 		params.push("usercenter="+st_UserCenter);
				   	 		$('#serachKey').val(params);
							//设置分页条件
							$('#grid_user_${pageId}').grid("setQueryParams", params);
							$('#grid_user_${pageId}').grid("load",params);
				    		return false;  	 
					}}
				   ,{name:'checked',caption:'${i18n.checked}[F4]',keyboard:'F4',action:function(){
							$('#grid_user_${pageId}').grid('selected');
				    		return false;
					}}
				  ,{name:'selectall',caption:'${i18n.selectall}[F5]',keyboard:'F5',action:function(){
			   	 		$('#grid_user_${pageId}').grid('selectedAll');
			    		return false;
					}}
				  ,{name:'print',caption:'${i18n.print}[F6]',keyboard:'F6',action:function(){
						var params = $('#grid_user_${pageId}').grid('getSelectedAll');
						
						if(params.length != 3){
                             showPromptMsg('red','${i18n.selecterror}');
                             return false;
                        }	
                        
                       
                        params1=params[0].toString().replace("list[0].","&");
                      	
                        var strWindowType = "top=0,left=0,toolbar=no,location=no,directories=no,menubar=no,scrollbars=no,resizable=yes,status=yes";  
					   
						 window.open("<%=request.getContextPath()%>/shouhuo/shuxlrdy.do"+st_Params+"&usercenter="+st_UserCenter+"&cangkbh="+st_Cangkbh+params1,"",strWindowType);			       		
					 	 
					}}
					,{name:'back',caption:'${i18n.back}[F11] '}
					,{name:'return',caption:'${i18n.return}[F12]'}
				]
				});		
				$('#form_user_${pageId}').form({
					fields:[
						{fieldType:'fieldSelect',property:'cangkbh',includeNull:false,notNull:true,caption:'${i18n.cangk}',src:'<%=request.getContextPath()%>/common/wareHousejlck.do'},
						{fieldType:'fieldText',property:'lingjbh',dataType:'letter_numeric',limitedLength:'10'},
						{fieldType:'fieldText',property:'blh',dataType:'blh'},
						{fieldType:'fieldText',property:'uth',dataType:'uth'},
						{fieldType:'fieldText',property:'ush',dataType:'ush'},
						{fieldType:'fieldText',property:'elh',dataType:'elh'}
					]
				});
				$(document).keyboardsupport({});
		});
		$(document).ready(function(){});
		
		function refresh(results){
			$('#grid_user_${pageId}').grid('parseResultRow',results.result.parameter);
		}
</script> 
		
	</head>
	<body>
	<div style="padding-left: 20px" >
			<div id="title"></div>
			<input id="serachKey" name="serachKey" type="Hidden"></input>
			<form id="putform" method="post" name="putform" >
					<input id="putvalue" name="putvalue" type="hidden"></input>
			</form> 
			<div id="form_user_${pageId}" class="ui-fieldLayout">
				<table class="ui-grid" cellspacing="1" width="100%">
					<tbody>
						<tr>
						    <td>${i18n.cangkbh }</td>
							<td><div class="ui-field" id="cangkbh"></div></td>
							<td>${i18n.lingjbh}</td>
							<td><div class="ui-field" id="lingjbh"></div></td>
					        <td>${i18n.blh}</td>
							<td><div class="ui-field" id="blh"></div></td>
						</tr>
						<tr>
							<td>${i18n.uth}</td>
							<td><div class="ui-field" id="uth"></div></td>
							<td>${i18n.ush}</td>
							<td><div class="ui-field" id="ush"></div></td>
							<td>${i18n.elh}</td>
							<td><div class="ui-field" id="elh"></div></td>
							
						</tr>
					</tbody>
				</table>
			</div>
			<div id="grid_user_${pageId}"></div>
		<div id='prompt'>${i18n.prompt}</div>
	  </div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>