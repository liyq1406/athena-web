<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","624");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_624}</title>
<jsp:include page="../../common/js.jsp" />
<script type="text/javascript">
var paramsQuery;
var currentPage = 1;
$(function(){
	$('#form_user_${pageId}').form({
		onreload:true,
 		fields:[
				{fieldType:'fieldSelect',property:'danjlx',internation:true,caption:'${i18n.danjpdlx}',onselect:'flagChange()',notNull:true,src:'<%=request.getContextPath()%>/common/danjpdlx.do'},
				{fieldType:'fieldSelect',property:'wuld',caption:'${i18n.rongqiq}',onselect:'flagChangeWuld()',notNull:true},
				{fieldType:'fieldText',property:'rongqxh',dataType:'letter_numeric',limitedLength:'5',caption:'${i18n.rongqxh}',notNull:true},
				{fieldType:'fieldText',property:'chengysdm',dataType:'shuzzm',maxLength:'10',caption:'${i18n.chengysdm}',notNull:true},
				{fieldType:'fieldText',property:'gongysdm',dataType:'shuzzm',maxLength:'10',caption:'${i18n.gongysdm}',notNull:true},
				{fieldType:'fieldText',property:'rongqsl',dataType:'positive',caption:'${i18n.rongqsl}',notNull:true}
	 			]
 		});
	var par=[];
	gridload();
	function gridload(){
		$('#grid_user_${pageId}').grid({
			keyFields:['rongqxh','rongqsl','gongysdm','chengysdm','wuld'],
			id:'grid_user_${pageId}',
			showCheckbox:false,
			//params:par,
			//翻页查询交易
			src:'<%=request.getContextPath()%>/rongqi/62401.do',
			editSubmitSrc:'<%=request.getContextPath()%>/rongqi/62408.do',
			cols:[
			{property:'wuld',caption:'${i18n.rongqiq}'},
			{property:'rongqxh',caption:'${i18n.rongqxh}'},
	  		{property:'rongqsl2',caption:'${i18n.rongqgs}'},
	  		//{property:'gongysdm',caption:'${i18n.gongys}'},
	  		{property:'chengysdm',caption:'${i18n.wuls}'},
	  		{property:'rongqsl',caption:'${i18n.shenbsl}',editor:'fieldText',dataType:'positive'}
	  		]
		});
	}
	
	//F1查询
 	$('#btn_search').bind('click',function(){
 		//参数校验
		//if(!$('#form_user_${pageId}').form("validateParam")){
		//		return;	
		//}
 		if(!$('#danjlx').fieldSelect('validateNotNull')){
 			return;
 		}
 		if(!$('#wuld').fieldSelect('validateNotNull')){
 			return;
 		}
 		 //提交数据
 		var params = $('#form_user_${pageId}').form("getFormParam");
 		$('#grid_user_${pageId}').grid("setQueryParams", params);
 		var url = "<%=request.getContextPath()%>/rongqi/62401.do";
		 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 if (showPromptRequestMsg(results)==true){
				//加载返回数据
					$('#grid_user_${pageId}').grid('parseResult',results)
			 }
			 });
 	}); 
	//F4盘点无差异
 	$('#btn_pandwcy').bind('click',function(){
 		//参数校验
		//if(!$('#form_user_${pageId}').form("validateParam")){
		//		return;	
		//}
		if(!$('#danjlx').fieldSelect('validateNotNull')){
 			return;
 		}
 		if(!$('#wuld').fieldSelect('validateNotNull')){
 			return;
 		}
 		 //提交数据
 		var params = [];
 		params.push("danjlx="+$('#danjlx input').attr('realValue'));
 		params.push("wuld="+$('#wuld input').attr('realValue'));
 		var url = "<%=request.getContextPath()%>/rongqi/62403.do";
		 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 if (showPromptRequestMsg(results)==true){
				//加载返回数据
					$('#grid_user_${pageId}').grid('parseResult',results)
                 	gridload();
                 	//par.push("zhuangt=1");                 	
			 }
			});
 	});
	//F3盘点有差异 增加
 	$('#btn_pandycy').bind('click',function(){
 		//参数校验
		if(!$('#form_user_${pageId}').form("validateParam")){
				return;	
		}
 		 //提交数据
 		var params = $('#form_user_${pageId}').form("getFormParam");
 		var url = "<%=request.getContextPath()%>/rongqi/62404.do";
		 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 if (showPromptRequestMsg(results)==true){
				//加载返回数据
					$('#grid_user_${pageId}').grid('parseResult',results)
			 }
			 });
 	});
 	$('#chengysdm input').attr("disabled",true);
	$('#gongysdm input').attr("disabled",true);
$(document).keyboardsupport({});
});
var flagChange=function(){		
	var url = '<%=request.getContextPath()%>/common/showRongqc633.do?temp='+$('#danjlx input').attr('realValue');
	$('#wuld').fieldSelect('resetUrl',url);
}
var flagChangeWuld=function(){
	$.ajax({
		type:'post',
		url:'<%=request.getContextPath()%>/common/flagJudge624.do',
		data:'rongqqbh='+$('#wuld input').val(),
		//dataType:'text',
		success:function(msg){
			var judge=msg.result.parameter[0].value;
			//设置供应商编号不可输入
			$("#gongysdm input").attr('disabled',true);
			if(judge=="0"){
				$('#chengysdm input').attr("disabled",false);
				//$('#gongysdm input').attr("disabled",false);
			}
			if(judge=="1"){
				$('#chengysdm input').attr("disabled",true);
				//$('#gongysdm input').attr("disabled",true);				
			}
		},
		error:function(){
			alert("error");
		}		
	});
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
<form id="putform" method="post" name="putform" >
<div id="form_user_${pageId}" class="ui-fieldLayout" >
<table class="ui-grid" cellspacing="1" width="100%" >
      <tr>
        <td class="field-label">${i18n.danjpdlx}：</td>
		<td class="field-container"><div class="ui-field" id="danjlx"></div></td> 
		<td class="field-label">${i18n.rongqiq}：</td>
		<td class="field-container"><div class="ui-field" id="wuld"></div></td>
      </tr>
      <tr>		
		<td class="field-label">${i18n.rongqxh}：</td>
		<td class="field-container"><div class="ui-field" id="rongqxh"></div></td> 
		<td class="field-label">${i18n.shenbsl}：</td>
		<td class="field-container"><div class="ui-field" id="rongqsl"></div></td>
      </tr>	  
      <tr>	      
		<td class="field-label">${i18n.chengysdm}：</td>
		<td class="field-container"><div class="ui-field" id="chengysdm"></div></td>
		<td class="field-label">${i18n.gongysdm}：</td>
		<td class="field-container"><div class="ui-field" id="gongysdm"></div></td> 
      </tr>	 
  </table>
  <br/>
  <div align="right">
  		<span id="btn_search"  class="ui-button">${i18n.search}[F1]</span>
		<span id="btn_pandycy"  class="ui-button">${i18n.add}[F3]</span>
		<span id="btn_pandwcy"  class="ui-button">${i18n.pandwcy}[F4]</span>
		<span id="btn_back"  class="ui-button">${i18n.back}[F11]</span>	
		<span id="btn_return"  class="ui-button">${i18n.return}[F12]</span>
  </div>
  <br/>
 <div id="grid_user_${pageId}" class='hidden-item'></div>
      </div>
      </form>
		<br>
		
		
 <div id='prompt'>${i18n.prompt}</div>

</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>