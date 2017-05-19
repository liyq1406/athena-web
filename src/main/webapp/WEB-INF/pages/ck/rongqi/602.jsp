<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","602");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_602}</title>
<jsp:include page="../../common/js.jsp" />
<script type="text/javascript">
var paramsQuery;
var currentPage = 1;
$(function(){
	$('#form_user_${pageId}').form({
		onreload:true,
 		fields:[
                {fieldType:'fieldLabel',property:'wuld',caption:'${i18n.rongqiq}',value:st_Rongqcbh},
				{fieldType:'fieldText',property:'usfhdh',dataType:'beihdh',caption:'${i18n.usfhdh}',notNull:false},
				//{fieldType:'fieldText',property:'usercenter',dataType:'letter_numeric',limitedLength:'2',limitedLength2:'3',caption:'${i18n.usercenter}',notNull:false},
				{fieldType:'fieldText',property:'chexyy',maxLength:'20',caption:'${i18n.chexyy}',notNull:false},
				{fieldType:'fieldText',property:'caozy',dataType:'laiy',maxLength:'10',caption:'${i18n.caozr}',notNull:false,value:st_UserName},
				{fieldType:'fieldText',property:'zhizs',maxLength:'35',caption:'${i18n.zhizs}',notNull:false},			
				{fieldType:'fieldSelect',property:'danjlx',caption:'${i18n.danjlx}',notNull:true,internation:true,src:'<%=request.getContextPath()%>/common/danjlxx.do'},
	 			]
 		});
	$('#grid_user_${pageId}').grid({
		keyFields:['usfhdh','usercenter','wuld','zhizs'],
		id:'grid_user_${pageId}',
		showCheckbox:true,
		//翻页查询交易
		src:'<%=request.getContextPath()%>/rongqi/60201.do',
		cols:[
		{property:'usfhdh',caption:'${i18n.usfhdh}'},
  		{property:'usercenter',caption:'${i18n.usercenter}'},
  		{property:'wuld',caption:'${i18n.rongqiq}'},
  		{property:'creator',caption:'${i18n.caozy}'},
  		{property:'create_time',caption:'${i18n.caozsj}'},
  		//{property:'zhizs',caption:'${i18n.zhizs}'}
  		],
  		buttons:[
 				//查询
 				{name:'btn_search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
 			 		 //参数校验
 			 		if(!$('#form_user_${pageId}').form("validateParam")){
 							return;	
 			 		} 		 
 			 		 //提交数据
 			 		var params = $('#form_user_${pageId}').form("getFormParam");
 					params.push("currentPage="+currentPage);
 					params.push("danjlx="+$('#danjlx input').attr("realValue"));
 					$('#grid_user_${pageId}').grid("setQueryParams", params);
 			 		var url = "<%=request.getContextPath()%>/rongqi/60201.do";
 					 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
 						 if (showPromptRequestMsg(results)==true){
 							 $('#grid_user_${pageId}').grid("parseResult",results)
 							
 						 }
 						 });
 				}},
 				//查看
 				{name:'info',caption:'${i18n.info}[F2]',keyboard:'F2',action:function(){
 					var params = $('#grid_user_${pageId}').grid('getSelectedAll');
 					//params应为表格的keyFields个数
                    if(params.length != 4){
                        showPromptMsg('red','${i18n.selecterror}');
                        return false;
                    }
 					//存放查询条件
 					var vQuery = $('#grid_user_${pageId}').grid('getQueryParams');
 					vQuery.push("danjlxxx="+$('#danjlx input').val());
 					
 					vQuery.push("currentPage="+currentPage);
 					$('#serachKey').val(vQuery);
 	                //页面数据提交并跳转，判断盘点方式，打开不同的查看页面
 					params.push("currentPage=1");
 					//去掉List[0];
 					for(i=0;i<params.length;i++){
 						params[i]=params[i].toString().replace("list[0].","");
 					}
 				
 					var url = "<%=request.getContextPath()%>/rongqi/60202.do";
 					 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
 						 if (showPromptRequestMsg(results)==true){
 							 if (results.result.response == "0000"){
									//加载返回数据
									var strJSON=JSON.stringify(results);
									$('#putvalue').val(strJSON);
									$("#putform").attr("action","<%=request.getContextPath()%>/rongqi/6020101.do"+st_Params+"&danjlx="+$('#danjlx input').attr('realValue'));
		    			    		document.putform.submit();
								 }
 						 }
 						 });
 					return false;
 				}},
 				//撤销
 				{name:'btn_chexiao',caption:'${i18n.repeal}[F3]',keyboard:'F3',action:function(){
 			 		var records = $('#grid_user_${pageId}').grid('getSelectedAll');
 					if(records.length < 1){
 						showPromptMsg('red','${i18n.selectoneerror}')
 						return false;
 					}
 			 		if(!$('#chexyy').fieldText('validateNotNull')){
 			 			return;
 			 		}
 			 		if(!$('#caozy').fieldText('validateNotNull')){
 			 			return;
 			 		}
 			 		//打开提示框是否删除
 					if(confirm($.sdcui.resource.i18n['C_remove'])){
 			 		 //提交数据
 			 		var params = $('#grid_user_${pageId}').grid('getSelectedAll');
 			 		params.push("danjlx="+$('#danjlx input').attr("realValue"));
 			 		paramsQuery = jQuery.extend(true,[],params);
 					params.push("currentPage="+currentPage);
 					params.push("chexyy="+$('#chexyy input').val());
 					params.push("caozy="+$('#caozy input').val());
 					params.push("usfhdh="+$('#usfhdh input').val());
 					params.push("wuld="+$('#wuld span').html());
 					//params.push("zhizs="+$('#zhizs input').val());
 					params.push("usercenter="+$('#usercenter input').val());
 					
 			 		var url = "<%=request.getContextPath()%>/rongqi/60203.do";
 					 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
 						 if (showPromptRequestMsg(results)==true){
 							 $('#grid_user_${pageId}').grid("parseResult",results)
 						 }
 						 });
 					}
 				}},
 				//单选
 				{name:'checked',caption:'${i18n.checked}[F4]',keyboard:'F4',action:function(){
 					$('#grid_user_${pageId}').grid('selected');
 					return false;
 				}},
 				//回退
 				{name:'btn_back',caption:'${i18n.back}[F11]',keyboard:'F11'},
 				//返回
 				{name:'btn_return',caption:'${i18n.return}[F12]',keyboard:'F12'} 				
   	   ]
	});	 	
