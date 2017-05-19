<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","111");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_111 }</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
			$(function(){
			$('#form_user_${pageId}').form({
				onload : true,
					fields:[
						{fieldType:'fieldText',property:'jusdh',dataType:'jusdh',notNull:true,caption:'${i18n.jusdh}'},
						{fieldType:'fieldHidden',property:'jusdh1'}
					]
				});
			$('#form_div_${pageId}').form({
					fields:[
						{fieldType:'fieldLabel',property:'chengysdm'},
						{fieldType:'fieldLabel',property:'chengysmc'},
						{fieldType:'fieldLabel',property:'kach'},
						{fieldType:'fieldLabel',property:'jiesr'},
						{fieldType:'fieldLabel',property:'caozy'}
					]
				});
			$('#form_div_${pageId}').hide();
			$('#grid_user_${pageId}').grid({
					keyFields:['jusgzdh'],
					id:'grid_user_${pageId}',
					showCheckbox:true,
					src:'<%=request.getContextPath()%>/shouhuo/11101.do',
					cols:[
						{property:'jusgzdh',caption:'${i18n.jusgzdh}'},
				  		{property:'lingjbh',caption:'${i18n.lingjbh}'},
						{property:'lingjmc',caption:'${i18n.lingjmc}'},
					 	{property:'jusljs',caption:'${i18n.lingjsl}'},
						{property:'chengysdm',caption:'${i18n.chengysdm}'},
						{property:'chengysmc',caption:'${i18n.chengysmc}'},
						{property:'gongysdm',caption:'${i18n.gongysdm}'},
						{property:'xiehd',caption:'${i18n.shouhzt}'},
						{property:'caozy',caption:'${i18n.caozy}'},
						{property:'create_time',caption:'${i18n.gengzdscrq}'}
				    ],
				buttons:[
			   	 	{name:'search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
					   	 	if(!$('#form_user_${pageId}').form("validateParam")){
								return;
							}
				   	 		var params = $('#form_user_${pageId}').form("getFormParam");
					   	 	params.push("currentPage=1");
							//设置分页条件
							$('#grid_user_${pageId}').grid("setQueryParams", params);
				   			//$('#jusdhh').val($("#jusdh .value").val());
				   			var	 url = "<%=request.getContextPath()%>/shouhuo/11101.do";
			 			    $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
								 if (showPromptRequestMsg(results)==true){
									 if (results.result.response == "0001"){
											//加载返回数据
											$('#jusdh1 input').val($('#jusdh input').val());
											$('#kach span').html(results.result.parameter.kach);
											$('#jiesr span').html(results.result.parameter.jiesr);
											$('#caozy span').html(results.result.parameter.caozy);
											$('#chengysdm span').html(results.result.parameter.chengysdm);
											$('#chengysmc span').html(results.result.parameter.chengysmc);
											$("#grid_user_${pageId}").grid('parseResult',results);
											if (results.result.parameter.list.length > 0){
													$('#grid_user_${pageId}').grid('focus');
												}
											//存放查询条件
											var vQuery = $('#grid_user_${pageId}').grid('getQueryParams')
											vQuery.push("chengysdm="+results.result.parameter.chengysdm);
											vQuery.push("chengysmc="+results.result.parameter.chengysmc);
											vQuery.push("kach="+results.result.parameter.kach);
											vQuery.push("jiesr="+results.result.parameter.jiesr);
											vQuery.push("caozy="+results.result.parameter.caozy);
											vQuery.push("jusdh="+results.result.parameter.jusdh);
											$('#serachKey').val(vQuery);
											$('#form_div_${pageId}').show();
									 }
								 }
				         });
		    		return false;	
					}}
					,{name:'add',caption:'${i18n.add}[F2]',keyboard:'F2',action:function(){
					if(!$('#form_user_${pageId}').form("validateParam")){
								return;
						}
				   var params = $('#form_user_${pageId}').form("getFormParam");
				   var records= $('#form_div_${pageId}').form("getFormParam");
				   params=params.concat(records);
				   var url = "<%=request.getContextPath()%>/shouhuo/11102.do";
			 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
							 if (showPromptRequestMsg(results)==true){
										 if (results.result.response == "0001"){
												//加载返回数据
												var strJSON=JSON.stringify(results);
												$('#putvalue').val(strJSON);
												$("#putform").attr("action","<%=request.getContextPath()%>/shouhuo/11102ym.do"+st_Params);
					    			    		document.putform.submit();
										   }
									 }
						 	});
					}}
			   	 	,{name:'checked',caption:'${i18n.checked}[F4]',keyboard:'F4',action:function(){
			   	 			$('#grid_user_${pageId}').grid('selected');
					}}
				   	 ,{name:'selectall',caption:'${i18n.selectall}[F5]',keyboard:'F5',action:function(){
				   	 		$('#grid_user_${pageId}').grid('selectedAll');
					}}
					
					,{name:'delete',caption:'${i18n.delete}[F6]',keyboard:'F6',action:function(){
							var params= $('#grid_user_${pageId}').grid('getSelectedAll');
							if(params.length == 0){
								showMsg("${i18n.selectoneerror}");
								return false;
							}
							var jsdh = $('#jusdh1 input').val();
							params.push("jusdh="+jsdh);
							var	 url = "<%=request.getContextPath()%>/shouhuo/11104.do";
			 			    $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
							 if (showPromptRequestMsg(results)==true){
										$("#grid_user_${pageId}").grid('parseResult',results)
								 }
						 	});
						 return false;
					}}
					,{name:'dayjsd',caption:'${i18n.dayjsd}[F8]',keyboard:'F8',action:function(){
						var params =[];
						params.push("jusdh="+$('#jusdh1 input').val());
						var	 url = "<%=request.getContextPath()%>/shouhuo/11105.do";
			 			 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
							 if (showPromptRequestMsg(results)==true){
							 
							    }
						 });
					}}
					,{name:'back',caption:'${i18n.back}[F11]'}
					,{name:'return',caption:'${i18n.return}[F12]'}
				]
				});

			//加载时判断是否是回退
			$(document).ready(function(){
				if ( $('#serachKey').val()!=""){
					//为界面查询字段赋值
					var params = $('#serachKey').val().split(",");
					for(i=0;i<params.length;i++){
						var vParam = params[i].split("=");
						if (vParam[0].indexOf("jusdh") != -1){                   //拒收单号
							$('#jusdh input').val(vParam[1]);
							$('#jusdh1 input').val(vParam[1]);
							continue;
						}else if (vParam[0].indexOf("chengysdm") != -1){           //承运商代码
							$('#chengysdm span').html(vParam[1])
							continue;
						} else if (vParam[0].indexOf("chengysmc") != -1){             //承运商名称
							$('#chengysmc span').html(vParam[1])
							continue;
						} else if (vParam[0].indexOf("kach") != -1){        //卡车号
							$('#kach span').html(vParam[1])
							continue;
						}else if (vParam[0].indexOf("jiesr") != -1){        //卡车司机
							$('#jiesr span').html(vParam[1])
							continue;
						}else if (vParam[0].indexOf("caozy") != -1){        //操作员
							$('#caozy span').html(vParam[1])
							continue;
						}
					}
					$('#form_div_${pageId}').show();
					//设置分页条件
					$('#grid_user_${pageId}').grid("setQueryParams", params);
					//加载列表数据
					$('#grid_user_${pageId}').grid("load",params);
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
				<tbody>
					<tr>
						<td>${i18n.jusdh }:</td>
						<td><div class="ui-field" id="jusdh"></div></td>
						<td><div class="ui-field" id="jusdh1"></div></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="form_div_${pageId}" class="ui-fieldLayout" >
			<table class="ui-grid" cellspacing="1" width="100%">
				<tbody>
					<tr>
						<td>${i18n.chengysdm }:</td>
						<td><div class="ui-field" id="chengysdm"></div></td>
						<td>${i18n.chengysmc }:</td>
						<td><div class="ui-field" id="chengysmc"></div></td>
						<td>${i18n.kach }:</td>
						<td><div class="ui-field" id="kach"></div></td>
					</tr>
					<tr>
						<td>${i18n.jiesr }:</td>
						<td><div class="ui-field" id="jiesr"></div></td>
						<td>${i18n.caozy }:</td>
						<td><div class="ui-field" id="caozy"></div></td>
						<td></td>
						<td></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="grid_user_${pageId}"></div>
		<div id='prompt'>${i18n.prompt}</div>
	</div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>