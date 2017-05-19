<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","163");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_163}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
		$(function(){
			$('#form_user_${pageId}').form({
		 		fields:[
                     {fieldType:'fieldText',property:'blh',dataType:'text',maxLength:'10',caption:'${i18n.blh}'}
		 		]
		 	});
			
			$('#grid_user_${pageId}').grid({
				keyFields:['uth','uah','jzsl','dpcadw'],
				id:'grid_user_${pageId}',
				showCheckbox:true,
				//翻页查询交易
				src:'<%=request.getContextPath()%>/shouhuo/16301.do',
				cols:[
				{property:'uth',caption:'${i18n.uth}'},
		  		{property:'blh',caption:'${i18n.blh}'},
		  		{property:'elh',caption:'${i18n.elh}'},
		  		{property:'uah',caption:'${i18n.uah}'},
		  		{property:'lingjbh',caption:'${i18n.lingjbh}'},
		  		{property:'lingjmc',caption:'${i18n.lingjmc}'},
		  		{property:'danw',caption:'${i18n.gongysljdw}'},
		  		{property:'dpcadw',caption:'${i18n.dpcaljdw}'},
		  		{property:'lingjsl',caption:'${i18n.lingjsl}'},
		  		{property:'jzsl',caption:'${i18n.jiuzsl}',dataType:'dbnumber',editor:'fieldText'}

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
					,{name:'checked',caption:'${i18n.checked}[F4]',keyboard:'F4',action:function(){
						$('#grid_user_${pageId}').grid('selected');
			    		return false;
					}}
			   	 	,{name:'selectall',caption:'${i18n.selectall}[F5]',keyboard:'F5',action:function(){
			   	 		$('#grid_user_${pageId}').grid('selectedAll');
			    		return false;
					}}
					,{name:'save',caption:'${i18n.save}[F7]',keyboard:'F7',action:function(){
					    var delflag = 0; //确定保存
						var params = $('#form_user_${pageId}').form("getFormParam");
						var  records = $('#grid_user_${pageId}').grid('getSelectedAll');
						if(records.length == 0){
							$('#prompt span').css('color','red').text("${i18n.selectoneerror}");
							return false;
						}
						params = params.concat(records);
						var jzlist = $('#grid_user_${pageId}').grid('getSelectedColumnValue','jzsl');
						for(var i=0;i<jzlist.length;i++){
							if('' == jzlist[i]){
							    delflag =1;
							  }
							}
							if(delflag){
							 //打开提示框是否删除
	                            if(confirm($.sdcui.resource.i18n['C_jus'])){
	                                var url = "<%=request.getContextPath()%>/shouhuo/16302.do";
							       	$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
								  	 if (showPromptRequestMsg(results)==true){
								       		$('#grid_user_${pageId}').grid('parseResult',results);
								     	 }
							        });
	                             }
	
							}else{
							       var url = "<%=request.getContextPath()%>/shouhuo/16302.do";
							       	$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
								  	 if (showPromptRequestMsg(results)==true){
								       		$('#grid_user_${pageId}').grid('parseResult',results);
								     	 }
							        });
							
							}
						return false;
					}}
				　,{name:'back',caption:'${i18n.back}[F11]'}
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
							<td>${i18n.blh}:</td>
							<td><div class="ui-field" id="blh"></div></td>
						</tr>
					</tbody>
				</table> 
			</div>
			<div id="grid_user_${pageId}"></div>
          <div id='prompt'>${i18n.prompt}</div>
		</div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>