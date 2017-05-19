<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","643");%>
<t:html i18n="i18n.ck">
<head>
<title>${i18n.title_643}</title>
<jsp:include page="../../common/js.jsp" />
<script type="text/javascript">
var paramsQuery;
var currentPage = 1;
$(function(){
	$('#form_user_${pageId}').form({
		onreload:true,
 		fields:[
                {fieldType:'fieldLabel',property:'wuld',value:st_Rongqcbh},
                {fieldType:'fieldSelect',property:'zhuangt',caption:'${i18n.rongqfhdzt}',includeNull:true,internation:true,notNull:false,src:'<%=request.getContextPath()%>/common/rongqbglx2.do'},
				//0010495
				{fieldType:'fieldText',property:'rongqfhdh',caption:'${i18n.rongqfhdh}',dataType:'shuzzm',maxLength:'10'},
				{fieldType:'fieldLabelInput',property:'caozy',value:'${userName}',dataType:'laiy',maxLength:'10'},
				{fieldType:'fieldText',property:'chengys',dataType:'shuzzm',maxLength:'10',caption:'${i18n.fanhs}'},
				{fieldType:'fieldText',property:'chexyy',maxLength:'50',caption:'${i18n.chexyy}'}				
				]
 		});
	$('#grid_user_${pageId}').grid({
		keyFields:['fanhs','fanhdh'],
		id:'grid_user_${pageId}',
		showCheckbox:true,
		//翻页查询交易
		src:'<%=request.getContextPath()%>/rongqi/64301.do',
		cols:[		
		{property:'fanhdh',caption:'${i18n.rongqfhdh}'},
		{property:'fanhdzt',caption:'${i18n.rongqfhdzt}',internation:true},
		{property:'fanhd',caption:'${i18n.rongqiq}'},		
		{property:'fanhs',caption:'${i18n.fanhs}'},		
  		{property:'fanhsmc',caption:'${i18n.fanhsmc}'},
  		{property:'caozy',caption:'${i18n.caozy}',width:50},
  		{property:'caozsj',caption:'${i18n.caozsj}',width:70},
  		{property:'chexyy',caption:'${i18n.chexyy}',width:150}  		
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
 		var url = "<%=request.getContextPath()%>/rongqi/64301.do";
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
            if(params.length < 2||params.length>2){
                 showPromptMsg('red','${i18n.selecterror}');
                 return false;
            }   
	        			
			params.push("currentPage=1");
			//去掉List[0];
			for(i=0;i<params.length;i++){							
				params[i]=params[i].toString().replace("fanhdh","rongqfhdh");	
				params[i]=params[i].toString().replace("list[0].","");				
			}
			
			
			
			var vQuery= $('#form_user_${pageId}').form("getFormParam");
				vQuery.push("zhuangtxx="+$('#zhuangt input').val());
				vQuery.push("wuld="+st_Rongqcbh);

			$('#serachKey').val(vQuery);
								
			var url = "<%=request.getContextPath()%>/rongqi/64302.do";
			$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
				 if (showPromptRequestMsg(results)==true){
					 if (results.result.response == "0000"){									
						//加载返回数据
						var strJSON=JSON.stringify(results);
						$('#putvalue').val(strJSON);
						$("#putform").attr("action","<%=request.getContextPath()%>/rongqi/P64302.do"+st_Params);
			    		document.putform.submit();
					 }
				 }
			});
			return false;
 	});
	//F3撤销
	$('#btn_chexiao').bind('click',function(){
	/*
	    var yuanyin = $('#chexyy input').val();
	    if(yuanyin==''){
	    	 showMsg("${i18n.C_643_08}");
			 return false;
	    }	
	 */
	
	    //页面数据提交并跳转，判断盘点方式，打开不同的查看页面
        var params = $('#grid_user_${pageId}').grid('getSelectedAll');
        
        
        if(params.length < 1){
			showPromptMsg('red','${i18n.selectoneerror}')
			return false;
		}
        
		    
        /* params应为表格的keyFields个数
           if(params.length < 2||params.length>2){
                 showPromptMsg('red','${i18n.selecterror}');
                 return false;
            } 
         */   
        params.push("currentPage=1");      
		/* 去掉List[0];
		for(i=0;i<params.length;i++){							
				params[i]=params[i].toString().replace("fanhdh","rongqfhdh");	
				params[i]=params[i].toString().replace("list[0].","");				
		}  
		*/      
		
		    var params2 = $('#form_user_${pageId}').form("getFormParam");
			//var chengys = $('#chengys input').val();
		  
		   // params.push("wuld="+st_Rongqcbh); 
			params.push("usercenter="+st_UserCenter); 
		    //params.push("chengys="+$('#chengys input').val()); 
		    //params.push("zhuangt="+$('#zhuangt input').val());
		   // params.push("rongqfhdh="+$('#rongqfhdh input').val());  
		
		   params=params.concat(params2);
		    
	
		//打开提示框是否删除
		if(confirm($.sdcui.resource.i18n['C_remove'])){	
		var url = "<%=request.getContextPath()%>/rongqi/64303.do";
		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 if (showPromptRequestMsg(results)==true){			 
				$('#grid_user_${pageId}').grid('parseResult',results);	
				// $('#grid_user_${pageId}').grid('clearRecords');
			    // $('#btn_search').click();
			 }
		});
		}
		return false;
	}); 
 	//F4 选中
 	$('#getSelected').bind('click',function(){
 		$('#grid_user_${pageId}').grid('selected');
			return false;
 	});
 	//F5 全选
 	$('#getSelectedAll').bind('click',function(){
 		$('#grid_user_${pageId}').grid('selectedAll');
			return false;
 	});
	$(document).keyboardsupport({});
	});
