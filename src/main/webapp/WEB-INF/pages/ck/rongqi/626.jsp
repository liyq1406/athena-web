<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","626");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_626}</title>
<jsp:include page="../../common/js.jsp" />
<script type="text/javascript">
var paramsQuery;
var currentPage = 1;
$(function(){
	$('#form_user_${pageId}').form({
		onreload:true,
 		fields:[
				//{fieldType:'fieldLabel',property:'wuld',value:st_Rongqcbh},
				{fieldType:'fieldSelect',property:'wuld',caption:'${i18n.rongqiq}',includeNull:true,notNull:false,src:'<%=request.getContextPath()%>/common/rongqc.do'},
				{fieldType:'fieldText',property:'gongysdm',dataType:'shuzzm',maxLength:'10',caption:'${i18n.gongysdm}',notNull:false},
				{fieldType:'fieldText',property:'chengysdm',dataType:'shuzzm',maxLength:'10',caption:'${i18n.chengysdm}',notNull:false},				
				{fieldType:'fieldText',property:'rongqxh',dataType:'letter_numeric',limitedLength:'5',caption:'${i18n.rongqxh}',notNull:false},
				{fieldType:'fieldText',property:'diaobsj1',dataType:'datetime',maskOptions:{mask:'9999-99-99 99:99:99'},caption:'${i18n.diaobsj1}',notNull:false},
				{fieldType:'fieldText',property:'diaobsj2',dataType:'datetime',maskOptions:{mask:'9999-99-99 99:99:99'},notNull:false},
				{fieldType:'fieldText',property:'danjbh',dataType:'text',caption:'${i18n.danjbh}',notNull:false},
				{fieldType:'fieldSelect',property:'caozuomlx',includeNull:true,caption:'${i18n.caozuomlx}',internation:true,notNull:false,src:'<%=request.getContextPath()%>/common/caozuomalx.do'}
	 			]
 		});
	//当流水账类型为"外部"时显示该grid
	$('#grid_user1_${pageId}').grid({
		keyFields:['rongqxh','rongqsl','rongqye','gongysdm','gongysmc','danjlxxx'],
		id:'grid_user_${pageId}',
		showCheckbox:false,
		//翻页查询交易
		src:'<%=request.getContextPath()%>/rongqi/62601.do',
		cols:[
		{property:'danjbh',caption:'${i18n.danjbh}'},
		//{property:'gongysdm',caption:'${i18n.gongysdm}'},
		{property:'chengysdm',caption:'${i18n.chengysdm}'},
		{property:'rongqxh',caption:'${i18n.rongqxh}'},
		{property:'edit_time',caption:'${i18n.shij}'},
		{property:'rongqsl',caption:'${i18n.rongqsl}'},		
		{property:'diaoruwld',caption:'${i18n.diaorurqq}'},
		{property:'wuld',caption:'${i18n.diaochurqq}'},
		//{property:'rongqye',caption:'${i18n.zaislsl}'},
		{property:'danjlxxx',caption:'${i18n.caozuomlx}',align:'center'},
		{property:'caozy',caption:'${i18n.caozy}'}
  		]
	});
	//页面加载时显示form1 grid1 隐藏 grid2
	$('#grid_user2_${pageId}').hide();
	//当流水账类型为"内部"的时候显示该grid
	$('#grid_user2_${pageId}').grid({
		keyFields:['rongqxh','rongqsl','rongqye','gongysdm','gongysmc'],
		id:'grid_user_${pageId}',
		showCheckbox:false,
		//翻页查询交易
		src:'<%=request.getContextPath()%>/rongqi/62601.do',
		cols:[
		{property:'danjbh',caption:'${i18n.danjbh}'},
		{property:'rongqxh',caption:'${i18n.rongqxh}'},
		{property:'diaobsj1',caption:'${i18n.shij}'},
		{property:'rongqsl',caption:'${i18n.rongqsl}'},
		{property:'wuld',caption:'${i18n.rongqiq}'},
		{property:'rongqye',caption:'${i18n.zaislsl}'},
		{property:'danjlxxx',caption:'${i18n.caozuomlx}',align:'center',internation:true},
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
 		 params.push('danjlx='+$('#liuslx input').attr("realValue"));
 		 params.push('bzxh='+$('#caozuomlx input').attr("realValue"));
 		$('#grid_user1_${pageId}').grid("setQueryParams", params);
 		var url = "<%=request.getContextPath()%>/rongqi/62601.do";
		 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 if (showPromptRequestMsg(results)==true){	
				 //加载返回数据
					$('#grid_user1_${pageId}').grid('parseResult',results);					
			 }
			 });
 	}); 
	function validateform(){
        //参数校验
        if(!$('#form_user_${pageId}').form("validateParam")){
            $('#grid_user1_${pageId}').grid('clearRecords');
            $('#grid_user2_${pageId}').grid('clearRecords');
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
        var date1 = new Date(saoksj1.replace(/-/g,'').replace(/:/g,'').replace(' ',''));
        var date2 = new Date(saoksj2.replace(/-/g,'').replace(/:/g,'').replace(' ','')); 
        var date3=date2.getTime()-date1.getTime();
        if (date3 > 7*24*3600*1000){
            showPromptMsg('red',$.sdcui.resource.i18n['C_F_JIESFHSL']);
            return false;
        }
        return true;
    }
$(document).keyboardsupport({});
});
function flagchange(){
	if($('#liuslx input').attr("realValue")=='2'){
		$('#gysdm1').hide();
		$('#gysdm2').hide();
		$('#cysdm1').hide();
		$('#cysdm2').hide();
		$('#grid_user1_${pageId}').hide();
		$('#grid_user2_${pageId}').show();
	}else{
		$('#gysdm1').show();
		$('#gysdm2').show();
		$('#cysdm1').show();
		$('#cysdm2').show();
		$('#grid_user2_${pageId}').hide();
		$('#grid_user1_${pageId}').show();
	}
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
<div id="form_user_${pageId}" class="ui-fieldLayout" >
<table class="ui-grid" cellspacing="1" width="100%" >
<tr>
		<td class="field-label">${i18n.rongqiq}：</td>
		<td class="field-container"><div class="ui-field" id="wuld"></div></td>
		<!--  
		<td class="field-label">${i18n.liushuizlx}：</td>
		<td class="field-container"><div class="ui-field" id="liuslx"></div></td>
		-->
		<td class="field-label">${i18n.rongqxh}：</td>
		<td class="field-container"><div class="ui-field" id="rongqxh"></div></td>
		<td class="field-label" id="gysdm1">${i18n.gongysdm}：</td>
		<td class="field-container" id="gysdm2"><div class="ui-field" id="gongysdm"></div></td>
      </tr>
      <tr>
		<td class="field-label">${i18n.liushuizscrq}：</td>
		<td class="field-container"><div style="float:left" class="ui-field" id="diaobsj1"></div><div style="float:left" >-</div><div style="float:left" class="ui-field" id="diaobsj2"></div></td>
 	    <td class="field-label">${i18n.liushuidjh}：</td>
		<td class="field-container"><div class="ui-field" id="danjbh"></div></td>
		<td class="field-label" id="cysdm1">${i18n.chengysdm}：</td>
		<td class="field-container" id="cysdm2"><div class="ui-field" id="chengysdm"></div></td>
 	  </tr>
	  <tr>
		<td class="field-label">${i18n.caozuomlx}：</td>
		<td class="field-container"><div class="ui-field" id="caozuomlx"></div></td>
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
<div id="grid_user1_${pageId}" class='hidden-item'></div>
<div id="grid_user2_${pageId}" class='hidden-item'></div>
</div> 

		<br/><br/>
	    
 <div id='prompt'>${i18n.prompt}</div>

</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>