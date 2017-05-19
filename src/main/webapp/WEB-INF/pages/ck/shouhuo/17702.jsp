<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","17702");%>
<!-- V4_022 -->
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_17702 }</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
			var temp = [];
			temp.push("blh="+'<%=request.getParameter("blh")%>');
			temp.push("tch="+'<%=request.getParameter("tch")%>');
			temp.push("cangkbh="+st_Cangkbh);
			
			$(function(){
				var results = ${result};
				$('#grid_user_${pageId}').grid({
					keyFields:['uth','uah','xuh'],
					id:'grid_user_${pageId}',
					showNum : false,
					src:'<%=request.getContextPath()%>/shouhuo/10302.do',
					cols:[
					    {property:'xuh',caption:'${i18n.xuh}',width:50},
						{property:'yaohlh',caption:'${i18n.yaohlh}',width:50},
						{property:'uah',caption:'${i18n.uah}',width:50},
						{property:'lingjbh',caption:'${i18n.lingjbh}',width:50},
						{property:'lingjmc',caption:'${i18n.lingjmc}',width:50},
						{property:'lingjsl',caption:'${i18n.lingjsl}',width:50},
						{property:'elh',caption:'${i18n.elh}',width:50},
						{property:'gongysdm',caption:'${i18n.gongysdm}',width:50},
						{property:'gongysmc',caption:'${i18n.gongysmc}',width:50},
						{property:'uaxh',caption:'${i18n.uaxh}',width:50},
						{property:'ucxh',caption:'${i18n.ucxh}',width:50},
						{property:'pich',caption:'${i18n.pich}',width:50},
						{property:'yansbz',caption:'${i18n.yansbz}',width:50}
				     ],
				buttons:[
			   	 	{name:'update',caption:'${i18n.update}[F1]',keyboard:'F1',action:function(){
	   	 	        	if(4==$('#zhuangt input').val()){
	     	               showPromptMsg('red','${i18n.utwdy}');
	     	               return;
     	                }
	   	 	           //检验行号是否合法
	   	 	           if(!$('#rownum').fieldText("validate")){
					     return;
					  	} 
	     	            var params=[];
			    		params.push("xuh="+$('#rownum input').val());
			    		params.push("uth="+$('#uth span').html());
			    		var url = "<%=request.getContextPath()%>/shouhuo/10303.do";
						 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
						 			if (showPromptRequestMsg(results)==true){
						 		          if(results.result.response != 'C_1403'){	
											//加载返回数据
											var strJSON=JSON.stringify(results);
											$('#putvalue').val(strJSON);
											$("#putform").attr("action","<%=request.getContextPath()%>/shouhuo/P17703.do"+st_Params+'&'+ params.join('&')+'&'+temp.join('&'));
				    			    		document.putform.submit();
				    			    	 }
									 }
						 	});
					}}
					<%--,{name:'quersh',caption:'${i18n.quersh}[F3]',keyboard:'F3',action:function(){
						if(4==$('#zhuangt input').val()){
					     	 showPromptMsg('red','${i18n.utwdy}');
					     	 return;
				     	  }
						var params =[];
						params.push("uth=" + $('#uth span').html());
						var url="<%=request.getContextPath()%>/shouhuo/10306.do";
					    $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
				 		    if (showPromptRequestMsg(results)==true){ 
				 		    	
				 		    	
			                   	  $('#zhuangt input').val(results.result.parameter.zhuangt);
			                   	  if("A" == results.result.parameter.falg){
			                   		  showMsg($.sdcui.resource.i18n['C1_0118']);
			                    	}
							    }
						 });
						
					}} --%>
					,{name:'dayysd',caption:'${i18n.dayysd}[F8]',keyboard:'F8',action:function(){
						var params = $('#form_user_${pageId}').form("getFormParam");
						params.push("blh="+blh); 
						params.push("cangkbh="+st_Cangkbh); 
						params.push("usercenter="+st_UserCenter); 
						
						var records = $('#grid_user_${pageId}').grid('getSelectedAll');
												
						var url2 = '<%=request.getContextPath()%>/shouhuo/17701.do';
												
						$('#form_user_${pageId}').form("submitUrl", params, url2, function(results){
			 			    if (showPromptRequestMsg(results)==true){
			 			    	$('#grid_user_${pageId}').grid('clearRecords');
								$('#form_user_${pageId}').form('clearValue'); 			       					  
								params = params.concat(records);
								var blh2 = '<%=request.getParameter("blh")%>';
								
						var strWindowType = "top=0,left=0,toolbar=no,location=no,directories=no,menubar=no,scrollbars=no,resizable=yes,status=yes";  
					    window.open("<%=request.getContextPath()%>/shouhuo/dhysdy.do?usercenter="+st_UserCenter+"&blh="+blh2+"&cangkbh="+st_Cangkbh,"",strWindowType);			       								 
							 }
					     });
		       		
					}}
				  ,{name:'back',caption:'${i18n.back}[F11]',keyboard:'F11',action:function(){
						window.location.href = '<%=request.getContextPath()%>/shouhuo/177.do'+st_Params+'&'+temp.join('&');
					 	return true;
					}}
					,{name:'return',caption:'${i18n.return}[F12]'}
				  
				   ]});
				
				$('#form_user_${pageId}').form({
					fields:[
						{fieldType:'fieldLabel',property:'blh'},
						{fieldType:'fieldLabel',property:'chengysdm'},
						{fieldType:'fieldLabel',property:'chengysmc'},
						{fieldType:'fieldLabel',property:'xiehzt'},
						{fieldType:'fieldLabel',property:'uth'},
						{fieldType:'fieldHidden',property:'zhuangt'},
						{fieldType:'fieldLabel',property:'tch'}
					]
				});
				//修改行form
				$('#form_update_${pageId}').form({
					fields:[
						{fieldType:'fieldText',property:'rownum',notNull:true,dataType:'plusinteger',caption:'${i18n.xuh}'},
					]
				});
			
          
				$(document).keyboardsupport({});
			});
			   //页面加载后，查询数据为界面赋值
			$(document).ready(function(){
				//加载返回数据
				if ('${result}' != ''){
						var result = JSON.parse('${result}');
						if (result.result){
								result = result.result;
					       }
						$('#blh span').html(result.parameter.blh);
						$('#chengysdm span').html(result.parameter.chengysdm);
						$('#chengysmc span').html(result.parameter.chengysmc);
						$('#xiehzt span').html(result.parameter.xiehzt);
						$('#uth span').html(result.parameter.uth);
						$('#tch span').html(result.parameter.tch);
						$('#zhuangt input').val(result.parameter.zhuangt);
						//加载返回数据
						$('#grid_user_${pageId}').grid('parseRecord',result);
						 showPromptRequestMsg(result);
				    }
				var params = $('#form_user_${pageId}').form("getFormParam");
		 		params.push("currentPage=1");
				//设置分页条件
				$('#grid_user_${pageId}').grid("setQueryParams", params);
			});
		</script>
		
	</head>
	<body>
        <form id="putform" method="post" name="putform" >
		    <input id="putvalue"   name="putvalue" type="hidden"></input>
		</form> 
		<div style="padding:20px;">
			<div id="title"></div>
			<div id="form_user_${pageId}" class="ui-fieldLayout">
				<table class="ui-grid" cellspacing="1" width="100%">
					<tbody>
						<tr>
							<td>${i18n.blh}</td>
							<td><div class="ui-field" id="blh"></div></td>
							<td>${i18n.chengysdm}</td>
							<td><div class="ui-field" id="chengysdm"></div></td>
						</tr>
						<tr>
							<td>${i18n.chengysmc}</td>
							<td><div class="ui-field" id="chengysmc"></div></td>
							<td>${i18n.xiehzt}</td>
							<td><div class="ui-field" id="xiehzt"></div></td>
						</tr>
						<tr>
							<td>${i18n.uth}</td>
							<td><div class="ui-field" id="uth"></div></td>
							<td>${i18n.tch}</td>
							<td><div class="ui-field" id="tch"></div><div class="ui-field" id="zhuangt"></div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div id="form_update_${pageId}" class="ui-fieldLayout">
			  <table class="ui-grid" cellspacing="1" width="100%"  >
				<tbody >
				<tr>
				  <td ><div style="float:right" >${i18n.hang}</div><div style="float:right" class="ui-field"  id="rownum" ></div><div style="float:right" >${i18n.xiugd}</div> </td>
			    </tr>
				</tbody>
				</table>
			</div>
			<div id="grid_user_${pageId}"></div>
		<div id='prompt'>${i18n.prompt}</div>
	</div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>