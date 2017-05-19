<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","217");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_217}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
		var sUsh;
		$(function(){
			$('#form_user_${pageId}').form({
				onemoredemand:true,
				onreload:true,
		 		fields:[
				 {fieldType:'fieldSelect',property:'cangkbh',caption:'${i18n.cangkbh}',includeNull:true,notNull:true,src:'<%=request.getContextPath()%>/common/wareHouse.do'},
				 {fieldType:'fieldText',property:'lingjbh',caption:'${i18n.lingjbh}',limitedLength:'10'},
				 {fieldType:'fieldText',property:'biaoqh',caption:'${i18n.yikdh}',dataType:'yikdh'}
		 		]
		 	});

			$('#grid_user_${pageId}').grid({
				keyFields:['cangkbh','zickbh','ush','kuwbh','usxh','ussl','ucxh','ucrl','yiksl','liush','dqykdh','lingjbh','danqkbh','danqkw'],
				id:'grid_user_${pageId}',
				showCheckbox:true,
				src:'<%=request.getContextPath()%>/kunei/21701.do',
				cols:[
		  		{property:'cangkbh',caption:'${i18n.cangkbh}'},
		  		{property:'zickbh',caption:'${i18n.zickh}'},
		  		{property:'dqykdh',caption:'${i18n.yikdh}'},
		  		{property:'ush',caption:'${i18n.beizyush}'},
		  		{property:'lingjbh',caption:'${i18n.lingjbh}'},
		  		{property:'kuwbh',caption:'${i18n.kuwdz}'},
		  		{property:'usxh',caption:'${i18n.usxh}'},
		  		{property:'ussl',caption:'${i18n.ussl}'},
		  		{property:'danqkbh',caption:'${i18n.danqkbh}'},
		  		{property:'danqkw',caption:'${i18n.danqkw}'},
		  		{property:'ucxh',caption:'${i18n.ucxh}'},
		  		{property:'ucrl',caption:'${i18n.ucrl}'},
		  		{property:'yiksl',caption:'${i18n.yiksl}'}
			],
		 	buttons:[
		 	//查询
			{name:'search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
				//参数校验
		 		if(!$('#form_user_${pageId}').form("validateParam")){
		 			$('#grid_user_${pageId}').grid('clearRecords');
	 				return;	
		 		}
				//查询并显示数据
		 		var params = $('#form_user_${pageId}').form("getFormParam");
		 		params.push("currentPage=1");
				//设置分页条件
				$('#grid_user_${pageId}').grid("setQueryParams", params);
				//加载数据
				$('#grid_user_${pageId}').grid("load",params);
	    		return false;
			}},
			//F4单选
			{name:'checked',caption:'${i18n.checked}[F4]',keyboard:'F4',action:function(){
					$('#grid_user_${pageId}').grid('selected');
					msgClear();
					return false;
			}},
			//F5全选
            {name:'selectall',caption:'${i18n.selectall}[F5]',keyboard:'F5',action:function(){
                    $('#grid_user_${pageId}').grid('selectedAll');
                    msgClear();
                    return false;
            }},
            //F6移库确认
			{name:'qued',caption:'${i18n.yikqr}[F6]',keyboard:'F6',action:function(){
				//获取选择行
		 		var params = $('#grid_user_${pageId}').grid('getSelectedAll');
		 		var record = $('#grid_user_${pageId}').grid('getSelectedAll');
		 		
		 		params.push("cangkbh=" + $("#cangkbh input").val() );
		 		params.push("lingjbh=" + $("#lingjbh input").val() );
		 		params.push("biaoqh=" + $("#biaoqh input").val() );
		 				 		
				if(record.length < 1){
			    	showPromptMsg('red','${i18n.selectoneerror}')
					return false;
				}
				// var params = $('#form_user_${pageId}').form("getFormParam");
				
				$.ajax({					    
          			url:"<%=request.getContextPath()%>/kunei/21702.do",
					type:'post', 
					dataType:'json', 
					data:params.join('&'),
					success:function(result){
							//alert( result.result.response);
							//var msg = result.result.parameter.list[0].value;
							
							 if(result.result.response=='C_YKQR_01'){
							         showMsg("${i18n.C_YKQR_01}");
							         return false;
							 }	
							 
							 if(result.result.response=='C_YKQR_02'){
							         showMsg("${i18n.C_YKQR_02}");
							         return false;
							 }	
							 										 
							 if(result.result.parameter.str1=='C_YKQR_03'){
										 	if(confirm($.sdcui.resource.i18n['C_P217_01']) ){
										 		params.push("cangkbh=" + st_Cangkbh);
												$.ajax({
													type:'post',
													url:'<%=request.getContextPath()%>/kunei/21703.do',
													data:params.join('&'),
													dataType:'json', //接受数据格式 
													success:function(results){
													    $('#grid_user_${pageId}').grid('parseResult',results);
														//alert(msg);
													},
													error:function(){
														alert("error");
													}
													});		
											}else{
												    return false;           	
						 		            }
							  }
						$('#grid_user_${pageId}').grid('parseResult',result); 																					
						},
						error:function(){
								return false;
								alert("error");
						}								
					});
				
				
				/*
				 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
					 if (showPromptRequestMsg(results)==true){
						 $('#grid_user_${pageId}').grid('parseResult',results)
					 }
					 });
					 
				*/	 
				}},
             //F7取消
			{name:'qux',caption:'${i18n.yikqx}[F7]',keyboard:'F7',action:function(){
				//获取选择行
				var params = $('#form_user_${pageId}').form("getFormParam");
		 		var records = $('#grid_user_${pageId}').grid('getSelectedAll');
				if(records.length < 1){
					showPromptMsg('red','${i18n.selectoneerror}')
					return false;
				}
				params=params.concat(records);
				params.push("flag="+2);
				var url = "<%=request.getContextPath()%>/kunei/21703.do";
				 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
					 if (showPromptRequestMsg(results)==true){
						 $('#grid_user_${pageId}').grid('parseResult',results)
					 }
					 });
				return false;
				}},
			//重新加载
			{name:'back',caption:'${i18n.back}[F11]'}
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
			<input id="serachKey" name="serachKey" type="Hidden"></input>
			<div id="form_user_${pageId}" class="ui-fieldLayout">
			 	<table class="ui-grid" cellspacing="1" width="100%">
					<tbody>
						<tr>
							<td>${i18n.cangkbh}:</td>
							<td><div class="ui-field" id="cangkbh"></div></td>
							<td>${i18n.yikdh}:</td>
							<td><div class="ui-field" id="biaoqh"></div></td>
							<td>${i18n.lingjbh}:</td>
							<td><div class="ui-field" id="lingjbh"></div></td>
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