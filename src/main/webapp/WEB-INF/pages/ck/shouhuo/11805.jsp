<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","11805");%>
<t:html i18n="i18n.ck">
<head>
	<title>${i18n.title_11805}</title>
	<jsp:include page="../../common/js.jsp" />
	<script type="text/javascript">
	$(document).ready(function(){
		//通过ajax请求获取打印数据
		var params = [];
		params.push("usercenter=abc");
		params.push("uth=Tb00000127");
		var url = "<%=request.getContextPath()%>/shouhuo/11805.do"
		ajaxRequest(params, url, function(results){
			$("#uth").html(results.result.uth);
			$("#chengysdm").html(results.result.chengysdm);
			if (results.result.listbzxx.length>0){
				for(var i=0; i<results.result.listbzxx.length; i++){
					var params = [];
					params.push("<td>"+ results.result.listbzxx[i].yaohlh +"</td>")
					params.push("<td>"+ results.result.listbzxx[i].uaxh +"</td>")
					params.push("<td>"+ results.result.listbzxx[i].uarl +"</td>")
					params.push("<td>"+ results.result.listbzxx[i].lingjsl +"</td>")
					params.push("<td>"+ results.result.listbzxx[i].yanssl +"</td>")
					params.push("<td>"+ results.result.listbzxx[i].liushbegin +"</td>")
					params.push("<td>"+ results.result.listbzxx[i].liushend +"</td>")
					var newTr = $("#bzxx").clone(true);
					newTr.attr("id",newTr.attr("id")+i.toString())
					newTr.html(params.toString());
					$("#bzxx").parent().append(newTr);
				}
			}
			if (results.result.listljhzxx.length>0){
				for(var i=0; i<results.result.listljhzxx.length; i++){
					var params = [];
					params.push("<td>"+ results.result.listljhzxx[i].lingjbh +"</td>")
					params.push("<td>"+ results.result.listljhzxx[i].lingjmc +"</td>")
					params.push("<td>"+ results.result.listljhzxx[i].yanssl +"</td>")
					var newTr = $("#ljhzxx").clone(true);
					newTr.attr("id",newTr.attr("id")+i.toString())
					newTr.html(params.toString());
					$("#ljhzxx").parent().append(newTr);
				}
			}
			if (results.result.listcyxx.length>0){
				for(var i=0; i<results.result.listcyxx.length; i++){
					var params = [];
					params.push("<td>"+ results.result.listcyxx[i].yaohlh +"</td>")
					params.push("<td>"+ results.result.listcyxx[i].liush +"</td>")
					params.push("<td>"+ results.result.listcyxx[i].lingjmc +"</td>")
					params.push("<td>"+ results.result.listcyxx[i].lingjsl +"</td>")
					params.push("<td>"+ results.result.listcyxx[i].yanssl +"</td>")
					var newTr = $("#cyxx").clone(true);
					newTr.attr("id",newTr.attr("id")+i.toString())
					newTr.html(params.toString());
					$("#cyxx").parent().append(newTr);
				}
			}
		});
	});
	</script>
</head>
	<body>
		<div style="padding:20px;">
			<div id="title"></div>
			<table class="ui-grid" cellspacing="1" width="100%">
				<tbody >
					<tr>
						<td>验收单号：</td>
						<td id="uth"></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>承运商：</td>
						<td id="chengysdm"></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</tbody>
			</table>
			<br>
			<!-- 包装信息 -->
			<div>包装信息：</div>
			<table class="ui-grid" cellspacing="1" width="100%">
				<tbody >
					<tr>
						<td>包装单元卡号</td>
						<td>UA型号</td>
						<td>UA容量</td>
						<td>零件数量</td>
						<td>实际验收数量</td>
						<td>流水号起始</td>
						<td>流水号结束</td>
					</tr>
					<tr id="bzxx">
					</tr>
				</tbody>
			</table>
			<br>
			<!-- 零件汇总信息 -->
			<div>零件汇总信息：</div>
			<table class="ui-grid" cellspacing="1" width="100%">
				<tbody >
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>零件号</td>
						<td>零件名称</td>
						<td>验收数量</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr id="ljhzxx">
					</tr>
				</tbody>
			</table>
			<br>
			<!-- 差异信息 -->
			<div>差异信息：</div>
			<table class="ui-grid" cellspacing="1" width="100%">
				<tbody >
					<tr>
						<td>包装单元卡号</td>
						<td>流水号</td>
						<td>零件名称</td>
						<td>零件数量</td>
						<td>实际验收数量</td>
						<td></td>
						<td></td>
					</tr>
					<tr id="cyxx">
					</tr>
				</tbody>
			</table>
		</div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>