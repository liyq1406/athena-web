<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","178");%>
<!-- V4_022 -->
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_178 }</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
			$(function(){
				$('#grid_user_${pageId}').grid({
					keyFields:['jusgzdh','blh','uth'],
					id:'grid_user_${pageId}',
					showCheckbox:true,
					src:'<%=request.getContextPath()%>/shouhuo/15102.do',
					cols:[
						{property:'blh',caption:'${i18n.blh}'},
						{property:'uth',caption:'${i18n.uth}'},
						{property:'jusgzdh',caption:'${i18n.jusgzdh}'},
						{property:'lingjbh',caption:'${i18n.lingjbh}'},
						{property:'lingjmc',caption:'${i18n.lingjmc}'},
						{property:'lingjsl',caption:'${i18n.lingjsl}'},
						{property:'chengysdm',caption:'${i18n.chengysdm}'},
						{property:'chengysmc',caption:'${i18n.chengysmc}'},
						{property:'gongysdm',caption:'${i18n.gongysdm}'},
						{property:'caozy',caption:'${i18n.caozy}'},
						{property:'create_time',caption:'${i18n.create_time}'}
				    ],
				buttons:[
			   	 	{name:'search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
					   	 	if(!$('#form_user_${pageId}').form("validateParam")){
						   	 	$('#grid_user_${pageId}').grid('clearRecords');
								return;
							}
				   	 		var params = $('#form_user_${pageId}').form("getFormParam");
				   	 		params.push("currentPage=1");
							//设置分页条件
							$('#grid_user_${pageId}').grid("setQueryParams", params);
							$('#serachKey').val(params);
				   	 		 var  url = "<%=request.getContextPath()%>/shouhuo/15102.do";
						     $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
								 if (showPromptRequestMsg(results)==true){
									//加载返回数据
									$('#uth input').val(results.result.parameter.uth);
									$('#uth input').val(results.result.parameter.uth);
									$('#grid_user_${pageId}').grid('parseResult',results)
									 if (results.result.parameter.list.length > 0){
											$('#grid_user_${pageId}').grid('focus');
										}
									
								 }
						 });
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
				  ,{name:'tjddhtzd',caption:'${i18n.tjddhtzd}[F6]',keyboard:'F6',action:function(){
				            var params = $('#form_user_${pageId}').form("getFormParam");
				            var records = $('#grid_user_${pageId}').grid('getSelectedAll');
				            if(records.length < 1){
					      	 	showPromptMsg('red','${i18n.selectoneerror}')
					       		return false;
					       	}
							params=params.concat(records);
				   	 	    //params.push("xiehzt="+$('#xiehzt input').attr('realValue'));
							 var  url = "<%=request.getContextPath()%>/shouhuo/15103.do";
						     $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
								 if (showPromptRequestMsg(results)==true){
									//加载返回数据
									
									//0010868
									$('#blh input').val(results.result.parameter.blh);
									
									$('#grid_user_${pageId}').grid('parseResult',results)
									$("#xiehzt input").attr("disabled",true);
									$('#uth input').val(results.result.parameter.uth);
									 var param= [];
									 param.push("uth ="+results.result.parameter.uth);
									 param.push("blh ="+results.result.parameter.blh);
									 param.push("xiehzt ="+results.result.parameter.xiehzt);
									 $('#serachKey').val(param);
								 }
						 });
				    		return false;  	 
					}}
					,{name:'tzdjsd',caption:'${i18n.tzdjsd}[F7]',keyboard:'F7',action:function(){
				   	 	    var params = $('#form_user_${pageId}').form("getFormParam");
				   	 	    $('#serachKey').val(params);
							var  url = "<%=request.getContextPath()%>/shouhuo/15101.do";
							$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
				 			if (showPromptRequestMsg(results)==true){
		    			    	$('#blh input').val(results.result.parameter.blh);
								  if(results.result.response != 'C_1403'){
									var strJSON=JSON.stringify(results);
									$('#putvalue').val(strJSON);
									$("#putform").attr("action","<%=request.getContextPath()%>/shouhuo/P17801.do"+st_Params+"&cangkbh="+st_Cangkbh);
		    			    		document.putform.submit();
		    			    	  } 	 
		    			     }
				 	       });
				    	  return false;  	 
					}}
					,{name:'back',caption:'${i18n.back}[F11] '}
					,{name:'return',caption:'${i18n.return}[F12]'}
				]
				});
				
			
				$('#form_user_${pageId}').form({
					fields:[
						{fieldType:'fieldText',property:'chengysdm',dataType:'letter_numeric',limitedLength:'10'},
						{fieldType:'fieldText',property:'lingjbh',dataType:'letter_numeric',limitedLength:'10'},
						{fieldType:'fieldText',property:'gongysdm',dataType:'letter_numeric',limitedLength:'10'},
						{fieldType:'fieldText',property:'jusgzdh',dataType:'jusgzdh'},
						{fieldType:'fieldHidden',property:'uth'},
						{fieldType:'fieldSelect',property:'xiehzt',includeNull:true,notNull:true,src:'<%=request.getContextPath()%>/common/xiehzt.do?cangkbh='+st_Cangkbh,caption:'${i18n.xiehzt}'},
						{fieldType:'fieldText',property:'blh'}
					]
				});
				$(document).keyboardsupport({});
		});
		//进入页面后调用15101
		$(document).ready(function(){
			
		//0010868
		$("#blh input").attr('disabled',true);
		
		if ( $('#serachKey').val()!=""){
					//为界面查询字段赋值
					var params = $('#serachKey').val().split(",");
					for(i=0;i<params.length;i++){
						var vParam = params[i].split("=");
						if (vParam[0].indexOf("blh") != -1){                   //BL号
							$('#blh input').val(vParam[1])
							continue;
						} else if (vParam[0].indexOf("xiehzt") != -1){           //卸货站台
							$('#xiehzt input').val(vParam[1]);
			                $('#xiehzt input').attr("realValue",vParam[1]);
			                $("#xiehzt input").attr("disabled",true);
							continue;
						}else if (vParam[0].indexOf("uth") != -1){           //UT号
							$('#uth input').val(vParam[1])
							continue;
						}else if (vParam[0].indexOf("chengysdm") != -1){           //承运商代码
							$('#chengysdm input').val(vParam[1])
							continue;
						}else if (vParam[0].indexOf("lingjbh") != -1){           //零件编号
							$('#lingjbh input').val(vParam[1])
							continue;
						}else if (vParam[0].indexOf("gongysdm") != -1){           //供应商代码
							$('#gongysdm input').val(vParam[1])
							continue;
						}else if (vParam[0].indexOf("jusgzdh") != -1){           //拒收跟踪单号
							$('#jusgzdh input').val(vParam[1])
							continue;
						}
					}
					$('#grid_user_${pageId}').grid("setQueryParams", params);
					//加载列表数据
					$('#grid_user_${pageId}').grid("load",params);
					$('.hidden-item').show();     //显示序号
				}else{
				    var params =[] 		
			        var url = "<%=request.getContextPath()%>/shouhuo/15106.do";
			        params.push("usercenter="+st_UserCenter);
				    $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
					  if (showPromptRequestMsg(results)==true){
					       if(results.result.response != 'C_1403'){
							   $('#uth input').val(results.result.parameter.uth);
							   $('#blh input').val(results.result.parameter.blh); 
							   $('#xiehzt input').val(results.result.parameter.xiehzt);
				               $('#xiehzt input').attr("realValue",results.result.parameter.xiehzt);
				               $("#xiehzt input").attr("disabled",true);
				               $('#chengysdm input').addClass('field-tabed').focus();
				             }   
						  }
					      msgClear();
						  return false;
			        });
			}
	});
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
						    <td>${i18n.xiehzt }</td>
							<td><div class="ui-field" id="xiehzt"></div></td>
							<td>${i18n.chengysdm}</td>
							<td><div class="ui-field" id="chengysdm"></div></td>
							<td>${i18n.lingjbh}</td>
							<td><div class="ui-field" id="lingjbh"></div></td>
							<td><div class="ui-field" id="uth"></div></td>
						</tr>
						<tr>
							<td>${i18n.gongysdm}</td>
							<td><div class="ui-field" id="gongysdm"></div></td>
							<td>${i18n.jusgzdh}</td>
							<td><div class="ui-field" id="jusgzdh"></div></td>
							<td>${i18n.blh}</td>
							<td><div class="ui-field" id="blh"></div></td>
							
						</tr>
					</tbody>
				</table>
			</div>
			<div id="grid_user_${pageId}"></div>
		<div id='prompt'>${i18n.prompt}</div>
	  </div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>