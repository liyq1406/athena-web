<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","60201");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_60201}</title>
<jsp:include page="../../common/js.jsp" />
<jsp:include page="../../common/print.jsp" />
<script type="text/javascript">
var danjlx;
<%	if (request.getParameter("danjlx") != null){			%>
		danjlx = '<%=request.getParameter("danjlx")%>';
<%	}%>
var paramsQuery;
var currentPage = 1;
$(function(){
	$('#form_user_${pageId}').form({
 		fields:[
                {fieldType:'fieldLabel',property:'usfhdh'},
                {fieldType:'fieldLabel',property:'wuld'},
                {fieldType:'fieldLabel',property:'usercenter'},
                {fieldType:'fieldLabel',property:'zhizs'},
                {fieldType:'fieldHidden',property:'danjlx'},
	 			]
 		});
	$('#grid_user_${pageId}').grid({
		keyFields:['rongqixh'],
		id:'grid_user_${pageId}',
		showCheckbox:false,
		//翻页查询交易
		src:'<%=request.getContextPath()%>/rongqi/60202.do',
		cols:[
		{property:'rongqxh',caption:'${i18n.rongqxh}'},
  		{property:'rongqsl',caption:'${i18n.ruksl}'},
		{property:'creator',caption:'${i18n.jiesr}'},
		{property:'create_time',caption:'${i18n.jiessj}'}
  		]
	});
	//F8打印 
	$('#btn_print').bind('click',function(){
		    var params = [];
			params.push("usercenter="+st_UserCenter);
			params.push("jsfhdh="+$('#usfhdh span').html());
			params.push("danjlx="+danjlx);
			if('1' == danjlx){
			var url2 ="<%=request.getContextPath()%>/rongqi/60104.do";
			doprint('601',params,url2);
			}else{
		     // var url3 ="<%=request.getContextPath()%>/rongqi/print_634.do";
		     //doprint('634',params,url3);
		     //window.location.href="<%=request.getContextPath()%>/rongqi/62106.do?usercenter="+st_UserCenter+"&jsfhdh="+$('#usfhdh span').html()+"&cangkbh="+st_Cangkbh+st_Params;
			 window.location.href="<%=request.getContextPath()%>/rongqi/63401.do?usercenter="+st_UserCenter+"&jsfhdh="+$('#usfhdh span').html()+"&danjlx="+danjlx+"&cangkbh="+st_Cangkbh+st_Params;
			}
			
			return false;
	 });
	 
	//页面加载后，查询数据为界面赋值
	$(document).ready(function(){
		//加载返回数据
			$('#usfhdh span').html('${result.result.parameter.usfhdh}');
			$('#usercenter span').html('${result.result.parameter.usercenter}');
			$('#wuld span').html('${result.result.parameter.wuld}');
			$('#zhizs span').html('${result.result.parameter.zhizs}');
			$('#danjlx input').val(danjlx);
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
              <td class="field-label">${i18n.usfhdh}：</td>
              <td class="field-container"><div class="ui-field" id="usfhdh"></div></td>
              <td class="field-label">${i18n.usercenter}：</td>
              <td class="field-container"><div class="ui-field" id="usercenter"></div></td>
              <td class="field-label">${i18n.rongqiq}：</td>
              <td class="field-container"><div class="ui-field" id="wuld"></div></td>
              <td ><div class="ui-field" id="danjlx"></div></td>
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