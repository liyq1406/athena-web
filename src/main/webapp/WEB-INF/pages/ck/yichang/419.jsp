<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","419");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_419}</title>
<jsp:include page="../../common/js.jsp" />
<jsp:include page="../../common/print.jsp" />
<script type="text/javascript">
var paramsQuery;
var list =[];
/* var demorecord = "{'result':{'response':'0000''','parameter':{";
demorecord=demorecord+list[1];
demorecord=demorecord+"}}}";
alert(records); */
//var demorecord = {"result":{"response":"0000","trans_bran_code":"abc","seqno":0,"parameter":{"jiesckbh":"D000000001",cangkbh:st_Cangkbh,"pageSize":"10","list":[{"jiaofsj":"","lingjmc":"5","weiwcsl":-10,"shipsl":30,"lingjbh":"a01","jihy":"5","lux":"123","danw":"m","zhixsl":40},{"jiaofsj":"","lingjmc":"5","weiwcsl":100,"shipsl":100,"lingjbh":"a04","jihy":"5","lux":"123","danw":"m","zhixsl":0}],"shij":"2012-3-27","cangkbh":"C01","beihybh":"ck"}}};

$(function(){
	$('#form_user_${pageId}').form({
		onreload:true,
 		fields:[
                {fieldType:'fieldText',property:'fanxdh',dataType:'fanxdh',caption:'${i18n.fanxdh}',notNull:true},
                {fieldType:'fieldHidden',property:'fanxrkdh'}
	 			]
 		});
	
	$('#grid_user_${pageId}').grid({
		keyFields:['cangkbh','elh','lingjbh','lingjmc','lingjsl','fanxsl','gongysdm','gongysmc','chengysdm','danw','druksl','zhijsj'],
		id:'grid_user_${pageId}',
		showCheckbox:true,
		checkedOnlyOne:true,
		//翻页查询交易
		src:'<%=request.getContextPath()%>/yichang/41901.do',
		cols:[
		{property:'lingjbh',caption:'${i18n.lingjbh}',align:'center'},
		{property:'lingjmc',caption:'${i18n.lingjmc}',align:'center'},
		{property:'lingjsl',caption:'${i18n.fanxsl}',align:'center'},
		{property:'fanxsl',caption:'${i18n.fanxrksl}',align:'center'},
		{property:'druksl',caption:'${i18n.fanxdrksl}',align:'center'},
		{property:'danw',caption:'${i18n.danw}',align:'center'},
		{property:'gongysdm',caption:'${i18n.gongysdm}',align:'center'},
		{property:'gongysmc',caption:'${i18n.gongysmc}',align:'center'},
		{property:'cangkbh',caption:'${i18n.cangkbh}',align:'center'}
		],
		buttons:[
	 				//F1查询 
	 				{name:'btn_search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
	 			 		 //参数校验
	 			 		 if(!$('#form_user_${pageId}').form("validateParam")){
	 							return;	
	 			 		} 
	 			 		 //提交数据
	 			 		var params = $('#form_user_${pageId}').form("getFormParam");
	 			 		$('#grid_user_${pageId}').grid("setQueryParams", params);
	 			 		var url = "<%=request.getContextPath()%>/yichang/41901.do";
	 					 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
	 						 if (showPromptRequestMsg(results)==true){
	 							//加载grid
	 								$('#grid_user_${pageId}').grid("parseResult",results);
	 								list=results.result.parameter.list;
	 								$('#fanxrkdh input').val("");
	 						 }
	 						 });
	 					return false;
	 				}},
	 				//F2修改
	 				{name:'btn_update',caption:'${i18n.update}[F2]',keyboard:'F2',action:function(){
	 			 		//是否选中
	 					var records = $('#grid_user_${pageId}').grid('getSelectedAll');
	 					if(records.length < 1){
	 						showPromptMsg('red','${i18n.selecterror}')
	 						return false;
	 					}
	 					//验证Grid的输入格式
	 			 		if (!$('#grid_user_${pageId}').grid("validate")){
	 			 			return false;
	 			 		}
	 					//存放查询条件
	 					var vQuery = $('#grid_user_${pageId}').grid('getQueryParams')
	 					$('#serachKey').val(vQuery);
	 			 		 //提交数据
	 			 		var params = $('#grid_user_${pageId}').grid('getSelectedAll');
	 					params.push("fanxdh="+$('#fanxdh input').val());
	 					params.push("fanxrkdh="+$('#fanxrkdh input').val());
	 			 		paramsQuery = jQuery.extend(true,[],params);
	 					//去掉List[0];
	 					for(i=0;i<params.length;i++){
	 						params[i]=params[i].toString().replace("list[0].","");
	 					}
	 					var lingjsl=params[2].split("=");
	 					var fanxsl=params[3].split("=");
	 					if(lingjsl[1]==fanxsl[1]){
	 						showPromptMsg('red','${i18n.bunquanbrk}');
	 					}else{
	 						var url = "<%=request.getContextPath()%>/yichang/41905.do";
	 						 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
	 							 if (showPromptRequestMsg(results)==true){
	 								 if (results.result.response == "0000"){
	 										//加载返回数据
	 										var strJSON=JSON.stringify(results);
	 										$('#putvalue').val(strJSON);
	 										$("#putform").attr("action","<%=request.getContextPath()%>/yichang/4190101.do"+st_Params);
	 							    		document.putform.submit();
	 								 }
	 							 }
	 							 });
	 					}
	 				}},
 				//单选
 				{name:'getSelected',caption:'${i18n.checked}[F4]',keyboard:'F4',action:function(){
 					$('#grid_user_${pageId}').grid('selected');
 					return false;
 				}},
 				//F5打印
 				{name:'btn_print',caption:'${i18n.print}[F5]',keyboard:'F5',action:function(){
 					if(!$('#fanxdh').fieldText('validateNotNull')){
 			 			return;
 			 		}
 					var params = $('#form_user_${pageId}').form("getFormParam");
 					var url = "<%=request.getContextPath()%>/yichang/41904.do";
 					$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
 						 if (showPromptRequestMsg(results)==true){
 						 	 if (results.result.response == "0000"){
								var params2=[];
								params2.push("usercenter="+st_UserCenter);
								params2.push("zhijqdh='"+ results.result.parameter.zhijqdh +"'");
								var url2 = "<%=request.getContextPath()%>/yichang/40805.do";
								g_isSub=0;
								doprint(408,params2,url2);
	 							$('#form_user_${pageId}').form('clearValue');
	 							$('#grid_user_${pageId}').grid('clearRecords');								
							 }
 						 }
 					});
 				}},
 				{name:'btn_back',caption:'${i18n.back}[F11]',keyboard:'F11'},
 				{name:'btn_return',caption:'${i18n.return}[F12]',keyboard:'F12'} 				
 				]
	});

	
	//加载时判断是否是回退
	$(document).ready(function(){
		var fanxd='${result.result.parameter.fanxdh}';
		//加载返回数据
		if(fanxd!=""){
			$('#fanxdh input').val('${result.result.parameter.fanxdh}');
			$('#fanxdh input').attr('defaultValue','${result.result.parameter.fanxdh}')
			$('#fanxrkdh input').val('${result.result.parameter.fanxrkdh}');
			$('#fanxrkdh input').attr('defaultValue','${result.result.parameter.fanxrkdh}')
			//加载返回数据
			paramsQuery = $('#form_user_${pageId}').form("getFormParam");
			//设置查询条件
			$('#grid_user_${pageId}').grid("setQueryParams", params);
			$('#grid_user_${pageId}').grid("load",paramsQuery,function(results){
                 if(showPromptRequestMsg(results)){
					showPromptMsg('red','${i18n.danjsxh}')
                 }
            });
		} else {
			if ( $('#serachKey').val()!=""){
				//为界面查询字段赋值
				var params = $('#serachKey').val().split(",");
				for(i=0;i<params.length;i++){
					var vParam = params[i].split("=");
					if (vParam[0].indexOf("fanxdh") != -1){                   //任务编号
						$('#fanxdh input').val(vParam[1])
						continue;
					}else if (vParam[0].indexOf("fanxrkdh") != -1){       //返修入库单号
						$('#fanxrkdh input').val(vParam[1])
						continue;
					} else if (vParam[0].indexOf("currentPage") != -1){       //页码
						currentPage = vParam[1]
						continue;
					}
				}
				//移除当前页码
				params.splice(params.length-1,1);
				//设置分页条件
				$('#grid_user_${pageId}').grid("setQueryParams", params);
				//加载列表数据
				$('#grid_user_${pageId}').grid("load",params,function(results){
	                 if(showPromptRequestMsg(results)){
	
	                 }
	            });
			}
		}
	});
	
 	$(document).keyboardsupport({});
});
</script>
</head>
<body>
<div style="padding:20px;">
<!--主体内容开始-->
<div id="title"></div>
<input id="serachKey" name="serachKey" type="Hidden"></input>
			<form id="putform" method="post" name="putform">
				<input id="putvalue" name="putvalue" type="Hidden"></input>
			</form> 
<div id="form_user_${pageId}" class="ui-fieldLayout">
<table class="ui-grid" cellspacing="1" width="100%">
      <tr>
		<td class="field-label">${i18n.fanxdh}：</td>
		<td class="field-container"><div class="ui-field" id="fanxdh"></div>
		<div class="ui-field" id="fanxrkdh"></div>
		</td>		
      </tr>
  </table>
</div>
<div id="grid_user_${pageId}" class='hidden-item'></div> 
<div id='prompt'>${i18n.prompt}</div>	    		    		    
</div>		    
</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>