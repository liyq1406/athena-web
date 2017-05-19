<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","147");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_147}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
			$(function(){
			   $('#grid_baoz_${pageId}').hide();
			    //form  
				$('#form_user_${pageId}').form({
					onreload:true,
					fields:[
						{fieldType:'fieldText' , property:'peislb',biaos:'enter',caption:'${i18n.ljpslb}',dataType:'letter_numeric',limitedLength:'4',notNull:true},
						{fieldType:'fieldText',property:'chanx',caption:'${i18n.chanx}'},
						{fieldType:'fieldText' ,property:'gongysdm',caption:'${i18n.peiss}',dataType:'letter_numeric',limitedLength:'10'},
						//{fieldType:'fieldText' , property:'xuh',biaos:'enter',caption:'${i18n.xuh}',dataType:'positive'}
					 ]
				}); 
                // grid
               $('#grid_user_${pageId}').grid({
                    keyFields:['yaohlh'],
					id:'grid_user_${pageId}',
					showCheckbox:true,
					src:'<%=request.getContextPath()%>/shouhuo/14701.do',
					cols:[
						{property:'yaohlh',caption:'${i18n.baozdykh}'},
						{property:'yaohlscsj',caption:'${i18n.baozscsj}'}

				     ],
				buttons:[
			   	 	{name:'search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
			   	 	   // $("#xuh input").val('');
			   	 	    $('#grid_user_${pageId}').grid('clearRecords');
					    if(!$('#form_user_${pageId}').form("validateParam")){
 			                return;
	 		              }
						  var params = $('#form_user_${pageId}').form("getFormParam");
						  params.push("currentPage=1");
						  //设置分页条件
						  $('#grid_user_${pageId}').grid("setQueryParams", params);
						   var  url = "<%=request.getContextPath()%>/shouhuo/14701.do";
						   $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
								 if (showPromptRequestMsg(results)==true){
								     if(results.result.response=="0001"){
										//加载返回数据
										$('#grid_baoz_${pageId}').hide();
										$('#grid_user_${pageId}').grid('parseResult',results);
										if (results.result.parameter.list.length > 0){
												$('#grid_user_${pageId}').grid('focus');
											}
										
									}
								 }
						 });
						    $('#btn_export').show();
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
					//F6导出
			   	 	,{name:'export',caption:'${i18n.export}[F6]',keyboard:'F6',action:function(){
                        var params=[];
				        var records = $('#grid_user_${pageId}').grid('getSelectedAll');
						if(records.length == 0){
							$('#prompt span').css('color','red').text("${i18n.selectoneerror}");
							return false;
						}
						$('#btn_export').hide();
						params.push("cangkbh="+st_Cangkbh);
						var str ="";
						 for(i=0;i<records.length;i++){
	                           str+="'"+(records[i].toString().replace("list[0].","")).split("=")[1]+"' ,";
	                        }
	                      str =str.substring(0,str.length -1);
						$('#putvalue').val(str);
                        $("#putform").attr("action","<%=request.getContextPath()%>/shouhuo/14703.do?"+params);
                        document.putform.submit();
                        return false;
					}}
					,{name:'info',caption:'${i18n.info}[F7]',keyboard:'F7',action:function(){
						  var records=$('#grid_user_${pageId}').grid('getSelectedAll');
					   	  	if(records.length !=1){
						   	  	showPromptMsg('red','${i18n.selecterror}');
						   	  	return false;
					   	  	} 
						   //去掉List[0];
	                        for(i=0;i<records.length;i++){
	                            records[i]=records[i].toString().replace("list[0].","");
	                        }
			   	 		 records.push("currentPage=1");
			   	 		 records.push("zhuangt=1");
			   	 		 //设置分页条件
						 $('#grid_baoz_${pageId}').grid("setQueryParams", records);
						 var  url = "<%=request.getContextPath()%>/shouhuo/15601.do";
						   $('#form_user_${pageId}').form("submitUrl", records, url, function(results){
								 if (showPromptRequestMsg(results)==true){
								     if(results.result.response=="0000"){
										//加载返回数据
										 $('#grid_baoz_${pageId}').show();
						                 $('#grid_user_${pageId}').hide();
										$('#grid_baoz_${pageId}').grid('parseResult',results);
									}
								 }
						 });
						
						 
					}}
				   ,{name:'print',caption:'${i18n.print}[F8]',keyboarad:'F8',action:function(){
				       var params=[];
				       var records = $('#grid_user_${pageId}').grid('getSelectedAll');
						if(records.length == 0){
							$('#prompt span').css('color','red').text("${i18n.selectoneerror}");
							return false;
						}
						params.push("cangkbh="+st_Cangkbh);
						params.push("usercenter="+st_UserCenter);
						params = params.concat(records);
						var url = "<%=request.getContextPath()%>/shouhuo/14702.do";
						$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
							  if (showPromptRequestMsg(results)==true){
							      
							      }
							      return false;
						 });
				       
				   
				   }}
				   ,{name:'back',caption:'${i18n.back}[F11]'}
		           ,{name:'return',caption:'${i18n.return}[F12]'}
				]}); 
				//包装grid
				$('#grid_baoz_${pageId}').grid({
					id:'grid_baoz_${pageId}',
					src:'<%=request.getContextPath()%>/shouhuo/15601.do',
					cols:[
						{property:'yaohlh',caption:'${i18n.baozdykh}',width:70},
						{property:'weiz',caption:'${i18n.weizh}',width:70},
						{property:'zhengclsh',caption:'${i18n.zhengclsh}',width:70},
						{property:'lingjbh',caption:'${i18n.lingjbh}',width:70},
						{property:'lingjmc',caption:'${i18n.lingjmc}',width:70},
						{property:'gongysdm',caption:'${i18n.gongysdm}',width:70},
						{property:'gongysmc',caption:'${i18n.gongysmc}',width:70},
						{property:'baozxh',caption:'${i18n.baozxh}',width:70},
						{property:'usxh',caption:'${i18n.baozrl}',width:70},
						{property:'zhengcsxsj',caption:'${i18n.shangxsj}',width:80},
						{property:'lingjsl',caption:'${i18n.lingjsl}',width:70},
						{property:'yaohlztxx',caption:'${i18n.yaohlzt}',internation:true,width:80},
						{property:'danw',caption:'${i18n.danw}',width:50}
				    ]
                ,buttons:[
					 {name:'fanh',caption:'${i18n.back}[F11]',keyboard:'F11',action:function(){
						 $('#grid_baoz_${pageId}').hide();
						 $('#grid_user_${pageId}').show();
						 msgClear();
					  }}
				]});
			  //配送类别回车事件
			  $('#peislb').bind('enter',function(){
					if(!$('#peislb').fieldText('validate')){ //校验配送类别
						    return ;
						}
					$('#chanx input').val('');
					var params=[];
					params.push("peislb="+$("#peislb input").val());
					params.push("cangkbh="+st_Cangkbh);
					var url = "<%=request.getContextPath()%>/common/Peislxchanx.do";
						$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
							  if (results.result.response=="0001"){
							      $('#chanx input').val(results.result.parameter.chanx);
							      }
							      return false;
						 });
						 msgClear();
			  });
			  $('#btn_export').hide();	
			  $(document).keyboardsupport({});
		});
		</script>
		
	</head>
	<body>
		<div style="padding:20px;">
			<div id="title"></div>
			<form id="putform" method="post" name="putform" >
			<input id="putvalue" name="putvalue" type="hidden"></input>
			<div id="form_user_${pageId}" class="ui-fieldLayout">
				<table class="ui-grid" cellspacing="1" width="100%">
					<tbody >
						<tr>
							<td align="right">${i18n.ljpslb}</td>
							<td align="left"><div class="ui-field" id="peislb" ></div></td>
							<td align="right">${i18n.chanx}</td>
							<td align="left"><div class="ui-field" id="chanx"></div></td>
							<td align="right">${i18n.peiss}</td>
							<td align="left"><div class="ui-field" id="gongysdm"></div></td>
						</tr>
					</tbody>
				</table>
			</div>
			</form>
			<div id="grid_user_${pageId}" ></div>
			<div id="grid_baoz_${pageId}"></div>
			<div id='prompt'>${i18n.prompt}</div>
		</div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>