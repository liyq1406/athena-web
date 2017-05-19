<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","174");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_174}</title>
<jsp:include page="../../common/js.jsp" />
<script type="text/javascript">
var paramsQuery;
var currentPage = 1;
//V4_039 卡车号限长输入8位 如 HBA12345  
$(function(){
	$('#form_user_${pageId}').form({
		onreload:true,
 		fields:[
                {fieldType:'fieldText',property:'huoch',dataType:'text',notNull:true,maxLength:'8',caption:'${i18n.huoch1}'},
				{fieldType:'fieldSelect',property:'zhuangt',notNull:true,value:$.sdcui.resource.i18n['C_ZHIJZT_1'],realValue:'2',caption:'${i18n.zhuangt}',internation:true,src:'<%=request.getContextPath()%>/common/kongcclx.do'}
	 			]
 		});
	
	$('#grid_user_${pageId}').grid({
		keyFields:['huoch','zhuangt','rongqfhdh'],
		id:'grid_user_${pageId}',
		showCheckbox:true,
		//翻页查询交易
		src:'<%=request.getContextPath()%>/clrc/17401.do',
		cols:[
		{property:'rongqfhdh',caption:'${i18n.danjbh}'},
  		{property:'huoch',caption:'${i18n.kch}'},
  		{property:'zhuangt',caption:'${i18n.zhuangt}',internation:true},
  		{property:'creator',caption:'${i18n.caozy}'},
  		{property:'create_time',caption:'${i18n.create_time}'}
  		],
  		buttons:[
 				//查询
 				{name:'btn_search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
 			 		 //参数校验
 			 		if(!$('#form_user_${pageId}').form("validateParam")){
 							return;	
 			 		} 
 			 		
 			 		
 			 		//$("#btn_btn_buda").attr("disabled",true);
 			 				 
 			 		 //提交数据
 			 		var params = $('#form_user_${pageId}').form("getFormParam");
 					params.push("currentPage="+currentPage);
 					
 					
 					//params.push("danjlx="+$('#danjlx input').attr("realValue"));
 					 $('#grid_user_${pageId}').grid("setQueryParams", params);
                     $('#grid_user_${pageId}').grid("load",params);
 					
 					/*
 			 		var url = "<%=request.getContextPath()%>/clrc/17401.do";
 					 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
 						 if (showPromptRequestMsg(results)==true){
 							 $('#grid_user_${pageId}').grid("parseResult",results); 							
 						 }
 						 });
 					*/
 						 
 						 
 				}},
 				//补打
 				{name:'btn_buda',caption:'${i18n.buda}[F2]',keyboard:'F2',action:function(){
 					var params = $('#grid_user_${pageId}').grid('getSelectedAll');
 					
 					
 					//params应为表格的keyFields个数
                    if(params.length != 3){
                        showPromptMsg('red','${i18n.selecterror}');
                        return false;
                    }
 					
 					//去掉List[0];
 					for(i=0;i<params.length;i++){
 						params[i]=params[i].toString().replace("list[0].","");
 					}
 					
 					if($('#zhuangt input').val() == "已撤销"){
 						showPromptMsg('red','该单据已撤销!');
 						 return false;
 					}
 					
 					var temp = params[2]; 					
 					var rongqfhdh=temp.replace("rongqfhdh=",""); 					
 					 					
 					window.location.href="<%=request.getContextPath()%>/clrc/P17401.do"+st_Params+"&rongqfhdh="+rongqfhdh;	
 					 				
 				}},
 				//撤销
 				{name:'btn_chexiao',caption:'${i18n.repeal}[F3]',keyboard:'F3',action:function(){
 			 		var records = $('#grid_user_${pageId}').grid('getSelectedAll');
 					if(records.length < 1){
 						showPromptMsg('red','${i18n.selectoneerror}')
 						return false;
 					}
 					
 					
 					/*
 			 		if(!$('#chexyy').fieldText('validateNotNull')){
 			 			return;
 			 		}
 			 		*/
 			 		
 			 		var zhuangt = $('#zhuangt input').val();
 			 		//alert (zhuangt);
 			 		
 			 		if(zhuangt=='已撤销'){
 					 	showPromptMsg('red',$.sdcui.resource.i18n['C_174_01']);
						return false;
 			 		}
 			 		
 			 		
 			 		//打开提示框是否删除
 					if(confirm($.sdcui.resource.i18n['C_cancel'])){
 			 		 //提交数据
 			 		//var params = $('#grid_user_${pageId}').grid('getSelectedAll');
 			 		
 			 		/*去掉List[0];
	                for(i=0;i<records.length;i++){
	                     records[i]=records[i].toString().replace("list[0].","");
	                }
	                */
	                        
 			 	   // paramsQuery = jQuery.extend(true,[],params);
 					var params = $('#form_user_${pageId}').form("getFormParam");
 					records=records.concat(params);
 			 		var url = "<%=request.getContextPath()%>/clrc/17402.do";
 					 $('#form_user_${pageId}').form("submitUrl", records, url, function(results){
 						 if (showPromptRequestMsg(results) ){
 						 
 							$('#grid_user_${pageId}').grid("parseResult",results); 
 						 	//$('#grid_user_${pageId}').grid('clearRecords');
 						 
 						 //girdload();
 						/*设置分页条件
					    $('#grid_user_${pageId}').grid("setQueryParams", params1);
                        $('#grid_user_${pageId}').grid("load",params1);
                        */
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
<div id="form_user_${pageId}" class="ui-fieldLayout" >
<table class="ui-grid" cellspacing="1" width="100%">
      <tr>
		<td class="field-label">${i18n.kch}：</td>
		<td class="field-container"><div class="ui-field" id="huoch"></div></td>
		
		<td class="field-label">${i18n.zhuangt}：</td>
		<td class="field-container"><div class="ui-field" id="zhuangt"></div></td>
      </tr>
      
  </table>  
<div id="grid_user_${pageId}" class='hidden-item'></div>
</div>
	
<div id='prompt'>${i18n.prompt}</div>
 	    
</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>