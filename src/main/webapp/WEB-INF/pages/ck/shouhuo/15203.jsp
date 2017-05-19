<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","15203");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_156}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
			$(function(){
                // grid
               $('#grid_user_${pageId}').grid({
					id:'grid_user_${pageId}',
					src:'<%=request.getContextPath()%>/shouhuo/15601.do',
					cols:[
					{property:'yaohlh',caption:'${i18n.baozdykh}',width:'50'},
					{property:'weiz',caption:'${i18n.weizh}',width:'50'},
					{property:'zhengclsh',caption:'${i18n.zhengclsh}',width:'50'},
					{property:'lingjbh',caption:'${i18n.lingjbh}',width:'50'},
					{property:'lingjmc',caption:'${i18n.lingjmc}',width:'50'},
					{property:'gongysdm',caption:'${i18n.gongysdm}',width:'50'},
					{property:'gongysmc',caption:'${i18n.gongysmc}',width:'50'},
					{property:'baozxh',caption:'${i18n.baozxh}',width:'50'},
					{property:'usxh',caption:'${i18n.baozrl}',width:'50'},
					{property:'zhengcsxsj',caption:'${i18n.shangxsj}',width:'50'},
					{property:'lingjsl',caption:'${i18n.lingjsl}',width:'50'},
					{property:'danw',caption:'${i18n.danw}',width:'50'}

				],
				buttons:[
			        {name:'back',caption:'${i18n.back}[F11]'}	
			   	 	,{name:'return',caption:'${i18n.return}[F12]'}
				]}); 
             //页面加载后，查询数据为界面赋值
	     $(document).ready(function(){
	     	if ('${result}' != ''){
				var result = JSON.parse('${result}');
				$('#grid_user_${pageId}').grid('parseResult',result.result);
				var params=[];
	    		params.push("yaohlh="+result.result.parameter.yaohlh);
	    		//设置分页条件
					$('#grid_user_${pageId}').grid("setQueryParams", params);
					//加载列表数据
					$('#grid_user_${pageId}').grid("load",params);
			}
				
			});     
	   
			  $(document).keyboardsupport({});
		});
		</script>
		
	</head>
	<body>
		<div style="padding:20px;">
			<div id="title"></div>
			<div id="grid_user_${pageId}" class='hidden-item'></div>
			<div id='prompt'>${i18n.prompt}</div>
		</div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>