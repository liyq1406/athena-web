<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","420");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_420}</title>
<jsp:include page="../../common/js.jsp" />
<script type="text/javascript">
var paramsQuery;
var currentPage = 1;
$(function(){
	$('#form_user_${pageId}').form({
		onreload:true,
 		fields:[
                {fieldType:'fieldLabel',property:'xiaohdh',dataType:'xiaohdh',caption:'${i18n.xiaohdh}',notNull:false},
				{fieldType:'fieldSelect',property:'ckandzick',caption:'${i18n.zickbh}',notNull:true,src:'<%=request.getContextPath()%>/common/wareHouseck.do'+'?buhgpk='+2+'&buhgpk2='+4},
				{fieldType:'fieldText',property:'lingjbh',dataType:'letter_numeric',limitedLength:'10',caption:'${i18n.lingjbh}',notNull:false},
				{fieldType:'fieldText',property:'gongysdm',dataType:'shuzzm',maxLength:'10',caption:'${i18n.gongysdm}',notNull:false},
				{fieldType:'fieldSelect',property:'zhuangtsx',caption:'${i18n.zhuangtsx}',internation:true,includeNull:true,notNull:false,src:'<%=request.getContextPath()%>/common/yichanglx.do'},
				{fieldType:'fieldText',property:'zhijrq1',dataType:'date',maskOptions:{mask:'9999-99-99'},width:100,caption:'${i18n.zhijrq1}',notNull:false},
				{fieldType:'fieldText',property:'zhijrq2',dataType:'date',maskOptions:{mask:'9999-99-99'},width:100,notNull:false},
				{fieldType:'fieldText',property:'uswld',dataType:'shuzzm',maxLength:'13',caption:'${i18n.uswld}',notNull:false},
				{fieldType:'fieldText',property:'caozy',maxLength:'10',width:100,caption:'${i18n.caozy}',notNull:false,value:st_UserName}
	 			]
 		});
	
	$('#grid_user_${pageId}').grid({
		keyFields:['ush','xiaohsl','lingjsl'],
		id:'grid_user_${pageId}',
		showCheckbox:true,
		//翻页查询交易
		src:'<%=request.getContextPath()%>/yichang/42001.do',
		editSubmitSrc:'<%=request.getContextPath()%>/yichang/42004.do',
		cols:[
		{property:'rukpjh',caption:'${i18n.baofdh}',align:'center'},
  		{property:'ush',caption:'${i18n.ush}',align:'center'},
  		{property:'lingjbh',caption:'${i18n.lingjbh}',align:'center'},
  		{property:'lingjmc',caption:'${i18n.lingjmc}',align:'center'},
  		{property:'zhuangtxx',caption:'${i18n.yiclx}',align:'center',internation:true},
  		{property:'lingjsl',caption:'${i18n.lingjsl}',width:100,align:'center'},
  		{property:'xiaohsl',caption:'${i18n.xiaohsl}',align:'center',editor:'fieldText',dataType:'dbnumber'},
  		{property:'gongysdm',caption:'${i18n.gongysdm}',align:'center'},
  		{property:'gongysmc',caption:'${i18n.gongysmc}',align:'center'},
  		{property:'rukrq',caption:'${i18n.rukrq}',align:'center'}
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
 							 		var url = "<%=request.getContextPath()%>/yichang/42001.do";
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
  				//F3确定
 				{name:'btn_ok',caption:'${i18n.ok}[F3]',keyboard:'F3',action:function(){
 			 		//是否选中
 					var records = $('#grid_user_${pageId}').grid('getSelectedAll');
 					if(records.length < 1){
 						showPromptMsg('red','${i18n.selecterror}')
 						return false;
 					}
 			 		//验证Grid的输入格式
 			 		if (!$('#grid_user_${pageId}').grid("validate")){
 			 			return false;
 			 		}
 			 		if(!$('#uswld').fieldText('validateNotNull')){
 			 			return;
 			 		}
 			 		if(!$('#caozy').fieldText('validateNotNull')){
 			 			return;
 			 		}
 			 		 //提交数据
 			 		var params = $('#grid_user_${pageId}').grid('getSelectedAll');
 			 		paramsQuery = jQuery.extend(true,[],params);
 					params.push("currentPage="+currentPage);
 					params.push("xiaohdh="+$('#xiaohdh span').html());
 					params.push("uswld="+$('#uswld input').val());
 					params.push("caozy="+$('#caozy input').val());
 					params.push("ckandzick="+$('#ckandzick input').val());
 					params.push("lingjbh="+$('#lingjbh input').val());
 					params.push("gongysdm="+$('#gongysdm input').val());
 					params.push("zhuangtsx="+$('#zhuangtsx input').attr('realValue'));
 					params.push("zhijrq1="+$('#zhijrq1 input').val());
 					params.push("zhijrq2="+$('#zhijrq2 input').val());
 			 		var url = "<%=request.getContextPath()%>/yichang/42002.do";
 					 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
 						 if (showPromptRequestMsg(results)==true){
 							//加载grid
 								$('#grid_user_${pageId}').grid("parseResult",results);
 								$('#xiaohdh span').html(results.result.parameter.xiaohdh);
 								showPromptMsg('red','${i18n.danjsxh}');
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
 					$('#grid_user_${pageId}').grid('selectedAll');
 					return false;
 				}},
  				//F6打印
 				{name:'btn_print',caption:'${i18n.printxhqd}[F6]',keyboard:'F6',action:function(){
 			 		 //提交数据
 			 		var params = $('#form_user_${pageId}').form("getFormParam");
 			 		paramsQuery = jQuery.extend(true,[],params);
 					params.push("currentPage="+currentPage);
 			 		var url = "<%=request.getContextPath()%>/yichang/42003.do";
 					 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
 						 if (showPromptRequestMsg(results)==true){
 							//加载grid
 								$('#grid_user_${pageId}').grid("parseResult",results)
 								$('#xiaohdh span').html('');
 						 }
 						 });
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
		<td class="field-label">${i18n.xiaohuidh}：</td>
		<td class="field-container"><div class="ui-field" id="xiaohdh"></div></td>
		<td class="field-label">${i18n.buhpckh}：</td>
		<td class="field-container"><div class="ui-field" id="ckandzick"></div></td>
      </tr>
      <tr>
		<td class="field-label">${i18n.lingjbh}：</td>
		<td class="field-container"><div class="ui-field" id="lingjbh"></div></td>
		<td class="field-label">${i18n.gongysdm}：</td>
		<td class="field-container"><div class="ui-field" id="gongysdm"></div></td>
      </tr>
      <tr>
		<td class="field-label">${i18n.yiclx}：</td>
		<td class="field-container"><div class="ui-field" id="zhuangtsx"></div></td>
		<td class="field-label">${i18n.zhijsj}：</td>
		<td class="field-container"><div class="ui-field" id="zhijrq1"></div><div style="float:left" >-</div><div class="ui-field" id="zhijrq2"></div></td>
      </tr>
	   <tr>
		<td class="field-label">${i18n.uswld}：</td>
		<td class="field-container"><div class="ui-field" id="uswld"></div></td>
		<td class="field-label">${i18n.caozy}：</td>
		<td class="field-container"><div class="ui-field" id="caozy"></div></td>
      </tr>
      <tr>
      <td colspan="4" ></td>
      </tr>
  </table>		
</div>   
<div id="grid_user_${pageId}" class='hidden-item'></div>
<div id='prompt'>${i18n.prompt}</div>	
</div>	    
</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>