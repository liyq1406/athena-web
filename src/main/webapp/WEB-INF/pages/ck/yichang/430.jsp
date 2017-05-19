<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","430");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_430}</title>
<jsp:include page="../../common/js.jsp" />
<script type="text/javascript">
var paramsQuery;
var currentPage = 1;
$(function(){
	$('#form_user_${pageId}').form({
		onreload:true,
 		fields:[
                {fieldType:'fieldSelect',property:'ckandzick',caption:'${i18n.zickbh}',notNull:true,src:'<%=request.getContextPath()%>/common/wareHouseck.do'+'?buhgpk='+2+'&buhgpk2='+0},
				{fieldType:'fieldText',property:'elh',dataType:'elh',caption:'${i18n.elh}',notNull:false},
				{fieldType:'fieldText',property:'shengbd',dataType:'shuzzm',maxLength:'13',caption:'${i18n.shengbd}',notNull:false},
				{fieldType:'fieldText',property:'lingjbh',dataType:'letter_numeric',limitedLength:'10',caption:'${i18n.lingjbh}',notNull:false}
	 			]
 		});
		$('#grid_user_${pageId}').grid({
			keyFields:['ush','lingjsl','fanxsl'],
			id:'grid_user_${pageId}',
			showCheckbox:true,
			//checkedOnlyOne:true,
			//翻页查询交易
			src:'<%=request.getContextPath()%>/yichang/43001.do',
			editSubmitSrc:'<%=request.getContextPath()%>/yichang/43002.do',
			cols:[
			{property:'elh',caption:'${i18n.elh}',align:'center'},
	  		{property:'ush',caption:'${i18n.ush}',align:'center'},
	  		{property:'lingjbh',caption:'${i18n.lingjbh}',align:'center'},
	  		{property:'lingjmc',caption:'${i18n.lingjmc}',align:'center'},
	  		{property:'lingjsl',caption:'${i18n.lingjsl}',width:100,align:'center'},
	  		{property:'fanxsl',caption:'${i18n.fanxsl}',align:'center',editor:'fieldText',dataType:'dbnumber'},
	  		{property:'gongysdm',caption:'${i18n.gongysdm}',align:'center'},
	  		{property:'gongysmc',caption:'${i18n.gongysmc}',align:'center'}
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
				   	  					 		params.push("cangklx=2");
				   	  					 		$('#grid_user_${pageId}').grid("setQueryParams", params);
				   	  					 		var url = "<%=request.getContextPath()%>/yichang/43001.do";
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
			  				showPromptMsg('red','${i18n.selectoneerror}')
			  				return false;
			  			}
			  			//验证Grid的输入格式
			  	 		if (!$('#grid_user_${pageId}').grid("validate")){
			  	 			return false;
			  	 		}
			  	 		 //提交数据
			  	 		var params = $('#grid_user_${pageId}').grid('getSelectedAll');
			  	 		params.push("ckandzick="+$('#ckandzick input').val());
			  	 		params.push("elh="+$('#elh input').val());
			  	 		params.push("shengbd="+$('#shengbd input').val());
			  	 		params.push("lingjbh="+$('#lingjbh input').val());
			  	 		params.push("cangklx=2");
			  	 		paramsQuery = jQuery.extend(true,[],params);
			  	 		var url = "<%=request.getContextPath()%>/yichang/43003.do";
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
 <div id="form_user_${pageId}" class="ui-fieldLayout" >
<table class="ui-grid" cellspacing="1" width="100%">
      <tr>
		<td class="field-label">${i18n.buhgpckh}：</td>
		<td class="field-container"><div class="ui-field" id="ckandzick"></div></td>
		<td class="field-label">${i18n.elh}：</td>
		<td class="field-container"><div class="ui-field" id="elh"></div></td>
      </tr>
      <tr>
		<td class="field-label">${i18n.shengbd}：</td>
		<td class="field-container"><div class="ui-field" id="shengbd"></div></td>
		<td class="field-label">${i18n.lingjbh}：</td>
		<td class="field-container"><div class="ui-field" id="lingjbh"></div></td>
      </tr>
  </table>
</div> 
<div id="grid_user_${pageId}" class='hidden-item'></div>
<div id='prompt'>${i18n.prompt}</div>	    		    
</div>	    
</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>