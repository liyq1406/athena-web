<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","425");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_425}</title>
<jsp:include page="../../common/js.jsp" />
<script type="text/javascript">
var paramsQuery;
var currentPage = 1;
$(function(){
	$('#form_user_${pageId}').form({
		onreload:true,
 		fields:[
                {fieldType:'fieldText',property:'lingjbh',dataType:'letter_numeric',limitedLength:'10',caption:'${i18n.lingjbh}',notNull:false},
				{fieldType:'fieldText',property:'rukpjh',dataType:'rukpjh',caption:'${i18n.rukpjh}',notNull:false}
	 			]	
 		});
	
	$('#grid_user_${pageId}').grid({
		keyFields:['ckandzick','lingjbh','lingjmc','chanx','ush','lingjsl','tuihsl'],
		id:'grid_user_${pageId}',
		showCheckbox:true,
		//翻页查询交易
		src:'<%=request.getContextPath()%>/yichang/42501.do',
		cols:[
		{property:'ush',caption:'${i18n.ush}',align:'center'},
		{property:'rukpjh',caption:'${i18n.zhijjjbgd}',align:'center'},
		{property:'ckandzick',caption:'${i18n.cangkbh}',align:'center'},
  		{property:'lingjbh',caption:'${i18n.lingjbh}',align:'center'},
  		{property:'lingjmc',caption:'${i18n.lingjmc}',align:'center'},
  		{property:'zhuangtxx',caption:'${i18n.yiclx}',align:'center',internation:true},
  		{property:'lingjsl',caption:'${i18n.lingjsl}',width:100,align:'center'},
  		{property:'tuihsl',caption:'${i18n.tuicxsl}',align:'center',editor:'fieldText',dataType:'dbnumber'},
  		{property:'chanx',caption:'${i18n.chanx}',align:'center',editor:'fieldText'}
  		],
  		buttons:[
   				//F1查询 
   	  			{name:'btn_search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
		   	  	 		if(!$('#form_user_${pageId}').form("validateParam")){
			   	 			return;	
			   	 		}
			   	  		 //提交数据
			   	  		var params = $('#form_user_${pageId}').form("getFormParam");
			   	  		params.push("currentPage="+currentPage);
			   	  		$('#grid_user_${pageId}').grid("setQueryParams", params);
			   	  		var url = "<%=request.getContextPath()%>/yichang/42501.do";
			   	 		 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			   	 			 if (showPromptRequestMsg(results)==true){
			   	 				//加载grid
			   	 					$('#grid_user_${pageId}').grid("parseResult",results)
			   	 			 }
			   	 			 });
			   	  		return false;
   	  				}},
   	  				//F2确定
   	 				{name:'btn_ok',caption:'${i18n.ok}[F2]',keyboard:'F2',action:function(){
		   	 		 		//是否选中
		   	 				var records = $('#grid_user_${pageId}').grid('getSelectedAll');
		   	 				if(records.length < 1){
		   	 					showPromptMsg('red','${i18n.selecterror}')
		   	 					return false;
		   	 				}
		   	 		 		 //提交数据
		   	 		 		var params = $('#grid_user_${pageId}').grid('getSelectedAll');
		   	 		 		paramsQuery = jQuery.extend(true,[],params);
		   	 		 		params.push("lingjbh="+$("#lingjbh input").val());
		   	 		 		params.push("rukpjh="+$("#rukpjh input").val());
		   	 				params.push("currentPage="+currentPage);
		   	 		 		var url = "<%=request.getContextPath()%>/yichang/42502.do";
		   	 				 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
		   	 					 if (showPromptRequestMsg(results)==true){
		   	 						//加载grid
		   	 							$('#grid_user_${pageId}').grid("parseResult",results)
		   	 					 }else{
		   	 						 if (results.result.response == "0000"){
		   	 							 $('#grid_user_${pageId}').grid('clearRecords');
		   	 						 }
		   	 						 }
		   	 					 });
		   	 		 		return false;
   	 				}},
	  				//单选
	  				{name:'getSelected',caption:'${i18n.checked}[F4]',keyboard:'F4',action:function(){
	  					$('#grid_user_${pageId}').grid('selected');
	  					return false;
	  				}}
	  			//全选
	 				,{name:'selectedAll',caption:'${i18n.selectall}[F5]',keyboard:'F5',action:function(){
	 					msgClear();
	 					$('#grid_user_${pageId}').grid('selectedAll');
	 					return false;
	 				}},
	 				{name:'btn_back',caption:'${i18n.back}[F11]',keyboard:'F11'},
	 				{name:'btn_return',caption:'${i18n.return}[F12]',keyboard:'F12'}
	  				]
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
		<td class="field-label">${i18n.lingjbh}：</td>
		<td class="field-container"><div class="ui-field" id="lingjbh"></div></td>
		<td class="field-label">${i18n.rukpjh}：</td>
		<td class="field-container"><div class="ui-field" id="rukpjh"></div></td>
      </tr>
  </table>
</div>
<div id="grid_user_${pageId}" class='hidden-item'></div>
<div id='prompt'>${i18n.prompt}</div>	 
</div>		
</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>