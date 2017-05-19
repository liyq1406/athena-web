<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","61701");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_61701}</title>
<jsp:include page="../../common/js.jsp" />
<jsp:include page="../../common/print.jsp" />
<script type="text/javascript">
var paramsQuery;
var currentPage = 1;
$(function(){
	$('#form_user_${pageId}').form({
 		fields:[
                {fieldType:'fieldLabel',property:'diaobdh'},
                {fieldType:'fieldLabel',property:'caozy'},
                {fieldType:'fieldLabel',property:'wuld'},
                {fieldType:'fieldLabel',property:'diaoruwld'},
                {fieldType:'fieldLabel',property:'diaobzt'}
	 			]
 		});
	$('#grid_user_${pageId}').grid({
		keyFields:['danjbh','chengysdm','gongysdm','wuld'],
		id:'grid_user_${pageId}',
		showCheckbox:false,
		//翻页查询交易
		src:'<%=request.getContextPath()%>/rongqi/61702.do',
		cols:[
		{property:'rongqxh',caption:'${i18n.rongqxh}'},
		{property:'rongqsl',caption:'${i18n.rongqsl}'},
		{property:'yidbsl',caption:'${i18n.yidbsl}'},
		{property:'weidbsl',caption:'${i18n.weidbsl}'},
		//{property:'gongysdm',caption:'${i18n.gongysdm}'},
		{property:'chengysdm',caption:'${i18n.chengysdm}'}
  		
  		]
	});
	
	//F8打印 
	$('#btn_print').bind('click',function(){
			var params2 = [];
			params2.push("usercenter="+st_UserCenter);
			params2.push("diaobdh="+ $('#diaobdh span').html());
			var url2 = "<%=request.getContextPath()%>/rongqi/61103.do";
			doprint(611,params2,url2);
			return false;
	 });
	
	//页面加载后，查询数据为界面赋值
	$(document).ready(function(){
		//加载返回数据
			$('#diaobdh span').html('${result.result.parameter.diaobdh}');
			$('#wuld span').html('${result.result.parameter.wuld}');
			$('#diaoruwld span').html('${result.result.parameter.diaoruwld}');
			$('#caozy span').html('${result.result.parameter.caozy}');
			var diaobdzt='${result.result.parameter.diaobzt}';
			$('#diaobzt span').html($.sdcui.resource.i18n[diaobdzt]);
			$('#zhuangt').val('${result.result.parameter.zhuangt}');
			//加载返回数据
			$('#grid_user_${pageId}').grid('parseResult',${result});
			var params = $('#form_user_${pageId}').form("getFormParam");
			params.push("zhuangt="+$('#zhuangt').val());
			$('#grid_user_${pageId}').grid("setQueryParams", params);
	});
	$(document).keyboardsupport({});
});
</script>
</head>
<body>
<!--主体内容开始-->
<div id="title"></div>
<input id="zhuangt" name="zhuangt" type="Hidden"></input>
<div id="form_user_${pageId}" class="ui-fieldLayout">
<table class="ui-grid" cellspacing="1" width="100%" >
 <tr>
              <td class="field-label">${i18n.diaobdh}：</td>
              <td class="field-container"><div class="ui-field" id="diaobdh"></div></td>
              <td class="field-label">${i18n.rongqiq}：</td>
              <td class="field-container"><div class="ui-field" id="wuld"></div></td>
              <td class="field-label">${i18n.diaorurqq}：</td>
              <td class="field-container"><div class="ui-field" id="diaoruwld"></div></td>
            </tr>
            <tr>
              <td class="field-label">${i18n.caozy}：</td>
              <td class="field-container"><div class="ui-field" id="caozy"></div></td>
              <td class="field-label">${i18n.diaobdzt}：</td>
              <td class="field-container"><div class="ui-field" id="diaobzt"></div></td>
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