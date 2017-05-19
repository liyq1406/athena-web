<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","101");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_101 }</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
			$(function(){
				$('#grid_user_${pageId}').grid({
					keyFields:['uth'],
					id:'grid_user_${pageId}',
					showCheckbox:true,
					src:'<%=request.getContextPath()%>/shouhuo/10101.do',
					cols:[
						{property:'uth',caption:'${i18n.uth}'},
						{property:'blh',caption:'${i18n.blh}'},
						{property:'xiehzt',caption:'${i18n.xiehzt}'},
				        {property:'chengysmc',caption:'${i18n.chengysmc}'},
				        {property:'tch',caption:'${i18n.tch}'}
				   ],
				buttons:[
			   	 	{name:'search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
			   	 	   $('#grid_user_${pageId}').grid('clearRecords');
				   	 	if(!$('#form_user_${pageId}').form("validateParam")){
				     		return;
				     	}
					    var  blh = $("#blh input").val();
					    var  tch = $("#tch input").val();
					    if( blh !="" && tch !=""){
					     	showPromptMsg('red','${i18n.BLH_TCH}');
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
			   	 	,{name:'selectall',caption:'${i18n.selectall}[F5]',keyboard:'F5',action:function(){
			   	 		$('#grid_user_${pageId}').grid('selectedAll');
			    		return false;
					}}
					,{name:'daydhd',caption:'${i18n.daydhd}[F8]',keyboard:'F8',action:function(){
						var params = $('#form_user_${pageId}').form("getFormParam");
						var records = $('#grid_user_${pageId}').grid('getSelectedAll');
						if(records.length == 0){
							$('#prompt span').css('color','red').text("${i18n.selectoneerror}");
							return false;
						}
						params = params.concat(records);
						var url = "<%=request.getContextPath()%>/shouhuo/10102.do";
						$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
							  if (showPromptRequestMsg(results)==true){
							       $('#grid_user_${pageId}').grid('parseResult',results);
							      }
						 });
			    		return false;
					}}
				　,{name:'back',caption:'${i18n.back}[F11]'}
		          ,{name:'return',caption:'${i18n.return}[F12]'}
				]
				});
				
				 $("#blh").bind('enter',function(event){
		   	 	  	 $('#grid_user_${pageId}').grid('clearRecords');
		   	 		 if(!$('#form_user_${pageId}').form("validateParam")){
			     		return;
			     	   }
				     var  blh = $("#blh input").val();
				     if(blh == ""){
					       showPromptMsg('red','${i18n.blhwk}');
					       return false;
				      }
				     var  tch = $("#tch input").val();
				     if( blh !="" && tch !=""){
				     	 showPromptMsg('red','${i18n.BLH_TCH}');
				     	 return false;
				     }
		   	 		var params=[];
				    params.push("blh="+blh);
		   	 		params.push("currentPage=1");
					//设置分页条件
					$('#grid_user_${pageId}').grid("setQueryParams", params);
					//加载数据
					$('#grid_user_${pageId}').grid("load",params);
		    		return false;
				});
				  
				$('#form_user_${pageId}').form({
					onemoredemand:true,
					onreload:true,
					fields:[
						{fieldType:'fieldText',biaos:'enter',property:'blh',dataType:'text',maxLength:'10',caption:'${i18n.blh}'},
						{fieldType:'fieldText',property:'tch',dataType:'laiy',maxLength:'11',caption:'${i18n.tch}'}
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
							<td>${i18n.blh }</td>
							<td><div class="ui-field" id="blh"></div></td>
						</tr>
						<tr>
							<td>${i18n.tch}</td>
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