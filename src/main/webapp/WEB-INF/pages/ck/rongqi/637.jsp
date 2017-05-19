<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","637");%>
<t:html i18n="i18n.ck">
<head>
<title>${i18n.title_637}</title>
<jsp:include page="../../common/js.jsp" />
<jsp:include page="../../common/print.jsp"/>
<script type="text/javascript">
var paramsQuery;
$(function(){
	$('#form_user_${pageId}').form({
		onreload:true,
 		fields:[
                {fieldType:'fieldText',property:'diaobdh',dataType:'diaobdh',caption:'${i18n.yikdh}',notNull:true},
                {fieldType:'fieldText',property:'diaoruwld',caption:'${i18n.diaorurqq}',notNull:false},
                {fieldType:'fieldText',property:'wuld',caption:'${i18n.diaochurqq}',notNull:false},
                {fieldType:'fieldText',property:'rongqxh',caption:'${i18n.rongqxh}',notNull:false}
	 			]
 		});

		$('#grid_user_${pageId}').grid({
			keyFields:['rongqxh','diaoruwld','wuld','rongqsl','yidbsl'],
			id:'grid_user_${pageId}',
			showCheckbox:false,
			//翻页查询交易
			src:'<%=request.getContextPath()%>/rongqi/63701.do?zhuangt1=2',
			editSubmitSrc:'<%=request.getContextPath()%>/rongqi/63701.do?zhuangt1=1',
			cols:[
			{property:'diaoruwld',caption:'${i18n.diaorurqq}'},
			{property:'wuld',caption:'${i18n.diaochurqq}'},
			{property:'rongqxh',caption:'${i18n.rongqxh}'},
			{property:'rongqsl',caption:'${i18n.rongqisl}'},
			{property:'yidbsl',caption:'${i18n.yirsl}',dataType:'dbnumber',notNull:true,editor:'fieldText'}
	  		]
		});
	
		//F1查询
	 	$('#btn_search').bind('click',function(){
	 		//参数校验
			if(!$('#form_user_${pageId}').form("validateParam")){
			 	$('#grid_user_${pageId}').grid('clearRecords');
				return;	
			}
			//查询并显示数据
	 		var params = $('#form_user_${pageId}').form("getFormParam");
	 		params.push("currentPage=1");
	 		params.push("rongqcbh="+st_Rongqcbh);
			//设置分页条件
			$('#grid_user_${pageId}').grid("setQueryParams", params);
			//加载数据
			$('#grid_user_${pageId}').grid("load",params);
    		return false;
	 	});
	 	
	 	//结束录入　
	 	$('#btn_endinput').bind('click',function(){
	 		//参数校验
			if(!$('#form_user_${pageId}').form("validateParam")){
			 	$('#grid_user_${pageId}').grid('clearRecords');
				return;	
			}
			//查询并显示数据
	 		var params = $('#form_user_${pageId}').form("getFormParam");
		 	var url = "<%=request.getContextPath()%>/rongqi/63701.do?zhuangt1=3";
			$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
				 if (showPromptRequestMsg(results)==true){
					  var params2 = [];
					  params2.push("usercenter="+st_UserCenter);
					  params2.push("diaobdh="+ $('#diaobdh input').val());
					  var url2 = "<%=request.getContextPath()%>/rongqi/print_637.do";
					  g_isSub=0;
					  doprint(637,params2,url2);
				 	//提交成功后 重新刷新当前页面
					$('#form_user_${pageId}').form('resetFields');
					$('#grid_user_${pageId}').grid('clearRecords');
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
		<td class="field-label">${i18n.yikdh}：</td>
		<td class="field-container"><div class="ui-field" id="diaobdh"></div></td>
		<td class="field-label">${i18n.diaorurqq}:</td>
		<td class="field-container"><div class="ui-field" id="diaoruwld"></div></td>	
		<td class="field-label">${i18n.diaochurqq}:</td>
		<td class="field-container"><div class="ui-field" id="wuld"></div></td>	
		<td class="field-label">${i18n.rongqxh}：</td>
		<td class="field-container"><div class="ui-field" id="rongqxh"></div></td>
     </tr>
</table>
<br/>
<div align="right">
	<span id="btn_search"  class="ui-button">${i18n.search}[F1]</span>
	<span id="btn_endinput"  class="ui-button">${i18n.endinput}[F3]</span>
	<span id="btn_back"  class="ui-button">${i18n.back}[F11]</span>
	<span id="btn_return"  class="ui-button">${i18n.return}[F12]</span>	
</div>
<br/>
</div>	
<div id="grid_user_${pageId}" class='hidden-item'></div>
<div id='prompt'>${i18n.prompt}</div>
</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>