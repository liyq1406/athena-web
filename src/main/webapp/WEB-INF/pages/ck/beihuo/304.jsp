<%@ page language="java" pageEncoding="UTF-8"%>
<%request.setAttribute("pageId","304");%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_304}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
			$(function(){
				$('#grid_user_${pageId}').grid({
					keyFields:['ush'],
					id:'grid_user_${pageId}',
					cols:[
					{property:'yicsbdh',caption:'${i18n.yicsbdh}'},
					{property:'lingjh',caption:'${i18n.lingjh}'},
					{property:'ush',caption:'${i18n.ush}'},
					{property:'ussl',caption:'${i18n.ussl}'},
					{property:'diz',caption:'${i18n.diz}'},
					{property:'usxh',caption:'${i18n.usxh}'},
			  		{property:'lingjdw',caption:'${i18n.lingjdw}'},
					{property:'yaohsl',caption:'${i18n.yaohsl}'}
				],
					records:{'result':{'total':2,'rows':[{'baozdykh':'123','qizlsh':'1234','peislx':'12345','shangxbz':'123','lingjh':'1234','lingjmc':'12345','ush':'123','gongysdm':'1234','kuw':'123','zhuangcsl':'123','zuizsxsj':'12345','chex':'12345','ceng':'123'}]}}
				});
				
			 	$('#form_user_${pageId}').form({
			 		fields:[
			 		]
			 	});
			 	
			});
		</script>
	</head>
	<body>
		<div style="padding:20px;">
			<div id="title"></div>
			<div id="form_user_${pageId}" class="ui-fieldLayout">
			 	<table class="ui-grid" cellspacing="1" width="100%">
					<tbody>
						<tr>
							<td>OL:</td>
							<td><div class="ui-field" id="ol">RQ05110630</div></td>
							<td>${i18n.yem}:</td>
							<td><div class="ui-field" id="yem">1/5</div></td>
						</tr>
						<tr>
							<td>${i18n.cangkbh}:</td>
							<td><div class="ui-field" id="cangkbh">WA0 03B</div></td>
							<td>${i18n.fahsj}:</td>
							<td><div class="ui-field" id="fahsj">11/05/11 08/46</div></td>
							<td>${i18n.daysj}:</td>
							<td><div class="ui-field" id="daysj">11/05/11 08/46</div></td>
							<td>${i18n.dayjbh}:</td>
							<td><div class="ui-field" id="dayjbh">P01</div></td>
						</tr>
						<tr>
							<td>${i18n.keh}:</td>
							<td><div class="ui-field" id="keh">WO513</div></td>
							<td>${i18n.shengbr}:</td>
							<td><div class="ui-field" id="shengbr">WO513</div></td>
							<td>${i18n.shifydyuc}:</td>
							<td><div class="ui-field" id="shifydyuc">是/否 </div></td>
						</tr>
					</tbody>
				</table> 
			</div>
			<br></br>
			<div id="grid_user_${pageId}"></div>
		</div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>