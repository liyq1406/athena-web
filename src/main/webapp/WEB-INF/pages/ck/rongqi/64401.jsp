<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","64401");%>
<!-- 11891 -->
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_64401}</title>
<jsp:include page="../../common/js.jsp" />
<jsp:include page="../../common/print.jsp" />
<script type="text/javascript">

var paramsQuery;
var currentPage = 1;
var params = [];
$(function(){
	$('#form_user_${pageId}').form({
	 		fields:[
				{fieldType:'fieldLabel',property:'rongqfhdh',caption:'${i18n.rongqbgdh}'},
				{fieldType:'fieldLabel',property:'danjbh',caption:'${i18n.rongqbbq}'}
	 			]
 		});
 		
	$('#grid_user_${pageId}').grid({
		keyFields:['rongqmxid','rongqxh','shifsl','rongqfhdh','rongqsl'],
		params:params,
		id:'grid_user_${pageId}',
		src:'<%=request.getContextPath()%>/rongqi/64403.do',
		editSubmitSrc:'<%=request.getContextPath()%>/rongqi/64402.do',
		showCheckbox:false,
		//翻页查询交易
		cols:[		
		{property:'rongqfhdh',caption:'${i18n.rongqbaoh}'},
		{property:'rongqxh',caption:'${i18n.rongqxh}'},
		{property:'rongqsl',caption:'${i18n.rongqsl}'},		
		{property:'shifsl',caption:'${i18n.shissl}',editor:'fieldText',dataType:'dbnumber'}
  		]
	});
	
	//页面加载后，查询数据为界面赋值
	$(document).ready(function(){
		//加载返回数据
		$('#rongqfhdh').html('${result.result.parameter.rongqfhdh}');	
		$('#danjbh').html('${result.result.parameter.danjbh}');
		params.push("flag=1");
		params.push("danjbh="+'${result.result.parameter.danjbh}');
		$('#grid_user_${pageId}').grid('parseResult',${result});
	});
	$(document).keyboardsupport({});
});
</script>
</head>
<body>
<!--主体内容开始-->
<div id="title"></div>
<input id="serachKey" name="serachKey" type="Hidden"></input>
<form id="putform" method="post" name="putform" >
<input id="putvalue"   name="putvalue" type="hidden"></input>
</form> 
<div id="form_user_${pageId}" class="ui-fieldLayout">
		  <table class="ui-grid" cellspacing="1" width="100%" >
		  	<tr>
		  	  <td class="field-label">${i18n.rongqfhdh}：</td>
              <td class="field-container"><div class="ui-field" id="rongqfhdh"></div></td>
              <td class="field-label">${i18n.rongqbbq}：</td>
              <td class="field-container"><div class="ui-field" id="danjbh"></div></td>
            </tr>
          </table>
		  <br>
		<div align=right>
		<span id="btn_back"  class="ui-button">${i18n.back}[F11]</span>	
		<span id="btn_return"  class="ui-button">${i18n.return}[F12]</span>
	    </div>
</div>
<div id="grid_user_${pageId}" class='hidden-item'></div>
<div id='prompt'>${i18n.prompt}</div>

</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>