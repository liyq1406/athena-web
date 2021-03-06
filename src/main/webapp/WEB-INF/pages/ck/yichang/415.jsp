<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","415");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_415}</title>
<jsp:include page="../../common/js.jsp" />
<script type="text/javascript">
var paramsQuery;
var currentPage = 1;
var list="";
$(function(){
	$('#form_user_${pageId}').form({
		onreload:true,
 		fields:[
                {fieldType:'fieldText',property:'rukpjh',dataType:'rukpjh',caption:'${i18n.rukpjh}',notNull:true},
                {fieldType:'fieldText',property:'chexyy',maxLength:'20',caption:'${i18n.chexyy}',notNull:false},
                {fieldType:'fieldText',property:'caozy',maxLength:'10',caption:'${i18n.caozr}',notNull:false,value:st_UserName}
				
				
	 			]
 		});
	
	$('#grid_user_${pageId}').grid({
		keyFields:['ush','lingjsl','ruksl','lingjbh','cangkbh'],
		id:'grid_user_${pageId}',
		showCheckbox:false,
		//翻页查询交易
		src:'<%=request.getContextPath()%>/yichang/41501.do',
		cols:[
		{property:'elh',caption:'${i18n.elh}',align:'center'},
		{property:'ush',caption:'${i18n.ush}',align:'center'},
		{property:'lingjbh',caption:'${i18n.lingjbh}',align:'center'},
		{property:'lingjmc',caption:'${i18n.lingjmc}',align:'center'},
		{property:'lingjsl',caption:'${i18n.lingjsl}',align:'center'},	
		{property:'ruksl',caption:'${i18n.ruksl	}',align:'center'},
        {property:'gongysdm',caption:'${i18n.gongysdm}',align:'center'},
		{property:'gongysmc',caption:'${i18n.gongysmc}',align:'center'},
		{property:'pich',caption:'${i18n.pich}',align:'center'}
  		],
  	buttons:[
  	         //F1查询 
	         {name:'search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
	   	 	    //参数校验
		 		if(!$('#form_user_${pageId}').form("validateParam")){
						return;	
		 		}
		 		 //提交数据
		 		var params = $('#form_user_${pageId}').form("getFormParam");
		 		$('#grid_user_${pageId}').grid("setQueryParams", params);
		 		var url = "<%=request.getContextPath()%>/yichang/41501.do";
				 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
					 if (showPromptRequestMsg(results)==true){
						//加载grid
							$('#grid_user_${pageId}').grid("parseResult",results)
							list=results.result.parameter.list;
					 }
				 });
			    return false;
			}}
			//F2撤销
			,{name:'chexiao',caption:'${i18n.repeal}[F2]',keyboard:'F2',action:function(){
			   if(list==""){
					return;
				}
		 		if(!$('#rukpjh').fieldText('validateNotNull')){
		 			return;
		 		}
		 		if(!$('#chexyy').fieldText('validateNotNull')){
		 			return;
		 		}
		 		if(!$('#caozy').fieldText('validateNotNull')){
		 			return;
		 		}
		 		//打开提示框是否删除
				if(confirm($.sdcui.resource.i18n['C_remove'])){
		 		 //提交数据
		 		var params = $('#grid_user_${pageId}').grid('getSelectedAll');
		 		params.push('rukpjh='+$('#rukpjh input').val());
		 		params.push("chexyy="+$('#chexyy input').val());
				params.push("caozy="+$('#caozy input').val());
		 		var url = "<%=request.getContextPath()%>/yichang/41502.do";
				 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
					 if (showPromptRequestMsg(results)==true){
						 $('#grid_user_${pageId}').grid("parseResult",results)
					 }
					 });
				}
	    		return false;
			}}
		　,{name:'back',caption:'${i18n.back}[F11]'}
          ,{name:'return',caption:'${i18n.return}[F12]'}
	
  	]});
	$(document).keyboardsupport({});
});
</script>
</head>
<body>
<div style="padding:20px;">
<!--主体内容开始-->
<div id="title"></div>
	<div id="form_user_${pageId}" class="ui-fieldLayout">
	  <table class="ui-grid" cellspacing="1" width="100%">
	      <tr>
			<td class="field-label">${i18n.rukpjh}：</td>
			<td class="field-container"><div class="ui-field" id="rukpjh"></div></td>
			<td class="field-label">${i18n.chexyy}：</td>
			<td class="field-container"><div class="ui-field" id="chexyy"></div></td>	
			<td class="field-label">${i18n.caozr}：</td>
			<td class="field-container"><div class="ui-field" id="caozy"></div></td>
	      </tr>
	  </table>
	</div> 
  <div id="grid_user_${pageId}" class='hidden-item'></div> 
  <div id='prompt'>${i18n.prompt}</div> 
</div>  
</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>