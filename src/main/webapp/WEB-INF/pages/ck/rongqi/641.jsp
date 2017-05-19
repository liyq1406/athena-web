<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","641");%>
<t:html i18n="i18n.ck">
<head>
<title>${i18n.title_641}</title>
<jsp:include page="../../common/js.jsp" />
<script type="text/javascript">
var temp =[];
var paramsQuery;
var currentPage = 1;
$(function(){
	$('#form_user_${pageId}').form({
		onemoredemand:true,
		onreload:true,
 		fields:[
 				{fieldType:'fieldLabel',property:'wuld',value:st_Rongqcbh},
 				{fieldType:'fieldSelect',property:'zhuangt',caption:'${i18n.zhuangt}',includeNull:true,internation:true,notNull:false,src:'<%=request.getContextPath()%>/common/rongqbglx.do'},				
                {fieldType:'fieldText',property:'danjbh',dataType:'shuzzm',maxLength:'10',caption:'${i18n.rongqbgdh}',notNull:false},
				{fieldType:'fieldText',property:'gongysdm',dataType:'shuzzm',maxLength:'10',caption:'${i18n.gongcbh}',notNull:false},
				//0010495
				//{fieldType:'fieldText',property:'gongcmc',dataType:'shuzzm',maxLength:'10',caption:'${i18n.gongcmc}',notNull:false},
	 			{fieldType:'fieldText',property:'chexyy',dataType:'laiy',maxLength:'20',caption:'${i18n.chexyy}',notNull:false}
	 			]
 		});
	$('#grid_user_${pageId}').grid({
		keyFields:['wuld','danjbh'],
		id:'grid_user_${pageId}',
		showCheckbox:true,
		//翻页查询交易
		src:'<%=request.getContextPath()%>/rongqi/64101.do',
		cols:[
		{property:'danjbh',caption:'${i18n.rongqbgdh}'},
  		{property:'wuld',caption:'${i18n.wuld}'},
  		{property:'gcbh',caption:'${i18n.gongcbh}'},
  		{property:'gongysmc',caption:'${i18n.gongcmc}'},  		
  		{property:'zhuangt',caption:'${i18n.rongqbgdzt}',internation:true},
  		{property:'chexyy',caption:'${i18n.chexyy}'}
  		]
	});
	//F1查询 
 	$('#btn_search').bind('click',function(){
 		 //参数校验
 		if(!$('#form_user_${pageId}').form("validateParam")){
				return;	
 		}
		
 		 //提交数据
 		var params = $('#form_user_${pageId}').form("getFormParam");
		params.push("currentPage="+currentPage);
		params.push("usercenter="+st_UserCenter); 
		params.push("wuld="+st_Rongqcbh); 	
		
		$('#grid_user_${pageId}').grid("setQueryParams", params);
 		var url = "<%=request.getContextPath()%>/rongqi/64101.do";
		 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 if (showPromptRequestMsg(results)==true){
				 $('#grid_user_${pageId}').grid("parseResult",results);
				 $('#chengysdm input').val(results.result.parameter.chengysdm);
				 $('#gongysdm input').val(results.result.parameter.gongysdm);
			 }
			 });
 	}); 
	//F2 查看明细
 	$('#info').bind('click',function(){				
         	//页面数据提交并跳转，判断盘点方式，打开不同的查看页面
        	var params = $('#grid_user_${pageId}').grid('getSelectedAll');
        	//获取选择行
			//params应为表格的keyFields个数
            if(params.length != 2){
                 showPromptMsg('red','${i18n.selecterror}');
                 return false;
            }
	        			
			params.push("currentPage=1");
			//去掉List[0];
			for(i=0;i<params.length;i++){
				params[i]=params[i].toString().replace("list[0].","");
			}
			
			var vQuery = $('#form_user_${pageId}').form("getFormParam");
				vQuery.push("zhuangtxx="+$('#zhuangt input').val());
				vQuery.push("wuld="+st_Rongqcbh);
			
			//var vQuery = $('#grid_user_${pageId}').grid('getQueryParams');
			
			$('#serachKey').val(vQuery);
								
		    //params = params.concat(Query);
			var url = "<%=request.getContextPath()%>/rongqi/64102.do";
			$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
				 if (showPromptRequestMsg(results)==true){
					 if (results.result.response == "0000"){					 						
						//加载返回数据
						var strJSON=JSON.stringify(results);
						$('#putvalue').val(strJSON);
						$("#putform").attr("action","<%=request.getContextPath()%>/rongqi/P64102.do"+st_Params);
			    		document.putform.submit();
					 }
				 }
				 });
			return false;
 	});
 				//撤销
 				
 				$('#btn_chexiao').bind('click',function(){	
 					var params = $('#grid_user_${pageId}').grid('getSelectedAll');
 					var params1 = $('#form_user_${pageId}').form("getFormParam");
 					
 					if(params.length != 2){
                     	showPromptMsg('red','${i18n.selecterror}');
                     	return false;
                    } 					
 					
 			 		if(!$('#chexyy').fieldText('validateNotNull')){
 			 			return;
 			 		}
 			 		//打开提示框是否删除
 					if(confirm($.sdcui.resource.i18n['C_remove'])){
						//去掉List[0];
						for(i=0;i<params.length;i++){
							params[i]=params[i].toString().replace("list[0].","");
						}
							
						params = params.concat(params1);
	 					params.push("usercenter="+st_UserCenter);
	 					
	 			 		var url = "<%=request.getContextPath()%>/rongqi/64103.do";
	 					$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
	 						 if (showPromptRequestMsg(results)==true){
	 							 $('#grid_user_${pageId}').grid("parseResult",results);
	 						 }
	 					});
 					}
 				});
	//F4 选中
 	$('#getSelected').bind('click',function(){
			$('#grid_user_${pageId}').grid('selected');
				return false;
 	});  
	 	
	 	
