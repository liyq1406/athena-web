<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","422");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_422}</title>
<jsp:include page="../../common/js.jsp" />
<script type="text/javascript">
var paramsQuery;
var currentPage = 1;
$(function(){
	$('#form_user_${pageId}').form({
		onreload:true,
 		fields:[
                {fieldType:'fieldText',property:'xiaohdh',dataType:'xiaohdh',caption:'${i18n.xiaohuidh}',notNull:true},
				{fieldType:'fieldText',property:'chexyy',maxLength:'20',caption:'${i18n.chexyy}',notNull:false},
				{fieldType:'fieldText',property:'caozy',maxLength:'10',caption:'${i18n.caozy}',notNull:false,value:st_UserName}
	 			]
 		});
	
	$('#grid_user_${pageId}').grid({
		keyFields:['uch'],
		id:'grid_user_${pageId}',
		showCheckbox:false,
		//翻页查询交易
		src:'<%=request.getContextPath()%>/yichang/42201.do',
		cols:[
		{property:'rukpjh',caption:'${i18n.rukpjh}',align:'center',width:50},
		{property:'cangkbh',caption:'${i18n.cangkbh}',align:'center',width:50},
  		{property:'ush',caption:'${i18n.ush}',align:'center',width:50},
  		{property:'lingjbh',caption:'${i18n.lingjbh}',align:'center',width:50},
  		{property:'lingjmc',caption:'${i18n.lingjmc}',align:'center',width:50},
  		{property:'zhuangtxx',caption:'${i18n.yiclx}',align:'center',internation:true,width:50},
  		{property:'lingjsl',caption:'${i18n.lingjsl}',width:50,align:'center'},
  		{property:'xiaohsl',caption:'${i18n.xiaohsl}',align:'center',width:50},
  		{property:'gongysdm',caption:'${i18n.gongysdm}',align:'center',width:50},
  		{property:'gongysmc',caption:'${i18n.gongysmc}',align:'center',width:50},
  		{property:'rukrq',caption:'${i18n.rukrq}',align:'center',width:50},
  		{property:'caozy',caption:'${i18n.caozy}',align:'center',width:50}
  		],
 buttons:[
  	 {name:'search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
  	 	  //参数校验
		  if(!$('#form_user_${pageId}').form("validateParam")){
				return;	
		    }
 		 //提交数据
 		 var params = $('#form_user_${pageId}').form("getFormParam");
		 params.push("chexzhuangt=0");
		 $('#grid_user_${pageId}').grid("setQueryParams", params);
 		 var url = "<%=request.getContextPath()%>/yichang/42201.do";
		 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 if (showPromptRequestMsg(results)==true){
				    //加载grid
					$('#grid_user_${pageId}').grid("parseResult",results)
			     }
		 });
 		return false;
	  }}
	  //撤销
	,{name:'chexiao',caption:'${i18n.repeal}[F2]',keyboard:'F2',action:function(){
		/*//是否选中
		var records = $('#grid_user_${pageId}').grid('getSelectedAll');
		if(records.length < 1){
			showPromptMsg('red','${i18n.selecterror}')
			return false;
		} */
 		if(!$('#xiaohdh').fieldText('validateNotNull')){
 			return;
 		}
 		if(!$('#chexyy').fieldText('validateNotNull')){
 			return;
 		}
 		if(!$('#caozy').fieldText('validateNotNull')){
 			return;
 		}
 		//打开提示框是否删除
		if(confirm($.sdcui.resource.i18n['C_remove'])){
 		 //提交数据
 		var params = $('#form_user_${pageId}').form("getFormParam");
 		paramsQuery = jQuery.extend(true,[],params);
		params.push("currentPage="+currentPage);
 		var url = "<%=request.getContextPath()%>/yichang/42202.do";
		 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 if (showPromptRequestMsg(results)==true){
				//加载grid
					$('#grid_user_${pageId}').grid("parseResult",results)
			 }
			 });
		}
 		return false;
	 }}	 	
	　,{name:'back',caption:'${i18n.back}[F11]'}
      ,{name:'return',caption:'${i18n.return}[F12]'}
	]});

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
		<td class="field-label" >${i18n.xiaohuidh}：</td>
		<td class="field-container"><div class="ui-field" id="xiaohdh"></div></td>
		<td class="field-label">${i18n.chexyy}：</td>
		<td class="field-container"><div class="ui-field" id="chexyy"></div></td>	
		<td class="field-label">${i18n.caozy}：</td>
		<td class="field-container"><div class="ui-field" id="caozy"></div></td> 
      </tr>
</table>
</div> 
<div id="grid_user_${pageId}" class='hidden-item'></div>	　
<div id='prompt'>${i18n.prompt}</div>	    		      
</div>
</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>