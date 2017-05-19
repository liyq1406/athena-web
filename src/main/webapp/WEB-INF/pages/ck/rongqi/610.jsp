<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","610");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_610}</title>
<jsp:include page="../../common/js.jsp" />
<script type="text/javascript">
var paramsQuery;
var currentPage = 1;
$(function(){
	$('#form_user_${pageId}').form({
		onreload:true,
 		fields:[
                {fieldType:'fieldSelect',property:'danjlx',caption:'${i18n.danjlx}',internation:true,notNull:true,src:'<%=request.getContextPath()%>/common/danjlx.do'},
                {fieldType:'fieldText',property:'danjbh',dataType:'baofdh',caption:'${i18n.danjbh}',notNull:true},
                {fieldType:'fieldText',property:'chexyy',maxLength:'20',caption:'${i18n.chexyy}',notNull:true}
	 			]
 		});
	$('#grid_user_${pageId}').grid({
		keyFields:['rongqxh'],
		id:'grid_user_${pageId}',
		showCheckbox:false,
		//翻页查询交易
		src:'<%=request.getContextPath()%>/rongqi/61002.do',
		cols:[
		//{property:'gongysdm',caption:'${i18n.gongys}'},
  		//{property:'chengysdm',caption:'${i18n.wuls}'},
  		{property:'wuld',caption:'${i18n.ronqqiq}'},
  		{property:'rongqxh',caption:'${i18n.rongqxh}'},
  		{property:'rongqsl',caption:'${i18n.baofsl}'}
  		]
	});
	//F1确认
 	$('#btn_ok').bind('click',function(){
 		$('#grid_user_${pageId}').grid('clearRecords');
 		 //参数校验
 		if(!$('#form_user_${pageId}').form("validateParam")){
				return;	
 		}
 		 //提交数据
 		var params = $('#form_user_${pageId}').form("getFormParam");
 		 params.push("caozy="+st_UserName);
 		$('#grid_user_${pageId}').grid("setQueryParams", params);
 		var url = "<%=request.getContextPath()%>/rongqi/61001.do";
		 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 if (showPromptRequestMsg(results)==true){
				 $('#grid_user_${pageId}').grid("parseResult",results)
			 }
			 });
 	}); 
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
		<td class="field-label">${i18n.chexyy}：</td>
		<td class="field-container"><div class="ui-field" id="chexyy"></div></td>
      </tr>
	</table>
	<br/>
	<div align="right">
		<span id="btn_ok" class="ui-button">${i18n.repeal}[F1]</span>
		<span id="btn_back"  class="ui-button">${i18n.back}[F11]</span>
		<span id="btn_return" class="ui-button">${i18n.return}[F12]</span>
	</div>
	<br/>
</div>		
<div id="grid_user_${pageId}" class='hidden-item'></div>
<div id='prompt'>${i18n.prompt}</div>

</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>