/**
 *进入643页面后进行查询
 */
$(document).ready(function(){
if ( $('#serachKey').val()!=""){
					//为界面查询字段赋值
					var params = $('#serachKey').val().split(",");
					for(i=0;i<params.length;i++){
						var vParam = params[i].split("=");
						if (vParam[0].indexOf("wuld") != -1){                   //物理点
							$('#wuld input').val(vParam[1]);
							continue;
						} else if (vParam[0].indexOf("danjbh") != -1){           //状态信息
							$('#danjbh input').val(vParam[1]);
							continue;
						} else if (vParam[0].indexOf("chengys") != -1){             //状态
							$('#chengys input').attr('realValue',vParam[1]);
							continue;
						}else if (vParam[0].indexOf("zhuangtxx") != -1){             //状态
							$('#zhuangt input').val(vParam[1]);
							continue;
						}else if (vParam[0].indexOf("zhuangt") != -1){   //状态明细
							$('#zhuangt input').attr('realValue',vParam[1]);      
							//$('#zhuangt input').val(vParam[1]);
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
</script>
</head>
<body>
<div id="title"></div>
<input id="serachKey" name="serachKey" type="Hidden"></input>
<form id="putform" method="post" name="putform">
	<input id="putvalue" name="putvalue" type="Hidden"></input>
</form> 
<div id="form_user_${pageId}" class="ui-fieldLayout" >
<table class="ui-grid" cellspacing="1" width="100%" >
<tbody>
	<tr>
		<td class="field-label">${i18n.rongqiq}：</td>
		<td class="field-container"><div class="ui-field" id="wuld" ></div></td>			
		
		<td class="field-label">${i18n.rongqfhdzt}：</td>
		<td class="field-container"><div class="ui-field" id="zhuangt"></div></td>
	</tr>
	<tr>
		<td class="field-label">${i18n.rongqfhdh}：</td>
		<td class="field-container"><div class="ui-field" id="rongqfhdh"></div></td>
		<td class="field-label">${i18n.caozy}：</td>
		<td class="field-container"><div class="ui-field" id="caozy"></div></td>		
	</tr>
	<tr>
		<td class="field-label">${i18n.fanhs}：</td>
		<td ><div class="ui-field" id="chengys"></div></td>	
		
		<td class="field-label">${i18n.chexyy}：</td>
		<td ><div class="ui-field" id="chexyy"></div></td>	
	</tr>
</tbody>
</table>
<br/>
<div align="right">		
	<span id="btn_search"  class="ui-button">${i18n.search}[F1]</span>
	<span id="info"  class="ui-button">${i18n.mingx}[F2]</span>
	<span id="btn_chexiao"  class="ui-button">${i18n.repeal}[F3]</span>	
	<span id="getSelected"  class="ui-button">${i18n.checked}[F4]</span>
	<span id="getSelectedAll"  class="ui-button">${i18n.selectall}[F5]</span>
	<span id="btn_back"  class="ui-button">${i18n.back}[F11]</span>	
	<span id="btn_return"  class="ui-button">${i18n.return}[F12]</span>
   </div>
   <br/>
<div id="grid_user_${pageId}" class='hidden-item'></div>
</div>
<div id='prompt'>${i18n.prompt}</div>
</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>