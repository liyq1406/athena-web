<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","639");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_639}</title>
<jsp:include page="../../common/js.jsp" />
<jsp:include page="../../common/print.jsp"/>
<script type="text/javascript">
var paramsQuery;
var currentPage = 1;
$(function(){
	$('#form_user_${pageId}').form({
		onreload:true,
 		fields:[
                {fieldType:'fieldLabel',property:'diaobdh',dataType:'diaobdh',caption:'${i18n.yikdh}',notNull:false}
	 			]
 		});
	$('#grid_user_${pageId}').grid({
		keyFields:['danjbh','chengysdm','gongysdm','wuld'],
		id:'grid_user_${pageId}',
		showCheckbox:false,
		//翻页查询交易
		src:'<%=request.getContextPath()%>/rongqi/63901.do',
		cols:[
			//{property:'diaobdh',caption:'${i18n.diaobdh}'},
			{property:'rongqxh',caption:'${i18n.rongqxh}'},
			{property:'rongqsl',caption:'${i18n.yikusqsl}'},
			{property:'weidbsl',caption:'${i18n.weiyikusl}'},
			{property:'yidbsl',caption:'${i18n.yiyikusqsl}'},
	  		{property:'diaoruwld',caption:'${i18n.diaoruwld}'},
	  		{property:'wuld',caption:'${i18n.wuld}'},
	  		//{property:'gongysdm',caption:'${i18n.gongysdm}'},
	  		//{property:'diaobsj',caption:'${i18n.diaobsj}'},
	  		{property:'chengysdm',caption:'${i18n.chengysdm}'}
  		],
  		buttons:[
  			//打印
			{name:'print',caption:'${i18n.print}[F7]',keyboard:'F7',action:function(){
				 var params = [];
				  params.push("usercenter="+st_UserCenter);
				  params.push("diaobdh="+ $('#diaobdh span').html());
				  var url = "<%=request.getContextPath()%>/rongqi/print_637.do";
				  doprint(637,params,url);
			}}
			//重新加载
			,{name:'back',caption:'${i18n.back}[F11]'}
			//返回
			,{name:'return',caption:'${i18n.return}[F12]'}
   	   ]
	});

	$(document).keyboardsupport({});
});

//页面加载后，查询数据为界面赋值
$(document).ready(function(){
	//加载返回数据
	if ('${result}' != ''){
		//查询条件赋值
		var result = JSON.parse('${result}');
		$('#diaobdh span').html(result.result.parameter.diaobdh);
		$('#diaobdh span').attr("defaultValue",result.result.parameter.diaobdh),	
		//加载返回数据
		$('#grid_user_${pageId}').grid('parseResult',result.result);
		if (result.result.parameter.list.length > 0){
			$('#grid_user_${pageId}').grid('focus');
		}
		//设置分页条件
		var params = $('#form_user_${pageId}').form("getFormParam");
		$('#grid_user_${pageId}').grid("setQueryParams", params);
	}
});
</script>
</head>
<body>
<!--主体内容开始-->
<div id="title"></div>
<div id="form_user_${pageId}" class="ui-fieldLayout">
<table class="ui-grid" cellspacing="1" width="100%" >
       <tr>
		<td class="field-label">${i18n.yikdh}：</td>
		<td class="field-container"><div class="ui-field" id="diaobdh"></div></td>				     
		</tr>	
		<tr>		 
</table>
<div id="grid_user_${pageId}" class='hidden-item'></div>
</div>
	
<div id='prompt'>${i18n.prompt}</div>
</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>