<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","631");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_631}</title>
<jsp:include page="../../common/js.jsp" />
<script type="text/javascript">
var paramsQuery;
var currentPage = 1;
$(function(){
	$('#form_user_${pageId}').form({
		onreload:true,
 		fields:[
				{fieldType:'fieldText',property:'danjbh',dataType:'weixdh',caption:'${i18n.danjbh}',notNull:true}
	 			]
 		});
	var par=[];
	gridload();
	function gridload()
	{
		$('#grid_user_${pageId}').grid({
			keyFields:['rongqxh','zhizs','wuld','weixsl','rongqsl','baofsl'],
			id:'grid_user_${pageId}',
			showCheckbox:false,
			params:par,
			//翻页查询交易
			src:'<%=request.getContextPath()%>/rongqi/63101.do',
			editSubmitSrc:'<%=request.getContextPath()%>/rongqi/63102.do',
			cols:[
			{property:'rongqxh',caption:'${i18n.rongqxh}'},
	  		//{property:'zhizs',caption:'${i18n.zhizs}'},
	  		{property:'wuld',caption:'${i18n.rongqiq}'},
	  		{property:'weixsl',caption:'${i18n.weixsl}'},
	  		{property:'rongqsl',caption:'${i18n.hegsl}',editor:'fieldText',dataType:'positive'},
	  		{property:'baofsl',caption:'${i18n.baofsl}'}
	  		]
		});
	}
	
	//F1查询
 	$('#btn_search').bind('click',function(){
 		 //参数校验
 		if(!$('#danjbh').fieldText('validate')){
 			$('#grid_user_${pageId}').grid('clearRecords');
 			return;
 		}
 		 //提交数据
 		var params = $('#form_user_${pageId}').form("getFormParam");
 		$('#grid_user_${pageId}').grid("setQueryParams", params);
 		var url = "<%=request.getContextPath()%>/rongqi/63101.do";
		 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 if (showPromptRequestMsg(results)==true){
				 if (results.result.response == "0001"){
					//加载返回数据
						$('#grid_user_${pageId}').grid('parseResult',results)
						par=[];
						gridload();
					   par.push("danjbh="+$('#danjbh input').val());
				 }else{
					 $('#grid_user_${pageId}').grid('clearRecords');
				 }
				
			 }
			 });
 	}); 
	//F2确认
 	$('#btn_ok').bind('click',function(){
 		 //参数校验
 		if(!$('#danjbh').fieldText('validateNotNull')){
 			return;
 		}
 		 //提交数据
 		var params = [];
 		 params.push("danjbh="+$('#danjbh input').val());
 		var url = "<%=request.getContextPath()%>/rongqi/63103.do";
		 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 if (showPromptRequestMsg(results)==true){
						$('#grid_user_${pageId}').grid('parseResult',results)

				
			 }
			 });
 	}); 
$(document).keyboardsupport({});
});
</script>
</head>
<body>
<!--主体内容开始-->
<div id="title"></div>
<div id="form_user_${pageId}" class="ui-fieldLayout">
<table class="ui-grid" cellspacing="1" width="100%" >
<tr>
	<td class="field-label">${i18n.weixdh}：</td>
	<td class="field-container"><div class="ui-field" id="danjbh"></div></td>
</tr>
</table>
<br/>
<div align="right">
	<span id="btn_search"  class="ui-button">${i18n.search}[F1]</span>
	<span id="btn_ok"  class="ui-button">${i18n.ok}[F2]</span>	
	<span id="btn_back"  class="ui-button">${i18n.back}[F11]</span>	
	<span id="btn_return"  class="ui-button">${i18n.return}[F12]</span>
</div>
<br/>
</div>	
<div id="grid_user_${pageId}" class='hidden-item'></div>
<div id='prompt'>${i18n.prompt}</div>
</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>