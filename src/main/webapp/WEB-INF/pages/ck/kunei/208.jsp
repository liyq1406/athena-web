<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","208");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_208}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
		$(function(){
			$('#form_user_${pageId}').form({
				onemoredemand:true,
				onreload:true,
		 		fields:[
				{fieldType:'fieldText',property:'renwbh',dataType:'jiufdh',caption:'${i18n.renwbh}',notNull:false},
				{fieldType:'fieldSelect',property:'kuczt',caption:'${i18n.zhuangt}',notNull:false,internation:true,src:'<%=request.getContextPath()%>/common/shengczt.do'}, 	
				{fieldType:'fieldText',property:'shengckcsj',dataType:'date',maskOptions:{mask:'9999-99-99'},caption:'${i18n.shengckcsj}',notNull:false},
				{fieldType:'fieldText',property:'creator',maxLength:'16',caption:'${i18n.creator}',notNull:false}
		 		]
		 	});

			$('#grid_user_${pageId}').grid({
				keyFields:['renwbh','pandfs','zhuangt'],
				id:'grid_user_${pageId}',
				showCheckbox:true,
				src:'<%=request.getContextPath()%>/kunei/20801.do',
				cols:[
				{property:'renwbh',caption:'${i18n.renwbh}'},
		  		{property:'usercenter',caption:'${i18n.usercenter}'},
		  		{property:'cangkbh',caption:'${i18n.cangk}'},
		  		{property:'pandfsxx',caption:'${i18n.pandfs}',internation:true},
		  		{property:'shengckcsj',caption:'${i18n.shengckcsj}'},
		  		{property:'creator',caption:'${i18n.creator}'},
		  		{property:'kucscfsxx',caption:'${i18n.kucscfs}',internation:true},
		  		{property:'zhuangtxx',caption:'${i18n.zhuangt}',internation:true}
			],
		 	buttons:[
		 	//查询
			{name:'search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
				//参数校验
		 		if(!$('#form_user_${pageId}').form("validateParam")){
		 			$('#grid_user_${pageId}').grid('clearRecords');
	 				return;	
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
		 			return false;
		 		}
				var records = $('#grid_user_${pageId}').grid('getSelectedAll');
				if(records.length < 1){
					showPromptMsg('red','${i18n.selecterror}')
					return false;
				}
				//打开提示框是否删除
				if(confirm($.sdcui.resource.i18n['C_remove']) != true){
					return false;
				}
				//先提交选中行，然后再重新加载
				var params = $('#grid_user_${pageId}').grid('getQueryParams')
				params = params.concat(records);
				var url = "<%=request.getContextPath()%>/kunei/20802.do";
		 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
		 			 if (showPromptRequestMsg(results)==true){
						//加载返回数据
						$('#grid_user_${pageId}').grid('parseResult',results)
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
							<td>${i18n.renwbh}:</td>
							<td><div class="ui-field" id="renwbh"></div></td>
							<td>${i18n.zhuangt}:</td>
							<td><div class="ui-field" id="kuczt"></div></td>
							<td>${i18n.shengckcsj}:</td>
							<td><div class="ui-field" id="shengckcsj"></div></td>
							<td>${i18n.creator}:</td>
							<td><div class="ui-field" id="creator"></div></td>
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