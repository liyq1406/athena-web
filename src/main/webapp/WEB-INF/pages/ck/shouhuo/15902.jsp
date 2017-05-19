<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","15902");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_15902}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
			$(function(){
			    //form  
				  //form  
				$('#form_user_${pageId}').form({
					fields:[
					{fieldType:'fieldText' , property:'ulh',caption:'${i18n.ulh}',dataType:'ulh',notNull:true}
					]
				}); 
					
				$('#form_info_${pageId}').form({
					fields:[
					{fieldType:'fieldLabel' , property:'ulh1',caption:'${i18n.ulh}'},
					{fieldType:'fieldLabel' , property:'uth',caption:'${i18n.uth}'},
					{fieldType:'fieldLabel' , property:'gongysdm',caption:'${i18n.gongysdm}'},
					{fieldType:'fieldLabel' , property:'gongysmc',caption:'${i18n.gongysmc}'},
					{fieldType:'fieldLabel' , property:'blh',caption:'${i18n.blh}'},
					{fieldType:'fieldLabel' , property:'maoz',caption:'${i18n.maoz}'},
					//huxy_11460
					{fieldType:'fieldLabel' , property:'cangkbh',caption:'${i18n.cangkbh}'},
					{fieldType:'fieldLabel' , property:'utscsj',caption:'${i18n.riq}'}
					]
				}); 
                // grid
               $('#grid_user_${pageId}').grid({
					id:'grid_user_${pageId}',
					keyFields:['elh','lingjbh','lingjsl','danw','utscsj','uss','cangkbh'],
					showNum:true,
					showCheckbox : true, // 显示复选框
					checkedOnlyOne : true, //是否单选
					src:'<%=request.getContextPath()%>/shouhuo/15902.do',
					cols:[
					{property:'elh',caption:'${i18n.elh}'},
					{property:'lingjbh',caption:'${i18n.lingjbh}'},
					{property:'lingjsl',caption:'${i18n.lingjsl}'},
					{property:'danw',caption:'${i18n.danw}'},
					{property:'utscsj',caption:'${i18n.ruksj}'},
					{property:'uss',caption:'${i18n.ussl}'},
					{property:'cangkbh',caption:'MAG'}

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
						   var url = "<%=request.getContextPath()%>/shouhuo/15902.do";
					 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
					 			 if (showPromptRequestMsg(results)==true){
					 			       $('#ulh1 span').html(results.result.parameter.ulh);
					 			       $('#uth span').html(results.result.parameter.uth);
					 			       $('#gongysdm span').html(results.result.parameter.gongysdm);
									   $('#gongysmc span').html(results.result.parameter.gongysmc);
									   $('#blh span').html(results.result.parameter.blh);
									   $('#maoz span').html(results.result.parameter.maoz);
									   $('#utscsj span').html(results.result.parameter.utscsj);
									   $('#blscsj span').html(results.result.parameter.blscsj);
					 			       $('#grid_user_${pageId}').grid('parseResult',results);
					 			        if (results.result.parameter.list.length > 0){
												$('#grid_user_${pageId}').grid('focus');
											}
					 			        $('#serachKey').val( results.result.parameter.ulh);
					 			    }
					 	    });
				    		return false;
					 	}}
					 	 //huxy_11459
					 	  ,{name:'print',caption:'${i18n.print}[F8]',keyboard:'F8',action:function(){
							var params = $('#form_info_${pageId}').form("getFormParam");
							var ulh = $('#ulh1 span').html();
							params.push("ulh="+ulh);
							var records = $('#grid_user_${pageId}').grid("getRecordAll");
							params=params.concat(records);
					 		var url = "<%=request.getContextPath()%>/shouhuo/15907.do";
					 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
					 		if (showPromptRequestMsg(results)==true){
									  
							}})
				    		return false;
				     	}}
                         ,{name:'getSelected',caption:'${i18n.checked}[F4]',keyboard:'F4',action:function(){
							$('#grid_user_${pageId}').grid('selected');
				    		return false;
				     	}}
                         ,{name:'utck',caption:'${i18n.utck}[F5]',keyboard:'F5',action:function(){
                         	var params=[];
                         	params.push("uth="+$('#uth span').html());
 	                        var url = "<%=request.getContextPath()%>/shouhuo/15901.do";
 	    			 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
 	    			 			 if (showPromptRequestMsg(results)==true){
 	    			 			    	if(results.result.response != 'C_1403'){
 	    					 				//加载返回数据
 	    									var strJSON=JSON.stringify(results);
 	    									$('#putvalue').val(strJSON);
 	    									$("#putform").attr("action","<%=request.getContextPath()%>/shouhuo/P15901.do"+st_Params);
 	    		    			    		document.putform.submit();
 	    		    			    	 }
 	    						 }
 	    					});
 	    					return false;
                         }}
                        ,{name:'elck',caption:'${i18n.elck}[F6]',keyboard:'F6',action:function(){
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
	                        var url = "<%=request.getContextPath()%>/shouhuo/15903.do";
	    			 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
	    			 			 if (showPromptRequestMsg(results)==true){
	    			 			    	if(results.result.response != 'C_1403'){
	    					 				//加载返回数据
	    									var strJSON=JSON.stringify(results);
	    									$('#putvalue').val(strJSON);
	    									$("#putform").attr("action","<%=request.getContextPath()%>/shouhuo/P15903.do"+st_Params);
	    		    			    		document.putform.submit();
	    		    			    	 }
	    						 }
	    					});
	    					return false;
                        }}
                       <%--  ,{name:'back',caption:'${i18n.back}[F11]',keyboard:'F11',action:function(){
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
				var ulh2 =$('#serachKey').val();
				if('${result}'!=''){
					var result = JSON.parse('${result}');
	                if('' != ulh2 && uth2 == result.result.parameter.ulh || ''==ulh2  ){
	                   $('#ulh1 span').html(result.result.parameter.ulh);
	                   //huxy_11460
					   $('#cangkbh span').html(result.result.parameter.cangkbh);
	 			       $('#uth span').html(result.result.parameter.uth);
	 			       $('#gongysdm span').html(result.result.parameter.gongysdm);
					   $('#gongysmc span').html(result.result.parameter.gongysmc);
					   $('#blh span').html(result.result.parameter.blh);
					   $('#maoz span').html(result.result.parameter.maoz);
					   $('#utscsj span').html(result.result.parameter.utscsj);
					   $('#blscsj span').html(result.result.parameter.blscsj);
				       $('#grid_user_${pageId}').grid('parseResult',result.result);
				       var params=[];
				       params.push("ulh="+$('#ulh1 span').html());
				       //设置分页条件
					   $('#grid_user_${pageId}').grid("setQueryParams", params);
				 }else{
			        var param2 = [];
					 param2.push("ulh="+ulh2);
					   //设置分页条件
					   $('#grid_user_${pageId}').grid("setQueryParams", params);
					   var url = "<%=request.getContextPath()%>/shouhuo/15902.do";
				 		$('#form_user_${pageId}').form("submitUrl", param2, url, function(results){
				 			 if (showPromptRequestMsg(results)==true){
				 			     if(results.result.response != 'C_1403'){
				 			       $('#ulh1 span').html(results.result.parameter.ulh);
				 			       $('#uth span').html(results.result.parameter.uth);
				 			       $('#gongysdm span').html(results.result.parameter.gongysdm);
								   $('#gongysmc span').html(results.result.parameter.gongysmc);
								   $('#blh span').html(results.result.parameter.blh);
								   $('#maoz span').html(results.result.parameter.maoz);
								   $('#utscsj span').html(results.result.parameter.utscsj);
								   $('#blscsj span').html(results.result.parameter.blscsj);
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
							<td >${i18n.ulh}</td>
							<td ><div class="ui-field" id="ulh" ></div></td>
						</tr>
					</tbody>
				</table>
			</div>	
			
			<div id="form_info_${pageId}" class="ui-fieldLayout">
				<table class="ui-grid" cellspacing="1" width="100%">
					<tbody >
						<tr>
						    <td >${i18n.ulh}</td>
							<td ><div class="ui-field" id="ulh1" ></div></td> 
							  <!-- huxy_11460 -->
							<td>${i18n.cangkbh}</td>
							<td><div class="ui-field" id="cangkbh" ></div></td>
						    <td >${i18n.uth}</td>
							<td ><div class="ui-field" id="uth" ></div></td>					    
						</tr>
						<tr>
						    <td >${i18n.gongysdm}</td>
							<td ><div class="ui-field" id="gongysdm" ></div></td>
							<td></td>
							<td></td>
						    <td >${i18n.gongysmc}</td>
							<td ><div class="ui-field" id="gongysmc" ></div></td>
						<tr>
						    <td >${i18n.blh}</td>
						    <td ><div class="ui-field" id="blh" ></div></td>
							<td >${i18n.maoz}</td>
							<td ><div class="ui-field" id="maoz" ></div></td>
							<td >${i18n.riq}</td>
						    <td ><div class="ui-field" id="utscsj" ></div></td>					    
						</tr>
					</tbody>
				</table>
			</div>	
			<div id="grid_user_${pageId}" ></div>
			<div id='prompt'>${i18n.prompt}</div>
		</div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>