<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","626");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_635}</title>
<jsp:include page="../../common/js.jsp" />
<script type="text/javascript">
var paramsQuery;
var currentPage = 1;
$(function(){
	$('#form_user_${pageId}').form({
		onreload:true,
 		fields:[
				{fieldType:'fieldLabel',property:'wuld',value:st_Rongqcbh},
				{fieldType:'fieldText',property:'gongysdm',dataType:'shuzzm',maxLength:'10',caption:'${i18n.gongysdm}',notNull:false},
				{fieldType:'fieldText',property:'chengysdm',dataType:'shuzzm',maxLength:'10',caption:'${i18n.chengysdm}',notNull:false},
				{fieldType:'fieldSelect',property:'danjlx',caption:'${i18n.danjlx}',includeNull:true,internation:true,notNull:false,src:'<%=request.getContextPath()%>/common/jiesfhlx.do'},
				{fieldType:'fieldText',property:'rongqxh',dataType:'letter_numeric',limitedLength:'5',caption:'${i18n.rongqxh}',notNull:false},
				{fieldType:'fieldText',property:'diaobsj1',dataType:'date',maskOptions:{mask:'9999-99-99'},caption:'${i18n.diaobsj1}',notNull:false},
				{fieldType:'fieldText',property:'diaobsj2',dataType:'date',maskOptions:{mask:'9999-99-99'},notNull:false},
				{fieldType:'fieldText',property:'danjbh',dataType:'text',maxLength:'10',caption:'${i18n.danjbh}',notNull:false}
	 			]
 		});
	$('#grid_user_${pageId}').grid({
		keyFields:['rongqxh','rongqsl','rongqye','gongysdm','gongysmc','zhuangt'],
		id:'grid_user_${pageId}',
		showCheckbox:false,
		//翻页查询交易
		src:'<%=request.getContextPath()%>/rongqi/62601.do?zhuangt=1',
		cols:[
		{property:'danjbh',caption:'${i18n.danjbh}'},
		//{property:'gongysdm',caption:'${i18n.gongysdm}'},
		{property:'chengysdm',caption:'${i18n.chengysdm}'},
		{property:'rongqxh',caption:'${i18n.rongqxh}'},
		{property:'diaobsj1',caption:'${i18n.shij}'},
		{property:'rongqsl',caption:'${i18n.rongqsl}'},
		{property:'wuld',caption:'${i18n.rongqiq}'},
		//{property:'rongqye',caption:'${i18n.zaislsl}'},
		{property:'danjlxxx',caption:'${i18n.jiesfhlx}',align:'center',internation:true},
		{property:'caozy',caption:'${i18n.caozy}'}
  		]
	});
	//F1查询
 	$('#btn_search').bind('click',function(){
 		 //参数校验
 		if(!$('#form_user_${pageId}').form("validateParam")){
				return;	
 		}
 		 if (!validateform()){
             return;
         }
 		 //提交数据
 		var params = $('#form_user_${pageId}').form("getFormParam");
 		$('#grid_user_${pageId}').grid("setQueryParams", params);
 		params.push("danjlx="+$('#danjlx input').attr("realValue"));
 		params.push("zhuangt=1");
 		var url = "<%=request.getContextPath()%>/rongqi/62601.do";
		 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 if (showPromptRequestMsg(results)==true){
				//加载返回数据
					$('#grid_user_${pageId}').grid('parseResult',results)
			 }
			 });
 	}); 
	function validateform(){
        //参数校验
        if(!$('#form_user_${pageId}').form("validateParam")){
            $('#grid_user_${pageId}').grid('clearRecords');
            return false;
        }
        
        //范围校验
        var saoksj1 = $('#diaobsj1 input').val();
        var saoksj2 = $('#diaobsj2 input').val();
        if(!validRangeData("datetime", saoksj1, saoksj2)){
            $('#diaobsj1 input').focus();
            $('#diaobsj1 input').removeClass('validate-success').addClass('validate-error');
            return false;
        }
        var date1 = new Date(saoksj1.replace(/-/g,"/"));
        var date2 = new Date(saoksj2.replace(/-/g,"/"));
        var date3=date2.getTime()-date1.getTime();
        if (date3 > 7*24*3600*1000){
            showPromptMsg('red',$.sdcui.resource.i18n['C_F_JIESFHSL']);
            return false;
        }
        return true;
    }
$(document).keyboardsupport({});
});
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
<div id="form_user_${pageId}" class="ui-fieldLayout" >
<table class="ui-grid" cellspacing="1" width="100%" >
      <tr>
		<td class="field-label">${i18n.rongqiq}：</td>
		<td class="field-container"><div class="ui-field" id="wuld"></div></td>
		<td class="field-label">${i18n.chengysdm}：</td>
		<td class="field-container"><div class="ui-field" id="chengysdm"></div></td>
		<td class="field-label">${i18n.gongysdm}：</td>
		<td class="field-container"><div class="ui-field" id="gongysdm"></div></td>
      </tr>
      <tr>
		<td class="field-label">${i18n.jiesfhlx}：</td>
		<td class="field-container"><div class="ui-field" id="danjlx"></div></td>
		<td class="field-label">${i18n.rongqxh}：</td>
		<td class="field-container"><div class="ui-field" id="rongqxh"></div></td>
		<td class="field-label">${i18n.jiesfhrq}：</td>
		<td class="field-container"><div style="float:left" class="ui-field" id="diaobsj1"></div><div style="float:left" >-</div><div style="float:left" class="ui-field" id="diaobsj2"></div></td>
 		  </tr>
	  <tr>
		<td class="field-label">${i18n.jfdanjh}：</td>
		<td class="field-container"><div class="ui-field" id="danjbh"></div></td>
		<td class="field-label"></td>
		<td class="field-container"></td>
		<td class="field-label"></td>
		<td class="field-container"></td>
 		  </tr>
  </table>
   	
		<br>
		<div align=right>
		<span id="btn_search"  class="ui-button">${i18n.search}[F1]</span>
		<span id="btn_back"  class="ui-button">${i18n.back}[F11]</span>	
		<span id="btn_return"  class="ui-button">${i18n.return}[F12]</span>
	    </div><br/>
<div id="grid_user_${pageId}" class='hidden-item'></div>
</div> 
<br/><br/>	    
<div id='prompt'>${i18n.prompt}</div>
</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>