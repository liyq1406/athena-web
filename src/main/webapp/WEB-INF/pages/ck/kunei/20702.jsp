<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","20702");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_20702}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
		$(function(){
			$('#form_user_${pageId}').form({
		 		fields:[	        
				{fieldType:'fieldLabel',property:'renwbh'},
				{fieldType:'fieldLabel',property:'cangkbh'},
				{fieldType:'fieldLabel',property:'zickbh'},
				{fieldType:'fieldLabel',property:'mian'},
				{fieldType:'fieldLabel',property:'kaisl',width:100}, 
				{fieldType:'fieldLabel',property:'jiesl',width:100}, 
				{fieldType:'fieldLabel',property:'kaisc',width:100}, 
				{fieldType:'fieldLabel',property:'jiesc',width:100}, 
				{fieldType:'fieldLabel',property:'shengckcsj'},
				{fieldType:'fieldLabelInput',property:'xianskkw'},
				{fieldType:'fieldLabelInput',property:'ancpx'}
		 		]
		 	});
			
			$('#grid_user_${pageId}').grid({
				keyFields:['cangkdz','ush'],
				id:'grid_user_${pageId}',
				src:'<%=request.getContextPath()%>/kunei/20703.do',
				cols:[
				{property:'kuwbh',caption:'${i18n.cangkdz}'},
		  		{property:'ush',caption:'${i18n.ush}'},
		  		{property:'lingjbh',caption:'${i18n.lingjbh}'},
		  		{property:'lingjsl',caption:'${i18n.lingjsl}'},
		  		{property:'danw',caption:'${i18n.lingjdw}'},
		  		{property:'ucgs',caption:'${i18n.ucgs}'},
		  		{property:'ruksq',caption:'${i18n.rukrq}'},
		  		{property:'gongysdm',caption:'${i18n.gongysdm}'},
		  		{property:'zhuangtxx',caption:'${i18n.kunzt}',internation:true}
			],
		 	buttons:[
			//打印
			{name:'print',caption:'${i18n.print}[F8]',keyboard:'F8',action:function(){
				//获取参数
				var params = $('#form_user_${pageId}').form('getFormParam')
				params.push("list[0].renwbh="+$('#renwbh span').html())
				//调用打印服务
				var url = "<%=request.getContextPath()%>/kunei/20704.do";
		 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
		 			 if (showPromptRequestMsg(results)==true){
		 				//打印成功
					 }
				});
				return false;
			}}
			//重新加载
			,{name:'back',caption:'${i18n.back}[F11]'}
			//返回
			,{name:'return',caption:'${i18n.return}[F12]'}
			]});
			
			//页面加载后，查询数据为界面赋值
			$(document).ready(function(){
				//加载返回数据
				if ('${result}' != ''){
					var result = JSON.parse('${result}');
					$('#renwbh span').html(result.result.parameter.renwbh);
					$('#usercenter span').html(result.result.parameter.usercenter);
					$('#cangkbh span').html(result.result.parameter.cangkbh);
					$('#zickbh span').html(result.result.parameter.zickbh);
					$('#mian span').html(result.result.parameter.mian);
					$('#kaisl span').html(result.result.parameter.kaisl);
					$('#jiesl span').html(result.result.parameter.jiesl);
					$('#kaisc span').html(result.result.parameter.kaisc);
					$('#jiesc span').html(result.result.parameter.jiesc);
					$('#shengckcsj span').html(result.result.parameter.shengckcsj);
					$('#xianskkw span').html(result.result.parameter.xianskkw);
					$("#xianskkw input").val(result.result.parameter.xianskkw);
					$('#ancpx span').html($.sdcui.resource.i18n[result.result.parameter.ancpxxx]);
					$('#ancpx input').val(result.result.parameter.ancpx);
					//加载返回数据
					$('#grid_user_${pageId}').grid('parseResult',result.result);
					if (result.result.parameter.list.length > 0){
						$('#grid_user_${pageId}').grid('focus');
					}
				}
				//设置分页条件
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
							<td>${i18n.renwbh}:</td>
							<td><div class="ui-field" id="renwbh"></div></td>
							<td>${i18n.cangk}:</td>
							<td><div class="ui-field" id="cangkbh"></div></td>
							<td>${i18n.zick}:</td>
							<td><div class="ui-field" id="zickbh"></div></td>
						</tr>
						<tr>
							<td>${i18n.mian}:</td>
							<td><div class="ui-field" id="mian"></div></td>
							<td>${i18n.lie}:</td>
							<td><div class="ui-field" id="kaisl"style="float:left"></div><div style="float:left">${i18n.zhi}</div><div class="ui-field" id="jiesl"></div></td>
							<td>${i18n.ceng}:</td>
							<td><div class="ui-field" id="kaisc"style="float:left"></div><div style="float:left">${i18n.zhi}</div><div class="ui-field" id="jiesc"></div></td>
						</tr>
						<tr>
							<td>${i18n.shengckcsj}:</td>
							<td><div class="ui-field" id="shengckcsj"></div></td>
							<td>${i18n.xianskkw}:</td>
							<td><div class="ui-field" id="xianskkw"></div></td>
							<td>${i18n.paixyxj}:</td>
							<td><div class="ui-field" id="ancpx"></div></td>
						</tr>
					</tbody>
				</table> 
			</div>
			<br/>
			<div id="grid_user_${pageId}"></div>
			<br/>
          <div id='prompt'>${i18n.prompt}</div>
		</div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>