<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<script src="<%=request.getContextPath()%>/scripts/lib/main.js" type="text/javascript" ></script>
		<script src="<%=request.getContextPath()%>/scripts/lib/tabs.js" type="text/javascript" ></script>
		<script src="<%=request.getContextPath()%>/scripts/lib/field.js" type="text/javascript" ></script>
		<script src="<%=request.getContextPath()%>/scripts/lib/form.js" type="text/javascript" ></script>
		<script src="<%=request.getContextPath()%>/scripts/lib/grid.js" type="text/javascript" ></script>
		<link type="text/css" rel="stylesheet" href="styles/main.css"></link>
		<title>主页</title>
		<script type="">
			<%
				request.setAttribute("pageId","001");
			%>
			var pageId = '001';
			$(function(){
				$('#grid_user_'+pageId).grid({
					src:'demo/grid.data',
					keyFields:['userId'],//主键
					showCheckbox:true,//开启checkbox
					cols:[
			  		 //{property:'userId',caption:'用户ID',width:200},
			  		{property:'userName',caption:'用户名称',editor:'fieldText'},
			  	 	{property:'agency.agencyCaption',caption:'用户机构',editor:'fieldSelect'},
			 	  		//{group:true,caption:'联系方式',cols:[
						{property:'address',caption:'地址'},
						{group:true,caption:'联系电话',cols:[
							{property:'tel',caption:'手机'},
							{property:'phone',caption:'座机'}
						]}
				    //]}
				],
				buttons:[
			   	 	{name:'save',caption:'增加行[F1]',keyboard:'F1',action:function(){
			    		//$('#grid_user').grid('addRow');

						$('#form_user_001').form('submit');
			    		return false;
					}},{name:'delete',caption:'删除[F2]',keyboard:'F2',action:function(){
			    		$('#grid_user').grid('deleteRow');
			    		return false;
					}},{name:'selectedAll',caption:'全选[F3]',keyboard:'F3',action:function(){
			    		$('#grid_user').grid('selectedAll');
			    		return false;
					}},{name:'getSelected',caption:'获取选择[F4]',keyboard:'F4',action:function(){
			    		var record = $('#grid_user').grid('getSelected');
			    		if(record){
			    			alert(record.userId);
			    		}
			    		return false;
					}},{name:'getSelectedAll',caption:'获取全选[F6]',keyboard:'F6',action:function(){
			    		var records = $('#grid_user').grid('getSelectedAll');
			    		if(records){
			    			alert("第一条记录："+records[0].userId);
			    		}
			    		return false;
					}}
				]
				//autofill:true,//自动模拟数据
				/**
				records:{"result":{"total":2,
					"rows":[
						{"agency":{"agencyCaption":"湖北省"},"phone":"02789872265","tel":"13398277655","userId":"8a9a2bf931739517013173c612090006","userName":"user001"},
						{"agency":{"agencyCaption":"湖北省"},"phone":"02789872265","tel":"13398277655","userId":"8a9a2bf931739517013173c612090001","userName":"user002"},
						{"agency":{"agencyCaption":"湖北省"},"phone":"02789872265","tel":"13398277655","userId":"8a9a2bf931739517013173c612090002","userName":"user003"},
						{"agency":{"agencyCaption":"湖北省"},"phone":"02789872265","tel":"13398277655","userId":"8a9a2bf931739517013173c612090003","userName":"user004"},
						{"agency":{"agencyCaption":"湖北省"},"phone":"02789872265","tel":"13398277655","userId":"8a9a2bf931739517013173c612090004","userName":"user005"},
						{"agency":{"agencyCaption":"湖北省"},"phone":"02789872265","tel":"13398277655","userId":"8a9a2bf931739517013173c612090005","userName":"user006"},
						{"agency":{"agencyCaption":"湖北省"},"phone":"02789872265","tel":"13398277655","userId":"8a9a2bf931739517013173c612090006","userName":"user007"},
						{"agency":{"agencyCaption":"湖北省"},"phone":"02789872265","tel":"13398277655","userId":"8a9a2bf931739517013173c612090007","userName":"user008"},
						{"agency":{"agencyCaption":"湖北省"},"phone":"02789872265","tel":"13398277655","userId":"8a9a2bf931739517013173c612090008","userName":"user009"},
						{"agency":{"agencyCaption":"湖北省"},"phone":"02789872265","tel":"13398277655","userId":"8a9a2bf931739517013173c612090009","userName":"user010"}
					
					]}}*/
				}).grid('load');
		
				// 全键盘支持
				$(document).keyboardsupport({});

				$('#form_user_001').form({
					fields:[
						{filedType:'fieldText',property:'username',startWidth:'ABC'},
						{property:'agency.agencyId'}
					]
				});
			});
		</script>
		
		
	</head>
	<body>
		<div style="padding:20px;">
			<div id="form_user_${pageId}">
				<table>
					<tbody>
						<tr>
							<td>用户名</td>
							<td><div class="ui-field" id="username"></div></td>
							
							<td>用户机构</td>
							<td><div class="ui-field" id="agency_agencyId"></div></td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<div id="grid_user_${pageId}"></div>
		</div>
	</body>
</html>