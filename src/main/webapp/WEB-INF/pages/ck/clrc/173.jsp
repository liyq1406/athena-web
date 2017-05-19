<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","173");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_173 }</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
		    var temp =[];
		    
			$(function(){
				$('#grid_user_${pageId}').grid({
					keyFields:['cangkbh','uth','huoch'],
					id:'grid_user_${pageId}',
					showCheckbox:true,
					checkedOnlyOne:true,
					src:'<%=request.getContextPath()%>/clrc/17301.do',
					cols:[
					 	{property:'huoch',caption:'${i18n.kch}'},
					 	{property:'uth',caption:'UT号'},
						{property:'blh',caption:'${i18n.blh}'},
						{property:'xiehzt',caption:'${i18n.xiehzt}'},
				        {property:'chengysmc',caption:'${i18n.chengysmc}'},
				        {property:'yujddsj',caption:'${i18n.yujddsj}'},
				        {property:'blscsj',caption:'${i18n.blscsj}'},
				        //0011365
				        {property:'cangkbh',caption:'${i18n.cangkbh}'}	
				        
				   ],
				buttons:[
			   	 	{name:'search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
					     var huoch = $("#huoch input").val();
					     temp.push("huoch="+huoch);
					     
					     	
						var cangkbh = $("#cangkbh input").val();
					    temp.push("cangkbh="+cangkbh);
					     
					     
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
					
					,{name:'caozdhd',caption:'${i18n.caozdhd}[F2]',keyboard:'F2',action:function(){
						var records = $('#grid_user_${pageId}').grid('getSelectedAll');
						if(records.length > 3 || records.length == 0){
							$('#prompt span').css('color','red').text("${i18n.selecterror}");
							return false;
						}
						
						/*0011365
						if(""==$('#cangkbh input').val()){
						 	showMsg("${i18n.C_171_01}");
							return false;
						}						
						*/
						
						//存放查询条件
				       var vQuery = $('#grid_user_${pageId}').grid('getQueryParams')
						   vQuery.push("huoch="+$('#huoch input').val());
						   vQuery.push("cangkbhxx="+$('#cangkbh input').val());
						    //vQuery.push("cangkbh="+$('#cangkbh input').val());
						
						$('#serachKey').val(vQuery);
                        //页面数据提交并跳转，判断盘点方式，打开不同的查看页面
			            var params2 = $('#grid_user_${pageId}').grid('getSelectedAll');		
			           // var params2 = $('#grid_user_${pageId}').grid('selected');           
			            
						params2.push("currentPage=1");
						
						//params2.push("cangkbh=" + parameter.cangkbh);
						
						var huoch = $("#huoch input").val();	
						params2.push("huoch="+huoch);
						
						var cangkbh = $("#cangkbh input").val();
					    params2.push("cangkbh="+cangkbh);
						
						
						// 去掉List[0];
						for(var i=0;i<params2.length;i++){
							params2[i]=params2[i].toString().replace("list[0].","");
						}
						
						var url2 = "<%=request.getContextPath()%>/clrc/17304.do";
		 		        $('#form_user_${pageId}').form("submitUrl", params2, url2, function(results){
			 			    if (showPromptRequestMsg(results)==true  || results.result.response == 'C_103_0704'){
			 			        if(results.result.response == '0001' || results.result.response == 'C_103_0704'){
					 				//加载返回数据
									var strJSON=JSON.stringify(results);
									$('#putvalue').val(strJSON);
								    // $("#putform").attr("action","<%=request.getContextPath()%>/clrc/P17302.do"+st_Params);
				  			   	   $("#putform").attr("action","<%=request.getContextPath()%>/clrc/P17302.do"+st_Params+'&'+temp.join('&'));
				  			    	document.putform.submit();
			  			      }	
							 }
					  });	
					}}
					,{name:'anckhys',caption:'${i18n.anckhys}[F5]',keyboard:'F5',action:function(){
						//0011365
						if(""==$('#cangkbh input').val()){
						 	showMsg("仓库编号不能为空！");
							return false;
						}						
						
						var params = $('#form_user_${pageId}').form("getFormParam");
						var huoch = $('#huoch input').val();
						
						params.push("huoch="+huoch);
						
						
						var url = "<%=request.getContextPath()%>/clrc/17302.do";
		 		        $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
							  if (showPromptRequestMsg(results)==true){
							       $('#grid_user_${pageId}').grid('parseResult',results);
							     
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
		         //V4_039 卡车号限长输入8位 如 HBA12345  
				$('#form_user_${pageId}').form({
					onemoredemand:true,
					fields:[
						{fieldType:'fieldText',property:'huoch',dataType:'text',notNull:true,maxLength:'8',caption:'${i18n.kch}'},
					 	{fieldType:'fieldSelect',property:'cangkbh',caption:'${i18n.cangkbh}',includeNull:true,notNull:false,src:'<%=request.getContextPath()%>/common/wareHouse.do'}			

				  ]
				});
				
				
			
				$(document).keyboardsupport({});
				
			});
			//加载时判断是否是回退
			$(document).ready(function(){
				var huoch,cangkbh;
				var params =[];
			
				<%	if (request.getParameter("huoch") != null){			%>
						huoch= '<%=request.getParameter("huoch")%>';
				<%	} %>
				
				<%	if (request.getParameter("cangkbh") != null){			%>
						cangkbh= '<%=request.getParameter("cangkbh")%>';
				<%	} %>
				
				if(undefined == huoch || '' == huoch){
						return false;
				} 
				
				if( '' != huoch  || '' != cangkbh){
					params.push("huoch="+huoch);
					params.push("cangkbh="+cangkbh);
					
					$('#huoch input').val(huoch);
					$('#cangkbh input').val(cangkbh);
					
					 temp.push("cangkbh="+cangkbh);
					 temp.push("huoch="+huoch);
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
			
			<form id="putform" method="post" name="putform">		
			<input id="serachKey" name="serachKey" type="Hidden"></input>
			<input id="putvalue" name="putvalue" type="Hidden"></input>	
			</form> 
			<div id="form_user_${pageId}" class="ui-fieldLayout">
				<table class="ui-grid" cellspacing="1" width="100%">
					<tbody>
						<tr>
							<td>${i18n.kch}</td>
							<td><div class="ui-field" id="huoch"></div></td>
							
							<td>${i18n.cangkbh}:</td>
							<td><div class="ui-field" id="cangkbh"></div></td>
							

						</tr>
					</tbody>
				</table>
			</div>
			<div id="grid_user_${pageId}"></div>
			<div id='prompt'>${i18n.prompt}</div>
		</div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>