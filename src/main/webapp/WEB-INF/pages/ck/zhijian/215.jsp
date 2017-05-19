<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","215");%>
<%long currTime = new java.util.Date().getTime();%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_215}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
		var sUsh;
		$(function(){
			$('#form_user_${pageId}').form({
				url:'<%=request.getContextPath()%>/zhijian/21502.do',
				onemoredemand:true,
		 		fields:[
				{fieldType:'fieldHidden',property:'chuangjbs',value:st_Cangkbh+'${userName}<%=currTime%>'},
				{fieldType:'fieldLabel',property:'cangkbh',caption:'${i18n.cangkbh}',value:st_Cangkbh}, 	
				{fieldType:'fieldText',biaos:'enter',property:'ush',dataType:'ush',caption:'${i18n.biaoqh}',notNull:true},
				{fieldType:'fieldLabel',property:'lingjbh',caption:'${i18n.lingjbh}'},
				{fieldType:'fieldText',property:'kehbh',caption:'${i18n.keh}',dataType:'letter_numeric',limitedLength:'5',limitedLength2:'9',notNull:false},
				{fieldType:'fieldText',property:'lingjsl',caption:'${i18n.shul}',dataType:'dbnumber',notNull:false}
		 		]
		 	});

			$('#grid_user_${pageId}').grid({
				keyFields:['liush','ush'],
				id:'grid_user_${pageId}',
				showCheckbox:true,
				src:'<%=request.getContextPath()%>/zhijian/21504.do',
				cols:[
				{property:'ush',caption:'${i18n.biaoqh}'},
		  		{property:'lingjbh',caption:'${i18n.lingjbh}'},
		  		{property:'lingjmc',caption:'${i18n.lingjmc}'},
		  		{property:'cangkbh',caption:'${i18n.cangkbh}'},
		  		{property:'kehbh',caption:'${i18n.keh}'},
		  		{property:'lingjsl',caption:'${i18n.shul}'},
		  		{property:'zhuangtxx',caption:'${i18n.zhuangt}',internation:true},
		  		{property:'caozsj',caption:'${i18n.caozsj}'},
		  		{property:'caozy',caption:'${i18n.caozr}'}
			],
		 	buttons:[
		 	//保存
			{name:'save',caption:'${i18n.save}[F2]',keyboard:'F2',action:function(){
				if(sUsh){
					//回复值
					$('#ush input').val(sUsh);
					//验证客户
			 		if(!$('#kehbh').fieldText('validateNotNull')){
			 			return;
			 		}
			 		//验证客户
			 		if(!$('#lingjsl').fieldText('validateNotNull')){
			 			return;
			 		}
					//参数校验
			 		if(!$('#form_user_${pageId}').form("validateParam")){
		 				return;	
			 		}
			 		//查询并显示数据
			 		var params = $('#form_user_${pageId}').form("getFormParam");
					$('#form_user_${pageId}').form("submit", params, function(results){
						 if (showPromptRequestMsg(results)==true){
						 	//设置分页条件,使用之前的页码
							$('#grid_user_${pageId}').grid("setQueryParamsDefaultPage", params);
							//为界面赋值
							$('#grid_user_${pageId}').grid('parseResult',results);
							if (results.result.parameter.list.length > 0){
								$('#grid_user_${pageId}').grid('focus');
							}
							//清除界面值
							$('#ush input').val('');
							$('#lingjbh span').html('');
							$('#kehbh input').val('');
							$('#lingjsl input').val('');
							sUsh = undefined ;
							return false;
						}
					});
				}
			}}
		 	//确认
			,{name:'submit',caption:'${i18n.ok}[F3]',keyboard:'F3',action:function(){
				//回复值
				$('#ush input').val(sUsh);
				//判断选择行
		 		var records = $('#grid_user_${pageId}').grid('getRecordAll');
		 		if (records < 1){
		 			showPromptMsg('red','${i18n.selecterror}')
					return false;
		 		}
		 		//打开提示框是否提交
				if(confirm($.sdcui.resource.i18n['C_submit'])){
			 		//提交数据
					var params = $('#form_user_${pageId}').form("getFormParam");
			 		params = params.concat(records);
			 		var url = "<%=request.getContextPath()%>/zhijian/21505.do";
			 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 			if (showPromptRequestMsg(results)==true){
							//提交成功后 重新刷新当前页面
							$('#form_user_${pageId}').form('resetFields');
							$('#grid_user_${pageId}').grid('clearRecords');
							//重新设置创建标识
							$('#cangkbh span').html(st_Cangkbh);
							$('#chuangjbs input').val(st_Cangkbh+'${userName}<%=currTime%>');
							sUsh = undefined;
						 }
			 		});
				}
			}}	
			//单选
			,{name:'getSelected',caption:'${i18n.checked}[F4]',keyboard:'F4',action:function(){
				msgClear();
				$('#grid_user_${pageId}').grid('selected');
				return false;
			}}
			//全选
			,{name:'selectedAll',caption:'${i18n.selectall}[F5]',keyboard:'F5',action:function(){
				msgClear();
				$('#grid_user_${pageId}').grid('selectedAll');
				return false;
			}}
			//删除
			,{name:'delete',caption:'${i18n.delete}[F6]',keyboard:'F6',action:function(){
				$('#ush input').val(sUsh);
				//判断选择行
				var records = $('#grid_user_${pageId}').grid('getSelectedAll');
				if(records.length < 1){
					showPromptMsg('red','${i18n.selecterror}')
					return false;
				}
				//打开提示框是否删除
				if(confirm($.sdcui.resource.i18n['C_remove'])){
					//获取查询条件
					var params = $('#grid_user_${pageId}').grid('getQueryParams')
					params = params.concat(records);
			 		var url = "<%=request.getContextPath()%>/zhijian/21503.do";
			 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 			if (showPromptRequestMsg(results)==true){
							//加载返回数据
							$('#grid_user_${pageId}').grid('parseResult',results)
						}
			 		});
				}
				return false;
			}}
			//重新加载
			,{name:'back',caption:'${i18n.back}[F11]'}
			//返回
			,{name:'return',caption:'${i18n.return}[F12]'}
			]});
		 	
			//查询零件编号和数量
		 	$('#ush').bind('enter',function(){
		 		//参数校验
		 		if(!$('#form_user_${pageId}').form("validateParam")){
		 			//清理数据
					$('#lingjbh span').html('');
			    	$('#lingjsl input').val('');
			    	sUsh = undefined;
		 			return;
		 		}
	 			var params = $('#form_user_${pageId}').form("getFormParam");
	 			var url = "<%=request.getContextPath()%>/zhijian/21501.do";
		 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
		 			 if (showPromptRequestMsg(results)==true){
						//赋值
						$('#lingjbh span').html(results.result.parameter.lingjbh);
				    	$('#lingjsl input').val(results.result.parameter.lingjsl);
				    	sUsh = results.result.parameter.ush;
					 } else {
						//清理数据
						$('#lingjbh span').html('');
				    	$('#lingjsl input').val('');
				    	sUsh = undefined;
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
							<td>${i18n.cangkbh}:</td>
							<td><div class="ui-field" id="cangkbh"></div></td>
							<td>${i18n.biaoqh}:</td>
							<td><div class="ui-field" id="ush"></div></td>
							<td>${i18n.lingjbh}:</td>
							<td><div class="ui-field" id="lingjbh"></div></td>
						</tr>
						<tr>
							<td>${i18n.keh}(${i18n.xianb}):</td>
							<td><div class="ui-field" id="kehbh"></div></td>
							<td>${i18n.shul}:</td>
							<td><div class="ui-field" id="lingjsl"></div></td>
							<td></td>
							<td><div class="ui-field" id="chuangjbs"></div></td>
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