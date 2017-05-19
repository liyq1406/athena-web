<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","353");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_353}</title>
<jsp:include page="../../common/js.jsp" />
<script type="text/javascript">
$(function(){
	$('#form_user_${pageId}').form({
 		fields:[
				   {fieldType:'fieldText',property:'kuwdz',dataType:'kuwdz',notNull:true,caption:'${i18n.cangkdz}'}
	 			]
 		});
	$('#grid_user_${pageId}').grid({
		id:'grid_user_${pageId}',
		src:'<%=request.getContextPath()%>/beihuo/35301.do',
		cols:[
			  	{property:'elh',caption:'${i18n.elh}',width:'40'},
			  	{property:'blh',caption:'${i18n.blh}',width:'40'},
			  	{property:'uth',caption:'${i18n.uth}',width:'40'},
			  	{property:'ush',caption:'${i18n.biaoqh}',width:'40'},
				//{property:'cangkbh',caption:'${i18n.cangkh}',width:'40'},
				//{property:'zickbh',caption:'${i18n.zickh}',width:'40'},
				{property:'baozztxx',caption:'${i18n.baozzt}',internation:true,width:'40'},
				{property:'lingjbh',caption:'${i18n.lingjh}',width:'40'},
				{property:'lingjmc',caption:'${i18n.lingjmc}',width:'40'},
				{property:'lingjsl',caption:'${i18n.shul}',width:'40'},
				{property:'danw',caption:'${i18n.lingjdw}',width:'40'},
				{property:'usxh',caption:'${i18n.rongqxh}',width:'40'},
				{property:'gongysdm',caption:'${i18n.gongysdm}',width:'40'},
				{property:'editor',caption:'${i18n.zhuangtczr}',width:'40'},
				{property:'edit_time',caption:'${i18n.xiugrq}',width:'40'}
						
		   ],
			buttons:[
		   	 	{name:'search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
		   	 	   $('#grid_user_${pageId}').grid('clearRecords');
			   	 	if(!$('#form_user_${pageId}').form("validateParam")){
			     		return;
			     	}
				    var params = $('#form_user_${pageId}').form("getFormParam");
				    params.push("usercenter="+st_UserCenter);
		   	 		params.push("currentPage=1");
					//设置分页条件
					$('#grid_user_${pageId}').grid("setQueryParams", params);
					//加载数据
					$('#grid_user_${pageId}').grid("load",params);
		    		return false;
				}}
				　,{name:'back',caption:'${i18n.back}[F11]'}
		          ,{name:'return',caption:'${i18n.return}[F12]'}
				]
				});
				

	$(document).keyboardsupport({});
});
</script>
</head>
<body>
<!--主体内容开始-->
<div id="title"></div>
<div id="form_user_${pageId}" class="ui-fieldLayout">
<table class="ui-grid" cellspacing="1" width="100%" >
	<tr>
		<td>${i18n.cangkdz}:</td>
		<td><div class="ui-field" id="kuwdz"></div></td>
	</tr>
  </table>
  <div id="grid_user_${pageId}" ></div>
</div>

<div id='prompt'>${i18n.prompt}</div>

</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>