<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","206");%>
<%long currTime = new java.util.Date().getTime();%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_206}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
		$(function(){
			$('#form_user_${pageId}').form({
				url:'<%=request.getContextPath()%>/kunei/20601.do',
				onemoredemand:true,
		 		fields:[
				{fieldType:'fieldLabel',property:'cangkbh',value:st_Cangkbh},
				{fieldType:'fieldHidden',property:'chuangjbs',value:st_Cangkbh+'${userName}<%=currTime%>'},
				{fieldType:'fieldSelect',property:'zickbh',caption:'${i18n.zick}',notNull:false,src:'<%=request.getContextPath()%>/common/childWareHouse.do?cangkbh='+st_Cangkbh},
				{fieldType:'fieldText',property:'lingjbh',dataType:'letter_numeric',limitedLength:'10',caption:'${i18n.lingjbh}',notNull:false}, 
				{fieldType:'fieldText',property:'mian',dataType:'mask',maskLength:'2',caption:'${i18n.mian}',notNull:false}, 	
				{fieldType:'fieldText',property:'kaisl',dataType:'fixnumber',limitedLength:'2',caption:'${i18n.lie}',width:71,notNull:false}, 
				{fieldType:'fieldText',property:'jiesl',dataType:'fixnumber',limitedLength:'2',caption:'${i18n.lie}',width:71,notNull:false}, 
				{fieldType:'fieldText',property:'kaisc',dataType:'letter_numeric',limitedLength:'2',caption:'${i18n.ceng}',width:71,notNull:false}, 
				{fieldType:'fieldText',property:'jiesc',dataType:'letter_numeric',limitedLength:'2',caption:'${i18n.ceng}',width:71,notNull:false}, 
				{fieldType:'fieldText',property:'shengckcsj',dataType:'datetime',maskOptions:{mask:'9999-99-99 99:99:99'},caption:'${i18n.shengckcsj}',notNull:false}, 
				{fieldType:'fieldSelect',property:'xianskkw',caption:'${i18n.xianskkw}',notNull:false,value:'N',realValue:'N',src:'<%=request.getContextPath()%>/common/yesOrNo.do'},		 		        
				{fieldType:'fieldSelect',property:'ancpx',caption:'${i18n.ancpx}',notNull:false,value:'N',realValue:'N',src:'<%=request.getContextPath()%>/common/yesOrNo.do'}
		 		]
		 	});

			$('#grid_user_${pageId}').grid({
				keyFields:['renwbh','zhuangt'],
				id:'grid_user_${pageId}',
				showCheckbox:true,
				//翻页查询交易
				src:'<%=request.getContextPath()%>/kunei/20603.do',
				cols:[
				{property:'renwbh',caption:'${i18n.renwbh}'},
		  		{property:'usercenter',caption:'${i18n.usercenter}'},
		  		{property:'cangkbh',caption:'${i18n.cangk}'},
		  		{property:'pandfsxx',caption:'${i18n.pandfs}',internation:true},
		  		{property:'shengckcsj',caption:'${i18n.shengckcsj}'},
		  		{property:'kucscfsxx',caption:'${i18n.kucscfs}',internation:true},
		  		{property:'zhuangtxx',caption:'${i18n.zhuangt}',internation:true}
			],
			
		 	buttons:[
		 	//创建任务
			{name:'create',caption:'${i18n.create}[F3]',keyboard:'F3',action:function(){
				//参数校验
		 		if(!$('#form_user_${pageId}').form("validateParam")){
	 				return;	
		 		}
		 		//验证开始面必须小于结束面
				if ($("#kaisl input").val()!="" && $("#jiesl input").val()!=""){
					var iKaisl = parseInt($("#kaisl input").val(),10);
					var iJiesl = parseInt($("#jiesl input").val(),10);
					if (iKaisl > iJiesl){
						showPromptMsg('red','${i18n.lie}'+$.sdcui.resource.i18n['C_fanwbf']);
						return;
					}
				}
				//验证开始层必须小于结束层
				if ($("#kaisc input").val()!="" && $("#jiesc input").val()!=""){
					var iKaisc = parseInt($("#kaisc input").val(),10);
					var iJiesc = parseInt($("#jiesc input").val(),10);
					if (iKaisc > iJiesc){
						showPromptMsg('red','${i18n.ceng}'+$.sdcui.resource.i18n['C_fanwbf']);
						return;
					}
				}
				//提交数据
		 		var params = $('#form_user_${pageId}').form("getFormParam");
		 		params.push("currentPage=1");
		 		//设置分页条件
				$('#grid_user_${pageId}').grid("setQueryParams", params);
		 		var records = $('#grid_user_${pageId}').grid('getSelectedAll');
				params = params.concat(records);
				$('#form_user_${pageId}').form('submit',params, function(results){
					 if (showPromptRequestMsg(results)==true){
						//加载返回数据
						$('#grid_user_${pageId}').grid('parseResult',results)
						 if (results.result.parameter.list.length > 0){
							$('#grid_user_${pageId}').grid('focus');
						 }
					 }
		 		});
				return false;
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
				//数据验证
		 		if(!$('#form_user_${pageId}').form("validateParam")){
		 			return;
		 		}
				var records = $('#grid_user_${pageId}').grid('getSelectedAll');
				if(records.length < 1){
					showPromptMsg('red','${i18n.selecterror}')
					return false;
				}
				//打开提示框是否删除
				if(confirm($.sdcui.resource.i18n['C_remove'])){
					//先提交选中行，然后再重新加载
					var params = $('#grid_user_${pageId}').grid('getQueryParams')
					params = params.concat(records);
					var url = "<%=request.getContextPath()%>/kunei/20602.do";
			 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 			 if (showPromptRequestMsg(results)==true){
			 				//加载返回数据
							$('#grid_user_${pageId}').grid('parseResult',results)
						 }
					});
				}
				return false;
			}}
			//打印
			,{name:'print',caption:'${i18n.print}[F8]',keyboard:'F8',action:function(){
				var allRow = $('#grid_user_${pageId}').grid("getRecordAll");
				if (allRow.length < 1){
					return false;
				}
				//调用打印服务
				var params = $('#form_user_${pageId}').form('getFormParam')
				var url = "<%=request.getContextPath()%>/kunei/20604.do";
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
							<td>${i18n.zick}:</td>
							<td><div class="ui-field" id="zickbh"></div></td>
							<td>${i18n.mian}:</td>
							<td><div class="ui-field" id="mian"></div></td>
						</tr>
						<tr>
							<td>${i18n.lie}:</td>
							<td><div class="ui-field" id="kaisl"></div><div style="float:left">${i18n.zhi}</div><div class="ui-field" id="jiesl"></div></td>
							<td>${i18n.ceng}:</td>
							<td><div class="ui-field" id="kaisc"></div><div style="float:left">${i18n.zhi}</div><div class="ui-field" id="jiesc" ></div></td>
							<td>${i18n.lingjbh}:</td>
							<td><div class="ui-field" id="lingjbh"></div></td>
						</tr>
						<tr>
							<td>${i18n.shengckcsj}:</td>
							<td><div class="ui-field" id="shengckcsj"></div></td>
							<td>${i18n.xianskkw}:</td>
							<td><div class="ui-field" id="xianskkw"></div></td>
							<td>${i18n.ancpx}:</td>
							<td><div class="ui-field" id="ancpx"></div>
							<div class="ui-field" id="chuangjbs"></div></td>
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