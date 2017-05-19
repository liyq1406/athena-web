<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","609");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_609}</title>
<jsp:include page="../../common/js.jsp" />
<jsp:include page="../../common/print.jsp" />
<script type="text/javascript">
var paramsQuery;
var currentPage = 1;
$(function(){
	$('#form_user_${pageId}').form({
		onreload:true,
 		fields:[
                {fieldType:'fieldSelect',property:'danjlx',caption:'${i18n.danjlx}',internation:true,notNull:true,src:'<%=request.getContextPath()%>/common/danjlx.do'},
                {fieldType:'fieldText',property:'danjbh',dataType:'baofdh',caption:'${i18n.danjbh}',notNull:true}
	 			]
 		});
	var par=[];
	gridload();
	function gridload(){
		$('#grid_user_${pageId}').grid({
			keyFields:['rongqxh','rongqsl','wuld'],
			id:'grid_user_${pageId}',
			showCheckbox:false,
			//翻页查询交易
			src:'<%=request.getContextPath()%>/rongqi/60902.do',
			editSubmitSrc:'<%=request.getContextPath()%>/rongqi/60702.do',
			params:par,
			cols:[
			//{property:'gongysdm',caption:'${i18n.gongys}'},
	  		//{property:'chengysdm',caption:'${i18n.wuls}'},
	  		{property:'wuld',caption:'${i18n.rongqiq}'},
	  		{property:'rongqxh',caption:'${i18n.rongqxh}'},
	  		{property:'rongqsl',caption:'${i18n.baofsl}',editor:'fieldText',dataType:'plusinteger'}
	  		]
		});
	}
	
	//F1查询
 	$('#btn_search').bind('click',function(){
 		$('#grid_user_${pageId}').grid('clearRecords');
 		 //参数校验
 		if(!$('#form_user_${pageId}').form("validateParam")){
				return;	
 		}
 		 //提交数据
 		var params = $('#form_user_${pageId}').form("getFormParam");
 		 params.push("zhuangtsx=1");//1,报废  2  维修
 		 if($("#danjlx input").val()=='报废'){
 			 params.push("zhuangt=1");
 		 }else{
 			 params.push("zhuangt=2");
 		 }
 		
 		 params.push("caozy="+st_UserName);
 		$('#grid_user_${pageId}').grid("setQueryParams", params);
 		var url = "<%=request.getContextPath()%>/rongqi/60701.do";
		 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 if (showPromptRequestMsg(results)==true){
				 $('#grid_user_${pageId}').grid("parseResult",results)
				
				 par = [];
					par.push('danjbh='+$('#danjbh input').val());
					 if($("#danjlx input").val()=='报废'){
			 			 par.push("zhuangt=1");
			 		 }else{
			 			 par.push("zhuangt=2");
			 		 }
					gridload();
			 }
			 });
 	});
	//F2确认
 	$('#btn_ok').bind('click',function(){
 		$('#grid_user_${pageId}').grid('clearRecords');
 		 //参数校验
 		if(!$('#form_user_${pageId}').form("validateParam")){
				return;	
 		}
 		 //提交数据
 		var params = $('#form_user_${pageId}').form("getFormParam");
 		 params.push("caozy="+st_UserName);
 		var url = "<%=request.getContextPath()%>/rongqi/60901.do";
		 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 if (showPromptRequestMsg(results)==true){
				 $('#grid_user_${pageId}').grid("parseResult",results)
			 }
			 });
 	});
	
 	//F4打印
<%-- 	$('#btn_print').bind('click',function(){
		if($('#danjbh input').val()=="")
		{
		showPromptMsg('red','${i18n.danjbhbnwk}')
		return;
		}
			   var params2 = [];
		 		params2.push("usercenter="+st_UserCenter);
		 		params2.push("danjbh='"+$('#danjbh input').val()+"'");
		 		var url2 = "<%=request.getContextPath()%>/rongqi/63002.do";
		 		doprint(630,params2,url2);
				$('#form_user_${pageId}').form("resetFields");
				$('#grid_user_${pageId}').grid('clearRecords');
				$('#danjbh').val("");
return false;
	});  --%>
	$(document).keyboardsupport({});
});
</script>
</head>
<body>
<!--主体内容开始-->
<div id="title"></div>
<div id="form_user_${pageId}" class="ui-fieldLayout">
	<table class="ui-grid" cellspacing="1" width="100%" >
      <tr>
		<td class="field-label">${i18n.danjlx}：</td>
		<td class="field-container"><div class="ui-field" id="danjlx"></div></td>
		<td class="field-label">${i18n.danjh}：</td>
		<td class="field-container"><div class="ui-field" id="danjbh"></div></td>
      </tr>
	</table>
	<br/>
	    <div align="right">
		<span id="btn_search"  class="ui-button">${i18n.search}[F1]</span>
		<span id="btn_ok"  class="ui-button">${i18n.ok}[F2]</span>			
		<span id="btn_back"  class="ui-button">${i18n.back}[F11]</span>
		<span id="btn_return"  class="ui-button">${i18n.return}[F12]</span>
	</div>
	<br/>
	<div id="grid_user_${pageId}" class='hidden-item'></div>
</div>	
<div id='prompt'>${i18n.prompt}</div>
</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>