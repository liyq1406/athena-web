<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","205");%>

<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_205}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
		$(function(){
			$('#form_user_${pageId}').form({
				onemoredemand:true,
				onreload:true,
		 		fields:[
						{fieldType:'fieldSelect',property:'cangkbh',caption:'${i18n.cangk}',notNull:true,value:st_Cangkbh,realValue:st_Cangkbh,src:'<%=request.getContextPath()%>/common/wareHouse.do'},
						{fieldType:'fieldText',property:'celbh',dataType:'letter_numeric',limitedLength:'4',caption:'${i18n.celbh}'},
						{fieldType:'fieldText',property:'qissj',dataType:'date',maskOptions:{mask:'9999-99-99'},caption:'${i18n.create_time}',width:80},
						{fieldType:'fieldText',property:'zhongzsj',dataType:'date',maskOptions:{mask:'9999-99-99'},caption:'${i18n.create_time}',width:80}
		 		]
		 	});
			
			$('#grid_user_${pageId}').grid({
				keyFields:['celbh'],
				id:'grid_user_${pageId}',
				showCheckbox:true,
				//查询交易
				src:'<%=request.getContextPath()%>/kunei/20501.do',
				cols:[
				{property:'celbh',caption:'${i18n.celbh}'},
		  		{property:'cangkbh',caption:'${i18n.cangk}'},
		  		{property:'pandzq',caption:'${i18n.pandzq}'},
		  		{property:'zhixsj',caption:'${i18n.celzxsj}'},
		  		{property:'lingjlx',caption:'${i18n.lingjlx}',align:'center',width:30},
			],
		 	buttons:[
		 	//查询
			{name:'search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
				 //参数校验
		 		if(!$('#form_user_${pageId}').form("validateParam")){
		 			$('#grid_user_${pageId}').grid('clearRecords');
	 				return;	
		 		}
		 		//验证开始日期必须小于结束日期
				if ($("#qissj input").val()!="" && $("#zhongzsj input").val()!=""){
					var sKssj = $("#qissj input").val().split("-");
					var sJssj = $("#zhongzsj input").val().split("-");
					var dKssj = new Date(sKssj[0],sKssj[1],sKssj[2]);
					var dJssj = new Date(sJssj[0],sJssj[1],sJssj[2]);
					if(dKssj > dJssj){
						$('#grid_user_${pageId}').grid('clearRecords');
						showPromptMsg('red','${i18n.create_time}'+$.sdcui.resource.i18n['C_fanwbf'])
						return;
					}
				}
	 			//查询数据
		 		var params = $('#form_user_${pageId}').form("getFormParam");
		 		params.push("currentPage=1");
		 		//设置分页条件
				$('#grid_user_${pageId}').grid("setQueryParams", params);
		 		//加载数据
				$('#grid_user_${pageId}').grid("load",params);
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
					//获取查询条件
					var params = $('#grid_user_${pageId}').grid('getQueryParams')
					params = params.concat(records);
					var url = "<%=request.getContextPath()%>/kunei/20502.do";
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
							<td>${i18n.celbh}:</td>
							<td><div class="ui-field" id="celbh"></div></td>
							<td>${i18n.create_time}:</td>
							<td><div style="float:left" class="ui-field" id="qissj"></div><div style="float:left">${i18n.zhi}</div><div style="float:left" class="ui-field" id="zhongzsj"></div></td>
							<td></td>
							<td></td>
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