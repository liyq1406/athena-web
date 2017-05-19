<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","40701");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_40701}</title>
<jsp:include page="../../common/js.jsp" />
<script type="text/javascript">
var paramsQuery;
var currentPage = 1;
var list =[];
$(function(){
	$('#form_user_${pageId}').form({
		onreload:true,
 		fields:[
                {fieldType:'fieldLabel',property:'fanxdh',dataType:'fanxdh',caption:'${i18n.fanxdh}',notNull:true}
                
	 			]
 		});
	
	$('#grid_user_${pageId}').grid({
		keyFields:['zhijsj'],
		id:'grid_user_${pageId}',
		showCheckbox:false,
		checkedOnlyOne:true,
		//翻页查询交易
		src:'<%=request.getContextPath()%>/yichang/40702.do',
		cols:[
		{property:'fanxrkdh',caption:'${i18n.fanxrkdh}',align:'center'},
		{property:'lingjbh',caption:'${i18n.lingjbh}',align:'center'},
		{property:'lingjmc',caption:'${i18n.lingjmc}',align:'center'},
		{property:'fanxsl',caption:'${i18n.fanxrksl}',align:'center'},
		{property:'danw',caption:'${i18n.danw}',align:'center'},
		{property:'gongysdm',caption:'${i18n.gongysdm}',align:'center'},
		{property:'gongysmc',caption:'${i18n.gongysmc}',align:'center'}
		]
	});

	//页面加载后，查询数据为界面赋值
	$(document).ready(function(){
		//加载返回数据
			$('#fanxdh span').html('${result.result.parameter.fanxdh}');
			//加载返回数据
			paramsQuery = $('#form_user_${pageId}').form("getFormParam");
			$('#grid_user_${pageId}').grid("load",paramsQuery);
			$('#grid_user_${pageId}').grid("setQueryParams", paramsQuery);
		
	});
 	$(document).keyboardsupport({});
});
</script>
</head>
<body>
<div style="padding:20px;">
<!--主体内容开始-->
<div id="title"></div>
<input id="fanxrkdh" name="fanxrkdh" type="Hidden"></input>
<input id="serachKey" name="serachKey" type="Hidden"></input>
			<form id="putform" method="post" name="putform">
				<input id="putvalue" name="putvalue" type="Hidden"></input>
			</form> 
<div id="form_user_${pageId}" class="ui-fieldLayout">
<table class="ui-grid" cellspacing="1" width="100%">
<tr>
		<td class="field-label">${i18n.fanxdh}：</td>
		<td class="field-container"><div class="ui-field" id="fanxdh"></div></td>
		<td align="right"><span id="btn_back"  class="ui-button">${i18n.back}[F11]</span><span id="btn_return"  class="ui-button">${i18n.return}[F12]</span></td>
      </tr>
  </table>
   	
<H4>
</H4>

<div id="grid_user_${pageId}" class='hidden-item'></div> 
</div> 
 <div id='prompt'>${i18n.prompt}</div>	    		    		    
</div>		    
</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>