<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","628");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_628}</title>
<jsp:include page="../../common/js.jsp" />
<script type="text/javascript">
var paramsQuery;
var currentPage = 1;
$(function(){
	$('#form_user_${pageId}').form({
		onreload:true,
 		fields:[
				{fieldType:'fieldLabel',property:'wuld',value:st_Rongqcbh},
				{fieldType:'fieldText',property:'rongqxh',dataType:'letter_numeric',limitedLength:'5',caption:'${i18n.rongqxh}',notNull:true},
				{fieldType:'fieldText',property:'rongqsl',dataType:'plusinteger',caption:'${i18n.rongqsl}',notNull:true},
				{fieldType:'fieldText',property:'gongysdm',dataType:'shuzzm',maxLength:'10',caption:'${i18n.gongysdm}',notNull:true},
				{fieldType:'fieldText',property:'chengysdm',dataType:'shuzzm',maxLength:'10',caption:'${i18n.chengysdm}',notNull:true},
				{fieldType:'fieldText',property:'zhizs',maxLength:'35',caption:'${i18n.zhizs}',notNull:false}
	 			]
 		});
	$('#grid_user_${pageId}').grid({
		keyFields:['rongqxh','rongqsl','wuld','zaiy','gongysdm','chengysdm','zhizs'],
		id:'grid_user_${pageId}',
		showCheckbox:true,
		//翻页查询交易
		src:'<%=request.getContextPath()%>/rongqi/62803.do',
		cols:[
		{property:'rongqxh',caption:'${i18n.rongqxh}'},
		{property:'rongqsl',caption:'${i18n.rongqsl}'},
		{property:'wuld',caption:'${i18n.rongqiq}'},
		{property:'zaiy',caption:'${i18n.laiy}'},
		//{property:'gongysdm',caption:'${i18n.gongysdm}'},
		{property:'chengysdm',caption:'${i18n.chengysdm}'},
		{property:'zhizs',caption:'${i18n.zhizs}'}
  		],
  		buttons:[
   				//单选
   				{name:'getSelected',caption:'${i18n.checked}[F4]',keyboard:'F4',action:function(){
   					$('#grid_user_${pageId}').grid('selected');
   					return false;
   				}}
   				//全选
 				,{name:'selectedAll',caption:'${i18n.selectall}[F6]',keyboard:'F6',action:function(){
 					$('#grid_user_${pageId}').grid('selectedAll');
 					return false;
 				}}
   				]
	});
	//F1确认 
 	$('#btn_ok').bind('click',function(){
 		 //参数校验
 		if(!$('#form_user_${pageId}').form("validateParam")){
				return;	
 		}
/*  		if($('#gongysdm input').val()=="DPCA"){
 			$('#gongysdm input').val('DPCA');
		} */
 		 //提交数据
 		var params = $('#form_user_${pageId}').form("getFormParam");
		params.push("currentPage="+currentPage);
 		 params.push("danjbh="+$('#danjbh').val());
 		$('#grid_user_${pageId}').grid("setQueryParams", params);
 		var url = "<%=request.getContextPath()%>/rongqi/62801.do";
		 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 if (showPromptRequestMsg(results)==true){
				//加载返回数据
					$('#grid_user_${pageId}').grid('parseResult',results)
					$('#danjbh').val(results.result.parameter.danjbh);
			 }
			 });
 	}); 
 	$('#gongysdm input').bind('blur',function(){
 		var gongys=$('#gongysdm input').val();
 		if(gongys.toUpperCase()=="DPCA"){
 			$('#chengysdm input').val('DPCA');
		}else{
			$('#chengysdm input').val('');
		}
 	});
 	//F2删除
	$('#btn_delete').bind('click',function(){

		//获取选择行
 		var params = $('#grid_user_${pageId}').grid('getSelectedAll');
		if(params.length < 1){
			showPromptMsg('red','${i18n.selectoneerror}')
			return false;
		}
		//打开提示框是否删除
		if(confirm($.sdcui.resource.i18n['C_remove'])){
		//先提交选中行，然后再重新加载
		var params = $('#grid_user_${pageId}').grid('getSelectedAll');	
		params.push("currentPage="+currentPage);
		 params.push("danjbh="+$('#danjbh').val());
		var url = "<%=request.getContextPath()%>/rongqi/62802.do";
		 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 if (showPromptRequestMsg(results)==true){
				 $('#grid_user_${pageId}').grid('parseResult',results)
			 }
			 });
		}
		return false;
	});
$(document).keyboardsupport({});
});
</script>
	</head>
	<body>
<div id="title"></div>
<input id="danjbh" type="Hidden"></input>
<div id="form_user_${pageId}" class="ui-fieldLayout" >
<table class="ui-grid" cellspacing="1" width="100%" >
<tr>
		<td class="field-label">${i18n.rongqiq}：</td>
		<td class="field-container"><div class="ui-field" id="wuld"></div></td>
		<td class="field-label">${i18n.rongqxh}：</td>
		<td class="field-container"><div class="ui-field" id="rongqxh"></div></td>
		<td class="field-label">${i18n.rongqsl}：</td>
		<td class="field-container"><div class="ui-field" id="rongqsl"></div></td>
		<td class="field-label"></td>
		<td class="field-container"></td>
      </tr>
      <tr>
		<td class="field-label">${i18n.gongysdm}：</td>
		<td class="field-container"><div class="ui-field" id="gongysdm"></div></td>
		<td class="field-label">${i18n.chengysdm}：</td>
		<td class="field-container"><div class="ui-field" id="chengysdm"></div></td>
		<td class="field-label">${i18n.zhizs}：</td>
		<td class="field-container"><div class="ui-field" id="zhizs"></div></td>
		<td class="field-label"></td>
		<td class="field-container"></td>
      </tr>
      
  </table>
		<br>
		<div align=right>
		<span id="btn_ok"  class="ui-button">${i18n.ok}[F1]</span>		
		<span id="btn_delete"  class="ui-button">${i18n.delete}[F2]</span>	
		<span id="btn_back"  class="ui-button">${i18n.back}[F11]</span>	
		<span id="btn_return"  class="ui-button">${i18n.return}[F12]</span>	
	    </div>
		</br>
<div id="grid_user_${pageId}" class='hidden-item'></div>

</div>
<div id='prompt'>${i18n.prompt}</div>
				    
</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>