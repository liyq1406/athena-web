<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","418");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_418}</title>
<jsp:include page="../../common/js.jsp" />
<script type="text/javascript">
var paramsQuery;
var currentPage = 1;
$(function(){
	$('#form_user_${pageId}').form({
		onreload:false,
 		fields:[
                {fieldType:'fieldLabel',property:'tuihdh',value:'${result.result.parameter.tuihdh}',notNull:true},
                {fieldType:'fieldText',property:'chexyy',maxLength:'20',caption:'${i18n.chexyy}',notNull:false},
                {fieldType:'fieldText',property:'caozy',maxLength:'10',caption:'${i18n.caozr}',notNull:false}
	 			]
 		});
	
	$('#grid_user_${pageId}').grid({
		keyFields:['ush','chengysdm','usxh','rongqxh','rongqsl','gongysdm','ckandzick','lingjbh','fanxsl'],
		id:'grid_user_${pageId}',
		showCheckbox:true,
		//翻页查询交易
		src:'<%=request.getContextPath()%>/yichang/41801.do',
		cols:[
		{property:'elh',caption:'${i18n.elh}',align:'center',width:50},
		{property:'ush',caption:'${i18n.ush}',align:'center',width:50},
		{property:'ckandzick',caption:'${i18n.cangkh}',align:'center',width:50},
		{property:'lingjbh',caption:'${i18n.lingjbh}',align:'center',width:50},
		{property:'lingjmc',caption:'${i18n.lingjmc}',align:'center',width:50},
		{property:'lingjsl',caption:'${i18n.lingjsl}',align:'center',width:50},
		{property:'pich',caption:'${i18n.pich}',align:'center',width:50},
		{property:'zhuangtxx',caption:'${i18n.yiclx}',align:'center',internation:true,width:50},
		{property:'gongysdm',caption:'${i18n.gongysdm}',align:'center',width:50},
		{property:'gongysmc',caption:'${i18n.gongysmc}',align:'center',width:50},
		{property:'uswld',caption:'${i18n.yuanwld}',align:'center',width:50},
		{property:'kuwbh',caption:'${i18n.kuw}',align:'center',width:50},
		{property:'rukpjh',caption:'${i18n.rukpjh}',align:'center',width:50},
		{property:'suopdh',caption:'${i18n.suopdh}', align:'center',width:50}
  		],
  		buttons:[
   				//单选
				{name:'getSelected',caption:'${i18n.checked}[F4]',keyboard:'F4',action:function(){
					msgClear();
					$('#grid_user_${pageId}').grid('selected');
					return false;
				}}
				//全选
				,{name:'selectedAll',caption:'${i18n.selectall}[F5]',keyboard:'F5',action:function(){
					msgClear();
					$('#grid_user_${pageId}').grid('selectedAll');
					return false;
				}}
   				//撤销
   				,{name:'btn_chexiao',caption:'${i18n.repeal}[F2]',keyboard:'F2',action:function(){
   					var records = $('#grid_user_${pageId}').grid('getSelectedAll');
   					if(records.length < 1){
   						showPromptMsg('red','${i18n.selecterror}')
   						return false;
   					}
   					if(!$('#tuihdh').fieldText('validateNotNull')){
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
    			 		var params = $('#grid_user_${pageId}').grid('getSelectedAll');
    			 		paramsQuery = jQuery.extend(true,[],params);
    					params.push("currentPage="+currentPage);
    					params.push("tuihdh="+$("#tuihdh span").html());
    					//alert($("#tuihdh span").html());
    			 		var url = "<%=request.getContextPath()%>/yichang/41802.do";
    					$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
    						if (showPromptRequestMsg(results)==true){
    							if (results.result.parameter.list && results.result.parameter.list.length>0){
	    							//加载grid
	    							$('#grid_user_${pageId}').grid("parseResult",results);	
    							} else {
					 				$(document).keyboardsupport('keyButtonClick','F11')
					 			}	
    						} 
    					});
   					}
   				}},
   				{name:'btn_back',caption:'${i18n.back}[F11]',keybord:'F11'},
   				{name:'btn_return',caption:'${i18n.return}[F12]',keybord:'F12'}
   			]
	});
	//F1查询 
 	//$('#btn_search').bind('click',function(){
 		 //参数校验
 		 if(!$('#form_user_${pageId}').form("validateParam")){
 			$('#grid_user_${pageId}').grid('clearRecords');
				return;	
 		} 
 		 //提交数据
 		var params = $('#form_user_${pageId}').form("getFormParam");
 		$('#grid_user_${pageId}').grid("setQueryParams", params);
 		var url = "<%=request.getContextPath()%>/yichang/41801.do";
		 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 if (showPromptRequestMsg(results)==true){
				//加载grid
					$('#grid_user_${pageId}').grid("parseResult",results);
			 }
			 });
 	//}); 
	$(document).keyboardsupport({});
});
</script>
</head>
<body>

<!--主体内容开始-->
<div id="title"></div>
<div id="form_user_${pageId}" class="ui-fieldLayout">
<table class="ui-grid" cellspacing="1" width="100%">
      <tr>
		<td class="field-label">${i18n.tuihdh}：</td>
		<td class="field-container"><div class="ui-field" id="tuihdh"></div></td>
		<td class="field-label">${i18n.chexyy}：</td>
		<td class="field-container"><div class="ui-field" id="chexyy"></div></td>	
		<td class="field-label">${i18n.caozr}：</td>
		<td class="field-container"><div class="ui-field" id="caozy"></div></td>
      </tr>
  </table>	   
</div>		
<div id="grid_user_${pageId}" class='hidden-item'></div> 
	    <div id='prompt'>${i18n.prompt}</div>			    
</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>