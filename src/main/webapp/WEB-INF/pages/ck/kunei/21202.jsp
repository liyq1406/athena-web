<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","21202");%>
<t:html i18n="i18n.ck">
<head>
<title>${i18n.title_21202}</title>
<jsp:include page="../../common/js.jsp" />
<script type="text/javascript">
		$(function(){
			$('#form_user_${pageId}').form({
				fields:[
						{fieldType:'fieldHidden',property:'cangkbh'},
						{fieldType:'fieldHidden',property:'renwbh'},
						{fieldType:'fieldHidden',property:'pandfs'},
						{fieldType:'fieldLabel',property:'lingjbh'},
						{fieldType:'fieldLabel',property:'lingjmc'},
						{fieldType:'fieldLabel',property:'danw'},
						{fieldType:'fieldLabel',property:'ush'},
						{fieldType:'fieldLabel',property:'usxh'},
						{fieldType:'fieldLabel',property:'ucrl'},
						{fieldType:'fieldLabel',property:'gongysdm'},
						{fieldType:'fieldLabel',property:'kuwbh'},
						{fieldType:'fieldLabelInput',property:'baozzt'},
						{fieldType:'fieldLabel',property:'yuanussl'},
						{fieldType:'fieldText',property:'lingjsl',dataType:'dbnumber',caption:'${i18n.shijussl}',notNull:true},
						{fieldType:'fieldLabel',property:'yuanucgs'},
						{fieldType:'fieldText',property:'ucgs',dataType:'integer',maxLength:'5',caption:'${i18n.shijucgs}',notNull:true},
						{fieldType:'fieldText',property:'pandr',maxLength:'16',caption:'${i18n.pandr}',notNull:true}
					]
			 	});
			//提交
		 	$('#btn_submit').bind('click',function(){
		 		//参数校验
		 		if(!$('#form_user_${pageId}').form("validateParam")){
	 				return;	
		 		}
		 		var params = $('#form_user_${pageId}').form("getFormParam");
		 		//1、滚动盘点，2、静态盘点
                if ($('#pandfs input').val()=="1"){
                	var url = "<%=request.getContextPath()%>/kunei/21105.do";
    		 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
    		 			 if (showPromptRequestMsg(results)==true){
    		 			 	if (results.result.response=="0000" && !results.result.respdesc){
	    		 			 	//操作成功--返回
	 			 				history.back();
    		 			 	}
						 }
    				});
                }else{
                	var url = "<%=request.getContextPath()%>/kunei/21204.do";
    		 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
    		 			 if (showPromptRequestMsg(results)==true){
    		 				if (results.result.response=="0000" && !results.result.respdesc){
	    		 			 	//操作成功--返回
	 			 				history.back();
    		 			 	}
						 }
    				});
                }
		 	}); 

			$(document).keyboardsupport({});
		});

		//页面加载后，查询数据为界面赋值
		$(document).ready(function(){
			//加载返回数据
			if ('${result}' != ''){
				var result = JSON.parse('${result}');
				$('#cangkbh input').val(result.result.parameter.cangkbh);
				$('#renwbh input').val(result.result.parameter.renwbh);
				$('#pandfs input').val(result.result.parameter.pandfs);
				$('#lingjbh span').html(result.result.parameter.lingjbh);
				$('#lingjmc span').html(result.result.parameter.lingjmc);
				$('#danw span').html(result.result.parameter.danw);
				$('#ush span').html(result.result.parameter.ush);
				$('#usxh span').html(result.result.parameter.usxh);
				$('#ucrl span').html(result.result.parameter.ucrl);
				$('#gongysdm span').html(result.result.parameter.gongysdm);
				$('#kuwbh span').html(result.result.parameter.kuwbh);
				$('#baozzt span').html($.sdcui.resource.i18n[result.result.parameter.baozztxx]);
				$('#baozzt input').val(result.result.parameter.baozzt);
				$('#yuanussl span').html(result.result.parameter.lingjsl);
				$('#yuanucgs span').html(result.result.parameter.ucgs);
				$('#pandr input').val(result.result.parameter.pandr)
				//显示错误消息
				showPromptRequestMsg(result.result);
			}
		});
		</script>
</head>
<body>
	<div style="padding: 20px;">
		<div id="title"></div>
		<div id="form_user_${pageId}" class="ui-fieldLayout">
			<table class="ui-grid" cellspacing="1" width="100%">
				<tbody>
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
					<tr>
						<td>${i18n.ush}:</td>
						<td><div class="ui-field" id="ush"></div>
						</td>
						<td>${i18n.usxh}:</td>
						<td><div class="ui-field" id="usxh"></div>
						</td>
						<td>${i18n.uchl}:</td>
						<td><div class="ui-field" id="ucrl"></div>
						</td>
					</tr>
					<tr>
						<td>${i18n.gongysdm}:</td>
						<td><div class="ui-field" id="gongysdm"></div>
						</td>
						<td>${i18n.cangkdz}:</td>
						<td><div class="ui-field" id="kuwbh"></div>
						</td>
						<td>${i18n.zhuangt}:</td>
						<td><div class="ui-field" id="baozzt"></div>
							<div class="ui-field" id="cangkbh"></div>
							<div class="ui-field" id="pandfs"></div>
							<div class="ui-field" id="renwbh"></div>
						</td>
					</tr>
				</tbody>
			</table>
			<br>
			<table class="ui-grid" cellspacing="1" width="100%">
				<tbody>
					<tr>
						<td>${i18n.yuanussl}:</td>
						<td><div class="ui-field" id="yuanussl"></div>
						</td>
						<td>${i18n.shijussl}:</td>
						<td><div class="ui-field" id="lingjsl"></div>
						</td>
					</tr>
					<tr>
						<td>${i18n.yuanucgs}:</td>
						<td><div class="ui-field" id="yuanucgs"></div>
						</td>
						<td>${i18n.shijucgs}:</td>
						<td><div class="ui-field" id="ucgs"></div>
						</td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td>${i18n.pandr}:</td>
						<td><div class="ui-field" id="pandr"></div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<br>
		<div>
			<table class="ui-grid" cellspacing="1" width="100%">
				<tbody>
					<tr>
						<td><div>
								<span id="btn_submit" class="ui-button">${i18n.qued}[F3]</span>
								<span id="btn_back" class="ui-button">${i18n.back}[F11]</span>
								<span id="btn_return" class="ui-button">${i18n.return}[F12]</span>
							</div>
						<td>
					</tr>
				</tbody>
			</table>
		</div>
		<br>
		<div id='prompt'>${i18n.prompt}</div>
	</div>
</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>