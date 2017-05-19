<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","41201");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_41201}</title>
<jsp:include page="../../common/js.jsp" />
<jsp:include page="../../common/print.jsp" />
<script type="text/javascript">
var paramsQuery;
var currentPage = 1;
$(function(){
	$('#form_user_${pageId}').form({
 		fields:[
                {fieldType:'fieldLabel',property:'elh'},
				{fieldType:'fieldLabel',property:'pich'},
				{fieldType:'fieldLabel',property:'zhijjjbgdh'}
	 			]
 		});
	
	$('#grid_user_${pageId}').grid({
		keyFields:['uch'],
		id:'grid_user_${pageId}',
		//翻页查询交易
		src:'<%=request.getContextPath()%>/yichang/41202.do',
		cols:[
        {property:'ush',caption:'${i18n.ush}',align:'center'},
        {property:'zhuangtxx',caption:'${i18n.zhijbz}',align:'center',internation:true},
  		{property:'lingjbh',caption:'${i18n.lingjbh}',align:'center'},
  		{property:'lingjmc',caption:'${i18n.lingjmc}',align:'center'},
  		{property:'lingjsl',caption:'${i18n.lingjsl}',align:'center'},
  		{property:'hegsl',caption:'${i18n.hegsl}',align:'center'},
  		{property:'buhgsl',caption:'${i18n.buhgsl}',align:'center'},
  		{property:'gongysdm',caption:'${i18n.gongysdm}',align:'center'},
  		{property:'gongysmc',caption:'${i18n.gongysmc}',align:'center'}
  		]
	});
	
	//页面加载后，查询数据为界面赋值
	$(document).ready(function(){
		//加载返回数据
			$('#elh span').html('${result.result.parameter.elh}');
			$('#pich span').html('${result.result.parameter.pich}');
			$('#zhijjjbgdh span').html('${result.result.parameter.zhijjjbgdh}');
			//加载返回数据
			$('#grid_user_${pageId}').grid('parseResult',${result});
			var params = $('#form_user_${pageId}').form("getFormParam");
			$('#grid_user_${pageId}').grid("setQueryParams", params);
	});
	//F2打印
	$('#btn_print').bind('click',function(){
					var params=[];
					params.push("usercenter="+st_UserCenter);
					params.push("zhijjjbgdh='"+ $("#zhijjjbgdh span").html() +"'");
					 var url = "<%=request.getContextPath()%>/yichang/41108.do";
					doprint(411,params,url);
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
<div id="form_user_${pageId}" class="ui-fieldLayout" >
<table class="ui-grid" cellspacing="1" width="100%">
      <tr>
		<td class="field-label">${i18n.elh}：</td>
		<td class="field-container"><div class="ui-field" id="elh"></div></td>
		<td class="field-label">${i18n.pich}：</td>
		<td class="field-container"><div class="ui-field" id="pich"></div></td>
		<td class="field-label">${i18n.zhijjjbgdh}：</td>
		<td class="field-container"><div class="ui-field" id="zhijjjbgdh"></div></td>
      </tr>
  </table>
  <br>
		<div align="right">
		<span id="btn_print"  class="ui-button">${i18n.print}[F1]</span>	
		<span id="btn_back"  class="ui-button">${i18n.back}[F11]</span>	
		<span id="btn_return"  class="ui-button">${i18n.return}[F12]</span>			
	    </div><br> 	
</div> 
<div id="grid_user_${pageId}" class='hidden-item'></div>
<div id='prompt'>${i18n.prompt}</div>	    		    		    
</div>  
</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>