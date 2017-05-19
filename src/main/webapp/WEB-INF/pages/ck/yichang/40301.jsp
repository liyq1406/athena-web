<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","403");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_403}</title>
<jsp:include page="../../common/js.jsp" />
<script type="text/javascript">
var paramsQuery;
var currentPage = 1;
$(function(){
	$('#form_user_${pageId}').form({
		onreload:true,
 		fields:[
                {fieldType:'fieldLabel',property:'xiaohdh',caption:'${i18n.xiaohdh}',value:'${result.result.parameter.xiaohdh}',notNull:false},
                {fieldType:'fieldLabel',property:'buhgsl',caption:'${i18n.buhgsl}',value:'${result.result.parameter.zbhegsl}',notNull:false}
	 			]
 		});
	
	$('#grid_user_${pageId}').grid({
		keyFields:['elh','zhijqdh'],
		id:'grid_user_${pageId}',
		showCheckbox:false,
		//翻页查询交易
		src:'<%=request.getContextPath()%>/yichang/40302.do',
		cols:[
		{property:'uch',caption:'${i18n.uch}',align:'center'},
		{property:'lingjbh',caption:'${i18n.lingjbh}',align:'center'},
		{property:'lingjmc',caption:'${i18n.lingjmc}',align:'center'},
		{property:'gongysdm',caption:'${i18n.gongysdm}',align:'center'},
		{property:'gongysmc',caption:'${i18n.gongysmc}',align:'center'},	
		{property:'buhgsl',caption:'${i18n.buhgsl}',align:'center'},
        {property:'zhuangtxx',caption:'${i18n.zhuangt}',align:'center',internation:true},
        {property:'zerztxx',caption:'${i18n.zerzt}',align:'center',internation:true},
		{property:'zerztdm',caption:'${i18n.zerztdm}',align:'center'},
		{property:'zerztmc',caption:'${i18n.zerztmc}',align:'center'}
  		],
  		buttons:[
			{name:'btn_back',caption:'${i18n.back}[F11]',keyboard:'F11'},
			{name:'btn_return',caption:'${i18n.return}[F12]',keyboard:'F12'}
		 ]
	});	
 	//页面加载时载入数据
	 if(!$('#form_user_${pageId}').form("validateParam")){
			$('#grid_user_${pageId}').grid('clearRecords');
				return;	
		} 
		 //提交数据
		var params = $('#form_user_${pageId}').form("getFormParam");
		$('#grid_user_${pageId}').grid("setQueryParams", params);
		var url = "<%=request.getContextPath()%>/yichang/40302.do";
		 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 if (showPromptRequestMsg(results)==true){
				//加载grid
					$('#grid_user_${pageId}').grid("parseResult",results);
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
		<td class="field-label">${i18n.xiaohdh}：</td>
		<td class="field-container"><div class="ui-field" id="xiaohdh"></div></td>	
		<td class="field-label">${i18n.buhgsl}：</td>
		<td class="field-container"><div class="ui-field" id="buhgsl"></div></td>
      </tr>
   </table> 
</div> 
<div id="grid_user_${pageId}"></div>
<div id='prompt'>${i18n.prompt}</div>	
</div> 
</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>