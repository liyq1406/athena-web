<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","405");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_405}</title>
<jsp:include page="../../common/js.jsp" />
<script type="text/javascript">
var paramsQuery;
var currentPage = 1;
$(function(){
	$('#form_user_${pageId}').form({
		onreload:true,
 		fields:[
                {fieldType:'fieldText',property:'xiaohdh',caption:'${i18n.xiaohdh}',dataType:'yicxhdh',notNull:true},
				{fieldType:'fieldLabel',property:'shengbdh'},
				{fieldType:'fieldLabel',property:'lingjbh'},
				{fieldType:'fieldLabel',property:'lingjmc'},
				{fieldType:'fieldLabel',property:'lingjsl'},
				{fieldType:'fieldLabel',property:'shengbd'},
				{fieldType:'fieldLabel',property:'gongysdm'},
				{fieldType:'fieldLabel',property:'gongysmc'},
				{fieldType:'fieldLabel',property:'yuch'},
				{fieldType:'fieldLabel',property:'elh'},
				{fieldType:'fieldLabel',property:'shengbr'},
				{fieldType:'fieldLabel',property:'pich'},
				{fieldType:'fieldLabel',property:'hegsl'},
				{fieldType:'fieldLabel',property:'gongfsl'},
				{fieldType:'fieldLabel',property:'liaofsl'},
				{fieldType:'fieldLabel',property:'suifljh'},
				{fieldType:'fieldLabel',property:'suifljmc'},
				{fieldType:'fieldLabel',property:'shuifsl'},
				{fieldType:'fieldLabel',property:'shuifpc'},
				{fieldType:'fieldLabel',property:'zerzt',caption:'${i18n.zerzt}',internation:true,notNull:false,src:'<%=request.getContextPath()%>/common/zerzt.do'},
				{fieldType:'fieldLabel',property:'zerztdm'},
				{fieldType:'fieldLabel',property:'zerztmc'},
				{fieldType:'fieldLabel',property:'uch'}
	 			]
 		});
	
	
	//F1查询 
 	$('#btn_search').bind('click',function(){
 		if(!$('#xiaohdh').fieldText('validate')){
 			return;
 		}
 		 //提交数据
 		var params = $('#form_user_${pageId}').form("getFormParam");
 		$('#grid_user_${pageId}').grid("setQueryParams", params);
 		var url = "<%=request.getContextPath()%>/yichang/40501.do";
		 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 if (showPromptRequestMsg(results)==true){
				//加载返回数据
					$('#shengbdh span').html(results.result.parameter.shengbdh)
					$('#yuch span').html(results.result.parameter.uch)
					$('#shengbr span').html(results.result.parameter.shengbr)
					$('#pich span').html(results.result.parameter.pich)
					$('#elh span').html(results.result.parameter.elh)
					$('#lingjbh span').html(results.result.parameter.lingjbh)
					$('#lingjmc span').html(results.result.parameter.lingjmc)
					$('#lingjsl span').html(results.result.parameter.lingjsl)
					$('#gongysdm span').html(results.result.parameter.gongysdm)
					$('#gongysmc span').html(results.result.parameter.gongysmc)
					$('#shengbd span').html(results.result.parameter.shengbd)
				    $('#hegsl span').html(results.result.parameter.hegsl)
				    $('#gongfsl span').html(results.result.parameter.gongfsl)
				    $('#liaofsl span').html(results.result.parameter.liaofsl)
				    $('#zerztdm span').html(results.result.parameter.zerztdm)
				    $('#zerztmc span').html(results.result.parameter.zerztmc)
					$('#grid_user_${pageId}').grid("parseResult",results)
			 }
			 });
 	}); 
	
 	$('#grid_user_${pageId}').grid({
		keyFields:['uch'],
		id:'grid_user_${pageId}',
		cols:[
        {property:'suifuch',caption:'${i18n.suifuch}',align:'center'},
		{property:'suifljh',caption:'${i18n.suifljh}',align:'center'},
  		{property:'suifljmc',caption:'${i18n.suifljmc}',align:'center'},
  		{property:'shuifsl',caption:'${i18n.shuifsl}',align:'center'},
  		{property:'shuifpc',caption:'${i18n.shuifpc}',align:'center'}
  		
  		]
	});
	
 	//F2取消
 	$('#btn_quxiao').bind('click',function(){
 		 //参数校验
 		if(!$('#form_user_${pageId}').form("validateParam")){
				return;	
 		}
 		if(!$('#xiaohdh').fieldText('validateNotNull')){
 			return;
 		}
 		//打开提示框是否删除
		if(confirm($.sdcui.resource.i18n['C_remove'])){
 		 //提交数据
 		var params = $('#form_user_${pageId}').form("getFormParam");
 		var url = "<%=request.getContextPath()%>/yichang/40502.do";
		 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 if (showPromptRequestMsg(results)==true){
				 $('#grid_user_${pageId}').grid('clearRecords');
				 $('#form_info_${pageId}').form('resetFields');
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
		<td align="right"><span id="btn_search" class="ui-button">${i18n.search}[F1]</span><span id="btn_quxiao"  class="ui-button">${i18n.qux}[F2]</span>		
		<span id="btn_back"  class="ui-button">${i18n.back}[F11]</span>		
		<span id="btn_return"  class="ui-button">${i18n.return}[F12]</span>		</td>
      </tr>
  </table>

<div id="content001"> 	
<table class="tui-grid" cellspacing="1" width="100%">
<tr>
		<td>${i18n.shengbdh}：</td>
		<td colspan="7"><div class="ui-field" id="shengbdh"></div></td>
      <tr>
		<td>${i18n.lingjbh}：</td>
		<td><div class="ui-field" id="lingjbh"></div></td>
		<td>${i18n.lingjmc}：</td>
		<td><div class="ui-field" id="lingjmc"></div></td>
		<td>${i18n.lingjsl}：</td>
		<td><div class="ui-field" id="lingjsl"></div></td>
		<td>${i18n.shengbd}：</td>
		<td><div class="ui-field" id="shengbd"></div></td>
      </tr>
      <tr>
		<td>${i18n.gongysdm}：</td>
		<td><div class="ui-field" id="gongysdm"></div></td>
		<td>${i18n.gongysmc}：</td>
		<td><div class="ui-field" id="gongysmc"></div></td>
		<td>${i18n.uch}：</td>
		<td><div class="ui-field" id="yuch"></div></td>
		<td>${i18n.shengbr}：</td>
		<td><div class="ui-field" id="shengbr"></div></td>
	</tr>
      <tr>
		<td>${i18n.elh}：</td>
		<td><div class="ui-field" id="elh"></div></td>
		<td>${i18n.pich}：</td>
		<td><div class="ui-field" id="pich"></div></td> 
		<td></td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
      <tr>
		<td>${i18n.hegsl}：</td>
		<td><div class="ui-field" id="hegsl"></div></td>
		<td>${i18n.gongfsl}：</td>
		<td><div class="ui-field" id="gongfsl"></div></td>
		<td>${i18n.liaofsl}：</td>
		<td><div class="ui-field" id="liaofsl"></div></td>
		<td>${i18n.zerztmc}：</td>
		<td><div class="ui-field" id="zerztmc"></div></td>
		
	</tr>
	 <tr>
		<td>${i18n.zerztdm}：</td>
		<td><div class="ui-field" id="zerztdm"></div></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
 		<td></td>
		<td></td>
	</tr>
  </table>	
</div>
<div id="grid_user_${pageId}" class='hidden-item'></div>
</div> 	    
<div id='prompt'>${i18n.prompt}</div>	
</div>    		    		    	    
</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>