<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","153");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_153}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
			$(function(){
			   $('.hidden-item').hide(); //隐藏查找行
			    //form  
				$('#form_user_${pageId}').form({
				    onreload:true,
					fields:[
					{fieldType:'fieldSelect',property:'yaohlzt',caption:'${i18n.zhixzt}',includeNull:true,notNull:true,src:'<%=request.getContextPath()%>/common/yaohlzt.do?zhuangt=1&pageid=153',internation:true},
					{fieldType:'fieldText' , property:'xuh',biaos:'enter',caption:'${i18n.xuh}',dataType:'positive'}
					]
				}); 
                // grid
               $('#grid_user_${pageId}').grid({
                    keyFields:['yaohlh','yaohlzt'],
					id:'grid_user_${pageId}',
					src:'<%=request.getContextPath()%>/shouhuo/15301.do',
					cols:[
					{property:'yaohlh',caption:'${i18n.baozdykh}'},
					{property:'blh',caption:'${i18n.blh}'},
					{property:'peislb',caption:'${i18n.peislb}'},
					{property:'yaohlztxx',caption:'${i18n.zhixzt}',internation:true},
					{property:'shangxsj',caption:'${i18n.zuizsxsj}'},
					{property:'yaohlscsj',caption:'${i18n.chanssj}'},
					{property:'blscsj',caption:'${i18n.fassj}'},
					{property:'yanssj',caption:'${i18n.jiessj}'},
					{property:'yansy',caption:'${i18n.jiesr}'}

				],
				buttons:[
			   	 	{name:'search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
			   	 	    $("#xuh input").val('');
			   	 	    $('#grid_user_${pageId}').grid('clearRecords');
					    if(!$('#form_user_${pageId}').form("validateParam")){
 			                return;
	 		              }
						  var params = $('#form_user_${pageId}').form("getFormParam");
						  params.push("currentPage=1");
						  //设置分页条件
						  $('#grid_user_${pageId}').grid("setQueryParams", params);
						   var  url = "<%=request.getContextPath()%>/shouhuo/15301.do";
						   $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
								 if (showPromptRequestMsg(results)==true){
								    if(results.result.response == '0000'){
										//加载返回数据
										$('.hidden-item').show();     //显示grid
										$('#grid_user_${pageId}').grid('parseResult',results);
										 if (results.result.parameter.list.length > 0){
												$('#grid_user_${pageId}').grid('focus');
											}
										params.push("yaohlztxx="+$('#yaohlzt input').val());
										$('#serachKey').val(params);
									}
								 }
						 });
				    		return false;  	 
					}}
				   ,{name:'back',caption:'${i18n.back}[F11]'}
		           ,{name:'return',caption:'${i18n.return}[F12]'}
				]}); 
		//点击序号回车事件
		 $("#xuh").bind('enter',function(event){
			 	var xuh=$("#xuh input").val();
			 	var yaohlzt='';
 				var params = $('#grid_user_${pageId}').grid('getSelectedByRowNum',xuh);
 				if (params.length < 1){
		 			             showPromptMsg('red','${i18n.selectederror}')
					             return false;
		 		               }
 				//去掉List[0];
				for(i=0;i<params.length;i++){
					params[i]=params[i].toString().replace("list[0].","");
				}
				for(i=0;i<params.length;i++){
					var vParam = params[i].split("=");
					if (vParam[0].indexOf("yaohlzt") != -1){                   //零件编号
						yaohlzt=vParam[1] ;
						continue;
					}
			    }
				params.push("currentPage=1");
				var url1 = "<%=request.getContextPath()%>/shouhuo/15601.do";
 				var url2 = "<%=request.getContextPath()%>/shouhuo/15602.do";
			    var  url='';
				if('00' == yaohlzt){
				  url = url2;
				  $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
							 if (showPromptRequestMsg(results)==true){
								 if (results.result.response == "0000"){
										//加载返回数据
										var strJSON=JSON.stringify(results);
										$('#putvalue').val(strJSON);
										$("#putform").attr("action","<%=request.getContextPath()%>/shouhuo/15602ym.do"+st_Params);
			    			    		document.putform.submit();
								   }
									 }
						 	});
				}else{
				  url = url1
				  $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
						 if(showPromptRequestMsg(results)==true){
							 if (results.result.response == "0000"){
									//加载返回数据
									var strJSON=JSON.stringify(results);
									$('#putvalue').val(strJSON);
									$("#putform").attr("action","<%=request.getContextPath()%>/shouhuo/15203ym.do"+st_Params);
		    			    		document.putform.submit();
							    }
							}
						 });
				}
 				
			 	});
			//加载时判断是否是回退
			$(document).ready(function(){
				if ( $('#serachKey').val()!=""){
					//为界面查询字段赋值
					var params = $('#serachKey').val().split(",");
					for(i=0;i<params.length;i++){
						var vParam = params[i].split("=");
						if (vParam[0].toString()=="yaohlzt"){                   //blh
							$('#yaohlzt input').attr('realValue',vParam[1])
							continue;
						}else if(vParam[0].toString()=="yaohlztxx"){                   //blh
							$('#yaohlzt input').val(vParam[1])
							continue;
						}
					}
					//设置分页条件
					$('#grid_user_${pageId}').grid("setQueryParams", params);
					//加载列表数据
					$('#grid_user_${pageId}').grid("load",params);
					$('.hidden-item').show(); //显示查找行
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
				<table class="ui-grid" cellspacing="1" width="100%" align="center">
					<tbody >
						<tr >
							<td align="right">${i18n.zhixzt}</td>
							<td align="left"><div class="ui-field" id="yaohlzt" ></div></td>
						</tr>
						<tr class='hidden-item' id="xuh_div" >
								<td align="right" class='hidden-item'>${i18n.search}</td>
							<td align="left"  class='hidden-item'><div class="ui-field" id="xuh" style="float:left"></div><span>${i18n.hang}</span></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div id="grid_user_${pageId}"></div>
			<div id='prompt'>${i18n.prompt}</div>
		</div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>