<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","64101");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_64101}</title>
<jsp:include page="../../common/js.jsp" />
<jsp:include page="../../common/print.jsp" />
<script type="text/javascript">
var paramsQuery;
var currentPage = 1;
$(function(){
	$('#form_user_${pageId}').form({
	 		fields:[
				{fieldType:'fieldLabel',property:'danjbh',caption:'${i18n.rongqbgdh}'}
	 			]
 		});
	$('#grid_user_${pageId}').grid({
		keyFields:['danjbh'],
		id:'grid_user_${pageId}',
		showCheckbox:false,
		//翻页查询交易
		src:'<%=request.getContextPath()%>/rongqi/64102.do',
		cols:[
		{property:'danjbh',caption:'${i18n.rongqbgdh}'},		
		{property:'rongqxh',caption:'${i18n.rongqxh}'},
  		{property:'rongqsl',caption:'${i18n.tuifsl}'},  		
  		//0010495
  		{property:'gcbh',caption:'${i18n.gongcbh}'},
  		{property:'gongysmc',caption:'${i18n.gongcmc}'},  		
  		{property:'edit_time',caption:'${i18n.caozsj}'},
  		{property:'editor',caption:'${i18n.caozyhm}'}
  		]
	});
	
	//F8打印 
	$('#btn_print').bind('click',function(){
		var params = $('#form_user_${pageId}').form("getFormParam");
		rongqfhdh='${result.result.parameter.danjbh}';
		params.push("rongqfhdh=" + rongqfhdh);
				
		var url = "<%=request.getContextPath()%>/rongqi/64104.do";
		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 if (showPromptRequestMsg(results)==true){
				 //$('#grid_user_${pageId}').grid('parseResult',results);
			 }
		});
	});
	
	//页面加载后，查询数据为界面赋值
	$(document).ready(function(){
		//设置供应商编号不可输入
		$("#gongysdm input").attr('disabled',true);
		//供应商编号赋值
		$('#chengysdm input').change(function(){
			$("#gongysdm input").val($('#chengysdm input').val());
		});
		//供应商编号赋值
		$('#chengysdm input').bind('input propertychange',function(){
			$("#gongysdm input").val($('#chengysdm input').val());
		});
		//加载返回数据
			$('#danjbh span').html('${result.result.parameter.danjbh}');
			$('#wuld span').html('${result.result.parameter.wuld}');
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
<input id="serachKey" name="serachKey" type="Hidden"></input>
<form id="putform" method="post" name="putform" >
<input id="putvalue"   name="putvalue" type="hidden"></input>
</form> 
<div id="form_user_${pageId}" class="ui-fieldLayout">
		  <table class="ui-grid" cellspacing="1" width="100%" >
		  	<tr>
              <td class="field-label">${i18n.rongqbgdh}：</td>
              <td class="field-container"><div class="ui-field" id="danjbh"></div></td>
            </tr>
            <td class="field-label"></td>
            <td class="field-container"></td>
            <tr>
            </tr>
          </table>
		  <br>
		<div align=right>
		<span id="btn_print"  class="ui-button">${i18n.buda}[F8]</span>	
		<span id="btn_back"  class="ui-button">${i18n.back}[F11]</span>	
		<span id="btn_return"  class="ui-button">${i18n.return}[F12]</span>
	    </div>

<div id="grid_user_${pageId}" class='hidden-item'></div>
</div>
		<div id='prompt'>${i18n.prompt}</div>

</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>