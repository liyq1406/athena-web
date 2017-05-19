<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","625");%>
<t:html i18n="i18n.ck">
<head>
<title>${i18n.title_625}</title>
<jsp:include page="../../common/js.jsp" />
<script type="text/javascript">
var paramsQuery;
var currentPage = 1;
$(function(){
	$('#form_user_${pageId}').form({
		onreload:true,
 		fields:[
				{fieldType:'fieldText',property:'diaobdh',dataType:'diaobdh',caption:'${i18n.diaobdh}',notNull:true}
	 			]
 		});
	$('#grid_user_${pageId}').grid({
		keyFields:['diaobdh','rongqxh','diaobsl','weidbsl','yidbsl','wuld','diaoruwld','gongysdm','chengysdm','diaobsqr'],
		id:'grid_user_${pageId}',
		showCheckbox:true,
		//翻页查询交易
		src:'<%=request.getContextPath()%>/rongqi/62501.do',
		cols:[
		{property:'diaobdh',caption:'${i18n.diaobdh}'},
		{property:'rongqxh',caption:'${i18n.rongqxh}'},
  		{property:'diaobsl',caption:'${i18n.diaobsl}'},
  		{property:'yidbsl',caption:'${i18n.yidbsl}'},
  		{property:'weidbsl',caption:'${i18n.weidbsl}'},
  		{property:'wuld',caption:'${i18n.rongqiq}'},
  		{property:'diaoruwld',caption:'${i18n.diaorurqq}'},
  		//{property:'gongysdm',caption:'${i18n.gongys}'},
  		{property:'chengysdm',caption:'${i18n.wuls}'},
  		{property:'shenqr',caption:'${i18n.diaobsqr}'},
  		{property:'create_time',caption:'${i18n.diaobsqsj}'}
  		]
	});
	//F1查询
 	$('#btn_search').bind('click',function(){
 		 //参数校验
 		if(!$('#diaobdh').fieldText('validate')){
 			return;
 		}
 		 //提交数据
 		var params = $('#form_user_${pageId}').form("getFormParam");
 		$('#grid_user_${pageId}').grid("setQueryParams", params);
 		var url = "<%=request.getContextPath()%>/rongqi/62501.do";
		 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 if (showPromptRequestMsg(results)==true){
				//加载返回数据
					$('#grid_user_${pageId}').grid('parseResult',results)
			 }
			 });
 	}); 
	//F2整单结束
 	$('#btn_zdover').bind('click',function(){
		 //参数校验
 		if(!$('#diaobdh').fieldText('validate')){
 			return;
 		}
 		 //提交数据
 		var params = $('#form_user_${pageId}').form("getFormParam");
 		var url = "<%=request.getContextPath()%>/rongqi/62502.do";
		 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 if (showPromptRequestMsg(results)==true){
				//加载返回数据
					$('#grid_user_${pageId}').grid('parseResult',results)
			 }
			 });
 	});
	//F3结束
 	$('#btn_over').bind('click',function(){
		 //参数校验
 		if(!$('#diaobdh').fieldText('validate')){
 			return;
 		}
 		//是否选中
		var records = $('#grid_user_${pageId}').grid('getSelectedAll');
		if(records.length < 1){
			showPromptMsg('red','${i18n.selectoneerror}')
			return false;
		}
 		 //提交数据
 		var params = $('#grid_user_${pageId}').grid('getSelectedAll');
 		params.push("diaobdh="+$('#diaobdh input').val());
 		params.push("currentPage="+currentPage);
 		var url = "<%=request.getContextPath()%>/rongqi/62503.do";
		 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 if (showPromptRequestMsg(results)==true){
				//加载返回数据
					$('#grid_user_${pageId}').grid('parseResult',results)
			 }
			 });
 	});
	$('#getSelected').bind('click',function(){
		$('#grid_user_${pageId}').grid('selected');
			return false;
	});
$(document).keyboardsupport({});
});
</script>
</head>
<body>
<div id="title"></div>
<div id="form_user_${pageId}" class="ui-fieldLayout" >
<table class="ui-grid" cellspacing="1" width="100%" >
<tr>
		<td class="field-label">${i18n.diaobdh}：</td>
		<td class="field-container"><div class="ui-field" id="diaobdh"></div></td>
  </table>
<br>
<div align=right>
	<span id="btn_search"  class="ui-button">${i18n.search}[F1]</span>
	<span id="btn_zdover"  class="ui-button">${i18n.zhengdjs}[F2]</span>
	<span id="btn_over"  class="ui-button">${i18n.jies}[F3]</span>
	<span id="getSelected"  class="ui-button">${i18n.checked}[F4]</span>
	<span id="btn_back"  class="ui-button">${i18n.back}[F11]</span>	
	<span id="btn_return"  class="ui-button">${i18n.return}[F12]</span>
</div><br/>
</div>
<div id="grid_user_${pageId}" class='hidden-item'></div>
<br>		
<div id='prompt'>${i18n.prompt}</div>
</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>