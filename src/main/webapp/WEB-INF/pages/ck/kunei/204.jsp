<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","204");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_204}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
		$(function(){
			$('#form_user_${pageId}').form({
				url:'<%=request.getContextPath()%>/kunei/20401.do',
				fields:[
					{fieldType:'fieldSelect',property:'cangkbh',caption:'${i18n.cangk}',notNull:true,value:st_Cangkbh,realValue:st_Cangkbh,src:'<%=request.getContextPath()%>/common/wareHouse.do'},
					{fieldType:'fieldText',property:'pandzq',dataType:'plusinteger',maxLength:'4',caption:'${i18n.pandzq}',notNull:true},
					{fieldType:'fieldText',property:'zhixsj',dataType:'date',maskOptions:{mask:'9999-99-99'},caption:'${i18n.celzxsj}',notNull:true},
					{fieldType:'fieldSelect',property:'lingjlx',caption:'${i18n.lingjlx}',notNull:true,src:'<%=request.getContextPath()%>/common/lingjlx.do'}
				]
		 	});
			
			//F3确认
		 	$('#btn_submit').bind('click',function(){
		 		//参数校验
		 		if(!$('#form_user_${pageId}').form("validateParam")){
	 				return;	
		 		}
		 		//提交数据
		 		var params = $('#form_user_${pageId}').form("getFormParam");
		 		$('#form_user_${pageId}').form('submit',params, function(results){
		 			if (showPromptRequestMsg(results)==true){
			 			//提交成功后 重新刷新当前页面
			 			$('#form_user_${pageId}').form('resetFields');
			 			//重新设置仓库编号
						$('#cangkbh input').val(st_Cangkbh);
						$('#cangkbh input').attr('realValue',st_Cangkbh);
		 			}
		 		});
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
							<td>${i18n.cangk}:</td>
							<td><div class="ui-field" id="cangkbh"></div></td>
							<td>${i18n.pandzq}:</td>
							<td><div class="ui-field" id="pandzq"></div></td>
						</tr>	
						<tr>
							<td>${i18n.celzxsj}:</td>
							<td><div class="ui-field" id="zhixsj"></div></td>
							<td>${i18n.lingjlx}:</td>
							<td><div class="ui-field" id="lingjlx"></div></td>
						</tr>	
					</tbody>
				</table> 
			</div>
			<br>
			<div>
			<table class="ui-grid" cellspacing="1" width="100%">
				<tbody>
					<tr>
						<td><div><span id="btn_submit" class="ui-button">${i18n.qued}[F3]</span>
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