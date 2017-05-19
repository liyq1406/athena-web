<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","408");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_408}</title>
<jsp:include page="../../common/js.jsp" />
<jsp:include page="../../common/print.jsp" />
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
		keyFields:['elh','zhijqdh'],
		id:'grid_user_${pageId}',
		showCheckbox:true,
		//翻页查询交易
		src:'<%=request.getContextPath()%>/yichang/40801.do',
		cols:[
		{property:'zhijqdh',caption:'${i18n.zhijgzdh}',align:'center',width:50},
		{property:'ckandzick',caption:'${i18n.cangkh}',align:'center',width:50},
		{property:'lingjbh',caption:'${i18n.lingjbh}',align:'center',width:50},
		{property:'lingjmc',caption:'${i18n.lingjmc}',align:'center',width:50},
		{property:'lingjsl',caption:'${i18n.lingjsl}',align:'center',width:50},
		{property:'elh',caption:'${i18n.elh}',align:'center',width:50},
		{property:'zhuangtxx',caption:'${i18n.zhijshx}',align:'center',width:50,internation:true},
		{property:'blh',caption:'${i18n.jiaohdh}',align:'center',width:50},
		{property:'pich',caption:'${i18n.pich}',align:'center',width:50},
		{property:'zhijz',caption:'${i18n.zhijz}',align:'center',width:50},
		{property:'gongysdm',caption:'${i18n.gongysdm}',align:'center',width:50},
		{property:'gongysmc',caption:'${i18n.gongysmc}',align:'center',width:50},
		{property:'shixq',caption:'${i18n.shixq}',align:'center',width:50},
		{property:'danw',caption:'${i18n.danw}',align:'center',width:50}
  		
  		],
  		buttons:[
    				//查询
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
       							 var params = $('#form_user_${pageId}').form("getFormParam");
       								params.push("currentPage="+currentPage);
       								params.push("zhijlx=1");
       								$('#grid_user_${pageId}').grid("setQueryParams", params);
       						 		var url = "<%=request.getContextPath()%>/yichang/40801.do";
       						 		g_isSub=0;
       								 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
       									 if (showPromptRequestMsg(results)==true){
       										 $('#grid_user_${pageId}').grid("parseResult",results);
       										 
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
   				}}
   			//全选
 				,{name:'selectedAll',caption:'${i18n.selectall}[F5]',keyboard:'F5',action:function(){
 					msgClear();
 					$('#grid_user_${pageId}').grid('selectedAll');
 					return false;
 				}}
   			//打印
 				,{name:'btn_print',caption:'${i18n.print}[F2]',keyboard:'F2',action:function(){
 					//是否选中
 					var records = $('#grid_user_${pageId}').grid('getSelectedAll');
 					if(records.length < 1){
 						showPromptMsg('red','${i18n.selectoneerror}')
 						return false;
 					}
 					records.push("ckandzick="+$("#ckandzick input").val());
 					var url = "<%=request.getContextPath()%>/yichang/40802.do";
 					 $('#form_user_${pageId}').form("submitUrl", records, url, function(results){
 						 if (showPromptRequestMsg(results)==true){
 							 var params = $('#grid_user_${pageId}').grid('getSelectedColumnValue','zhijqdh');
 								var strZhijqdh;
 								for(i=0;i<params.length;i++){
 									if(i == 0){
 										strZhijqdh=params[i];
 									}else{
 										strZhijqdh=strZhijqdh+"','" + params[i];
 									}
 								}
 								params.push("usercenter="+st_UserCenter);
 								params.push("zhijqdh='"+ strZhijqdh +"'");
 								var url = "<%=request.getContextPath()%>/yichang/40805.do";
 								g_isSub=0;
 								doprint(st_PageId,params,url);
 								$('#form_user_${pageId}').form("resetFields");
 								$('#grid_user_${pageId}').grid('clearRecords');
 								$('#ckandzick input').val(st_Cangkbh); 								
 						 }
 						 });
 					
 					return false;
 				}}
 	   			//返回上一页
 				,{name:'btn_back',caption:'${i18n.back}[F11]',keyboard:'F11'}
 				//返回
 				,{name:'btn_return',caption:'${i18n.return}[F12]',keyboard:'F11'}
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
		<br>
		<div align=right>
	    </div><br/>
<div id="grid_user_${pageId}"></div>
</div> 

	    
<div id='prompt'>${i18n.prompt}</div>	   
</div> 		    		    	    	    
</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>