<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","124");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_124}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
		$(function(){
			$('#form_user_${pageId}').form({
				onemoredemand:true,
				onreload:true,
		 		fields:[
				{fieldType:'fieldText',property:'qissj',dataType:'date',maskOptions:{mask:'9999-99-99'},caption:'${i18n.daohqssj}',notNull:false},
				{fieldType:'fieldText',property:'zhongzsj',dataType:'date',maskOptions:{mask:'9999-99-99'},caption:'${i18n.daohjzsj}',notNull:false},
				{fieldType:'fieldText',property:'uth',dataType:'uth',caption:'${i18n.uth}',notNull:false},
				{fieldType:'fieldSelect',property:'cangkbh',caption:'${i18n.cangk}',notNull:true,src:'<%=request.getContextPath()%>/common/wareHouse.do'},
				{fieldType:'fieldText',property:'lingjbh',dataType:'letter_numeric',limitedLength:'10',caption:'${i18n.lingjbh}',notNull:false},
				{fieldType:'fieldText',property:'gongysdm',dataType:'letter_numeric',limitedLength:'10',caption:'${i18n.gongysdm}',notNull:false}
		 		]
		 	});
			
			$('#grid_user_${pageId}').grid({
				keyFields:['jiufdh','elh','lingjbh','gongysdm'],
				id:'grid_user_${pageId}',
				showCheckbox:true,
				//翻页查询交易
				src:'<%=request.getContextPath()%>/kunei/12401.do',
				cols:[
				{property:'jiufdh',caption:'${i18n.jiufdh}'},
		  		{property:'elh',caption:'${i18n.elh}'},
		  		{property:'lingjbh',caption:'${i18n.lingjbh}'},
		  		{property:'lingjmc',caption:'${i18n.lingjmc}'},
		  		{property:'gongysdm',caption:'${i18n.gongysdm}'},
		  		{property:'gongysmc',caption:'${i18n.gongysmc}'},
		  		{property:'jiufyy',caption:'${i18n.jiufyy}'},
		  		{property:'shijkcsl',caption:'${i18n.jiuf}${i18n.shul}'},
		  		{property:'chengysdm',caption:'${i18n.chengysdm}'},
		  		{property:'chengysmc',caption:'${i18n.chengysmc}'}
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
				//查看
				,{name:'info',caption:'${i18n.info}[F7]',keyboard:'F7',action:function(){
					//获取选择行
					var params = $('#grid_user_${pageId}').grid('getSelectedAll');
					if(params.length != 4){
						showPromptMsg('red','${i18n.selecterror}')
						return false;
					}
					//去掉List[0];
					for(i=0;i<params.length;i++){
						params[i]=params[i].toString().replace("list[0].","");
					}
					//添加仓库
					params.push("cangkbh="+$('#cangkbh input').attr('realValue'));
					var url = "<%=request.getContextPath()%>/kunei/12201.do";
			 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 			if (showPromptRequestMsg(results)==true){
							//存放查询条件
							var vQuery = $('#grid_user_${pageId}').grid('getQueryParams')
							$('#serachKey').val(vQuery);
							//跳转查看页面
							var strJSON = JSON.stringify(results);
							$('#putvalue').val(strJSON);
							$("#putform").attr("action","<%=request.getContextPath()%>/kunei/12402.do"+st_Params);
				    		document.putform.submit();
						 }
					 });
				}}
				//重新加载
				,{name:'back',caption:'${i18n.back}[F11]'}
			 	//返回
				,{name:'return',caption:'${i18n.return}[F12]'}
			 ]
		 	});

		 	$(document).keyboardsupport({});
		});
		
		//加载时判断是否是回退
		$(document).ready(function(){
			if ( $('#serachKey').val()!=""){
				//为界面查询字段赋值
				var params = $('#serachKey').val().split(",");
				for(i=0;i<params.length;i++){
					var vParam = params[i].split("=");
					if (vParam[0].indexOf("qissj") != -1){                   //到货起始时间
						$('#qissj input').val(vParam[1]);
						continue;
					} else if (vParam[0].indexOf("zhongzsj") != -1){         //到货截止时间
						$('#zhongzsj input').val(vParam[1]);
						continue;
					} else if (vParam[0].indexOf("uth") != -1){            	 //UT号
						$('#uth input').val(vParam[1]);
						continue;
					} else if (vParam[0].indexOf("cangkbh") != -1){       	 //仓库
						$('#cangkbh input').val(vParam[1]);
						$('#cangkbh input').attr('realValue',vParam[1]);
						continue;
					} else if (vParam[0].indexOf("lingjbh") != -1){          //零件编号
						$('#lingjbh input').val(vParam[1]);
						continue;
					} else if (vParam[0].indexOf("gongysdm") != -1){          //供应商编号
						$('#gongysdm input').val(vParam[1]);
						continue;
					}
				}
				//设置分页条件
				$('#grid_user_${pageId}').grid("setQueryParams", params);
				//加载列表数据
				$('#grid_user_${pageId}').grid("load",params);
			}
		});
		</script>
	</head>
	<body>
		<div style="padding:20px;">
			<div id="title"></div>
			<input id="serachKey" name="serachKey" type="Hidden"></input>
			<form id="putform" method="post" name="putform">
				<input id="putvalue" name="putvalue" type="Hidden"></input>
			</form> 
			<div id="form_user_${pageId}" class="ui-fieldLayout">
	 			<table class="ui-grid" cellspacing="1" width="100%">
					<tbody>
						<tr>
							<td>${i18n.daohqssj}:</td>
							<td><div class="ui-field" id="qissj"></div></td>
							<td>${i18n.daohjzsj}:</td>
							<td><div class="ui-field" id="zhongzsj"></div></td>
							<td>${i18n.uth}:</td>
							<td><div class="ui-field" id="uth"></div></td>
						</tr>
						<tr>
							<td>${i18n.cangk}:</td>
							<td><div class="ui-field" id="cangkbh"></div></td>
							<td>${i18n.lingjbh}:</td>
							<td><div class="ui-field" id="lingjbh"></div></td>
							<td>${i18n.gongysdm}:</td>
							<td><div class="ui-field" id="gongysdm"></div></td>
						</tr>
					</tbody>
				</table> 
			</div>
			<br>
			<div id="grid_user_${pageId}"></div>
			<br/>
          <div id='prompt'>${i18n.prompt}</div>
		</div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>