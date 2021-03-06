<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","60801");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_60801}</title>
<jsp:include page="../../common/js.jsp" />
<jsp:include page="../../common/print.jsp" />
<script type="text/javascript">
var paramsQuery;
var currentPage = 1;
$(function(){
	$('#form_user_${pageId}').form({
 		fields:[
                {fieldType:'fieldLabel',property:'danjbh'},
                {fieldType:'fieldLabel',property:'wuld'},
                {fieldType:'fieldLabel',property:'gongysdm'},
                {fieldType:'fieldLabel',property:'chengysdm'}
	 			]
 		});
	$('#grid_user_${pageId}').grid({
		keyFields:['rongqxh'],
		id:'grid_user_${pageId}',
		showCheckbox:false,
		//翻页查询交易
		src:'<%=request.getContextPath()%>/rongqi/60802.do',
		cols:[
		{property:'rongqxh',caption:'${i18n.rongqxh}'},
  		{property:'rongqsl',caption:'${i18n.rongqsl}'},
  		{property:'creator',caption:'${i18n.creator}'},
		{property:'create_time',caption:'${i18n.create_time}'}
  		]
	});
	
	//F8打印 
	$('#btn_print').bind('click',function(){
			var params2 = [];
	 		params2.push("usercenter="+st_UserCenter);
	 		params2.push("danjbh="+$('#danjbh span').html());
	 		var url2 = "<%=request.getContextPath()%>/rongqi/63002.do";
	 		doprint(630,params2,url2);
			return false;
	 });
	 
	
	//页面加载后，查询数据为界面赋值
	$(document).ready(function(){
		//加载返回数据
			$('#danjbh span').html('${result.result.parameter.danjbh}');
			$('#wuld span').html('${result.result.parameter.wuld}');
			$('#gongysdm span').html('${result.result.parameter.gongysdm}');
			$('#chengysdm span').html('${result.result.parameter.chengysdm}');
			//加载返回数据
			$('#grid_user_${pageId}').grid('parseResult',${result});
			var params = $('#form_user_${pageId}').form("getFormParam");
			$('#grid_user_${pageId}').grid("setQueryParams", params);
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
              <td class="field-label">${i18n.shengbdh}：</td>
              <td class="field-container"><div class="ui-field" id="danjbh"></div></td>
              <td class="field-label">${i18n.rongqiq}：</td>
              <td class="field-container"><div class="ui-field" id="wuld"></div></td>
              <td class="field-label">${i18n.rongqgys}：</td>
              <td class="field-container"><div class="ui-field" id="gongysdm"></div></td>
            </tr>
            <tr>
              <td class="field-label">${i18n.rongqwls}：</td>
              <td class="field-container"><div class="ui-field" id="chengysdm"></div></td>
              <td class="field-label">&nbsp;</td>
              <td class="field-container">&nbsp;</td>
              <td class="field-label">&nbsp;</td>
              <td class="field-container">&nbsp;</td>
            </tr>
          </table>
		  <br>
		<div align=right>
		<span id="btn_print"  class="ui-button">${i18n.buda}[F8]</span>	
		<span id="btn_back"  class="ui-button">${i18n.back}[F11]</span>	
		<span id="btn_return"  class="ui-button">${i18n.return}[F12]</span>
	    </div><br/>

<div id="grid_user_${pageId}" class='hidden-item'></div>
</div>
		<div id='prompt'>${i18n.prompt}</div>
	
</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>