<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","22302");%>
<t:html i18n="i18n.ck">
	<head>
		<!-- V4_030 12978-->
		<title>${i18n.title_22302}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
		
	var pingzh=[];
	var shengqr=[];
	var shengqbm=[];
	var keh=[];
	
		$(function(){
			$('#form_user_${pageId}').form({
			onreload:true,
			fields:[
					{fieldType:'fieldLabel',property:'pingjh'},
					{fieldType:'fieldLabel',property:'shengqr'},
					{fieldType:'fieldLabel',property:'shengqbm'},
					{fieldType:'fieldLabel',property:'keh'},
					{fieldType:'fieldLabel',property:'lingjbh'},
					{fieldType:'fieldLabel',property:'lingjmc'},
					{fieldType:'fieldLabel',property:'danw'},
					{fieldType:'fieldLabel',property:'ush'},
					{fieldType:'fieldLabel',property:'usxh'},
					{fieldType:'fieldLabel',property:'usrl'},
					{fieldType:'fieldLabel',property:'gongysdm'},
					{fieldType:'fieldLabel',property:'cangkdz'},
					{fieldType:'fieldLabel',property:'lingjsl'},
					{fieldType:'fieldText',property:'tuihsl',dataType:'dbnumber',notNull:true}
				]
		 	});
		 	$('#grid_cjus_${pageId}').grid({
				keyFields:['lingjxlh'],
				id:'grid_cjus_${pageId}',
				showCheckbox:false,
				enableCutPage:false,
				cols:[
		  		{property:'lingjxlh',caption:'${i18n.lingjxlh}'}
			],
			});
			
		 	$('#btn_submit').bind('click',function(){
		 		if(!$('#tuihsl').fieldText('validate')){
		 			return;
		 		}
		 		//获取参数
				var params = $('#form_user_${pageId}').form("getFormParam");
				//存放缓存数据
				$('#serachKey').val(params);
				var params4=[];
				params4.push("pingjh="+pingjh);
				params4.push("shengqr="+shengqr);
				params4.push("shengqbm="+shengqbm);
				params4.push("keh="+keh);
				params=params.concat(params4);
				//页面数据提交并跳转
				var url = "<%=request.getContextPath()%>/kunei/22305.do";
		 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
		 			 if (showPromptRequestMsg(results)==true){
						 	if (results.result.response=="0000" && !results.result.respdesc){
	 			 				history.back();
					 }
					 }});
					 });
				$(document).keyboardsupport({});
		});
		$(document).ready(function(){
			if ('${result}' != ''){
				var result = JSON.parse('${result}');
				$('#lingjbh span').html(result.result.parameter.lingjbh);
				$('#lingjmc span').html(result.result.parameter.lingjmc);
				$('#danw span').html(result.result.parameter.danw);
				$('#ush span').html(result.result.parameter.ush);
				$('#usxh span').html(result.result.parameter.usxh);
				$('#usrl span').html(result.result.parameter.usrl);
				$('#gongysdm span').html(result.result.parameter.gongysdm);
				$('#cangkdz span').html(result.result.parameter.buhgpkuw);
				$('#lingjsl span').html(result.result.parameter.lingjsl);
				
								
				$('#pingjh span').html(result.result.parameter.pingjh);
				$('#shengqr span').html(result.result.parameter.shengqr);
				$('#shengqbm span').html(result.result.parameter.shengqbm);
				$('#keh span').html(result.result.parameter.keh);
				
				$('#grid_cjus_${pageId}').grid('parseResult',result);
				//盘点人获取焦点
				$('#ush input').focus();
				$('#ush input').removeClass("field-tabed");
				$('#tuihsl input').addClass("field-tabed");
			}
		});
		</script>
	</head>
	<body>
		<div style="padding:20px;">
			<div id="title"></div>
			<input id="serachKey" name="serachKey" type="Hidden"></input>
			<form id="putform" method="post" name="putform" >
			<input id="putvalue" name="putvalue" type="Hidden"></input>
			</form> 
			<div id="form_user_${pageId}" class="ui-fieldLayout">
			 	<table class="ui-grid" cellspacing="1" width="100%">
					<tbody>
				 		<tr>
							<td>${i18n.pingjh}:</td>
							<td><div class="ui-field" id="pingjh"></div></td>
							<td>${i18n.shenqr}:</td>
							<td><div class="ui-field" id="shengqr"></div></td>
							<td>${i18n.shenqbm}:</td>
							<td><div class="ui-field" id="shengqbm"></div></td>
							<td>${i18n.keh}:</td>
							<td><div class="ui-field" id="keh"></div></td>
						</tr>
					
					<tr>
						<td>${i18n.lingjbh}:</td>
						<td><div class="ui-field" id="lingjbh"></div>
						</td>
						<td>${i18n.lingjmc}:</td>
						<td><div class="ui-field" id="lingjmc"></div>
						</td>
						<td>${i18n.lingjdw}:</td>
						<td><div class="ui-field" id="danw"></div>
						</td>
					</tr>
						<tr>
							<td>${i18n.ush}:</td>
							<td><div class="ui-field" id="ush"></div></td>
							<td>${i18n.usxh}:</td>
							<td><div class="ui-field" id="usxh"></div></td>
							<td>${i18n.usrl}:</td>
							<td><div class="ui-field" id="usrl"></div></td>
						</tr>	
						<tr>
							<td>${i18n.gongysdm}:</td>
							<td><div class="ui-field" id="gongysdm"></div></td>
							<td>${i18n.cangkdz}:</td>
							<td><div class="ui-field" id="cangkdz"></div></td>
							<td>${i18n.lingjsl}:</td>
							<td><div class="ui-field" id="lingjsl"></div></td>
						</tr>
						<tr>
							<td>${i18n.tuiksl}:</td>
							<td><div class="ui-field" id="tuihsl"></div></td>
						</tr>	
					</tbody>
				</table> 
			</div>
			<br>
			<div id="grid_cjus_${pageId}"></div>
			<br />
			<br>
			<div>
			<table class="ui-grid" cellspacing="1" width="100%">
				<tbody>
					<tr>
						<td><div>
						<span id="btn_submit" class="ui-button">${i18n.qued}[F3]</span>
						<span id="btn_back" class="ui-button">${i18n.back}[F11]</span>
						<span id="btn_return" class="ui-button">${i18n.return}[F12]</span></div><td>
					</tr>
					</tbody>
				</table> 
			</div>
			<br>
			<div id='prompt'>${i18n.prompt}</div> 
		</div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>