<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","148");%>
<t:html i18n="i18n.ck">
<head>
	<title>${i18n.title_148 }</title>
	<jsp:include page="../../common/js.jsp" />
	<script type="text/javascript">
		var row = 0;
		var list_1 = [];
		var list_2 = [];
		$(function(){
		//////////////////////表格////////////////////////////////////////////
			$('#grid_user_${pageId}_1').grid({
				keyFields:['ush'],
				enableCutPage:false,
				showCheckbox:true,
				id:'grid_user_${pageId}_1',
				cols:[
			        {property:'ush',caption:'${i18n.yuanush}'}
			      ],
			buttons:[
                  {name:'check',caption:'${i18n.checked}[F2]',keyboard:'F2',action:function(){
					$('#grid_user_${pageId}_1').grid('selected');
		    		return false;
				}}
			  ,{name:'selectall',caption:'${i18n.selectall}[F3]',keyboard:'F3',action:function(){
					$('#grid_user_${pageId}_1').grid('selectedAll');
		    		return false;
				}}
				
	          ,{name:'delete',caption:'${i18n.delete}[F4]',keyboard:'F4',action:function(){
					var records=$('#grid_user_${pageId}_1').grid('getSelectedAll');
					//选中的ush数组
					var ushArr = [];
					for(var i=0;i<records.length;i++){
						ushArr = records[i].split('=');
						var ush = ushArr[1];
						for(var n=0;n<list_1.length;n++){
								if(list_1[n].ush == ush){
									 list_1.splice(n,1)
								  }
						     }
						$('#grid_user_${pageId}_3').grid('deleteRowByValue',ush);
					}
                       $('#grid_user_${pageId}_1').grid('deleteCheckBoxedRow');
                       if(list_1.length==0){
                        $('#form_user_${pageId}_1').form('clearValue');
                       }
		    		return false;
				}}
			]
			});
			
			$('#grid_user_${pageId}_2').grid({
				keyFields:['xuh','xinbzxh'],
				enableCutPage:false,
				showCheckbox:true,
				showNum : true,
				id:'grid_user_${pageId}_2',
				cols:[
			        {property:'xinbzxh',caption:'${i18n.xinbzxh}'}
			         ],
			   buttons:[
                  {name:'checked',caption:'${i18n.checked}[F6]',keyboard:'F6',action:function(){
					$('#grid_user_${pageId}_2').grid('selected');
		    		return false;
				}}
				,{name:'checkall',caption:'${i18n.selectall}[F7]',keyboard:'F7',action:function(){
					$('#grid_user_${pageId}_2').grid('selectedAll');
		    		return false;
				}}
				,{name:'delete1',caption:'${i18n.delete}[F8]',keyboard:'F8',action:function(){
					//获取选中行
					var tabedRows = $('#grid_user_${pageId}_2').find('tr.grid-row:has(input[type=checkbox]:checked)')
					for(var i=0; i<tabedRows.length; i++){
				  		//查找序号
				  		var currNum = parseInt($(tabedRows[i]).find('.num').html());
				  		//获取要更改值的列表的行
				  		var tRows = $('#grid_user_${pageId}_3').find('tr#.grid-row');
				  		for (var j=0; j<tRows.length; j++){
							//获取行编号
							var num = parseInt($(tRows[j]).find('.baozxh').html());
							if (num == currNum){
								//清空值
								$(tRows[j]).find('.baozxh').attr("value",'');
								$(tRows[j]).find('.baozxh').text('');
								$(tRows[j]).find('.xinbzxh').text('');
							}
				  		}
					}
					var records=$('#grid_user_${pageId}_2').grid('getSelectedAll');
					//选中的xuh数组
					var xuhArr = [];
					for(var i=0;i<records.length;i++){
						xuhArr = records[i].split('=');
						var xuh = xuhArr[1];
						for(var n=0;n<list_2.length;n++){
								if(list_2[n].xuh == xuh){
									list_2.splice(n,1)
								}
						}
					}
					$('#grid_user_${pageId}_2').grid("deleteCheckBoxedRow");
		    		return false;
				}}
				,{name:'tij',caption:'${i18n.tij}[F9]',keyboard:'F9',action:function(){
				   //验证Grid的输入格式
			 		if (!$('#grid_user_${pageId}').grid("validate")){
			 			  return;
			 		   }
				   var params= $('#grid_user_${pageId}_3').grid('getRecordAll');
				   if(params.length ==0){
				       return ;
				       }
				   var url = "<%=request.getContextPath()%>/shouhuo/14802.do";
			 		$('#form_user_${pageId}_1').form("submitUrl", params, url, function(results){
			 			if (showPromptRequestMsg(results)==true){
					 		 //加载返回数据
								$('#grid_user_${pageId}_1').grid('clearRecords');
								$('#grid_user_${pageId}_2').grid('clearRecords');
								$('#grid_user_${pageId}_3').grid('clearRecords');
								$('#form_user_${pageId}_1').form('clearValue');
							    $('#form_user_${pageId}_2').form('clearValue');
							    list_1 = [];
	                            list_2 = [];
						   }
                       });
		    		return false;
				}}
				,{name:'back',caption:'${i18n.back}[F11]'}
				,{name:'return',caption:'${i18n.return}[F12]'}
			]});
				
			$('#grid_user_${pageId}_3').grid({
				keyFields:['ush','lingjxlh','baozxh','xinbzxh'],
				enableCutPage:false,
				id:'grid_user_${pageId}',
				cols:[
			        {property:'ush',caption:'${i18n.ush}'},
			        {property:'lingjxlh',caption:'${i18n.lingjxlh}'},
			        {property:'baozxh',caption:'${i18n.baozxuh}',editor:'fieldText',onenter:'changeValue()'},
			        {property:'xinbzxh',caption:'${i18n.xinbzxh}',notNull:'true'}
			]
			});
			
			/////////////////////表单/////////////////////////////////////
		   $('#form_user_${pageId}_1').form({
		        onreload:true,
				fields:[
					{fieldType:'fieldText',property:'ush',dataType:'ush',caption:'${i18n.ush}',notNull:true},
					{fieldType:'fieldLabel',property:'lingjbh'},
					{fieldType:'fieldLabel',property:'pich'},
					{fieldType:'fieldLabel',property:'chanx'}
				]
			});

		  $('#form_user_${pageId}_2').form({
				fields:[
					{fieldType:'fieldText',property:'xinbzxh',dataType:'letter_numeric',limitedLength:'5',caption:'${i18n.xinbzxh}',notNull:true},
					{fieldType:'fieldText',property:'xinbzgs',dataType:'plusinteger',caption:'${i18n.xinbzgs}',notNull:true}
				 ]	
			});
			
			
		///////////////////事件///////////////////////////////////
			
			$('#btn_select').bind('click',function(){
			    msgClear();
				if(!$('#form_user_${pageId}_1').form("validateParam")){
					return;
				}
				var usValue = $('#ush .value').val();
				for(var n=0;n<list_1.length;n++){
				  if(usValue==list_1[n].ush){
				     showPromptMsg('red','${i18n.uscf}');
				  $('#ush .value').val("");
				  return  ;
				  }
				}
				var params=$('#form_user_${pageId}_1').form("getFormParam");
				var url = "<%=request.getContextPath()%>/shouhuo/14801.do";
			 		$('#form_user_${pageId}_1').form("submitUrl", params, url, function(results){
			 			if (showPromptRequestMsg(results)==true){
			 		            //加载返回数据
							     $('#pich span').html(results.result.parameter.pich); 									
								 $('#chanx span').html(results.result.parameter.chanx);
								 $('#lingjbh span').html(results.result.parameter.lingjbh);
								 list_1.push({ush:usValue});
									var records1 = {
											result : {
												total : list_1.length,
												rows : list_1
											}
										};
									$('#grid_user_${pageId}_1').grid("parseRecords",records1);
									for(var i=0;i<results.result.parameter.list.length;i++){
									$('#grid_user_${pageId}_3').grid("addRow",results.result.parameter.list[i]);
									}
						          }
					 });
					return  false; 
			}); 
			
			$('#btn_search').bind('click',function(){
			if(!$('#form_user_${pageId}_2').form("validateParam")){
					return;
				}
		 	var params=$('#form_user_${pageId}_2').form("getFormParam");
		 	var xinbzxh=$('#xinbzxh input').val();
		 	var xinbzgs=$('#xinbzgs input').val();
		 	var url = "<%=request.getContextPath()%>/shouhuo/14803.do";
			$('#form_user_${pageId}_2').form("submitUrl", params, url, function(results){
				 if (showPromptRequestMsg(results)==true){
				    for(var i=0;i<xinbzgs;i++){
				    //取序号
			 	 	var xuhao = 1;
			 	 	if (list_2.length > 0){
			 	 		xuhao = parseInt(list_2[list_2.length - 1].xuh) + 1;
			 	 	    }
 	                 list_2.push({xuh:xuhao,xinbzxh:xinbzxh});
 	                }
 	                 var records2 = {
						result : {
									total : list_2.length,
									rows : list_2
								 }
					  };
	     	        $('#grid_user_${pageId}_2').grid("parseRecords",records2);
     	         	var tRows = $('#grid_user_${pageId}_2').find('tr#.grid-row');
     	         	for(var n=0;n<tRows.length;n++){
     	        		 $(tRows[n]).find(".num").text(list_2[n].xuh)
     	               }
	     	        msgClear();
				 }
	
 	       });
	     	return  false;
	 	  });
		$(document).keyboardsupport({});
       });
	
	function changeValue(){
		var srcTr = $(document).find(".ed");
		var currValue =  $(srcTr).find('.baozxh input').val();
		var records = $('#grid_user_${pageId}_2').grid('getSelectedByRowNum',currValue);
        if (records.length < 1){
		 			showPromptMsg('red','${i18n.selectederror}');
		 			$(srcTr).find('.baozxh input').val('');
					return false;
		 	}
		for(var i=0; i<records.length; i++){
			if (records[i].indexOf('xinbzxh') != -1){
			  	var array=records[i].split('=');
				$(srcTr).find('.xinbzxh').text(array[1]);
				$(srcTr).find('.xinbzxh').attr("value",array[1]);
			}
		}
		//修改tr的ID
		var keyFields = ['ush','lingjxlh','baozxh','xinbzxh'];
		var trId = srcTr.attr('id').split(",");
		for(var j=0;j<keyFields.length;j++){
			var propertiy = keyFields[j];
			var tds = $(srcTr).find('.cell');
			for(var k = 0 ; k < tds.length ; k++){
				if ($(tds[k]).attr("class").indexOf("cell "+propertiy)!=-1){
						trId[j]=$(tds[k]).text()
						break;
				   }
			   }
		   }
		srcTr.attr('id',trId.toString());
	}

