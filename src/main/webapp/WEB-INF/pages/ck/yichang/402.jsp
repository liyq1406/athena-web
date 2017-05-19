<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","402");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_402}</title>
<jsp:include page="../../common/js.jsp" />
<script type="text/javascript">
$(function(){
	$('#form_user_${pageId}').form({
		onreload:true,
 		fields:[
                {fieldType:'fieldText',property:'xiaohdh',dataType:'yicxhdh',caption:'${i18n.xiaohdh}',notNull:true},
				{fieldType:'fieldLabel',property:'uch'},
				{fieldType:'fieldLabel',property:'lingjbh'},
				{fieldType:'fieldLabel',property:'lingjmc'},
				{fieldType:'fieldLabel',property:'shenbsl'},
				{fieldType:'fieldLabel',property:'gongysdm'},
				{fieldType:'fieldLabel',property:'gongysmc'},
				{fieldType:'fieldLabel',property:'chengysdm'},
				{fieldType:'fieldLabel',property:'chengysmc'},
				{fieldType:'fieldLabel',property:'shengbd'},
				{fieldType:'fieldLabel',property:'shengbr'},
				{fieldType:'fieldLabel',property:'pich'},
				{fieldType:'fieldLabel',property:'elh'},
				{fieldType:'fieldLabel',property:'yuany'}
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
 		var url = "<%=request.getContextPath()%>/yichang/40201.do";
 		 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 if (showPromptRequestMsg(results)==true){
				 //加载返回数据
					$('#uch span').html(results.result.parameter.uch)
					$('#lingjbh span').html(results.result.parameter.lingjbh)
					$('#lingjmc span').html(results.result.parameter.lingjmc)
					$('#shenbsl span').html(results.result.parameter.shenbsl)
					$('#gongysdm span').html(results.result.parameter.gongysdm)
					$('#gongysmc span').html(results.result.parameter.gongysmc)
					$('#chengysdm span').html(results.result.parameter.chengysdm)
					$('#chengysmc span').html(results.result.parameter.chengysmc)
					$('#shengbd span').html(results.result.parameter.shengbd)
					$('#shengbr span').html(results.result.parameter.shengbr)
					$('#pich span').html(results.result.parameter.pich)
					$('#elh span').html(results.result.parameter.elh)
					$('#yuany span').html(results.result.parameter.yuany)
			 }
			 });
 	}); 
	
	
	//F2取消
 	$('#btn_quxiao').bind('click',function(){
 		 //参数校验
 		if(!$('#form_user_${pageId}').form("validateParam")){
				return;	
 		}
 		//打开提示框是否删除
		if(confirm($.sdcui.resource.i18n['C_remove'])){
 		 //提交数据
 		var params = $('#form_user_${pageId}').form("getFormParam");
 		var url = "<%=request.getContextPath()%>/yichang/40202.do";
 		 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 if (showPromptRequestMsg(results)==true){
				
			 }
			 });
		}
 	}); 
	
	$(document).keyboardsupport({});
});
</script>
</head>
<body>
<div style="padding:20px;">
<!--主体内容开始-->
<div id="title"></div> 
<div id="form_user_${pageId}" class="ui-fieldLayout" > 	
<table class="ui-grid" cellspacing="1" width="100%">
      <tr>
		<td class="field-label">${i18n.xiaohdh}：</td>
		<td class="field-container"><div class="ui-field" id="xiaohdh"></div></td>
		<td align="right" >
			<span id="btn_search"  class="ui-button">${i18n.search}[F1]</span>
			<span id="btn_quxiao"  class="ui-button">${i18n.qux}[F2]</span>		
			<span id="btn_back"  class="ui-button">${i18n.back}[F11]</span>		
			<span id="btn_return"  class="ui-button">${i18n.return}[F12]</span>
	     </td>
        </tr>
  </table>

<div id="grid_user_${pageId}" class="hidden-item"> 	
<table class="ui-grid" cellspacing="1" width="100%">
      <tr>
		<td>${i18n.uch}：</td>
		<td><div class="ui-field" id="uch"></div></td>
		<td>${i18n.lingjh}：</td>
		<td><div class="ui-field" id="lingjbh"></div></td>
		<td>${i18n.lingjmc}：</td>
		<td><div class="ui-field" id="lingjmc"></div></td>
      </tr>
      <tr>
		<td>${i18n.shenbsl}：</td>
		<td><div class="ui-field" id="shenbsl"></div></td>
		<td>${i18n.gongysdm}：</td>
		<td><div class="ui-field" id="gongysdm"></div></td>
		<td>${i18n.gongysmc}：</td>
		<td><div class="ui-field" id="gongysmc"></div></td>
	</tr>
      <tr>
		<td>${i18n.chengysdm}：</td>
		<td><div class="ui-field" id="chengysdm"></div></td>
		<td>${i18n.chengysmc}：</td>
		<td><div class="ui-field" id="chengysmc"></div></td>
		<td>${i18n.shengbd}：</td>
		<td><div class="ui-field" id="shengbd"></div></td> 
	</tr>
      <tr>
		<td>${i18n.shengbr}：</td>
		<td><div class="ui-field" id="shengbr"></div></td>
		<td>${i18n.pich}：</td>
		<td><div class="ui-field" id="pich"></div></td> 
		<td></td>
		<td></td>
	</tr>
      <tr>
		<td>${i18n.elh}：</td>
		<td><div class="ui-field" id="elh"></div></td>
		<td>${i18n.yuany}：</td>
		<td><div class="ui-field" id="yuany"></div></td>
		<td></td>
		<td></td>
	</tr>
  </table>	
</div>
</div> 	    
<div id='prompt'>${i18n.prompt}</div>
</div>	    
</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>