<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","60701");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_60701}</title>
<jsp:include page="../../common/js.jsp" />
<jsp:include page="../../common/print.jsp" />
<script type="text/javascript">
var paramsQuery;
var currentPage = 1;
$(function(){
	$('#form_user_${pageId}').form({
		onreload:true,
 		fields:[
                {fieldType:'fieldLabel',property:'danjbh'},
                {fieldType:'fieldLabel',property:'shengqr'},
                {fieldType:'fieldLabel',property:'bhsj1'}
	 			]
 		});
	var par = [];
	gridload();
	//F3删除
 	$('#btn_delete').bind('click',function(){
 		
		//获取选择行
 		var params = $('#grid_user_${pageId}').grid('getSelectedAll');
		if(params.length < 1){
			showPromptMsg('red','${i18n.selectoneerror}')
			return false;
		}
		//打开提示框是否删除
		if(confirm($.sdcui.resource.i18n['C_remove'])){
		params.push('danjbh='+$('#danjbh span').html());
		params.push("currentPage="+currentPage);
 		var url = "<%=request.getContextPath()%>/rongqi/60703.do";
		 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 if (showPromptRequestMsg(results)==true){
				 $('#grid_user_${pageId}').grid("parseResult",results)
			 }
			 });
		}
 	});
	//F5打印
	$('#btn_print').bind('click',function(){
		if($('#danjbh span').html()=="")
		{
		showPromptMsg('red','${i18n.danjbhbnwk}')
		return;
		}
            var params2 = [];
	 		params2.push("usercenter="+st_UserCenter);
	 		params2.push("danjbh="+$('#danjbh span').html());
	 		var url2 = "<%=request.getContextPath()%>/rongqi/63002.do";
	 		g_isSub=0;
	 		doprint(630,params2,url2);	
	 		return false;
	}); 
	//F4 选中
	$('#getSelected').bind('click',function(){
		$('#grid_user_${pageId}').grid('selected');
		return false;
	});	
 		//页面加载后，查询数据为界面赋值
	$(document).ready(function(){
		//加载返回数据
			$('#danjbh span').html('${result.result.parameter.danjbh}');
			par.push('danjbh='+$('#danjbh span').html());
			gridload();
			$('#shengqr span').html('${result.result.parameter.shengqr}');
			$('#bhsj1 span').html('${result.result.parameter.bhsj1}');
			//加载返回数据
			$('#grid_user_${pageId}').grid('parseResult',${result});
			var params = $('#form_user_${pageId}').form("getFormParam");
			$('#grid_user_${pageId}').grid("setQueryParams", params);
	});
	$(document).keyboardsupport({});
	
	function gridload()
	{
		$('#grid_user_${pageId}').grid({
			keyFields:['rongqxh','gongysdm','chengysdm','rongqsl','wuld'],
			id:'grid_user_${pageId}',
			showCheckbox:true,
			params:par,
			//翻页查询交易
			src:'<%=request.getContextPath()%>/rongqi/60701.do',
			editSubmitSrc:'<%=request.getContextPath()%>/rongqi/60702.do',
			cols:[
			//{property:'gongysdm',caption:'${i18n.gongys}'},
	  		{property:'chengysdm',caption:'${i18n.wuls}'},
	  		{property:'wuld',caption:'${i18n.rongqiq}'},
	  		{property:'rongqxh',caption:'${i18n.rongqxh}'},
	  		{property:'rongqsl',caption:'${i18n.baofsl}',editor:'fieldText',dataType:'plusinteger'}
	  		]
		});
	}
});
</script>
</head>
<body>
<!--主体内容开始-->
<div id="title"></div>
<div id="form_user_${pageId}" class="ui-fieldLayout">
<table class="ui-grid" cellspacing="1" width="100%">
      <tr>
		<td class="field-label">${i18n.danjbh}：</td>
		<td class="field-container"><div class="ui-field" id="danjbh"></div></td>
		<td class="field-label">${i18n.shenqr}：</td>
		<td class="field-container"><div class="ui-field" id="shengqr"></div></td>
		<td class="field-label">${i18n.baofsqdsj}：</td>
		<td class="field-container"><div style="float:left" class="ui-field" id="bhsj1"></div></td>
      </tr>
  </table>
<br/>
<div align="right">
		<span id="btn_delete"  class="ui-button">${i18n.delete}[F3]</span>
		<span id="getSelected"  class="ui-button">${i18n.checked}[F4]</span>
		<span id="btn_print"  class="ui-button">${i18n.print}[F5]</span>
		<span id="btn_back"  class="ui-button">${i18n.back}[F11]</span>	
		<span id="btn_return"  class="ui-button">${i18n.return}[F12]</span>
</div>
<br/>	  				
<div id="grid_user_${pageId}" class='hidden-item'></div>
</div>     
<div id='prompt'>${i18n.prompt}</div>
		    
</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>