<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","429");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_429}</title>
<jsp:include page="../../common/js.jsp" />
<script type="text/javascript">
var paramsQuery;
var currentPage = 1;
$(function(){
	$('#form_user_${pageId}').form({
		onreload:true,
 		fields:[
                {fieldType:'fieldText',property:'rukpjh',dataType:'rukpjh',caption:'${i18n.rukpjh}',notNull:false},
				{fieldType:'fieldText',property:'elh',dataType:'elh',caption:'${i18n.elh}',notNull:false},
				{fieldType:'fieldText',property:'ush',dataType:'ush',caption:'${i18n.ush}',notNull:false},
				{fieldType:'fieldText',property:'lingjbh',dataType:'letter_numeric',limitedLength:'10',caption:'${i18n.lingjbh}',notNull:false},
				{fieldType:'fieldSelect',property:'cangkbh',dataType:'letter_numeric',limitedLength:'3',limitedLength2:'6',caption:'${i18n.cangkbh}',includeNull:true,notNull:false,src:'<%=request.getContextPath()%>/common/wareHouse.do'},
				{fieldType:'fieldText',property:'chengysdm',dataType:'shuzzm',maxLength:'10',caption:'${i18n.chengysdm}',notNull:false},
				{fieldType:'fieldText',property:'rukrq1',dataType:'datetime',maskOptions:{mask:'9999-99-99 99:99:99'},caption:'${i18n.caozsj}',notNull:false},
				{fieldType:'fieldText',property:'rukrq2',dataType:'datetime',maskOptions:{mask:'9999-99-99 99:99:99'},notNull:false},
				{fieldType:'fieldText',property:'gongysdm',dataType:'shuzzm',maxLength:'10',caption:'${i18n.gongysdm}',notNull:false}
	 			]
 		});
	
	$('#grid_user_${pageId}').grid({
		keyFields:['uch'],
		id:'grid_user_${pageId}',
		showCheckbox:false,
		//翻页查询交易
		src:'<%=request.getContextPath()%>/yichang/42901.do',
		cols:[
		{property:'rukpjh',caption:'${i18n.rukpjh}',align:'center',width:50},
		{property:'elh',caption:'${i18n.elh}',align:'center',width:50},
  		{property:'ush',caption:'${i18n.ush}',align:'center',width:50},
  		{property:'lingjbh',caption:'${i18n.lingjbh}',align:'center',width:50},
  		{property:'lingjmc',caption:'${i18n.lingjmc}',align:'center',width:50},
  		{property:'lingjsl',caption:'${i18n.lingjsl}',width:50,align:'center'},
  		{property:'gongysdm',caption:'${i18n.gongysdm}',align:'center',width:50},
  		{property:'gongysmc',caption:'${i18n.gongysmc}',align:'center',width:50},
  		{property:'buhgpkuw',caption:'${i18n.buhgpkuw}',align:'center',width:50}
  		],
 buttons:[
  	 {name:'search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
  	    //参数校验
 		if(!$('#form_user_${pageId}').form("validateParam")){
				return;	
 		}
 		var shengbrq1 = $('#rukrq1 input').val();
 		var shengbrq2 = $('#rukrq2 input').val();
		  var date1 = new Date(shengbrq1.replace(/-/g,"/"));
		  var date2 = new Date(shengbrq2.replace(/-/g,"/"));
		  if(date1>date2){
				 showPromptMsg('red','${i18n.diyigsjxydrg}')
				 return;
		  }
 		 //提交数据
 		var params = $('#form_user_${pageId}').form("getFormParam");
 		$('#grid_user_${pageId}').grid("setQueryParams", params);
 		var url = "<%=request.getContextPath()%>/yichang/42901.do";
		 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 if (showPromptRequestMsg(results)==true){
					 $('#grid_user_${pageId}').grid("parseResult",results)
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
<div id="form_user_${pageId}" class="ui-fieldLayout">
<table class="ui-grid" cellspacing="1" width="100%">
      <tr>
		<td class="field-label">${i18n.rukpjh}：</td>
		<td class="field-container"><div class="ui-field" id="rukpjh"></div></td>
		<td class="field-label">${i18n.lingjbh}：</td>	
		<td class="field-container"><div class="ui-field" id="lingjbh"></div></td>
		
      </tr>
      <tr>
      <td class="field-label">${i18n.cangkbh}：</td>	
		<td class="field-container"><div class="ui-field" id="cangkbh"></div></td>
		<td class="field-label">${i18n.chengysdm}：</td>	
		<td class="field-container"><div class="ui-field" id="chengysdm"></div></td>
      </tr>
	  <tr>
	  
	     <td class="field-label">${i18n.elh}：</td>
		<td class="field-container"><div class="ui-field" id="elh"></div></td>
		<td class="field-label">${i18n.ush}：</td>
		<td class="field-container"><div class="ui-field" id="ush"></div></td>
	</tr>
      <tr>
      	<td class="field-label">${i18n.gongysdm}：</td>
		<td class="field-container"><div class="ui-field" id="gongysdm"></div></td>
		<td class="field-label">${i18n.caozsj}：</td>	
		<td class="field-container"><div style="float:left" class="ui-field" id="rukrq1"></div><div style="float:left" >-</div><div style="float:left" class="ui-field" id="rukrq2"></div></td>
      
      </tr>
  </table>
 </div> 
<div id="grid_user_${pageId}" class='hidden-item'></div>
<div id='prompt'>${i18n.prompt}</div>		
</div> 
     
</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>