<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","15903");%>
<t:html i18n="i18n.ck">
	<head>
		<!-- V4_056 -->
		<title>${i18n.title_15903}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
			$(function(){
				  //form  
				$('#form_user_${pageId}').form({
					fields:[
					{fieldType:'fieldText' , property:'elh',dataType:'elh',caption:'${i18n.elh}',notNull:true}
					]
				}); 
					
				$('#form_info_${pageId}').form({
					fields:[
					{fieldType:'fieldLabel' , property:'elh1',caption:'${i18n.elh}'},
					{fieldType:'fieldLabel' , property:'ulh',caption:'${i18n.ulh}'},
					{fieldType:'fieldLabel' , property:'gongysdm',caption:'${i18n.gongysdm}'},
					{fieldType:'fieldLabel' , property:'gongysmc',caption:'${i18n.gongysmc}'},
					{fieldType:'fieldLabel' , property:'lingjbh',caption:'${i18n.lingjbh}'},
					{fieldType:'fieldLabel' , property:'lingjmc',caption:'${i18n.lingjmc}'},
					{fieldType:'fieldLabel' , property:'yanssl',caption:'${i18n.yanssl}'},
					{fieldType:'fieldLabel' , property:'lingjsl',caption:'${i18n.jiessl}'},
					{fieldType:'fieldLabel' , property:'danw',caption:'${i18n.danw}'},
					{fieldType:'fieldLabel' , property:'pich',caption:'${i18n.pich}'},
					{fieldType:'fieldLabel' , property:'uaxh',caption:'${i18n.uaxh}'},
					//huxy_11460
					{fieldType:'fieldLabel' , property:'ckandzick',caption:'${i18n.cangkbh}'},
					{fieldType:'fieldLabel' , property:'uarl',caption:'${i18n.uarl}'},
					{fieldType:'fieldLabel' , property:'uth',caption:'${i18n.uth}'},
					{fieldType:'fieldLabel' , property:'chuangjrq',caption:'${i18n.chuangjrq}'}
					]
				}); 
                // grid <!-- V4_056 -->
               $('#grid_user_${pageId}').grid({
					id:'grid_user_${pageId}',
					keyFields:['ush','baozztxx','lingjsl','rukrq','kuwbh','danw','xiaohd'],
					showNum:true,
					showCheckbox : true, // 显示复选框
					checkedOnlyOne : true, //是否单选
					src:'<%=request.getContextPath()%>/shouhuo/15903.do',
					cols:[
					{property:'ush',caption:'${i18n.ush}'},
					{property:'baozztxx',caption:'${i18n.baozzt}',internation:true},
					{property:'lingjsl',caption:'${i18n.lingjsl}'},
					{property:'rukrq',caption:'${i18n.rukrq}'},
					{property:'kuwbh',caption:'${i18n.kuwbh}'},
					{property:'danw',caption:'${i18n.danw}'},
					{property:'xiaohd',caption:'${i18n.xiaohd}'}

				],
		 	buttons:[
				 	   {name:'search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
					 	  $('#grid_user_${pageId}').grid('clearRecords');
					 	  $('#form_info_${pageId}').form('clearValue');
		                  //参数校验
					 	  if(!$('#form_user_${pageId}').form("validateParam")){
		 			            return;
			 		        }
						   var params = $('#form_user_${pageId}').form("getFormParam");
						   params.push("currentPage=1");
							//设置分页条件
							$('#grid_user_${pageId}').grid("setQueryParams", params);
							
						   var url = "<%=request.getContextPath()%>/shouhuo/15903.do";
					 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
					 			 if (showPromptRequestMsg(results)==true){
				 			     	   //huxy_11460
					  				   $('#ckandzick span').html(results.result.parameter.ckandzick);
					 			       $('#elh1 span').html(results.result.parameter.elh);
					 			       $('#ulh span').html(results.result.parameter.ulh);
					 			       $('#uth span').html(results.result.parameter.uth);
					 			       $('#gongysdm span').html(results.result.parameter.gongysdm);
									   $('#gongysmc span').html(results.result.parameter.gongysmc);
									   $('#lingjbh span').html(results.result.parameter.lingjbh);
									   $('#lingjmc span').html(results.result.parameter.lingjmc);
									   $('#yanssl span').html(results.result.parameter.yanssl);
									   $('#lingjsl span').html(results.result.parameter.lingjsl);
									   $('#danw span').html(results.result.parameter.danw);
									   $('#pich span').html(results.result.parameter.pich);
									   $('#uaxh span').html(results.result.parameter.uaxh);
									   $('#uarl span').html(results.result.parameter.uarl);
									   $('#chuangjrq span').html(results.result.parameter.chuangjrq);
					 			       $('#grid_user_${pageId}').grid('parseResult',results);
					 			        if (results.result.parameter.list.length > 0){
												$('#grid_user_${pageId}').grid('focus');
											}
					 			       $('#serachKey').val( results.result.parameter.elh);
					 			    }
					 	    });
				    		return false;
					 	}}
					      //huxy_11459
					 	  ,{name:'print',caption:'${i18n.print}[F8]',keyboard:'F8',action:function(){
							var params = $('#form_info_${pageId}').form("getFormParam");
							var elh = $('#elh1 span').html();
							params.push("elh="+elh);
							var records = $('#grid_user_${pageId}').grid("getRecordAll");
							params=params.concat(records);
					 		var url = "<%=request.getContextPath()%>/shouhuo/15908.do";
					 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
					 		if (showPromptRequestMsg(results)==true){
									  
							}})
				    		return false;
				     	}}
                         ,{name:'getSelected',caption:'${i18n.checked}[F4]',keyboard:'F4',action:function(){
 							$('#grid_user_${pageId}').grid('selected');
 				    		return false;
 				     	 }}
                          ,{name:'ulck',caption:'${i18n.ulck}[F5]',keyboard:'F5',action:function(){
                          	var params=[];
                          	params.push("ulh="+$('#ulh span').html());
  	                        var url = "<%=request.getContextPath()%>/shouhuo/15902.do";
  	    			 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
  	    			 			 if (showPromptRequestMsg(results)==true){
  	    			 			    	if(results.result.response != 'C_1403'){
  	    					 				//加载返回数据
  	    									var strJSON=JSON.stringify(results);
  	    									$('#putvalue').val(strJSON);
  	    									$("#putform").attr("action","<%=request.getContextPath()%>/shouhuo/P15902.do"+st_Params);
  	    		    			    		document.putform.submit();
  	    		    			    	 }
  	    						 }
  	    					});
  	    					return false;
                          }}
                         ,{name:'usck',caption:'${i18n.usck}[F6]',keyboard:'F6',action:function(){
                         	//判定是否有数据被选中 
         		    	    var params = $('#grid_user_${pageId}').grid('getSelectedAll');
         		    	   	if(params.length != 7 ){
         	 					$('#prompt span').css('color','red').text("${i18n.selecterror}");
         			  				return false;
         		  			}
         		    	    //去掉List[0];
 	                        for(i=0;i<params.length;i++){
 	                            params[i]=params[i].toString().replace("list[0].","");
 	                        }
 	                        var url = "<%=request.getContextPath()%>/shouhuo/15904.do";
 	    			 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
 	    			 			 if (showPromptRequestMsg(results)==true){
 	    			 			    	if(results.result.response != 'C_1403'){
 	    					 				//加载返回数据
 	    									var strJSON=JSON.stringify(results);
 	    									$('#putvalue').val(strJSON);
 	    									$("#putform").attr("action","<%=request.getContextPath()%>/shouhuo/P15904.do"+st_Params);
 	    		    			    		document.putform.submit();
 	    		    			    	 }
 	    						 }
 	    					});
 	    					return false;
                         }}
                        <%-- ,{name:'back',caption:'${i18n.back}[F11]',keyboard:'F11',action:function(){
                          window.location.href="<%=request.getContextPath()%>/shouhuo/159.do"+st_Params;
						  return true;
                         }} --%>
                        ,{name:'back',caption:'${i18n.back}[F11]'}
                        ,{name:'return',caption:'${i18n.return}[F12]'}
		 	        ]
					}); 
				
		//页面加载后，查询数据为界面赋值
			$(document).ready(function(){
				//加载返回数据
				var elh2 = $('#serachKey').val();
				if('${result}'!=''){
					var result = JSON.parse('${result}');
					if( ('' != elh2 && elh2 == result.result.parameter.elh) || '' == elh2  ){
					   $('#elh1 span').html(result.result.parameter.elh);
					    //huxy_11460
					   $('#ckandzick span').html(result.result.parameter.ckandzick);
	 			       $('#ulh span').html(result.result.parameter.ulh);
	 			       $('#uth span').html(result.result.parameter.uth);
	 			       $('#gongysdm span').html(result.result.parameter.gongysdm);
					   $('#gongysmc span').html(result.result.parameter.gongysmc);
					   $('#lingjbh span').html(result.result.parameter.lingjbh);
					   $('#lingjmc span').html(result.result.parameter.lingjmc);
					   $('#yanssl span').html(result.result.parameter.yanssl);
					   $('#lingjsl span').html(result.result.parameter.lingjsl);
					   $('#danw span').html(result.result.parameter.danw);
					   $('#pich span').html(result.result.parameter.pich);
					   $('#uaxh span').html(result.result.parameter.uaxh);
					   $('#uarl span').html(result.result.parameter.uarl);
					   $('#chuangjrq span').html(result.result.parameter.chuangjrq);
				       $('#grid_user_${pageId}').grid('parseResult',result.result);
				       var params=[];
				       params.push("elh="+$('#elh1 span').html());
				       //设置分页条件
					   $('#grid_user_${pageId}').grid("setQueryParams", params);
				 }else{
			        var param2 = [];
					 param2.push("elh="+elh2);
					   //设置分页条件
					   $('#grid_user_${pageId}').grid("setQueryParams", param2);
					   var url = "<%=request.getContextPath()%>/shouhuo/15903.do";
				 		$('#form_user_${pageId}').form("submitUrl", param2, url, function(results){
				 			 if (showPromptRequestMsg(results)==true){
				 			     if(results.result.response != 'C_1403'){
				 			         $('#elh1 span').html(results.result.parameter.elh);
					 			       $('#ulh span').html(results.result.parameter.ulh);
					 			       $('#uth span').html(results.result.parameter.uth);
					 			       $('#gongysdm span').html(results.result.parameter.gongysdm);
									   $('#gongysmc span').html(results.result.parameter.gongysmc);
									   $('#lingjbh span').html(results.result.parameter.lingjbh);
									   $('#lingjmc span').html(results.result.parameter.lingjmc);
									   $('#yanssl span').html(results.result.parameter.yanssl);
									   $('#lingjsl span').html(results.result.parameter.lingjsl);
									   $('#danw span').html(results.result.parameter.danw);
									   $('#pich span').html(results.result.parameter.pich);
									   $('#uaxh span').html(results.result.parameter.uaxh);
									   $('#uarl span').html(results.result.parameter.uarl);
									   $('#chuangjrq span').html(results.result.parameter.chuangjrq);
					 			       $('#grid_user_${pageId}').grid('parseResult',results);       
				 			       }
				 			    }
				 	    });
			    		return false;
				 }
				}
			});
			  $(document).keyboardsupport({});

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
					<tbody >
						<tr>
							<td >${i18n.elh}</td>
							<td ><div class="ui-field" id="elh" ></div></td>
						</tr>
					</tbody>
				</table>
			</div>	
			
			<div id="form_info_${pageId}" class="ui-fieldLayout">
				<table class="ui-grid" cellspacing="1" width="100%">
					<tbody >
						<tr>
						    <td >${i18n.elh}</td>
							<td ><div class="ui-field" id="elh1" ></div></td> 
							<td >${i18n.ulh}</td>
							<td ><div class="ui-field" id="ulh" ></div></td> 
						    <td >${i18n.uth}</td>
							<td ><div class="ui-field" id="uth" ></div></td>					    
						</tr>
						<tr>
						    <td >${i18n.gongysdm}</td>
							<td ><div class="ui-field" id="gongysdm" ></div></td>
							<td >${i18n.gongysmc}</td>
							<td ><div class="ui-field" id="gongysmc" ></div></td>
						    <td >${i18n.pich}</td>
							<td ><div class="ui-field" id="pich" ></div></td>
					    </tr>
						<tr>
						    <td >${i18n.lingjbh}</td>
						    <td ><div class="ui-field" id="lingjbh" ></div></td>
							<td >${i18n.lingjmc}</td>
							<td ><div class="ui-field" id="lingjmc" ></div></td>
							<td >${i18n.chuangjrq}</td>
						    <td ><div class="ui-field" id="chuangjrq" ></div></td>					    
						</tr>
						<tr>
						    <td >${i18n.yanssl}</td>
						    <td ><div class="ui-field" id="yanssl" ></div></td>
							<td >${i18n.jiessl}</td>
							<td ><div class="ui-field" id="lingjsl" ></div></td>
							<td >${i18n.danw}</td>
						    <td ><div class="ui-field" id="danw" ></div></td>					    
						</tr>
						<tr>
						    <td >${i18n.uaxh}</td>
						    <td ><div class="ui-field" id="uaxh" ></div></td>
						    <!-- huxy_11460 -->
							<td>${i18n.cangkbh}</td>
							<td><div class="ui-field" id="ckandzick" ></div></td>	
							<td >${i18n.uarl}</td>
							<td ><div class="ui-field" id="uarl" ></div></td>
						</tr>
					</tbody>
				</table>
			</div>	
			<div id="grid_user_${pageId}" ></div>
			<div id='prompt'>${i18n.prompt}</div>
		</div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>