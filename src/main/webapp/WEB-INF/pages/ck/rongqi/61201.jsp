<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","612");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_612}</title>
<jsp:include page="../../common/js.jsp" />
<script type="text/javascript">
var paramsQuery;
var currentPage = 1;
$(function(){
	$('#form_user_${pageId}').form({
		onreload:true,
 		fields:[
                {fieldType:'fieldLabel',property:'diaobdh',dataType:'diaobdh',caption:'${i18n.diaobdh}',notNull:true}
	 			]
 		});
	var par =[];
	gridload();
	function gridload()
	{
		$('#grid_user_${pageId}').grid({
			keyFields:['diaobdh','rongqxh','rongqsl','wuld','gongysdm','chengysdm'],
			id:'grid_user_${pageId}',
			showCheckbox:true,
			params:par,
			//翻页查询交易
			src:'<%=request.getContextPath()%>/rongqi/61201.do',
			editSubmitSrc:'<%=request.getContextPath()%>/rongqi/61202.do',
			cols:[
			{property:'rongqxh',caption:'${i18n.rongqxh}'},
			{property:'rongqsl',caption:'${i18n.rongqsl}',editor:'fieldText',dataType:'plusinteger'},
			{property:'diaoruwld',caption:'${i18n.diaorurqq}'},
			{property:'wuld',caption:'${i18n.rongqiq}'},
	  		{property:'chengysdm',caption:'${i18n.rongqwls}'},
	  		//{property:'gongysdm',caption:'${i18n.rongqgys}'},
	  		{property:'caozy',caption:'${i18n.xitczyhm}'}
	  		],
	  		buttons:[	   				
	   				//F2删除
	   				{name:'btn_delete',caption:'${i18n.delete}[F2]',keyboard:'F2',action:function(){
	   			 		//获取选择行
	   			 		var params = $('#grid_user_${pageId}').grid('getSelectedAll');
	   					if(params.length < 1){
	   						showPromptMsg('red','${i18n.selectoneerror}')
	   						return false;
	   					}
	   			 		//打开提示框是否删除
	   					if(confirm($.sdcui.resource.i18n['C_remove'])){
	   			 		 //提交数据
	   			 		var params = $('#grid_user_${pageId}').grid('getSelectedAll');
	   					params.push('diaobdh='+'${result.result.parameter.diaobdh}');
	   			 		paramsQuery = jQuery.extend(true,[],params);
	   					
	   			 		var url = "<%=request.getContextPath()%>/rongqi/61203.do";
	   					 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
	   						 if (showPromptRequestMsg(results)==true){
	   							//加载grid
	   								$('#grid_user_${pageId}').grid("parseResult",results)
	   								par =[];
	   								par.push('diaobdh='+'${result.result.parameter.diaobdh}');
	   								gridload();
	   						 }
	   						 });
	   					}
	   				}},
	   				//单选
	   				{name:'getSelected',caption:'${i18n.checked}[F4]',keyboard:'F4',action:function(){
	   					$('#grid_user_${pageId}').grid('selected');
	   					return false;
	   				}}
	   			    //全选
	 				,{name:'selectedAll',caption:'${i18n.selectall}[F6]',keyboard:'F6',action:function(){
	 					$('#grid_user_${pageId}').grid('selectedAll');
	 					return false;
	 				}},
	 				//F11返回上一页
	   				{name:'btn_back',caption:'${i18n.back}[F11]',keyboard:'F11'},
	   			    //F12返回主页
	   				{name:'btn_return',caption:'${i18n.return}[F12]',keyboard:'F12'}
	   				]
		});
	}
	$(document).keyboardsupport({});
});
//页面加载后，查询数据为界面赋值
$(document).ready(function(){
	//加载返回数据
		$('#diaobdh span').html('${result.result.parameter.diaobdh}');
		//加载返回数据
		$('#grid_user_${pageId}').grid('parseResult',${result});
		var params = $('#form_user_${pageId}').form("getFormParam");
		$('#grid_user_${pageId}').grid("setQueryParams", params);
});
</script>
</head>
<body>
<!--主体内容开始-->
<div id="title"></div>
<div id="form_user_${pageId}" class="ui-fieldLayout">
<table class="ui-grid" cellspacing="1" width="100%" >
    <tr>
      <td class="field-label">${i18n.diaobdh}：</td>
      <td class="field-container"><div class="ui-field" id="diaobdh"></div></td>
    </tr>
</table>
<div id="grid_user_${pageId}" class='hidden-item'></div>
</div>
<div id='prompt'>${i18n.prompt}</div>
</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>