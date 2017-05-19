<%@ page language="java" pageEncoding="UTF-8"%>
<%request.setAttribute("pageId","101");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>101 到货申报</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
			var pageId = '${pageId}';
			$(function(){
				$('#grid_user_'+pageId).grid({
					keyFields:['uth','blh','chengysmc','tch'],  //与后台打交道的数据
					id:'grid_user_${pageId}',
					showCheckbox:true,
					checkedOnlyOne:true,
					src:'<%=request.getContextPath()%>/demo/grid.data',  //表格的数据来源
					editSubmitSrc:'<%=request.getContextPath()%>/shouhuo/10102.do',   //行编辑提交的地址
				//	src:'<%=request.getContextPath()%>/shouhuo/10101.do',
					cols:[
						{property:'uth',caption:'UT号',editor:'fieldText'},
						{property:'blh',caption:'BL号'},
						{property:'xiehzt',caption:'卸货点'},
				        {property:'chengysmc',caption:'承运商',editor:'fieldText'},
				        {property:'tch',caption:'集装箱号/车牌号',editor:'fieldText',notNull:true},
						{property:'chengysmc',caption:'承运商'},
					//	{property:'tch',caption:'集装箱号/车牌号'},
				],
				buttons:[
			   	 	{name:'select',caption:'查询[F1]',keyboard:'F1',action:function(){
				   	 		var params = $('#form_user_'+pageId).form("getFormParam");
							$('#grid_user_'+pageId).grid("load",params);
				    		return false;
					}}
			   	 	,{name:'selectedAll',caption:'全选[F3]',keyboard:'F3',action:function(){
				   	 		$('#grid_user_'+pageId).grid('selectedAll');
				    		return false;
					}}
					,{name:'getSelected',caption:'选中[F4]',keyboard:'F4',action:function(){
							$('#grid_user_'+pageId).grid('selected');
				    		return false;
					}}
					,{name:'daydhd',caption:'打印到货单[F6]',keyboard:'F6',action:function(){
							var params = $('#form_user_'+pageId).form("getFormParam");
							var records = $('#grid_user_'+pageId).grid('getSelectedAll');
							var postParams = [];
							params = params.concat(records);
							$.ajax({
								 url:"<%=request.getContextPath()%>/shouhuo/myTest.do",
								 data:params.join('&'),
								 type:"POST",
								 dataType : 'json',
								 contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
								 success:function(results){
								 }
							 });
				    		return false;
					}}
				]
				});
				
				
				$('#form_user_${pageId}').form({
					fields:[
						{fieldType:'fieldText',property:'blh',},
						{fieldType:'fieldText',property:'tch'},
						{fieldType:'fieldSelect',property:'guzyy',src:'<%=request.getContextPath()%>/demo/list.data'},
						{fieldType:'fieldSelect',property:'guzyg',src:'<%=request.getContextPath()%>/demo/list.data'}
					]
				});
				$(document).keyboardsupport({});
			});
		</script>
		
		
	</head>
	<body>
		<div style="padding:20px;">
			<div id="form_user_${pageId}" class="ui-fieldLayout">
				<table class="ui-grid" cellspacing="1" width="100%">
					<tbody>
						<tr>
							<td>BL号</td>
							<td><div class="ui-field" id="blh"></div></td>
						</tr>
						<tr>
							<td>集装箱号/车牌号</td>
							<td><div class="ui-field" id="tch"></div></td>
						</tr>
						<tr>
							<td>下拉框测试1</td>
							<td><div class="ui-field" id="guzyy"></div></td>
						</tr>
						<tr>
							<td>下拉框测试2</td>
							<td><div class="ui-field" id="guzyg"></div></td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<br></br>
			<div id="grid_user_${pageId}"></div>
		</div>
		<div id='prompt'>${i18n.prompt}</div>
		
	</body>
</html>