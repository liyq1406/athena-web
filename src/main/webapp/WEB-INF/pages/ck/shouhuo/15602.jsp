<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","15602");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_156}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
			$(function(){
                // grid
               $('#grid_user_${pageId}').grid({
					id:'grid_user_${pageId}',
					src:'<%=request.getContextPath()%>/shouhuo/15602.do',
					cols:[
					{property:'yaohlh',caption:'${i18n.baozdykh}',width:'60'},
					{property:'weiz',caption:'${i18n.weizh}',width:'60'},
					{property:'zhengclsh',caption:'${i18n.zhengclsh}',width:'60'},
					{property:'lingjbh',caption:'${i18n.lingjbh}',width:'60'},
					{property:'lingjmc',caption:'${i18n.lingjmc}',width:'60'},
					{property:'gongysdm',caption:'${i18n.gongysdm}',width:'60'},
					{property:'gongysmc',caption:'${i18n.gongysmc}',width:'60'},
					{property:'uaxh',caption:'${i18n.baozxh}',width:'60'},
					{property:'uarl',caption:'${i18n.baozrl}',width:'60'},
					{property:'zhengcsxsj',caption:'${i18n.shangxsj}',width:'60'},
					{property:'lingjsl',caption:'${i18n.lingjsl}',width:'60'},
					{property:'danw',caption:'${i18n.danw}',width:'60'}

				],
				buttons:[
				    {name:'back',caption:'${i18n.back}[F11]'}
			   	 	,{name:'return',caption:'${i18n.return}[F12]'}
				]}); 
             //页面加载后，查询数据为界面赋值
	     $(document).ready(function(){
				//加载返回数据
				if ('${result}' != ''){
						var result = JSON.parse('${result}');
						$('#grid_user_${pageId}').grid('parseResult',result.result);
						var params=[];
			    		params.push("yaohlh="+result.result.parameter.yaohlh);
			    		//设置分页条件
					    $('#grid_user_${pageId}').grid("setQueryParams", params);
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