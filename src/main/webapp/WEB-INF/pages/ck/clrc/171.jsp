<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","17101");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_171}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
			$(function(){
				$('#grid_user_${pageId}').grid({
					keyFields:['huoch'],
					id:'grid_user_${pageId}',
					showCheckbox:false,
					src:'<%=request.getContextPath()%>/clrc/17101.do',
					cols:[
					    {property:'huoch',caption:'${i18n.kch}'},
						{property:'uth',caption:'${i18n.uth}'},
						{property:'blh',caption:'${i18n.blh}'},
						{property:'xiehzt',caption:'${i18n.xiehzt}'},
				        {property:'chengysmc',caption:'${i18n.chengysmc}'},
				        //0011365
				        {property:'cangkbh',caption:'${i18n.cangkbh}'}			        
				   ],
				buttons:[
			   	 	{name:'search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
			   	 	   $('#grid_user_${pageId}').grid('clearRecords');
				   	 	
				   	 	if(!$('#form_user_${pageId}').form("validateParam")){
				     		return;
				     	}
				     	
					    var params = $('#form_user_${pageId}').form("getFormParam");
			   	 		params.push("currentPage=1");
						//设置分页条件
						$('#grid_user_${pageId}').grid("setQueryParams", params);
						//加载数据
						$('#grid_user_${pageId}').grid("load",params);
			    		return false;
					}}
					,{name:'daydhd',caption:'${i18n.daydhd}[F8]',keyboard:'F8',action:function(){
						var params = $('#form_user_${pageId}').form("getFormParam");
						
						if(""==$('#cangkbh input').val()){
						 	showMsg("仓库编号不能为空！");
							return false;
						}
						
						/*
						var params = $('#grid_user_${pageId}').grid('getSelectedAll');
						if(params.length > 1 || params.length == 0){
							$('#prompt span').css('color','red').text("${i18n.selecterror}");
							return false;
						}
						*/

						var url = "<%=request.getContextPath()%>/clrc/17102.do";
						$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
							  if (showPromptRequestMsg(results)==true){
							       $('#grid_user_${pageId}').grid('parseResult',results);
							      }
						 });
			    		return false;
					}}
				　,{name:'back',caption:'${i18n.back}[F11]'}
		          ,{name:'return',caption:'${i18n.return}[F12]'}
				]
				});
				
				//V4_039 卡车号限长输入8位 如 HBA12345  
				$('#form_user_${pageId}').form({
					onemoredemand:true,
					onreload:true,
					fields:[
						{fieldType:'fieldText',property:'huoch',dataType:'text',notNull:true,maxLength:'8',caption:'${i18n.kch}'},
						{fieldType:'fieldSelect',property:'cangkbh',caption:'${i18n.cangkbh}',includeNull:true,src:'<%=request.getContextPath()%>/common/wareHouse.do'}
				    ]
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
							<td>${i18n.kch}</td>
							<td><div class="ui-field" id="huoch"></div></td>
							
						    <td>${i18n.cangkbh}:</td>
							<td><div class="ui-field" id="cangkbh"></div></td>
							

						</tr>
					</tbody>
				</table>
			</div>
			<div id="grid_user_${pageId}"></div>
		   <div id='prompt'>${i18n.prompt}</div>
		 </div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>