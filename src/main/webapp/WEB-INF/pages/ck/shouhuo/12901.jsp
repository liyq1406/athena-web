<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","12901");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_12901}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
			$(function(){
			    //form  
				$('#form_user_${pageId}').form({
				    //onreload:true,
					fields:[
						{fieldType:'fieldText' , property:'yaohlh',dataType:'yaohlh',caption:'${i18n.baozdykh}',dataType:'yaohlh'},
						{fieldType:'fieldSelect' , property:'kajthbs',caption:'${i18n.shifth}',includeNull:true,src:'<%=request.getContextPath()%>/common/yesOrNo.do'},
			            {fieldType:'fieldHidden',property:'uth'},
						{fieldType:'fieldText' , property:'xuh',biaos:'enter',caption:'${i18n.xuh}',dataType:'plusinteger'}
					]
				}); 
                // UA_grid
               $('#grid_user_${pageId}').grid({
					keyFields:['uah','yaohlh','kajthbs'],
					id:'grid_user_${pageId}',
					src:'<%=request.getContextPath()%>/shouhuo/12903.do',
					cols:[
						{property:'yaohlh',caption:'${i18n.baozdykh}',dataType:'yaohlh'},
						{property:'uah',caption:'${i18n.uah}',dataType:'uah'},
						{property:'shangxsj',caption:'${i18n.shangxsj}'},
						{property:'shengcsj',caption:'${i18n.blscsj}'},
						{property:'kajthbsxx',caption:'${i18n.shifth}',internation:true},
						{property:'baozzt',caption:'${i18n.baozzt}',internation:true},
						{property:'blh',caption:'${i18n.bldh}'}
						
					]

				,buttons:[
			   	 	{name:'search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
						 //参数校验
						$("#xuh input").val('');
						$('#grid_user_${pageId}').grid('clearRecords');
				 		if(!$('#form_user_${pageId}').form("validateParam")){
	 			          return;
		 		          }
						var params = $('#form_user_${pageId}').form("getFormParam");
						params.push("currentPage=1");
						$('#grid_user_${pageId}').grid("setQueryParams", params);
						var url = "<%=request.getContextPath()%>/shouhuo/12903.do";
				 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
				 			if (showPromptRequestMsg(results)==true){
						 		   //加载返回数据
								   $('#grid_user_${pageId}').grid('parseResult',results);
								    if (results.result.parameter.list.length > 0){
												$('#grid_user_${pageId}').grid('focus');
											}
								   $('.hidden-item').show();     //显示序号
					           }
				         });
		    		return false;
		          }}
                  /* ,{name:'back',caption:'${i18n.back}[F11] ',keyboard:'F11',action:function(){
							//为文本绑定失去焦点事件
							var uiForm = $(document).find(".ui-fieldLayout");
							for(var i=0;i<uiForm.length;i++){
									//查找所有的input，判断值是否有改变
									var fieldElement = $(uiForm[i]).find('.ui-field');
									for(var j=0;j<fieldElement.length;j++){
										if ($(fieldElement[j]).find('input')){
											var defaultValue = $(fieldElement[j]).find('input').attr('defaultValue');
											var currentValue = $(fieldElement[j]).fieldValue();
											if (!defaultValue){
												if (currentValue.length > 0){
													st_BackCount = 0;
												}
											} else {
												if (defaultValue != currentValue){
													st_BackCount = 0;
												}
											}
										}
									}
								}
							//判断界面是刷新还是回退
							if (st_BackCount == 0){
								//重新加载当前页面
								var serachKey = $(document).find('input#serachKey');
								if(serachKey.length > 0){
									$(serachKey).val('');
								}
								 $('#form_user_${pageId}').form('clearValue');
								 $('#grid_user_${pageId}').grid('clearRecords');
								 msgClear();
								 st_BackCount = 1;
							} else {
								//返回上一页面
								history.go("-"+st_BackCount);
							}
						}} */
				 ,{name:'back',caption:'${i18n.back}[F11]'}
                 ,{name:'return',caption:'${i18n.return}[F12]'}
				]});
			
			 $('#grid_user2_${pageId}').grid({
					keyFields:['lingjbh'],
					hotkey:'grid1',
					id:'grid_user2_${pageId}',
					src:'<%=request.getContextPath()%>/shouhuo/12905.do',
					cols:[
						{property:'lingjbh',caption:'${i18n.lingjbh}',dataType:'lingjbh'},
						{property:'lingjmc',caption:'${i18n.lingjmc}'},
						{property:'gongysdm',caption:'${i18n.gongysdm}'},
						{property:'gongysmc',caption:'${i18n.gongysmc}'},
						{property:'lingjsl',caption:'${i18n.lingjsl}'},
						{property:'yanssl',caption:'${i18n.yanssl}'},
						{property:'danw',caption:'${i18n.danw}'}
						]						
				});

		 //点击序号回车事件
		 $("#xuh").bind('enter',function(event){
			 	var xuh=$("#xuh input").val();
 				var params = $('#grid_user_${pageId}').grid('getSelectedByRowNum',xuh);
  				if (params.length < 1){
		 			showPromptMsg('red','${i18n.selectederror}')
					return false;
		 		}
			 //页面数据提交并跳转，打开新的页面
			 params.push("currentPage=1");
			 //去掉List[0];
			 for(i=0;i<params.length;i++){
				params[i]=params[i].toString().replace("list[0].","");
			 }
			    params.push("uth="+$('#uth input').val());
				 var url = "<%=request.getContextPath()%>/shouhuo/12904.do";
				 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
				 			if (showPromptRequestMsg(results)==true){
				 		          if(results.result.response != 'C_1403'){	
									//加载返回数据
									var strJSON=JSON.stringify(results.result);
									var strJSON1=JSON.stringify(results.result2);
									$('#putvalue').val(strJSON);
									$('#putvalue1').val(strJSON1);						
									$("#putform").attr("action","<%=request.getContextPath()%>/shouhuo/P12902.do"+st_Params);
		    			    		document.putform.submit();
		    			    	 }
							 }
				 	});
			 	});
         //页面加载后，查询数据为界面赋值
	    $(document).ready(function(){
				$("#uth input").val('${result.parameter.uth}');
				
				//加载返回数据
				$('#grid_user_${pageId}').grid('parseResult',${result});
				$('#grid_user2_${pageId}').grid('parseResult',${result1});
				
				 var params = $('#form_user_${pageId}').form("getFormParam");
		        $('#grid_user_${pageId}').grid("setQueryParams", params);
		        $('#grid_user2_${pageId}').grid("setQueryParams", params);
				
			});
          
			  $(document).keyboardsupport({});
		});
		</script>
	</head>
	<body>
	<form id="putform" method="post" name="putform" >
			<input id="putvalue"   name="putvalue" type="hidden"></input>
			<input id="putvalue1"  name="putvalue1" type="hidden"></input>
			</form> 
		<div style="padding:20px;">
			<div id="title"></div>
			<div id="form_user_${pageId}" class="ui-fieldLayout">
				<table class="ui-grid" cellspacing="1" width="100%">
					<tbody >
						<tr>
							<td>${i18n.baozdykh }</td>
							<td><div class="ui-field" id="yaohlh" ></div></td>
							<td>${i18n.shifth}</td>
							<td><div class="ui-field" id="kajthbs"></div>
							<div class="ui-field" id="uth" ></div>
							</td>
						</tr>
						<tr class='hidden-item' id="xuh_div">
							<td colspan="2"></td>
							<td style="align:right">${i18n.xuh}</td>
							<td style="align:left"><div class="ui-field" id="xuh" style="align:center"></div></td>
						</tr>
					</tbody>
				</table>
				
				
			</div>
			<div id="grid_user_${pageId}" ></div>
			<div id="grid_user2_${pageId}" class='hidden-item'></div>
			<div id='prompt'>${i18n.prompt}</div>
		</div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>