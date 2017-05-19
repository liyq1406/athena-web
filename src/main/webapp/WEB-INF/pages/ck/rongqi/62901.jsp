<%@ page language="java" pageEncoding="UTF-8"%>
<%request.setAttribute("pageId","62901");%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_62901}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
		var paramsQuery;
		var currentPage = 1;

			//var demorecord = {'result':{'total':1,cangkbh:st_Cangkbh,jiesckbh:'123','rows':[{us:'us1','shul':20,'lingjbh':123,'ush':'S00000001','gongysmc':345,'shangxbz':678,'shifsl':901,'danw':322,'kuw':012},{us:'us2','shul':20,'lingjbh':123,'ush':'S00000002','gongysmc':345,'shangxbz':678,'shifsl':901,'danw':322,'kuw':014}]}};


			$(function(){
				$('#grid_user_${pageId}').grid({
					keyFields:['us'],
					id:'grid_user_${pageId}',
					showCheckbox:false,
					//查询交易
					src:'<%=request.getContextPath()%>/rongqi/62002.do',
					cols:[
						{property:'rongqxh',caption:'${i18n.rongqxh}'},
						{property:'rongqsl',caption:'${i18n.weixsl}'}
					],
					buttons:[
						{name:'back',caption:'${i18n.back}[F11]'},
						//F12返回
						{name:'return',caption:'${i18n.return}[F12]'}
					]				
				});
			 	$('#form_user_${pageId}').form({
			 		fields:[
		                {fieldType:'fieldLabel',property:'danjbh'},
		                {fieldType:'fieldLabel',property:'wuld'},
		                {fieldType:'fieldLabel',property:'gongysmc1'},
		                {fieldType:'fieldLabel',property:'shengqr'},
		                {fieldType:'fieldLabel',property:'zhongzsj'}
			 		]
			 	});

				//页面加载后，查询数据为界面赋值
				$(document).ready(function(){
					//加载返回数据
						$('#danjbh span').html('${result.result.parameter.danjbh}');
						$('#wuld span').html('${result.result.parameter.wuld}');
						$('#gongysmc1 span').html('${result.result.parameter.gongysmc1}');
						$('#shengqr span').html('${result.result.parameter.shengqr}');
						$('#zhongzsj span').html('${result.result.parameter.zhongzsj}');
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
			<form id="putform" method="post" name="putform" >
				<input id="putvalue" name="putvalue" type="Hidden"></input>
			</form>
			<div id="form_user_${pageId}" class="ui-fieldLayout">
			 	<table class="ui-grid" cellspacing="1" width="100%">
					<tbody>
						<tr>
							<td>${i18n.weixdh}:</td>
							<td><div class="ui-field" id="danjbh"></div></td>
							<td>${i18n.rongqiq}:</td>
                            <td><div class="ui-field" id="wuld"></div></td>
                            <td>${i18n.weixs}:</td>
                            <td><div class="ui-field" id="gongysmc1"></div></td>
						</tr>
						<tr>
                            <td>${i18n.shenqr}:</td>
                            <td><div class="ui-field" id="shengqr"></div></td>
                            <td>${i18n.yujwcsj}:</td>
                            <td><div class="ui-field" id="zhongzsj"></div></td>
                        </tr>
					</tbody>
				</table> 
			</div>
			<br></br>
			<div id="grid_user_${pageId}"></div>
			<br></br>
			<div id='prompt'>${i18n.prompt}</div> 
		</div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>