</script>
	</head>
	<body> 
		<div style="padding:20px;">
			<div id="title"></div>
			<div id="form_user_${pageId}_1" class="ui-fieldLayout">
				<table class="ui-grid" cellspacing="1" width="100%">
					<tbody>
						<tr>
							<td>${i18n.ush}</td>
							<td><div class="ui-field" id="ush"></div></td>
							<td>${i18n.lingjbh}</td>
							<td ><div class="ui-field" id="lingjbh"></div></td>
							<td></td>
					  </tr>
					  <tr>
							<td>${i18n.pich}</td>
							<td ><div class="ui-field" id="pich"></div></td>
							<td>${i18n.chanx}</td>
							<td ><div class="ui-field" id="chanx"></div></td>
							<td><div><span id="btn_select" class="ui-button">${i18n.tianjybz}[F1]</span></div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div id="yushdiv" class="ui-fieldLayout" style="padding-top: 15px">
			<!-- 原包装列表 -->
			<div id="grid_user_${pageId}_1"></div></div>
			<div id="form_user_${pageId}_2" class="ui-fieldLayout" style="padding-top: 15px">
						<table class="ui-grid" cellspacing="1" width="100%">
							<tbody>
								<tr>
									<td>${i18n.xinbzxh}</td>
									<td><div class="ui-field" id="xinbzxh"></div></td>
									<td>${i18n.xinbzgs}</td>
									<td><div class="ui-field" id="xinbzgs"></div></td>
									<td><div ><span id="btn_search" class="ui-button">${i18n.tianjxbz}[F5]</span></div></td>
								</tr>
							</tbody>
						</table>
					</div>
					<!--新包装零件列表 -->
					<div id="xushdiv" class="ui-fieldLayout" style="padding-top: 15px">
					<div id="grid_user_${pageId}_2"></div>
					</div>
					<!-- 修改后包装列表 -->
					<div id="ljxlhdiv" class="ui-fieldLayout" style="padding-top: 15px" >
					<div id="grid_user_${pageId}_3"></div>
					</div>
		<div id='prompt'>${i18n.prompt}</div>
	  </div>
	  
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>	   	 	