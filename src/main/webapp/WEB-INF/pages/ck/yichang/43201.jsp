<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","43201");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_43201}</title>
<jsp:include page="../../common/js.jsp" />
<jsp:include page="../../common/print.jsp" />
<script type="text/javascript">
var paramsQuery;
var currentPage = 1;
$(function(){
	$('#form_user_${pageId}').form({
 		fields:[
                {fieldType:'fieldLabel',property:'ckandzick'},
				{fieldType:'fieldLabelInput',property:'elh'},
				{fieldType:'fieldSelect',property:'daoclx',caption:'${i18n.daoclx}',value:'Text',realValue:'0',notNull:true,src:'<%=request.getContextPath()%>/common/daoclx.do'},
				{fieldType:'fieldHidden',property:'zhijqdh'}
	 			]
 		});
	
	$('#grid_user_${pageId}').grid({
		keyFields:['zhijqdh'],
		id:'grid_user_${pageId}',
		showCheckbox:false,
		//翻页查询交易
		src:'<%=request.getContextPath()%>/yichang/43202.do',
		cols:[
  		{property:'zhijqdh',caption:'${i18n.zhijd}',align:'center',width:50},
  		{property:'ckandzick',caption:'${i18n.cangkh}',align:'center',width:50},
  		{property:'ush',caption:'${i18n.ush}',align:'center',width:50},
  		{property:'lingjbh',caption:'${i18n.lingjbh}',align:'center',width:50},
  		{property:'lingjmc',caption:'${i18n.lingjmc}',align:'center',width:50},
  		{property:'lingjsl',caption:'${i18n.lingjsl}',align:'center',width:50},
  		{property:'elh',caption:'${i18n.elh}',align:'center',width:50},
  		{property:'zhijlxxx',caption:'${i18n.zhijdlx}',align:'center',internation:true,width:50},
  		{property:'blh',caption:'${i18n.jiaohdh}',align:'center',width:50},
  		{property:'pich',caption:'${i18n.pich}',align:'center',width:50},
  		{property:'zhijz',caption:'${i18n.zhijz}',align:'center',width:50},
  		{property:'zhijy',caption:'${i18n.zhijy}',align:'center',width:50},
  		{property:'gongysdm',caption:'${i18n.gongysdm}',align:'center',width:50},
  		{property:'gongysmc',caption:'${i18n.gongysmc}',align:'center',width:50}
  		
  		]
	});
	//页面加载后，查询数据为界面赋值
	$(document).ready(function(){
		//加载返回数据
		$('#ckandzick span').html('${result.result.parameter.ckandzick}');
		$('#elh span').html('${result.result.parameter.elh}');
		$('#elh input').val('${result.result.parameter.elh}');
		//设置质检清单号
		$('#zhijqdh input').val('${result.result.parameter.zhijqdh}'); 
		//加载返回数据
		$('#grid_user_${pageId}').grid('parseResult',${result});
		var params = $('#form_user_${pageId}').form("getFormParam");
		params.push("zhijqdh="+'${result.result.parameter.zhijqdh}');
		params.push("zhijlx="+'${result.result.parameter.zhijlx}');
		params.push("blh="+'${result.result.parameter.blh}');			
		params.push("zhijz="+'${result.result.parameter.zhijz}');
		params.push("zhijy="+'${result.result.parameter.zhijy}');
		$('#grid_user_${pageId}').grid("setQueryParams", params);
	});
	//F2打印
 	$('#btn_print').bind('click',function(){
 		//是否选中
 		var params = $('#grid_user_${pageId}').grid('getRecordAll');
 		var strZhijqdh;
 		var par=[];
 		//去掉List[0];
		for(i=0;i<params.length;i++){
			params[i]=params[i].toString().replace("list[0].","");
		}
 		var strZhijqdh=params[0].split("=");
 		par.push("usercenter="+st_UserCenter);
 		par.push("zhijqdh="+ strZhijqdh[1]);
		var url = "<%=request.getContextPath()%>/yichang/41003.do";
	 	$('#form_user_${pageId}').form("submitUrl", par, url, function(results){
			if (showPromptRequestMsg(results)==true){
				g_isSub = 0;
				var printParams = [];
				printParams.push("usercenter="+st_UserCenter);
 				printParams.push("zhijqdh='"+ strZhijqdh[1] +"'");
 				printParams.push("elh="+$('#elh span').html());
		 		var url = "<%=request.getContextPath()%>/yichang/40805.do";
		 		doprint(408,printParams,url);
		 		return false;
	 		}
 		});
 		
 	});
 	
 	//F8导出
 	$('#btn_export').bind('click',function(){ 
 		//参数校验
 		if(!$('#form_user_${pageId}').form("validateParam")){
			return;	
 		}
 		$('#btn_export').hide();
		//数据导出
   	 	var dclx = $("#daoclx input").val();
   	 	$("#daoclx input").val($("#daoclx input").attr("realValue"));
		$("#putform").attr("action","<%=request.getContextPath()%>/yichang/40806.do");
	    document.putform.submit();
	    $("#daoclx input").val(dclx);
		return false;
 	});
 	
	$(document).keyboardsupport({});
});
</script>
</head>
<body>
<div style="padding:20px;">
<!--主体内容开始--> 
<div id="title"></div>
<form id="putform" method="post" name="putform">
<div id="form_user_${pageId}" class="ui-fieldLayout" >
<table class="ui-grid" cellspacing="1" width="100%">
      <tr>
		<td class="field-label">${i18n.zickbh}：</td>
		<td class="field-container"><div class="ui-field" id="ckandzick"></div></td>
		<td class="field-label">${i18n.elh}：</td>
		<td class="field-container"><div class="ui-field" id="elh"></div></td>
		<td class="field-label">${i18n.daoclx}：</td>
		<td class="field-container"><div class="ui-field" id="daoclx"></div><div class="ui-field" id="zhijqdh"></div></td>
  </table>
  <br/>
	<div align=right>
	<span id="btn_print"  class="ui-button">${i18n.printzjqd}[F2]</span>	
	<span id="btn_export"  class="ui-button">${i18n.export}[F8]</span>	
	<span id="btn_back"  class="ui-button">${i18n.back}[F11]</span>		
	<span id="btn_return"  class="ui-button">${i18n.return}[F12]</span>
    </div>

</div> 
  </form> 
<div id="grid_user_${pageId}" class='hidden-item'></div>
<div id='prompt'>${i18n.prompt}</div>	    		    
</div>		  		    
</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>