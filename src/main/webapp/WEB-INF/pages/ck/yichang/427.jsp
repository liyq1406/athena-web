<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","427");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_427}</title>
<jsp:include page="../../common/js.jsp" />
<script type="text/javascript">
var paramsQuery;
var currentPage = 1;
var list="";
$(function(){
	$('#form_user_${pageId}').form({
	onreload:true,
 		fields:[
                {fieldType:'fieldText',property:'ush',dataType:'ush',caption:'${i18n.ush}',notNull:true}
                ]
 		});
		$('#grid_user_${pageId}').grid({
			keyFields:['yush'],
			id:'grid_user_${pageId}',
			showCheckbox:false,
			//翻页查询交易
			src:'<%=request.getContextPath()%>/yichang/42701.do',
			cols:[
			{property:'yush',caption:'${i18n.yuanush}',align:'center'},
	  		{property:'ush',caption:'${i18n.ush}',align:'center'},
	  		{property:'lingjbh',caption:'${i18n.lingjbh}',align:'center'},
	  		{property:'lingjmc',caption:'${i18n.lingjmc}',align:'center'},
	  		{property:'lingjsl',caption:'${i18n.lingjsl}',width:100,align:'center'},
	  		{property:'gongysdm',caption:'${i18n.gongysdm}',align:'center'},
	  		{property:'gongysmc',caption:'${i18n.gongysmc}',align:'center'}
	  		],
 buttons:[
          //查询
  	 {name:'search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
  	 	  //参数校验
		  if(!$('#form_user_${pageId}').form("validateParam")){
				return;	
		     }
 		 //提交数据
 		 var params = $('#form_user_${pageId}').form("getFormParam");
		 params.push("chexzhuangt=1");
		 params.push("zhuangtsx=2");
		 $('#grid_user_${pageId}').grid("setQueryParams", params);
 		 var url = "<%=request.getContextPath()%>/yichang/42701.do";
		 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 if (showPromptRequestMsg(results)==true){
				    //加载grid
					$('#grid_user_${pageId}').grid("parseResult",results);
					list=results.result.parameter.list;					
			     }else{
			    	 $('#grid_user_${pageId}').grid('clearRecords');	
			     }
		 });
 		return false;
	  }}
	  //撤销
	,{name:'chexiao',caption:'${i18n.repeal}[F2]',keyboard:'F2',action:function(){		
		if(list==""){
			return;
		}
 	   if(!$('#ush').fieldText('validateNotNull')){
 			return;
 		}
 		 //提交数据
 		var params = [];
 		params.push("ush="+$('#ush input').val());
 		params.push('zhuangtsx=2');
 		var url = "<%=request.getContextPath()%>/yichang/42702.do";
		 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 if (showPromptRequestMsg(results)==true){
				//加载grid
					$('#grid_user_${pageId}').grid("parseResult",results)
					list="";
			 }
			 });
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
 <div id="form_user_${pageId}" class="ui-fieldLayout" >
<table class="ui-grid" cellspacing="1" width="100%">
      <tr>
		<td class="field-label">${i18n.ush}：</td>
		<td class="field-container"><div class="ui-field" id="ush"></div></td>
		<td class="field-label"></td>
		<td class="field-container"></td>
      </tr>
</table>	
</div> 
<div id="grid_user_${pageId}" class='hidden-item'></div>
<div id='prompt'>${i18n.prompt}</div>	    		    
</div>	    
</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>