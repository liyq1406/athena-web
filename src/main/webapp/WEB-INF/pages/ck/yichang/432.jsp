<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","432");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_432}</title>
<jsp:include page="../../common/js.jsp" />
<script type="text/javascript">
var paramsQuery;
var currentPage = 1;
$(function(){
	$('#form_user_${pageId}').form({
		onreload:true,
 		fields:[
                {fieldType:'fieldText',property:'ckandzick',dataType:'letter_numeric',limitedLength:'3',limitedLength2:'6',caption:'${i18n.zickbh}',notNull:true,value:st_Cangkbh},
				{fieldType:'fieldText',property:'elh',dataType:'elh',caption:'${i18n.elh}',notNull:false},
				{fieldType:'fieldText',property:'lingjbh',dataType:'letter_numeric',limitedLength:'10',caption:'${i18n.lingjbh}',notNull:false},
				{fieldType:'fieldText',property:'gongysdm',dataType:'shuzzm',maxLength:'10',caption:'${i18n.gongysdm}',notNull:false},
				{fieldType:'fieldText',property:'pich',dataType:'shuzzm',maxLength:'12',caption:'${i18n.pich}',notNull:false},				
				{fieldType:'fieldSelect',property:'zhijz',caption:'${i18n.zhijz}',notNull:false,src:'<%=request.getContextPath()%>/common/zhijz.do'}
				]
 		});
	
	$('#grid_user_${pageId}').grid({
		keyFields:['zhijqdh','elh','ckandzick','zhijlx','zhijz','zhijy','lingjbh','lingjmc','lingjsl','pich','blh','gongysdm','gongysmc','ush'],
		id:'grid_user_${pageId}',
		showCheckbox:true,
		//翻页查询交易
		src:'<%=request.getContextPath()%>/yichang/43201.do',
		cols:[
  		{property:'zhijqdh',caption:'${i18n.zhijd}',align:'center'},
  		{property:'ckandzick',caption:'${i18n.cangkh}',align:'center'},
  		{property:'zhijlxxx',caption:'${i18n.zhijdlx}',align:'center',internation:true},
  		{property:'zhijz',caption:'${i18n.zhijz}',align:'center'},
  		{property:'elh',caption:'${i18n.elh}',align:'center'},
  		{property:'lingjbh',caption:'${i18n.lingjbh}',align:'center'},
  		{property:'lingjsl',caption:'${i18n.lingjsl}',align:'center'}
  		],
  		buttons:[
	  				//F1查询
  	  				{name:'btn_search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
	  	  		 		//参数校验
	  	  				  if(!$('#form_user_${pageId}').form("validateParam")){
	  	  						return;	
	  	  				}  
	  	  				  var cangkh=$('#ckandzick input').val();
	  	  			 		var cangkbh=cangkh.substr(0,3);
	  	  			 		var params2 = [];
	  	  					 var url2 = "<%=request.getContextPath()%>/common/wareHouse.do";
	  	  					 $('#form_user_${pageId}').form("submitUrl", params2, url2, function(results){
	  	  						 showPromptMsg('blue','');
	  	  						 var size=results.result.parameter.list.length;
	  	  						 var id=0;
	  	  						 for(var i=0;i<size;i++){
	  	  							 if(cangkbh!=results.result.parameter.list[i].value){
	  	  								 	id=0;
	  	  							 }else{
	  	  								 id=1;
	  	  								 break;
	  	  							 }
	  	  						 }
	  	  						 if(id==0){
	  	  							 $('#grid_user_${pageId}').grid('clearRecords');
	  	  							 showPromptMsg('red','${i18n.C_C_cuowckh}')
	  	  							  return;
	  	  						 }else{
	  	  						 		 //提交数据
	  	  						 		var params = $('#form_user_${pageId}').form("getFormParam");
	  	  						 		$('#grid_user_${pageId}').grid("setQueryParams", params);
	  	  						 		var url = "<%=request.getContextPath()%>/yichang/43201.do";
	  	  						 		g_isSub=0;
	  	  								 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
	  	  									 if (showPromptRequestMsg(results)==true){
	  	  										//加载grid
	  	  											$('#grid_user_${pageId}').grid("parseResult",results)
	  	  									 }
	  	  									 });
	  	  						 }
	  	  					 });
	  	  		 		return false;
  	  				}},
  	  				//单选
  	  				{name:'getSelected',caption:'${i18n.checked}[F4]',keyboard:'F4',action:function(){
  	  					$('#grid_user_${pageId}').grid('selected');
  	  					return false;
  	  				}},
  	  				//F2明细
  	  				{name:'btn_mingxi',caption:'${i18n.mingx}[F2]',keyboard:'F2',action:function(){
	  	  				//获取选择行
	  	  				var currPandfs=$('#grid_user_${pageId}').grid('getSelectedColumnValue','ckandzick');
	  	  		        if(currPandfs.length!=1){
	  	  		        	showPromptMsg('red','${i18n.selecterror}')
	  	  					return false;
	  	  				}
	  	  				var Query= $('#form_user_${pageId}').form("getFormParam");
	  	  				//存放查询条件
	  	  				var vQuery = $('#grid_user_${pageId}').grid('getQueryParams')
	  	  				vQuery.push("zhijzxx="+$('#zhijz input').val())
	  	  				vQuery.push("currentPage="+currentPage);
	  	  				$('#serachKey').val(vQuery);
	  	  		        //页面数据提交并跳转，判断盘点方式，打开不同的查看页面
	  	  		        var params = $('#grid_user_${pageId}').grid('getSelectedAll');
	  	  				params.push("currentPage=1");
	  	  				//去掉List[0];
	  	  				for(i=0;i<params.length;i++){
	  	  					params[i]=params[i].toString().replace("list[0].","");
	  	  				}
	  	  		 		var url = "<%=request.getContextPath()%>/yichang/43202.do";
	  	  				 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
	  	  					 if (showPromptRequestMsg(results)==true){
	  	  						 if (results.result.response == "0000"){
	  	  								//加载返回数据
	  	  								var strJSON=JSON.stringify(results);
	  	  								$('#putvalue').val(strJSON);
	  	  								$("#putform").attr("action","<%=request.getContextPath()%>/yichang/4320201.do"+st_Params);
	  	  					    		document.putform.submit();
	  	  							 }
	  	  					 }
	  	  					 });
	  	  		 		return false;
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
				if (vParam[0].indexOf("ckandzick") != -1){                   //任务编号
					$('#ckandzick input').val(vParam[1])
					continue;
				} else if (vParam[0].indexOf("elh") != -1){           //状态信息
					$('#elh input').val(vParam[1])
					continue;
				} else if (vParam[0].indexOf("lingjbh") != -1){             //状态
					$('#lingjbh input').attr(vParam[1])
					continue;
				} else if (vParam[0].indexOf("pich") != -1){        //生成库存时间
					$('#pich input').val(vParam[1])
					continue;
				} else if (vParam[0].indexOf("gongysdm") != -1){        //生成库存时间
					$('#gongysdm input').val(vParam[1])
					continue;
				}else if (vParam[0].indexOf("zhijzxx") != -1){        //质检组信息
					$('#zhijz input').val(vParam[1])
					continue;
				}else if (vParam[0].indexOf("zhijz") != -1){        //质检组
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
			$('#grid_user_${pageId}').grid("load",params);
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
<div id="form_user_${pageId}" class="ui-fieldLayout" >
<table class="ui-grid" cellspacing="1" width="100%">
      <tr>
		<td class="field-label">${i18n.zickbh}：</td>
		<td class="field-container"><div class="ui-field" id="ckandzick"></div></td>
		<td class="field-label">${i18n.elh}：</td>
		<td class="field-container"><div class="ui-field" id="elh"></div></td>
		<td class="field-label">${i18n.lingjbh}：</td>
		<td class="field-container"><div class="ui-field" id="lingjbh"></div></td>
      </tr>
      <tr>
		<td class="field-label">${i18n.gongysdm}：</td>
		<td class="field-container"><div class="ui-field" id="gongysdm"></div></td>
		<td class="field-label">${i18n.pich}：</td>
		<td class="field-container"><div class="ui-field" id="pich"></div></td>
 		<td class="field-label">${i18n.zhijz}：</td>
		<td class="field-container"><div class="ui-field" id="zhijz"></div></td>
      </tr>

  </table>
</div>
<div id="grid_user_${pageId}" class='hidden-item'></div>
<div id='prompt'>${i18n.prompt}</div>
</div> 	  	    
</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>