//加载时判断是否是回退
$(document).ready(function(){
	if ( $('#serachKey').val()!=""){
		//为界面查询字段赋值
		var params = $('#serachKey').val().split(",");
		for(i=0;i<params.length;i++){
			var vParam = params[i].split("=");
			if (vParam[0].indexOf("usfhdh") != -1){             
				$('#usfhdh input').val(vParam[1])
				continue;
			} else if (vParam[0].indexOf("wuld") != -1){           
				$('#wuld span').html(vParam[1])
				continue;
			} else if (vParam[0].indexOf("danjlxxx") != -1){             
				$('#danjlx input').val(vParam[1])
				continue;
			} else if (vParam[0].indexOf("danjlx") != -1){   
				$('#danjlx input').attr("realValue",vParam[1])
				continue;
			}else if (vParam[0].indexOf("zhizs") != -1){             
				$('#zhizs input').val(vParam[1])
				continue;
			} else if (vParam[0].indexOf("usercenter") != -1){   
				$('#usercenter input').val(vParam[1])
				continue;
			}else if (vParam[0].indexOf("chexyy") != -1){        
				$('#chexyy input').val(vParam[1])
				continue;
			} else if (vParam[0].indexOf("currentPage") != -1){ 
				currentPage = vParam[1]
				continue;
			}
		}
		//移除当前页码
		params.splice(params.length-1,1);
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
<!--主体内容开始-->
<div id="title"></div>
<input id="serachKey" name="serachKey" type="Hidden"></input>
			<form id="putform" method="post" name="putform">
				<input id="putvalue" name="putvalue" type="Hidden"></input>
			</form> 
<div id="form_user_${pageId}" class="ui-fieldLayout" >
<table class="ui-grid" cellspacing="1" width="100%">
      <tr>
        <td class="field-label">${i18n.rongqiq}：</td>
		<td class="field-container"><div class="ui-field" id="wuld"></div></td>
		<td class="field-label">${i18n.usfhdh}：</td>
		<td class="field-container"><div class="ui-field" id="usfhdh"></div></td>
		<td class="field-label">${i18n.chexyy}：</td>
		<td class="field-container"><div class="ui-field" id="chexyy"></div></td>
      </tr>
      <tr>
		<!--<td class="field-label">${i18n.usercenter}：</td>
		<td class="field-container"><div class="ui-field" id="usercenter"></div></td>-->
		<td class="field-label">${i18n.caozr}：</td>
		<td class="field-container"><div class="ui-field" id="caozy"></div></td>
		<td class="field-label">${i18n.danjlx}：</td>
		<td class="field-container"><div class="ui-field" id="danjlx"></div></td>
		<td class="field-label"></td>
		<td class="field-container"></td>
      </tr>
  </table>  
<div id="grid_user_${pageId}" class='hidden-item'></div>
</div>
	
<div id='prompt'>${i18n.prompt}</div>
 	    
</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>