<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","62301");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_62301}</title>
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
                {fieldType:'fieldLabel',property:'chengysdm'},
                {fieldType:'fieldLabel',property:'gongysdm'},
                {fieldType:'fieldLabel',property:'gongysmc'}
	 			]
 		});
	$('#grid_user_${pageId}').grid({
		keyFields:['rongqixh'],
		id:'grid_user_${pageId}',
		showCheckbox:false,
		//翻页查询交易
		src:'<%=request.getContextPath()%>/rongqi/62302.do',
		cols:[
		{property:'rongqxh',caption:'${i18n.rongqxh}'},
  		{property:'rongqsl',caption:'${i18n.tuifsl}'},
  		{property:'create_time',caption:'${i18n.blscsj}'},
  		{property:'caozy',caption:'${i18n.caozyhm}'},
  		{property:'chengysbh',caption:'${i18n.chengysdm}'}
  		]
	});
	
	//F8打印 
	$('#btn_print').bind('click',function(){
	 		window.location.href="<%=request.getContextPath()%>/rongqi/62106.do?usercenter="+st_UserCenter+"&danjbh="+$('#danjbh span').html()+"&cangkbh="+st_Cangkbh+st_Params;
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
			//$('#gongysdm span').html('${result.result.parameter.gongysdm}');
			//$('#gongysmc span').html('${result.result.parameter.gongysmc}');
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
              <td class="field-label">${i18n.danjbh}：</td>
              <td class="field-container"><div class="ui-field" id="danjbh"></div></td>
              <td class="field-label">${i18n.rongqiq}：</td>
              <td class="field-container"><div class="ui-field" id="wuld"></div></td>
              <td class="field-label">${i18n.chengysdm}：</td>
              <td class="field-container"><div class="ui-field" id="chengysdm"></div></td>
            </tr>
            <!--<tr>
              <td class="field-label">${i18n.gongysdm}：</td>
              <td class="field-container"><div class="ui-field" id="gongysdm"></div></td>
              <td class="field-label">${i18n.gongysmc}：</td>
              <td class="field-container"><div class="ui-field" id="gongysmc"></div></td>
              <td class="field-label">&nbsp;</td>
              <td class="field-container">&nbsp;</td>
            </tr>-->
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