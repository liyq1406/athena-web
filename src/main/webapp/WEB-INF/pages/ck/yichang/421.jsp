<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","421");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_421}</title>
<jsp:include page="../../common/js.jsp" />
<script type="text/javascript">
var paramsQuery;
var currentPage = 1;
$(function(){
	$('#form_user_${pageId}').form({
		onreload:true,
 		fields:[
                {fieldType:'fieldText',property:'xiaohdh',dataType:'xiaohdh',caption:'${i18n.xiaohdh}',notNull:false},
				{fieldType:'fieldText',property:'lingjbh',dataType:'letter_numeric',limitedLength:'10',caption:'${i18n.lingjbh}',notNull:false},
				{fieldType:'fieldText',property:'gongysdm',dataType:'shuzzm',maxLength:'10',caption:'${i18n.gongysdm}',notNull:false},
				{fieldType:'fieldText',property:'xiaohrq',dataType:'date',maskOptions:{mask:'9999-99-99'},caption:'${i18n.xiaohrq}',notNull:false},
				{fieldType:'fieldSelect',property:'zhuangtsx',caption:'${i18n.zhuangtsx}',includeNull:true,internation:true,notNull:false,src:'<%=request.getContextPath()%>/common/yichanglx.do'}
	 			]
 		});
	var par=[];
	
	gridload();
	function gridload()
	{
		$('#grid_user_${pageId}').grid({
			keyFields:['ush','lingjsl','xiaohsl','xiaohdh'],
			id:'grid_user_${pageId}',
			showCheckbox:true,
			params:par,
			//翻页查询交易
			src:'<%=request.getContextPath()%>/yichang/42101.do',
			editSubmitSrc:'<%=request.getContextPath()%>/yichang/42103.do',
			cols:[
			{property:'xiaohdh',caption:'${i18n.xiaohuidh}',align:'center',width:50},
			{property:'rukpjh',caption:'${i18n.rukpjh}',align:'center',width:50},
			{property:'cangkbh',caption:'${i18n.cangkbh}',align:'center',width:50},
	  		{property:'ush',caption:'${i18n.ush}',align:'center',width:50},
	  		{property:'lingjbh',caption:'${i18n.lingjbh}',align:'center',width:50},
	  		{property:'lingjmc',caption:'${i18n.lingjmc}',align:'center',width:50},
	  		{property:'zhuangtxx',caption:'${i18n.yiclx}',align:'center',internation:true,width:50},
	  		{property:'lingjsl',caption:'${i18n.lingjsl}',width:100,align:'center',width:50},
	  		{property:'xiaohsl',caption:'${i18n.xiaohsl}',width:50,align:'center',editor:'fieldText',dataType:'dbnumber'},
	  		{property:'gongysdm',caption:'${i18n.gongysdm}',align:'center',width:50},
	  		{property:'gongysmc',caption:'${i18n.gongysmc}',align:'center',width:50},
	  		{property:'rukrq',caption:'${i18n.rukrq}',align:'center',width:50},
	  		{property:'zhijsj',caption:'${i18n.blscsj}',align:'center',width:50},
	  		{property:'caozy',caption:'${i18n.caozy}',align:'center',width:50}
	  		],
	  		buttons:[
	   				//F1查询 
	   	  			{name:'btn_search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
			   	  	   if(!$('#form_user_${pageId}').form("validateParam")){
			   	 			return;	
			   	 		}
			   	  		 //提交数据
			   	  		var params = $('#form_user_${pageId}').form("getFormParam");
			   	 		params.push("chexzhuangt=0");
			   	 		$('#grid_user_${pageId}').grid("setQueryParams", params);
			   	  		var url = "<%=request.getContextPath()%>/yichang/42101.do";
			   	 		 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			   	 			 if (showPromptRequestMsg(results)==true){
			   	 				//加载grid
			   	 					$('#grid_user_${pageId}').grid("parseResult",results)
			   	 					par=[];
			   	 					par.push("xiaohdh="+$('#xiaohdh input').val());
			   	 					par.push("chexzhuangt=0");
			   	 					gridload();
			   	 			 }
			   	 			 });
			   	  		return false;
	   	  				}},
		   				//F3删除 
		   	  			{name:'btn_delete',caption:'${i18n.delete}[F3]',keyboard:'F3',action:function(){
				   	  	 		//是否选中
				   	  			var records = $('#grid_user_${pageId}').grid('getSelectedAll');
				   	  			if(records.length < 1){
				   	  				showPromptMsg('red','${i18n.selecterror}')
				   	  				return false;
				   	  			}
				   	  	 		//打开提示框是否删除
				   	  			if(confirm($.sdcui.resource.i18n['C_remove'])){
				   	  	 		 //提交数据
				   	  	 		var params = $('#grid_user_${pageId}').grid('getSelectedAll');
				   	  	 		params.push("xiaohdh="+$('#xiaohdh input').val());
				   	  	 		params.push("lingjbh="+$('#lingjbh input').val());
				   	  	 		params.push("gongysdm="+$('#gongysdm input').val());
				   	  	 		params.push("zhuangtsx="+$('#zhuangtsx input').val());
				   	  	 		params.push("xiaohrq="+$('#xiaohrq input').val());
				   	  	 		params.push("chexzhuangt=0");
				   	  	 		paramsQuery = jQuery.extend(true,[],params);
				   	  	 		var url = "<%=request.getContextPath()%>/yichang/42102.do";
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
				   	  			}
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
	}	
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
		<td class="field-label">${i18n.lingjbh}：</td>
		<td class="field-container"><div class="ui-field" id="lingjbh"></div></td>
		<td class="field-label">${i18n.gongysdm}：</td>
		<td class="field-container"><div class="ui-field" id="gongysdm"></div></td>
      </tr>
      <tr>
		<td class="field-label">${i18n.yiclx}：</td>
		<td class="field-container"><div class="ui-field" id="zhuangtsx"></div></td>
		<td class="field-label">${i18n.xiaohrq}：</td>
		<td class="field-container"><div class="ui-field" id="xiaohrq"></div></td>
 		<td class="field-label"></td>
      </tr>
  </table>
</div>	
<div id="grid_user_${pageId}" class='hidden-item'></div>
<div id='prompt'>${i18n.prompt}</div>	
</div>    
</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>