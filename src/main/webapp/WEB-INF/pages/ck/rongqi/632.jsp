<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","632");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_632}</title>
<jsp:include page="../../common/js.jsp" />
<script type="text/javascript">
var paramsQuery;
var currentPage = 1;
$(function(){
	$('#form_user_${pageId}').form({
		onreload:true,
 		fields:[
                {fieldType:'fieldSelect',property:'zhuangt',caption:'${i18n.rongqzzlx}',notNull:true,internation:true,onselect:'flagchange()',src:'<%=request.getContextPath()%>/common/rongqilx.do'},
				{fieldType:'fieldSelect',property:'wuld',includeNull:true},
				{fieldType:'fieldText',property:'rongqxh',dataType:'letter_numeric',limitedLength:'5',caption:'${i18n.rongqxh}',notNull:false},
				{fieldType:'fieldText',property:'chengysdm',dataType:'shuzzm',maxLength:'10',caption:'${i18n.chengysdm}',notNull:false},
				{fieldType:'fieldText',property:'gongysdm',dataType:'shuzzm',maxLength:'10',caption:'${i18n.gongysdm}',notNull:false}
	 			]
 		});
	$('#grid_user_${pageId}').grid({
		keyFields:['rongqxh','rongqsl','gongysdm','chengys','wuld'],
		id:'grid_user_${pageId}',
		showCheckbox:false,
		//翻页查询交易
		src:'<%=request.getContextPath()%>/rongqi/63201.do',
		cols:[
		{property:'wuld',caption:'${i18n.rongqiq}'},
		{property:'usercenter',caption:'${i18n.usercenter}'},
  		{property:'rongqsl',caption:'${i18n.rongqsl}'},
  		//{property:'gongysdm',caption:'${i18n.gongys}'},
  		{property:'chengys',caption:'${i18n.wuls}'},
  		{property:'rongqlb',caption:'${i18n.rongqlx}'}
  		]
	});
	//F1查询
 	$('#btn_search').bind('click',function(){
 		 //参数校验
 		if(!$('#form_user_${pageId}').form("validateParam")){
				return;	
 		}
 		//提交数据
 		var params = $('#form_user_${pageId}').form("getFormParam");
 		params.push("usercenter="+st_UserCenter);
 		params.push("currentPage="+currentPage);
 		params.push("zhuangt="+$("#zhuangt input").attr("realValue"));
 		$('#grid_user_${pageId}').grid("setQueryParams", params);
 		var url = "<%=request.getContextPath()%>/rongqi/63201.do";
		 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 if (showPromptRequestMsg(results)==true){
				//加载返回数据
					$('#grid_user_${pageId}').grid('parseResult',results)
			 }
		});
	 }); 	
 
$(document).keyboardsupport({});
});
function flagchange(){
	if(!$('#zhuangt').fieldSelect('validateNotNull')){
		return;
	}
	var url = '<%=request.getContextPath()%>/common/showRongqc633.do?temp='+$('#zhuangt input').attr('realValue');
	$('#wuld').fieldSelect('resetUrl',url);
}
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
	
});
</script>
</head>
<body>
<div id="title"></div>
<input id="danjbh" type="Hidden"></input>
<div id="form_user_${pageId}" class="ui-fieldLayout" >
<table class="ui-grid" cellspacing="1" width="100%" >
<tr>	    
		<td class="field-label">${i18n.rongqzzlx}：</td>
		<td class="field-container"><div class="ui-field" id="zhuangt"></div></td>
		<td class="field-label">${i18n.rongqiq}：</td>
		<td class="field-container"><div class="ui-field" id="wuld"></div></td>
		<td class="field-label">${i18n.rongqxh}：</td>
		<td class="field-container"><div class="ui-field" id="rongqxh"></div></td>		
      </tr>	 
	  	<tr>	      
		<td class="field-label"><div id="rongqilabel1">${i18n.wuls}：</div></td>
		<td class="field-container"><div class="ui-field" id="chengysdm"></div></td>
		<td class="field-label"><div id="rongqilabel2">${i18n.gongys}：</div></td>
		<td class="field-container"><div class="ui-field" id="gongysdm"></div></td> 
		<td class="field-label"></td>
		<td class="field-container"></td>
      </tr>	 
  </table>
  <br/>
  <div align="right">
  <span id="btn_search"  class="ui-button">${i18n.search}[F1]</span>
  <span id="btn_back"  class="ui-button">${i18n.back}[F11]</span>	
  <span id="btn_return"  class="ui-button">${i18n.return}[F12]</span> 
  </div>
  <br/>
 <div id="grid_user_${pageId}" class='hidden-item'></div>
</div>
<br>
<div id='prompt'>${i18n.prompt}</div>
</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>