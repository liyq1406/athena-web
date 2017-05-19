<%@ page language="java" pageEncoding="UTF-8"%>
<%request.setAttribute("pageId","314");%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_314}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
			$(function(){
			 	$('#form_user_${pageId}').form({
			 		onemoredemand:true,
			 		onreload:true,
			 		fields:[
							{fieldType:'fieldText',property:'beihdh',dataType:'beihdh'},
							{fieldType:'fieldText',property:'yaohlh',dataType:'yaohlh'}
			 		]
			 	});
			 	
			 	//F1查询
			 	$('#btn_search').bind('click',function(){
                    if ($('#beihdh input').val() && $('#yaohlh input').val()){
                        showPromptMsg('red',$.sdcui.resource.i18n['C_F_ONEBYH']);
                        return;
                    }
			 		if(!$('#form_user_${pageId}').form("validateParam")){
			 			return;
			 		}
			 		var params = $('#form_user_${pageId}').form("getFormParam");
			 		params.push('beihybh=${userName}');
			 		params.push('currentPage=1');
			 		//修改备货单需设置备货单状态，查看不需要
			 		params.push('beihdbs=0');
                    var url="<%=request.getContextPath()%>/beihuo/31401.do";
                    $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
                        if (showPromptRequestMsg(results)){
                            if (results.result.response == "0001"){
                               //加载返回数据
                               var strJSON=JSON.stringify(results);
                               $('#beihlx').val(results.result.parameter.beihlx);
                               $('#putvalue').val(strJSON);
                               $("#putform").attr("action","<%=request.getContextPath()%>/beihuo/P31401.do"+st_Params+'&'+"flag="+"314");
                               document.putform.submit();
                            }
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
			<form id="putform" method="post" name="putform" >
				<input id="beihlx" name="beihlx" type="Hidden"></input>
				<input id="putvalue" name="putvalue" type="Hidden"></input>
			</form>
			<div id="form_user_${pageId}" class="ui-fieldLayout">
			 	<table class="ui-grid" cellspacing="1" width="100%">
					<tbody>
						<tr>
							<td>${i18n.beihdh}:</td>
							<td><div class="ui-field" id="beihdh"></div></td>
							<td>${i18n.yaohlh}:</td>
							<td><div class="ui-field" id="yaohlh"></div></td>
							<td><div align="right"><span id="btn_search" class="ui-button">${i18n.search}[F1]</span>
							<span id="btn_back" class="ui-button">${i18n.back}[F11]</span>
							<span id="btn_return" class="ui-button">${i18n.return}[F12]</span></div></td>
						</tr>
					</tbody>
				</table> 
			</div>
			<br></br>
			<div id='prompt'>${i18n.prompt}</div> 
		</div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>