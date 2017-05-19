<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","17701");%>
<!-- V4_022 -->
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_17701 }</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
		    var temp =[];
			$(function(){
				$('#grid_user_${pageId}').grid({
					keyFields:['uth'],
					id:'grid_user_${pageId}',
					showCheckbox:true,
					checkedOnlyOne:true,
					src:'<%=request.getContextPath()%>/shouhuo/10301.do',
					cols:[
						{property:'blh',caption:'${i18n.blh}'},
						{property:'xiehzt',caption:'${i18n.xiehzt}'},
				        {property:'chengysmc',caption:'${i18n.chengysmc}'},
				        {property:'tch',caption:'${i18n.tch}'},
				        {property:'yujddsj',caption:'${i18n.yujddsj}'},
				        {property:'blscsj',caption:'${i18n.blscsj}'}
				   ],
				buttons:[
			   	 	{name:'search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
			   	 	     var  blh = $("#blh input").val();
					     var  tch = $("#tch input").val();
					     temp = [];
					     temp.push("blh="+blh);
					     temp.push("tch="+tch);
				     	 if( blh != "" && tch != ""){
					     	  showPromptMsg('red','${i18n.BLH_TCH}');
					     	  return false;
				     	   }
				   	  	 if(!$('#form_user_${pageId}').form("validateParam")){
				   	 		  return;
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
					,{name:'caozdhd',caption:'${i18n.caozdhd}[F3]',keyboard:'F3',action:function(){
						var records = $('#grid_user_${pageId}').grid('getSelectedAll');
						if(records.length > 1 || records.length == 0){
							$('#prompt span').css('color','red').text("${i18n.selecterror}");
							return false;
						}
						//存放查询条件
				       var vQuery = $('#grid_user_${pageId}').grid('getQueryParams')
						vQuery.push("blh="+$('#blh input').val());
						vQuery.push("tch="+$('#tch input').val());
						$('#serachKey').val(vQuery);
                        //页面数据提交并跳转，判断盘点方式，打开不同的查看页面
			            var params = $('#grid_user_${pageId}').grid('getSelectedAll');
						params.push("currentPage=1");
						//去掉List[0];
						for(var i=0;i<params.length;i++){
							params[i]=params[i].toString().replace("list[0].","");
						}
						params.push("flag=1");
						var url = "<%=request.getContextPath()%>/shouhuo/10302.do";
		 		        $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 			    if (showPromptRequestMsg(results)==true  || results.result.response == 'C_103_0704'){
			 			        if(results.result.response == '0001' || results.result.response == 'C_103_0704'){
					 				//加载返回数据
									var strJSON=JSON.stringify(results);
									$('#putvalue').val(strJSON);
									$("#putform").attr("action","<%=request.getContextPath()%>/shouhuo/P17702.do"+st_Params+'&'+temp.join('&'));
				  			    	document.putform.submit();
			  			      }	
							 }
					  });
							
					}}
				    ,{name:'back',caption:'${i18n.back}[F11]',keyboard:'F11',action:function(){
		
				    	window.location.replace(window.location.href.split("?")[0] + st_Params);
				    	 return false;   
					}}	
					,{name:'return',caption:'${i18n.return}[F12]'}
				  ]
				});
		
				$('#form_user_${pageId}').form({
					onemoredemand:true,
					fields:[
						{fieldType:'fieldText',property:'blh',dataType:'text',maxLength:'10',caption:'${i18n.blh}'},
						{fieldType:'fieldText',property:'tch',dataType:'laiy',maxLength:'11',caption:'${i18n.tch}'}
					]
				});
				
				
			
				$(document).keyboardsupport({});
				
			});
			//加载时判断是否是回退
			$(document).ready(function(){
				var blh, tch,cangkbh;
				var params =[];
				<%	if (request.getParameter("blh") != null){			%>
						blh= '<%=request.getParameter("blh")%>';
				<%	}
				if (request.getParameter("cangkbh") != null){				%>
					cangkbh= '<%=request.getParameter("cangkbh")%>';
				<%	}
					if (request.getParameter("tch") != null){				%>
					tch= '<%=request.getParameter("tch")%>';
				<%	}		%>
				  if(undefined == blh || undefined == tch){
						return false;
					} 
					if( '' != blh  || '' != tch){
					params.push("blh="+blh);
					params.push("cangkbh="+cangkbh);
					params.push("tch="+tch);
					$('#blh input').val(blh);
					$('#tch input').val(tch);
					 temp.push("blh="+blh);
					 temp.push("tch="+tch);
					//加载列表数据
					$('#grid_user_${pageId}').grid("load",params, function(results){
			 				msgClear();
					});
				} 	
		   });
		</script>
	</head>
	<body>
		<div style="padding:20px;">
			<div id="title"></div>
			<input id="serachKey" name="serachKey" type="Hidden"></input>
			<form id="putform" method="post" name="putform">
				<input id="putvalue" name="putvalue" type="Hidden"></input>
			</form> 
			<div id="form_user_${pageId}" class="ui-fieldLayout">
				<table class="ui-grid" cellspacing="1" width="100%">
					<tbody>
						<tr>
							<td>${i18n.blh}</td>
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