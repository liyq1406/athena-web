<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","15901");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_15901}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
			$(function(){
			    //form  
				$('#form_user_${pageId}').form({
					fields:[
					{fieldType:'fieldText' , property:'uth',caption:'${i18n.uth}',dataType:'uth',notNull:true}
					]
				}); 
					
				$('#form_info_${pageId}').form({
					fields:[
					{fieldType:'fieldLabel' , property:'uth1',caption:'${i18n.uth}',dataType:'uth'}	,
					{fieldType:'fieldLabel' , property:'chengysmc',caption:'${i18n.chengysmc}'},
					{fieldType:'fieldLabel' , property:'cangkbh',caption:'${i18n.cangkbh}'},
					{fieldType:'fieldLabel' , property:'tch',caption:'${i18n.tch}'},
					{fieldType:'fieldLabel' , property:'utscsj',caption:'${i18n.xhrq}'},
					{fieldType:'fieldLabel' , property:'blscsj',caption:'${i18n.srrq}'}
					]
				}); 
                // grid
               $('#grid_user_${pageId}').grid({
					id:'grid_user_${pageId}',
					keyFields:['ulh','gongysdm','gongysmc','blh'],
					showNum:true,
					showCheckbox : true, // 显示复选框
					checkedOnlyOne : true, //是否单选
					src:'<%=request.getContextPath()%>/shouhuo/15901.do',
					cols:[
					{property:'ulh',caption:'${i18n.ulh}'},
					{property:'gongysdm',caption:'${i18n.gongysdm}'},
					{property:'gongysmc',caption:'${i18n.gongysmc}'},
					{property:'blh',caption:'${i18n.blh}'}
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
							
						   var url = "<%=request.getContextPath()%>/shouhuo/15901.do";
					 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
					 			 if (showPromptRequestMsg(results)==true){
					 			     if(results.result.response != 'C_1403'){
					 			       $('#uth1 span').html(results.result.parameter.uth);
									   $('#chengysmc span').html(results.result.parameter.chengysmc);
									   $('#tch span').html(results.result.parameter.tch);
									   $('#cangkbh span').html(results.result.parameter.cangkbh);
									   $('#utscsj span').html(results.result.parameter.utscsj);
									   $('#blscsj span').html(results.result.parameter.blscsj);
					 			       $('#grid_user_${pageId}').grid('parseResult',results);
					 			        if (results.result.parameter.list.length > 0){
												$('#grid_user_${pageId}').grid('focus');
											}
					 			       $('#serachKey').val( results.result.parameter.uth);
					 			       }
					 			    }
					 	    });
				    		return false;
					 	}}
					 	//huxy_11459
					 	  ,{name:'print',caption:'${i18n.print}[F8]',keyboard:'F8',action:function(){
							var params = $('#form_info_${pageId}').form("getFormParam");
							var uth = $('#uth1 span').html();
							params.push("uth="+uth);
							var records = $('#grid_user_${pageId}').grid("getRecordAll");
							params=params.concat(records);
					 		var url = "<%=request.getContextPath()%>/shouhuo/15906.do";
					 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
					 		if (showPromptRequestMsg(results)==true){
									  
							}})
				    		return false;
				     	}}

                     	,{name:'getSelected',caption:'${i18n.checked}[F4]',keyboard:'F4',action:function(){
							$('#grid_user_${pageId}').grid('selected');
				    		return false;
				     	}}
                        ,{name:'ulck',caption:'${i18n.ulck}[F6]',keyboard:'F6',action:function(){
                        	//判定是否有数据被选中 
        		    	    var params = $('#grid_user_${pageId}').grid('getSelectedAll');
        		    	   	if(params.length != 4 ){
        	 					$('#prompt span').css('color','red').text("${i18n.selecterror}");
        			  				return false;
        		  			}
        		    	    //去掉List[0];
	                        for(i=0;i<params.length;i++){
	                            params[i]=params[i].toString().replace("list[0].","");
	                        }
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
				var uth2 =$('#serachKey').val();
				if('${result}'!=''){
					var result = JSON.parse('${result}');
	                if('' != uth2 && uth2 == result.result.parameter.uth || ''==uth2  ){
					   $('#uth1 span').html(result.result.parameter.uth);
					   $('#chengysmc span').html(result.result.parameter.chengysmc);
					   $('#tch span').html(result.result.parameter.tch);
					   $('#cangkbh span').html(result.result.parameter.cangkbh);
					   $('#utscsj span').html(result.result.parameter.utscsj);
					   $('#blscsj span').html(result.result.parameter.blscsj);
				       $('#grid_user_${pageId}').grid('parseResult',result.result);
				       var params=[];
				       params.push("uth="+$('#uth1 span').html());
				       //设置分页条件
					  $('#grid_user_${pageId}').grid("setQueryParams", params);
				 }else{
			        var param2 = [];
					 param2.push("uth="+uth2);
					   //设置分页条件
					   $('#grid_user_${pageId}').grid("setQueryParams", params);
					   var url = "<%=request.getContextPath()%>/shouhuo/15901.do";
				 		$('#form_user_${pageId}').form("submitUrl", param2, url, function(results){
				 			 if (showPromptRequestMsg(results)==true){
				 			     if(results.result.response != 'C_1403'){
				 			       $('#uth1 span').html(results.result.parameter.uth);
								   $('#chengysmc span').html(results.result.parameter.chengysmc);
								   $('#tch span').html(results.result.parameter.tch);
								   $('#cangkbh span').html(results.result.parameter.cangkbh);
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
							<td >${i18n.uth}</td>
							<td ><div class="ui-field" id="uth" ></div></td>
						</tr>
					</tbody>
				</table>
			</div>	
			
			<div id="form_info_${pageId}" class="ui-fieldLayout">
				<table class="ui-grid" cellspacing="1" width="100%">
					<tbody >
						<tr>
						    <td >${i18n.uth}</td>
							<td ><div class="ui-field" id="uth1" ></div></td>
							<td >${i18n.chengysmc}</td>
							<td ><div class="ui-field" id="chengysmc" ></div></td>
							<td></td>						    
						</tr>
						<tr>
						    <td >${i18n.tch}</td>
						    <td ><div class="ui-field" id="tch" ></div></td>
							<td >${i18n.cangkbh}</td>
							<td ><div class="ui-field" id="cangkbh" ></div></td>					    
						</tr>
						<tr>
						    <td >${i18n.xhrq}</td>
						    <td ><div class="ui-field" id="utscsj" ></div></td>
							<td >${i18n.srrq}</td>
							<td ><div class="ui-field" id="blscsj" ></div></td>	
						</tr>
					</tbody>
				</table>
			</div>	
			<div id="grid_user_${pageId}" ></div>
			<div id='prompt'>${i18n.prompt}</div>
		</div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>