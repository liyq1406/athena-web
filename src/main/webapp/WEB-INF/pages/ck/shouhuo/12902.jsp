<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","12902");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_12902}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
			$(function(){
			 //grid
               $('#grid_user_${pageId}').grid({
                    keyFields:['uah','yaohlh','uth'],
					id:'grid_user_${pageId}',
					src:'<%=request.getContextPath()%>/shouhuo/12904.do',
					cols:[
						{property:'yaohlh',caption:'${i18n.baozdykh}'},
						{property:'weizh',caption:'${i18n.weizh}'},
						{property:'zhengclsh',caption:'${i18n.zhengclsh}'},
						{property:'lingjbh',caption:'${i18n.lingjbh}'},
						{property:'lingjmc',caption:'${i18n.lingjmc}'},
						{property:'gongysdm',caption:'${i18n.gongysdm}'},
						{property:'gongysmc',caption:'${i18n.gongysmc}'},
						{property:'lingjsl',caption:'${i18n.lingjsl}'},
						{property:'danw',caption:'${i18n.danw}'},
						{property:'yanssl',caption:'${i18n.yanssl}'}
						
					]
				,buttons:[
	                     {name:'back',caption:'${i18n.back}[F11]'}
                        ,{name:'return',caption:'${i18n.return}[F12]'}
				          ]});  	          		          
				          
			   $('#grid_user2_${pageId}').grid({
			        keyFields:['lingjbh'],
					id:'grid_user2_${pageId}',
					hotkey:'grid1',
					src:'<%=request.getContextPath()%>/shouhuo/12906.do',
					cols:[
						{property:'uah',caption:'${i18n.uah}'},
						{property:'lingjbh',caption:'${i18n.lingjbh}'},
						{property:'lingjmc',caption:'${i18n.lingjmc}'},
						{property:'gongysdm',caption:'${i18n.gongysdm}'},
						{property:'lingjsl',caption:'${i18n.lingjsl}'},
						{property:'yanssl',caption:'${i18n.yanssl}'}
						]
					});  
		
		
		
		//页面加载后，查询数据为界面赋值
		$(document).ready(function(){
				var params=[];
	    		params.push("yaohlh=${result.parameter.yaohlh}");
	    		params.push("uth=${result.parameter.uth}");
	    		params.push("uah=${result.parameter.uah}");
	    		
				$('#grid_user_${pageId}').grid('parseResult',${result});
				$('#grid_user2_${pageId}').grid('parseResult',${result2});
				
				//设置分页条件
				$('#grid_user_${pageId}').grid("setQueryParams", params);
				$('#grid_user2_${pageId}').grid("setQueryParams", params);
			});
	
			  $(document).keyboardsupport({});
		});
		</script>
	</head>
	<body>
		<div style="padding:20px;">
			<div id="title"></div>
			<div id="grid_user_${pageId}" ></div>
			<div id="grid_user2_${pageId}" class='hidden-item'></div>
			<div id='prompt'>${i18n.prompt}</div>
		</div>

	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>