//加载时判断是否是回退
$(document).ready(function(){
if ( $('#serachKey').val()!=""){
					//为界面查询字段赋值
					var params = $('#serachKey').val().split(",");
					for(i=0;i<params.length;i++){
						var vParam = params[i].split("=");
						if (vParam[0].indexOf("wuld") != -1){                   //物理点
							$('#wuld input').val(vParam[1]);
							continue;
						}else if (vParam[0].indexOf("danjbh") != -1){                   //任务编号
							$('#danjbh input').val(vParam[1]);
							continue;
						} else if (vParam[0].indexOf("gongysdm") != -1){           //状态信息
							$('#gongysdm input').val(vParam[1]);
							continue;
						} else if (vParam[0].indexOf("chexyy") != -1){             //状态
							$('#chexyy input').val(vParam[1]);
							continue;
						}else if (vParam[0].indexOf("zhuangtxx") != -1){             //状态
							$('#zhuangt input').val(vParam[1]);
							continue;
						}else if (vParam[0].indexOf("zhuangt") != -1){   //状态信息
							//$('#zhuangt input').val(vParam[1])
							$('#zhuangt input').attr('realValue',vParam[1]); 
							continue;
						}
						
					}
					//移除库存状态信息
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
			<td class="field-label">${i18n.zhuangt}：</td>
		    <td class="field-container"><div class="ui-field" id="zhuangt"></div></td>
		    
		   	<td class="field-label">${i18n.rongqbgdh}：</td>
		    <td class="field-container"><div class="ui-field" id="danjbh"></div></td> 
		    
		    <td class="field-label">${i18n.wuld}：</td>
		    <td class="field-container"><div class="ui-field" id="wuld" ></div></td>		    
	  </tr>
      <tr>
	    <td class="field-label">${i18n.gongcbh}：</td>
		<td class="field-container"><div class="ui-field" id="gongysdm"></div></td>
		<td class="field-label">${i18n.chexyy}：</td>
		<td class="field-container"><div class="ui-field" id="chexyy"></div></td>			
	 </tr>
  </table>		
<br><div align=right>
	<span id="btn_search"  class="ui-button">${i18n.search}[F1]</span>
	<span id="info"  class="ui-button">${i18n.mingx}[F2]</span>	
	<span id="btn_chexiao"  class="ui-button">${i18n.repeal}[F3]</span>	
	<span id="getSelected"  class="ui-button">${i18n.checked}[F4]</span>
	<span id="btn_back"  class="ui-button">${i18n.back}[F11]</span>	
	<span id="btn_return"  class="ui-button">${i18n.return}[F12]</span>
</div><br/>
</div>
<div id="grid_user_${pageId}" class='hidden-item'></div>		
<div id='prompt'>${i18n.prompt}</div>
</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>