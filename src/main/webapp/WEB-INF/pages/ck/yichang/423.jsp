<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","423");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_423}</title>
<jsp:include page="../../common/js.jsp" />
<script type="text/javascript">
var paramsQuery;
var currentPage = 1;
$(function(){
	$('#form_user_${pageId}').form({
		onreload:true,
 		fields:[
                {fieldType:'fieldText',property:'xiaohdh',dataType:'xiaohdh',caption:'${i18n.xiaohuidh}',notNull:true}
	 			]
 		});
	var par=[];
	gridload();
	function gridload()
	{
		$('#grid_user_${pageId}').grid({
			keyFields:['ush','lingjsl','xiaohsl'],
			id:'grid_user_${pageId}',
			showCheckbox:false,
			params:par,
			//翻页查询交易
			src:'<%=request.getContextPath()%>/yichang/42301.do',
			editSubmitSrc:'<%=request.getContextPath()%>/yichang/42303.do',
			cols:[
			{property:'rukpjh',caption:'${i18n.baofdh}',align:'center',width:50},
			{property:'cangkbh',caption:'${i18n.cangkbh}',align:'center',width:50},
	  		{property:'ush',caption:'${i18n.ush}',align:'center',width:50},
	  		{property:'lingjbh',caption:'${i18n.lingjbh}',align:'center',width:50},
	  		{property:'lingjmc',caption:'${i18n.lingjmc}',align:'center',width:50},
	  		{property:'zhuangtxx',caption:'${i18n.yiclx}',align:'center',internation:true,width:50},
	  		{property:'lingjsl',caption:'${i18n.daixhsl}',width:50,align:'center'},
	  		{property:'xiaohsl',caption:'${i18n.shijxhsl}',width:50,align:'center',editor:'fieldText',dataType:'dbnumber'},
	  		{property:'gongysdm',caption:'${i18n.gongysdm}',align:'center',width:50},
	  		{property:'gongysmc',caption:'${i18n.gongysmc}',align:'center',width:50},
	  		{property:'rukrq',caption:'${i18n.rukrq}',align:'center',width:50},
	  		{property:'caozy',caption:'${i18n.caozy}',align:'center',width:50}
	  		]
		});
	}
	
	//F1查询
 	$('#btn_search').bind('click',function(){
 		//参数校验
		  if(!$('#form_user_${pageId}').form("validateParam")){
				return;	
		}
 		 //提交数据
 		var params = $('#form_user_${pageId}').form("getFormParam");
		params.push("chexzhuangt=1");
		params.push("zhuangt=0");
		$('#grid_user_${pageId}').grid("setQueryParams", params);
 		var url = "<%=request.getContextPath()%>/yichang/42301.do";
		 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 if (showPromptRequestMsg(results)==true){
				//加载grid
					$('#grid_user_${pageId}').grid("parseResult",results)
					par=[];
					par.push("xiaohdh="+$('#xiaohdh input').val());
					par.push("chexzhuangt=1");
					gridload();
			 }
			 });
 		return false;
 		
 	}); 
 	//F2销毁确认
 	$('#btn_ok').bind('click',function(){
 		 //提交数据
 		var params = $('#form_user_${pageId}').form("getFormParam");
		params.push("currentPage="+currentPage);
 		var url = "<%=request.getContextPath()%>/yichang/42302.do";
		 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 if (showPromptRequestMsg(results)==true){
				//加载grid
					$('#grid_user_${pageId}').grid("parseResult",results)
			 }
			 });
 		return false;
 		
 	});
	$(document).keyboardsupport({});
});
</script>
</head>
<body>
<div style="padding:20px;">
<!--主体内容开始--> 
<div id="title"></div>
<div id="form_user_${pageId}" class="ui-fieldLayout"> 
<table class="ui-grid" cellspacing="1" width="100%">
      <tr>
		<td class="field-label">${i18n.xiaohuidh}：</td>
		<td class="field-container"><div class="ui-field" id="xiaohdh"></div></td>
		<td class="field-label"></td>
		<td align="right">
		<span id="btn_search" class="ui-button">${i18n.search}[F1]</span><span id="btn_ok"  class="ui-button">${i18n.xiaohqr}[F2]</span>	
		<span id="btn_back"  class="ui-button">${i18n.back}[F11]</span>	
		<span id="btn_return"  class="ui-button">${i18n.return}[F12]</span>	</td>
      </tr>
  </table>
</div>
<div id="grid_user_${pageId}" class='hidden-item'></div>
<div id='prompt'>${i18n.prompt}</div>
</div>  
</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>