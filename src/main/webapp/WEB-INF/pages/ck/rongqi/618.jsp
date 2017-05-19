<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","618");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_618}</title>
<jsp:include page="../../common/js.jsp" />
<script type="text/javascript">
var paramsQuery;
var currentPage = 1;
$(function(){
	$('#form_user_${pageId}').form({
		onreload:true,
 		fields:[
                {fieldType:'fieldText',property:'rongqxh',dataType:'letter_numeric',limitedLength:'5',caption:'${i18n.rongqxh}',notNull:false},
                {fieldType:'fieldText',property:'diaobsj1',dataType:'datetime',maskOptions:{mask:'9999-99-99 99:99:99'},caption:'${i18n.diaobsj}',notNull:true},
                {fieldType:'fieldText',property:'diaobsj2',dataType:'datetime',maskOptions:{mask:'9999-99-99 99:99:99'},caption:'${i18n.diaobsj}',notNull:true},
                {fieldType:'fieldText',property:'diaobdh',dataType:'diaobdh',caption:'${i18n.diaobdh}',notNull:false},
                //{fieldType:'fieldLabel',property:'wuld',value:st_Rongqcbh},
                {fieldType:'fieldSelect',property:'wuld',maxLength:'10',includeNull:true,caption:'${i18n.diaochurqq}',notNull:false,src:'<%=request.getContextPath()%>/common/rongqc2.do'},
                {fieldType:'fieldSelect',property:'diaoruwld',includeNull:true,src:'<%=request.getContextPath()%>/common/rongqc2.do'}
	 			]
 		});
	$('#grid_user_${pageId}').grid({
		keyFields:['danjbh','chengysdm','gongysdm','wuld'],
		id:'grid_user_${pageId}',
		showCheckbox:false,
		//翻页查询交易
		src:'<%=request.getContextPath()%>/rongqi/61801.do',
		cols:[
		//{property:'diaobdh',caption:'${i18n.diaobdh}'},
		{property:'rongqxh',caption:'${i18n.rongqxh}'},
		{property:'rongqsl',caption:'${i18n.diaobsqsl}'},
		{property:'yidbsl',caption:'${i18n.yidbsl}'},
		{property:'weidbsl',caption:'${i18n.weidbsl}'},
  		{property:'diaoruwld',caption:'${i18n.diaorurqq}'},
  		{property:'wuld',caption:'${i18n.rongqiq}'},
  		//{property:'gongysdm',caption:'${i18n.gongysdm}'},
  		//{property:'diaobsj',caption:'${i18n.diaobsj}'},
  		{property:'chengysdm',caption:'${i18n.chengysdm}'}
  		
  		]
	});
	//F1查询
 	$('#btn_search').bind('click',function(){
 		 //参数校验
 		if(!$('#form_user_${pageId}').form("validateParam")){
				return;	
 		}
 		//范围校验
        if(!validRangeData("date", $('#diaobsj1 input').val(), $('#diaobsj2 input').val())){
            $('#diaobsj1 input').focus();
            $('#diaobsj1 input').removeClass('validate-success').addClass('validate-error');
            return;
        }
 		 //提交数据
 		var params = $('#form_user_${pageId}').form("getFormParam");
		params.push("currentPage="+currentPage);
		$('#grid_user_${pageId}').grid("setQueryParams", params);
 		var url = "<%=request.getContextPath()%>/rongqi/61801.do";
		 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 if (showPromptRequestMsg(results)==true){
				 $('#grid_user_${pageId}').grid('parseResult',results)
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
		<td class="field-label">${i18n.rongqxh}：</td>
		<td class="field-container"><div class="ui-field" id="rongqxh"></div></td>
		<td class="field-label">${i18n.diaochurqq}：</td>
		<td class="field-container"><div class="ui-field" id="wuld"></div></td>				     
        <td class="field-label">${i18n.diaobdh}：</td>
		<td class="field-container"><div class="ui-field" id="diaobdh"></div></td>	
	</tr>	
	<tr>	      
        <td class="field-label">${i18n.diaobsj}：</td>
		<td class="field-container"><div style="float:left" class="ui-field" id="diaobsj1"></div><div style="float:left" >-</div><div style="float:left" class="ui-field" id="diaobsj2"></div></td>
		<td class="field-label">${i18n.diaorurqq}：</td>
		<td class="field-container"><div class="ui-field" id="diaoruwld"></div></td> 
		<td class="field-label"></td>
		<td class="field-container"></td>
      </tr>	 
</table>
 <br/><div align=right>
		<span id="btn_search"  class="ui-button">${i18n.search}[F1]</span>	
		<span id="btn_back"  class="ui-button">${i18n.back}[F11]</span>	
	    <span id="btn_return"  class="ui-button">${i18n.return}[F12]</span>
</div><br/> 
<div id="grid_user_${pageId}" class='hidden-item'></div>
      </div>
		<br>
		
		
<div id='prompt'>${i18n.prompt}</div>

</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>