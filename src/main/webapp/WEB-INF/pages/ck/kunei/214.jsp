<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","214");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_214}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
		$(function(){
			$('#form_user_${pageId}').form({
				onemoredemand:true,
				onreload:true,
		 		fields:[
		 		{fieldType:'fieldLabelInput',property:'cangkbh',value:st_Cangkbh},
				{fieldType:'fieldText',property:'renwbh',dataType:'jiufdh',caption:'${i18n.renwbh}',notNull:false},
				{fieldType:'fieldSelect',property:'kuczt',caption:'${i18n.zhuangt}',notNull:false,internation:true,src:'<%=request.getContextPath()%>/common/shengczt.do'}, 	
				{fieldType:'fieldText',property:'shengckcsj',dataType:'date',maskOptions:{mask:'9999-99-99'},caption:'${i18n.shengckcsj}',notNull:false},
				{fieldType:'fieldText',property:'creator',maxLength:'16',caption:'${i18n.creator}',notNull:false},
				{fieldType:'fieldSelect',property:'daoclx',caption:'${i18n.daoclx}',value:'Text',realValue:'0',notNull:true,src:'<%=request.getContextPath()%>/common/daoclx.do'}
		 		]
		 	});

			$('#grid_user_${pageId}').grid({
				keyFields:['renwbh','cangkbh','pandfs','zhuangt'],
				id:'grid_user_${pageId}',
				showCheckbox:false,
				src:'<%=request.getContextPath()%>/kunei/20701.do',
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
				$('#btn_export').show();
	    		return false;
			}}
			,{name:'export',caption:'${i18n.export}[F8]',keyboard:'F8',action:function(){
				//参数校验
		 		if(!$('#form_user_${pageId}').form("validateParam")){
		 			$('#grid_user_${pageId}').grid('clearRecords');
	 				return;	
		 		}
		 		$('#btn_export').hide();
		 		
				//数据导出
		   	 	var kczt = $("#kuczt input").val();
		   	 	var dclx = $("#daoclx input").val();
		   	 	$("#kuczt input").val($("#kuczt input").attr("realValue"));
		   	 	$("#daoclx input").val($("#daoclx input").attr("realValue"));
				$("#putform").attr("action","<%=request.getContextPath()%>/kunei/20705.do");
			    document.putform.submit();
			    $("#kuczt input").val(kczt);
			    $("#daoclx input").val(dclx);
				return false;
			}}
			//重新加载
			,{name:'back',caption:'${i18n.back}[F11]'}
			//返回
			,{name:'return',caption:'${i18n.return}[F12]'}
			]});
			$('#btn_export').hide();
		 	$(document).keyboardsupport({});
		});
		</script>
	</head>
	<body>
		<div style="padding:20px;">
			<div id="title"></div>
			<form id="putform" method="post" name="putform">
			<div id="form_user_${pageId}" class="ui-fieldLayout">
			 	<table class="ui-grid" cellspacing="1" width="100%">
					<tbody>
						<tr>
							<td>${i18n.cangk}:</td>
							<td><div class="ui-field" id="cangkbh"></div></td>
							<td>${i18n.renwbh}:</td>
							<td><div class="ui-field" id="renwbh"></div></td>
							<td>${i18n.zhuangt}:</td>
							<td><div class="ui-field" id="kuczt"></div></td>
							<td>${i18n.shengckcsj}:</td>
							<td><div class="ui-field" id="shengckcsj"></div></td>		
						</tr>
						<tr>
							<td>${i18n.creator}:</td>
							<td><div class="ui-field" id="creator"></div></td>
							<td>${i18n.daoclx}:</td>
							<td><div class="ui-field" id="daoclx"></div></td>
						</tr>
					</tbody>
				</table>
			</div>
			</form> 
			<br/>
			<div id="grid_user_${pageId}"></div>
			<br/>
          <div id='prompt'>${i18n.prompt}</div>
		</div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>