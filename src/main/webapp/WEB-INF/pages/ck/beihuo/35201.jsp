<%@ page language="java" pageEncoding="UTF-8"%>
<%request.setAttribute("pageId","35201");%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_35201}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
			$(function(){
					$('#grid_user_${pageId}').grid({
						keyFields:['ush'],
						id:'grid_user_${pageId}',
						//查询交易
						src:'<%=request.getContextPath()%>/beihuo/33901.do',
						cols:[
						  	{property:'elh',caption:'${i18n.elh}',width:'50'},
						  	{property:'blh',caption:'${i18n.blh}',width:'50'},
						  	{property:'uth',caption:'${i18n.uth}',width:'50'},
						  	{property:'ush',caption:'${i18n.biaoqh}',width:'50'},
							{property:'cangkbh',caption:'${i18n.cangkh}',width:'50'},
							{property:'zickbh',caption:'${i18n.zickh}',width:'50'},
							{property:'kuwbh',caption:'${i18n.kuw}',width:'50'},
							{property:'lingjbh',caption:'${i18n.lingjh}',width:'50'},
							{property:'lingjmc',caption:'${i18n.lingjmc}',width:'50'},
							{property:'lingjsl',caption:'${i18n.shul}',width:'50'},
							{property:'danw',caption:'${i18n.lingjdw}',width:'50'},
							{property:'gongysdm',caption:'${i18n.gongysdm}',width:'50'},
							{property:'editor',caption:'${i18n.zhuangtczr}'},
							{property:'edit_time',caption:'${i18n.xiugrq}'}
						],
						buttons:[
	                       {name:'back',caption:'${i18n.back}[F11]'},
	                       //F12返回
	                       {name:'return',caption:'${i18n.return}[F12]'}
						]
					});
				
				//页面加载后，查询数据为界面赋值
		     $(document).ready(function(){
				var params=[];
				params.push("cangkbh=${result.result.parameter.cangkbh}");
	    		params.push("lingjbh=${result.result.parameter.lingjbh}");
	    		params.push("baozzt=${result.result.parameter.baozzt}");
	    		var flag='${result.result.parameter.flag}';
	    		if(flag==0){
	    			params.push("flag=0");
	    		}
				$('#grid_user_${pageId}').grid('parseResult',${result})
				//设置分页条件
				$('#grid_user_${pageId}').grid("setQueryParams", params);
				
			});
	
			 	$(document).keyboardsupport({});
			 	
			});
			
		</script>
	</head>
	<body>
		<div style="padding:20px;">
			<div id="title"></div>
			<div id="grid_user_${pageId}"></div>
			<div id='prompt'>${i18n.prompt}</div> 
			
			
		</div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>