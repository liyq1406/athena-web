<%@ page language="java" pageEncoding="UTF-8"%>
<%request.setAttribute("pageId","326");%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_326}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
		var list="";
			$(function(){
				$('#grid_user_${pageId}').grid({
					keyFields:['dingdh'],
					id:'grid_user_${pageId}',
					showCheckbox:true,
					//查询交易
					src:'<%=request.getContextPath()%>/beihuo/32603.do',
					cols:[
						{property:'dingdh',caption:'${i18n.diaobdh}'},
						{property:'diaobsqdh',caption:'${i18n.diaobsqdh}'},
						{property:'cangkbh',caption:'${i18n.cangkbh}'},
						{property:'keh',caption:'${i18n.keh}'}, 
						{property:'shipsl',caption:'${i18n.shipsl}'},
						{property:'zhixsl',caption:'${i18n.zhixsl}'},
				  		{property:'weiwcsl',caption:'${i18n.weiwcl}'},
						{property:'diaobsj',caption:'${i18n.diaobsqsj}'},
						{property:'shifdj',caption:'${i18n.shifdcjf}'}
					],
					buttons:[
						//F1查询
						{name:'search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
				   	 	   	$('#grid_user_${pageId}').grid('clearRecords');
					   	 	if(!$('#form_user_${pageId}').form("validateParam")){
					     		return;
					     	}
					   	   var starttime=new Date(($('#diaobsj1 input').val()).replace(/-/g,"/"));
	                       var endtime=new Date(($('#diaobsj2 input').val()).replace(/-/g,"/"));
	                       if(endtime<starttime){
	                              showPromptMsg('red','${i18n.datetime_invalid}');
	                               return false;
	                          }
					 		var params = $('#form_user_${pageId}').form("getFormParam");
					 		params.push('beihybh=${userName}');
					 		//设置分页条件
							$('#grid_user_${pageId}').grid("setQueryParams", params);
							//加载数据
							$('#grid_user_${pageId}').grid("load",params, function(results){
								$('#serachKey').val(params);
					         });
				    		return false;
						}},
					   //明细
						{name:'info',caption:'${i18n.mingx}[F2]',keyboard:'F2',action:function(){
			                //选取列表中的数据 点击查看备货单明细
			                var params = $('#grid_user_${pageId}').grid('getSelectedAll');
			                if(params.length != 1 ){
        	 					$('#prompt span').css('color','red').text("${i18n.selecterror}");
        			  				return false;
        		  			}
							params.push("currentPage=1");
							//去掉List[0];
							for(i=0;i<params.length;i++){
								params[i]=params[i].toString().replace("list[0].","");
							}
							params.push('beihybh=${userName}');
		                	var url = "<%=request.getContextPath()%>/beihuo/32601.do";
					 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
					 			 if (showPromptRequestMsg(results)==true){
					 				if(results.result.response != "C_1403"){
						 				//加载返回数据
										var strJSON=JSON.stringify(results);
										$('#putvalue').val(strJSON);
										$("#putform").attr("action","<%=request.getContextPath()%>/beihuo/P32601.do"+st_Params);
			    			    		document.putform.submit();
					 				  }
								 }
							});
						 	 return false;
						}},
						//单选
						{name:'getSelected',caption:'${i18n.checked}[F4]',keyboard:'F4',action:function(){
							msgClear();
							$('#grid_user_${pageId}').grid('selected');
							return false;
						}},
						 //重新加载
                        {name:'back',caption:'${i18n.back}[F11]'},
                        //F12返回
                        {name:'return',caption:'${i18n.return}[F12]'}
					]				
				});
				
			 	$('#form_user_${pageId}').form({
			 		//onemoredemand:true,
			 		//url:'<%=request.getContextPath()%>/beihuo/32603.do',
			 		onreload:true,
			 		fields:[
							{fieldType:'fieldText',property:'diaobsqdh',dataType:'text',maxLength:'8',caption:'${i18n.diaobsqdh}'},
							{fieldType:'fieldText',property:'dingdh',dataType:'diaobdh',caption:'${i18n.diaobdh}' },
							{fieldType:'fieldText',property:'keh',caption:'${i18n.keh}',dataType:'keh'},
							{fieldType:'fieldText',property:'diaobsj1',caption:'${i18n.diaobsqsj}',dataType:'date',maskOptions:{mask:'9999-99-99'}},
							{fieldType:'fieldText',property:'diaobsj2',caption:'${i18n.diaobsqsj}',dataType:'date',maskOptions:{mask:'9999-99-99'}}
			 		]
			 	});
 			 	
			 	$(document).keyboardsupport({});
			 	
			 	 //加载时判断是否是回退
				$(document).ready(function(){
					if ( $('#serachKey').val()!=""){
						//为界面查询字段赋值
						var params = $('#serachKey').val().split(",");
						for(i=0;i<params.length;i++){
							var vParam = params[i].split("=");
							if (vParam[0].indexOf("dingdh") != -1){                   //
								$('#dingdh input').val(vParam[1])
								continue;
							} else if (vParam[0].indexOf("diaobsqdh") != -1){           //UT号
								$('#diaobsqdh input').val(vParam[1])
								continue;
							}else if (vParam[0].indexOf("keh") != -1){           //UT号
								$('#keh input').val(vParam[1])
								continue;
							}else if (vParam[0].indexOf("diaobsj1") != -1){           //UT号
								$('#diaobsj1 input').val(vParam[1])
								continue;
							}else if (vParam[0].indexOf("diaobsj2") != -1){           //UT号
								$('#diaobsj2 input').val(vParam[1])
								continue;
							} 
						}
						$('#grid_user_${pageId}').grid("setQueryParams", params);
						//加载列表数据
						$('#grid_user_${pageId}').grid("load",params);
					}
				});
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
							<td>${i18n.diaobsqdh}:</td>
							<td><div class="ui-field" id="diaobsqdh"></div></td>
							<td>${i18n.diaobdh}:</td>
							<td><div class="ui-field" id="dingdh"></div></td>
							<td>${i18n.keh}:</td>
							<td><div class="ui-field" id="keh"></div></td>
				       </tr>
				       <tr>			
				            <td>${i18n.diaobsqsj}:</td>
							<td><div class="ui-field" id="diaobsj1"></div></td>
							<td>${i18n.zhi}:</td>
							<td><div class="ui-field" id="diaobsj2"></div></td>
						</tr>
					</tbody>
				</table> 
			</div>
			<br></br>
			<div id="grid_user_${pageId}"></div>
			<br></br>
			<div id='prompt'>${i18n.prompt}</div> 
		</div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>