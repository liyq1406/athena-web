<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","17302");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_17302 }</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
			var paramsQuery;
			var temp = [];
			// temp.push("cangkbh="+'<%=request.getParameter("cangkbh")%>');
			temp.push("huoch="+'<%=request.getParameter("huoch")%>');
			temp.push("uth="+'<%=request.getParameter("uth")%>');
			
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
			    		
			    		
			    		var cangkbh = '${result.result.parameter.cangkbh}';			
				        params.push("cangkbh="+cangkbh); 
				        				
				
			    		var url = "<%=request.getContextPath()%>/shouhuo/10303.do";
						 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
						 			if (showPromptRequestMsg(results)==true){
						 		          if(results.result.response != 'C_1403'){	
											//加载返回数据
											var strJSON=JSON.stringify(results);
											$('#putvalue').val(strJSON);
											$("#putform").attr("action","<%=request.getContextPath()%>/clrc/P17303.do"+st_Params+'&'+ params.join('&')+'&'+temp.join('&'));
				    			    		document.putform.submit();
				    			    	 }
									 }
						 	});
					}}
				  ,{name:'back',caption:'${i18n.back}[F11]',keyboard:'F11',action:function(){	
				    	var params=[];	
				  		var cangkbh = '${result.result.parameter.cangkbh}';			
				        params.push("cangkbh="+cangkbh); 
				        	        
						window.location.href = '<%=request.getContextPath()%>/clrc/173.do'+st_Params+'&'+ params.join('&')+'&'+temp.join('&');
						//document.putform.submit();
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
					//加载列表数据
					//$('#grid_user_${pageId}').grid("load",params);
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