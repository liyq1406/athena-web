<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","411");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_411}</title>
<jsp:include page="../../common/js.jsp" />
<script type="text/javascript">
var paramsQuery;
var currentPage = 1;
$(function(){
	$('#form_user_${pageId}').form({
		onreload:true,
 		fields:[
                {fieldType:'fieldText',property:'zhijqdh',dataType:'zhijqdgzd',caption:'${i18n.zhijqdh}',notNull:false},
                {fieldType:'fieldText',property:'elh',dataType:'elh',caption:'${i18n.elh}',notNull:false},
                {fieldType:'fieldText',property:'lingjbh',dataType:'letter_numeric',limitedLength:'10',caption:'${i18n.lingjbh}',notNull:false},
                {fieldType:'fieldText',property:'gongysdm',dataType:'shuzzm',maxLength:'10',caption:'${i18n.gongysdm}',notNull:false},
                {fieldType:'fieldText',property:'pich',dataType:'shuzzm',maxLength:'12',caption:'${i18n.pich}',notNull:false},                
                {fieldType:'fieldSelect',property:'zhijz',caption:'${i18n.zhijz}',notNull:false,src:'<%=request.getContextPath()%>/common/zhijz.do'}
	 			]
 		});
	
	$('#grid_user_${pageId}').grid({
		keyFields:['elh','zhijqdh'],
		id:'grid_user_${pageId}',
		showCheckbox:true,
		//翻页查询交易
		src:'<%=request.getContextPath()%>/yichang/41101.do',
		cols:[
		{property:'zhijqdh',caption:'${i18n.zhijqdh}',align:'center'},
		{property:'elh',caption:'${i18n.elh}',align:'center'},
		{property:'lingjbh',caption:'${i18n.lingjbh}',align:'center'},
		{property:'lingjmc',caption:'${i18n.lingjmc}',align:'center'},
		{property:'lingjsl',caption:'${i18n.lingjsl}',align:'center'},	
		{property:'pich',caption:'${i18n.pich}',align:'center'},
        {property:'zhijz',caption:'${i18n.zhijz}',align:'center'},
        {property:'gongysdm',caption:'${i18n.gongysdm}',align:'center'},
		{property:'gongysmc',caption:'${i18n.gongysmc}',align:'center'},
		{property:'caozy',caption:'${i18n.caozy}',align:'center'}
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
  			 		var url = "<%=request.getContextPath()%>/yichang/41101.do";
  					$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
  						 if (showPromptRequestMsg(results)==true){
  							//加载返回数据
  							$('#grid_user_${pageId}').grid("parseResult",results)
  						 }
  					});
  					return false;
  				}},
		 	//修改
			{name:'update',caption:'${i18n.update}[F2]',keyboard:'F2',action:function(){
				//获取选择行
				var currPandfs=$('#grid_user_${pageId}').grid('getSelectedColumnValue','elh')
		        if(currPandfs.length!=1){
		        	showPromptMsg('red','${i18n.selecterror}')
					return false;
				}
				var Query= $('#form_user_${pageId}').form("getFormParam");
				//存放查询条件
				var vQuery = $('#grid_user_${pageId}').grid('getQueryParams')
				vQuery.push("zhijzxx="+$('#zhijz input').val());
				vQuery.push("currentPage="+currentPage);
				
                //页面数据提交并跳转，判断盘点方式，打开不同的查看页面
                var params = $('#grid_user_${pageId}').grid('getSelectedAll');
                //params.push("zhijqdh="+$("#zhijqdh input").val());
				params.push("currentPage=1");
				//去掉List[0];
				var zjqd = "",elh = "";
				for(i=0;i<params.length;i++){
					params[i]=params[i].toString().replace("list[0].","");
					var vParam = params[i].split("=");
 					if (vParam[0].indexOf("zhijqdh") != -1){                   //任务编号
 						zjqd = vParam[1];
 						continue;
					}
					if (vParam[0].indexOf("elh") != -1){                   //任务编号
 						elh = vParam[1];
 						continue;
					}
				}
				vQuery.push("zjqdhList=|"+zjqd+"|"+elh);
				$('#serachKey').val(vQuery);
		 		var url = "<%=request.getContextPath()%>/yichang/41102.do";
				 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
					 if (showPromptRequestMsg(results)==true){
						 if (results.result.response == "0000"){
								//加载返回数据
								var strJSON=JSON.stringify(results);
								$('#putvalue').val(strJSON);
								$("#putform").attr("action","<%=request.getContextPath()%>/yichang/4110101.do"+st_Params);
	    			    		document.putform.submit();
							 }
					 }
					 });
			}}
			//单选
			,{name:'getSelected',caption:'${i18n.checked}[F4]',keyboard:'F4',action:function(){
				$('#grid_user_${pageId}').grid('selected');
				return false;
			}},
			//F6打印
			{name:'btn_print',caption:'${i18n.printzjjsbg}[F6]',keyboard:'F6',action:function(){
				//获取选择行
				var params = $('#grid_user_${pageId}').grid('getSelectedAll');
		        if(params.length < 1){
		        	showPromptMsg('red','${i18n.selectoneerror}')
					return false;
				} 
				//存放查询条件
				var Query= $('#form_user_${pageId}').form("getFormParam");
				var vQuery = $('#grid_user_${pageId}').grid('getQueryParams')
				$('#serachKey').val(vQuery);
		 		var url = "<%=request.getContextPath()%>/yichang/41105.do";
				 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
					 if (showPromptRequestMsg(results)==true){
						 if (results.result.response == "0000"){
							var strJSON=JSON.stringify(results);
							$('#putvalue').val(strJSON);
					 		$("#putform").attr("action","<%=request.getContextPath()%>/yichang/4110202.do"+st_Params);
			    		    document.putform.submit();
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
 		if ( $('#serachKey').val()!=""){
 			//为界面查询字段赋值
 			var params = $('#serachKey').val().split(",");
 			for(i=0;i<params.length;i++){
 				var vParam = params[i].split("=");
 				if (vParam[0].indexOf("zhijqdh") != -1){                   //任务编号
 					$('#zhijqdh input').val(vParam[1])
 					continue;
 				} else if (vParam[0].indexOf("elh") != -1){           //状态信息
 					$('#elh input').val(vParam[1])
 					continue;
 				} else if (vParam[0].indexOf("pich") != -1){             //状态
 					$('#pich input').attr(vParam[1])
 					continue;
 				} else if (vParam[0].indexOf("lingjbh") != -1){        //生成库存时间
 					$('#lingjbh input').val(vParam[1])
 					continue;
 				} else if (vParam[0].indexOf("gongysdm") != -1){        //生成库存时间
 					$('#gongysdm input').val(vParam[1])
 					continue;
				} else if (vParam[0].indexOf("zhijzxx") != -1){        	//质检组信息
 					$('#zhijz input').val(vParam[1])
 					continue;
 				}else if (vParam[0].indexOf("zhijz") != -1){        	//质检组
 					$('#zhijz input').attr("realValue",vParam[1])
 					continue;
 				}else if (vParam[0].indexOf("currentPage") != -1){       //页码
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
 				var params = $('#serachKey').val().split(",");
 				for(i=0;i<params.length;i++){
 					var vParam = params[i].split("=");
 					if (vParam[0].indexOf("zjqdhList") != -1){
	 					var zjqdList = $('td.zhijqdh');
	 					for(var j=0; j<zjqdList.length; j++){
	 						var value = "|"+$('td.zhijqdh')[j].innerHTML+"|"+$('td.elh')[j].innerHTML;
	 						if (value==vParam[1] ){
	 							$($('td.checkbox')[j]).find(':input[type=checkbox]').attr('checked','checked');
	 							break;
	 						}
	 					}
 					}
 				}
 			}); 			
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
		<td class="field-label">${i18n.zhijqdh}/${i18n.zhijgzdh}：</td>
		<td class="field-container"><div class="ui-field" id="zhijqdh"></div></td>
	
		<td class="field-label">${i18n.elh}：</td>
		<td class="field-container"><div class="ui-field" id="elh"></div></td>
			<td class="field-label">${i18n.pich}：</td>
		<td class="field-container"><div class="ui-field" id="pich"></div></td>
      </tr>
       <tr>
		<td class="field-label">${i18n.lingjbh}：</td>
		<td class="field-container"><div class="ui-field" id="lingjbh"></div></td>
		<td class="field-label">${i18n.gongysdm}：</td>
		<td class="field-container"><div class="ui-field" id="gongysdm"></div></td>
		<td class="field-label">${i18n.zhijz}：</td>
		<td class="field-container"><div class="ui-field" id="zhijz"></div></td>
       </tr>
  </table> 	
</div> 
<div id="grid_user_${pageId}"></div>
<div id='prompt'>${i18n.prompt}</div>	    		    		    	    	    
 </div>   
</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>