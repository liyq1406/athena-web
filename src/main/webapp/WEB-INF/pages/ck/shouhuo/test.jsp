<%@ page language="java" pageEncoding="UTF-8"%>
<%request.setAttribute("pageId","1");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>交易测试页面</title>
		<script src="<%=request.getContextPath()%>/scripts/lib/main.js" type="text/javascript" ></script>
		<script src="<%=request.getContextPath()%>/scripts/lib/tabs.js" type="text/javascript" ></script>
		<script src="<%=request.getContextPath()%>/scripts/lib/field.js" type="text/javascript" ></script>
		<script src="<%=request.getContextPath()%>/scripts/lib/form.js" type="text/javascript" ></script>
		<script src="<%=request.getContextPath()%>/scripts/lib/grid.js" type="text/javascript" ></script>
		<script src="<%=request.getContextPath()%>/scripts/lib/keyboardsupport.js" type="text/javascript" ></script>
		<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/styles/main.css"></link>
		
		<script type="text/javascript">
			$(function(){
				$(document).bind('keydown','F2',function(){
					var param = $("#param").val();
					var transcode = $("#transcode").val();
					var data = param + "&transcode=" +transcode;
					$.ajax({
						 url:"<%=request.getContextPath()%>/shouhuo/transTest.do",
						 data:data,
						 type:"POST",
						 dataType : 'json',
						 contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
						 success:function(results){
						 }
					 });
			 	});
			});
		</script>
		
		
	</head>
	<body>
		<div style="padding:20px;">
				<table>
					<tbody>
						<tr>
							<td>参数类似于<span style="color: red;font-weight: bolder;">uth=1&list[0]=uah:11#bzxh:b00001#ljsl:30&list[1]=uah:22#bzxh:b00001#ljsl:30</span></td>
							<td>
								<textarea id="param" rows="5" cols="70"></textarea>
							</td>
						</tr>
						<tr>
							<td>交易码</td>
							<td><input id="transcode" type="text"></input></td>
						</tr>
					</tbody>
				</table>
				<div style="padding:20px;text-align: left">
				<span id="btn_submit" class="ui-button">提交[F2]</span>
			</div>
		</div>
	</body>
</html>