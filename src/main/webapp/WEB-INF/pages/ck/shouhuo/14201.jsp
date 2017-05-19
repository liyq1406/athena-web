<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","14201");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_142 }</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
			$(function(){
				$('#grid_user_${pageId}').grid({
					keyFields:['uth','uah'],
					id:'grid_user_${pageId}',
					src:'<%=request.getContextPath()%>/shouhuo/14202.do',
					cols:[
							{property:'yaohlh',caption:'${i18n.yaohlh}',width:50},
							{property:'uah',caption:'${i18n.uah}',width:50},
							{property:'lingjbh',caption:'${i18n.lingjbh}',width:50},
							{property:'lingjmc',caption:'${i18n.lingjmc}',width:50},
							{property:'lingjsl',caption:'${i18n.lingjsl}',width:50},
							{property:'elh',caption:'${i18n.elh}',width:50},
							{property:'gongysdm',caption:'${i18n.gongysdm}',width:50},
							{property:'gongysmc',caption:'${i18n.gongysmc}',width:50},
							{property:'uaxh',caption:'${i18n.uaxh}',width:50},
							{property:'ucxh',caption:'${i18n.ucxh}',width:50},
							{property:'pich',caption:'${i18n.pich}',width:50},
							{property:'yansts',caption:'${i18n.yansbz}',width:50},
							{property:'danw',caption:'${i18n.danw}',width:50}
				     ],
				buttons:[
                         {name:'back',caption:'${i18n.back}[F11]'}
                        ,{name:'return',caption:'${i18n.return}[F12]'}
				]});
				
				$('#form_user_${pageId}').form({
					fields:[
						{fieldType:'fieldLabel',property:'blh'},
						{fieldType:'fieldLabel',property:'chengysdm'},
						{fieldType:'fieldLabel',property:'chengysmc'},
						{fieldType:'fieldLabel',property:'xiehzt'},
						{fieldType:'fieldHidden',property:'cangkbh'},
						{fieldType:'fieldText',property:'uth'}
						
					]});
				
			

			//页面加载后，查询数据为界面赋值
			$(document).ready(function(){
				//加载返回数据
					$('#blh span').html('${result.result.parameter.blh}');
					$('#chengysmc span').html('${result.result.parameter.chengysmc}');
					$('#xiehzt span').html('${result.result.parameter.xiehzt}');
					$('#chengysdm span').html('${result.result.parameter.chengysdm}');
					$('#uth  input').val('${result.result.parameter.uth}');
					$('#uth input').attr("disabled",true);	
					//加载返回数据
					$('#grid_user_${pageId}').grid('parseResult',${result});
					var params = $('#form_user_${pageId}').form("getFormParam");
					$('#grid_user_${pageId}').grid("setQueryParams", params);
			});
			$(document).keyboardsupport({});
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
						    <td>${i18n.uth}</td>
							<td><div class="ui-field" id="uth"></div></td>
							<td>${i18n.blh}</td>
							<td><div class="ui-field" id="blh"></div></td>
							<td>${i18n.chengysdm}</td>
							<td><div class="ui-field" id="chengysdm"></div></td>
						</tr>
						<tr>
							<td>${i18n.chengysmc}</td>
							<td><div class="ui-field" id="chengysmc"></div></td>
							<td>${i18n.xiehzt}</td>
							<td><div class="ui-field" id="xiehzt"></div></td>
						</tr>
						
					</tbody>
				</table>
			</div>
			<div id="grid_user_${pageId}"></div>
		<div id='prompt'>${i18n.prompt}</div>
	  </div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>