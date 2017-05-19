<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","220");%>
<%long currTime = new java.util.Date().getTime();%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_220}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
		$(function(){
			$('#form_user_${pageId}').form({
		 		fields:[
				{fieldType:'fieldLabel',property:'cangkbh',caption:'${i18n.cangkbh}',value:st_Cangkbh}, 	
				{fieldType:'fieldText',biaos:'enter',property:'ush',dataType:'ush',caption:'${i18n.biaoqh}',notNull:true},
				{fieldType:'fieldLabel',property:'lingjbh',caption:'${i18n.lingjbh}'},
				{fieldType:'fieldText',property:'kehbh',caption:'${i18n.keh}',dataType:'letter_numeric',limitedLength:'5',limitedLength2:'9',notNull:true},
				{fieldType:'fieldLabel',property:'lilkcsl',caption:'${i18n.lingjsl}'},
				{fieldType:'fieldLabel',property:'lingjsl',caption:'${i18n.tuicxsl}'}
		 		]
		 	});

			$('#grid_user_${pageId}').grid({
				keyFields:['lingjxlh','shiftcx'],
				id:'grid_user_${pageId}',
				enableCutPage:false,
				showCheckbox:true,
				src:'<%=request.getContextPath()%>/kunei/22002.do',
				showCheckboxRenderer:function(record,tdValue,rowIndex,colIndex){
				var checked = '';
				if(record.shiftcx == "Y") {
					checked = 'checked="checked"';
				} 
				return '<input id=\"' + (rowIndex +'_box') + '\" type="checkbox" ' + checked + ' onclick="save(this)"></input>';
				},
				cols:[
				{property:'lingjxlh',caption:'${i18n.lingjxlh}'},
		  		{property:'shiftcx',caption:'${i18n.shiftcx}'}
			    ],
		 	buttons:[
		 	//确认
			{name:'submit',caption:'${i18n.ok}[F3]',keyboard:'F3',action:function(){
			    //验证参数
                if(!$('#form_user_${pageId}').form("validateParam")){
                    return;
                }
			 		//提交数据
					var params = $('#form_user_${pageId}').form("getFormParam");
			 		var url = "<%=request.getContextPath()%>/kunei/22004.do";
			 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 			if (showPromptRequestMsg(results)==true){
							//提交成功后 重新刷新当前页面
							$('#form_user_${pageId}').form('resetFields');
							$('#grid_user_${pageId}').grid('clearRecords');
							$('#ush input').attr('disabled',false);
							$('#cangkbh span').html(st_Cangkbh);
							
						 }
			 		});
			}}	
			//单选
			,{name:'checked',caption:'${i18n.checked}[F4]',keyboard:'F4',action:function(){
				msgClear();
				check();
			}}
			//全选
			,{name:'selectedAll',caption:'${i18n.selectall}[F6]',keyboard:'F6',action:function(){
				msgClear();
				checkall();
				
			}}
			
			
			//重新加载
			,{name:'back',caption:'${i18n.back}[F11]'}
			//返回
			,{name:'return',caption:'${i18n.return}[F12]'}
			]});
		 	
			//查询零件编号和数量
		 	$('#ush').bind('enter',function(){
		 		//参数校验
		 		if(!$('#ush').fieldText('validate')){
		 			//清理数据
					$('#lingjbh span').html('');
			    	$('#lingjsl input').val('');
		 			return;
		 		}
	 			var params = $('#form_user_${pageId}').form("getFormParam");
	 			params.push("currentPage=1");
	 			var url = "<%=request.getContextPath()%>/kunei/22001.do";
		 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
		 			 if (showPromptRequestMsg(results)==true){
						//赋值
						$('#lingjbh span').html(results.result.parameter.lingjbh);
				    	$('#lingjsl span').html(results.result.parameter.lingjsl);
				    	$('#lingjxlh span').html(results.result.parameter.lingjxlh);
				    	$('#lilkcsl span').html(results.result.parameter.lilkcsl);
				    	$('#grid_user_${pageId}').grid('parseResult',results);
				    	$('#kehh input').val(results.result.parameter.kehh);
				    	$('#ush input').attr('disabled',true);
				    	$('#grid_user_${pageId}').grid('focus');
				    	var params =[] 
						params.push("ush="+results.result.parameter.ush);
						params.push("currentPage=1");
						$('#grid_user_${pageId}').grid("setQueryParams", params);
					 } else {
						//清理数据
						$('#lingjbh span').html('');
				    	$('#lingjsl input').val('');
					 }
		 		});
		 	});
            $('#btn_check').bind('click',function(){
                             checkall();
						     check();
						     
			});
		 	$(document).keyboardsupport({});
		});
		  function  check(){
	        $('#grid_user_${pageId}').grid('selected');
	        //$('#btn_checked').hide();
		    var params = $('#form_user_${pageId}').form("getFormParam");
		    var lingjxlh=$('#grid_user_${pageId}').grid('getSelected').find('.lingjxlh').html();
		    var shiftcx=$('#grid_user_${pageId}').grid('getSelected').find('.shiftcx').html();
		    var num=parseInt($('#grid_user_${pageId}').grid('getSelected').find('.num').html())-1;
		    params.push("lingjxlh="+lingjxlh);  
		    params.push("shiftcx="+shiftcx);  
		    if(null == lingjxlh || null==shiftcx){
		       showPromptMsg('red','${i18n.selecterror}');
		       return false;
		    }
			 var url = "<%=request.getContextPath()%>/kunei/22003.do";
		         $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			           if (showPromptRequestMsg(results)==true){
			               $('#lingjsl span').html(results.result.parameter.lingjsl);
				       	   $('#lingjxlh span').html(results.result.parameter.lingjxlh);
				       	   $($('#grid_user_${pageId}').find('.num')[num]).parent().find('.shiftcx').html(results.result.parameter.flag);
	                        /* var tds =$('#grid_user_${pageId}').find('.num');
							var td = null;
							if(tds.length){
								for(var i = 0 ; i < tds.length ; i++){
									if($(tds[i]).text() == num){
										td = tds[i];
										break;
									}
								}
							}
							$(td).parent().find('.shiftcx').html(results.result.parameter.flag); */ 
                           }else{
			               	$('#grid_user_${pageId}').grid('selected');
			               }
			               $('#btn_checked').show();
				})
	    		return false;
	    }
	    
	    	function  checkall(){
			var params = $('#form_user_${pageId}').form("getFormParam");
			var records = $('#grid_user_${pageId}').grid('getRecordAll');
			var checked = '';
			
			if(records.length != 0){
				params=params.concat(records);
			
				var url = "<%=request.getContextPath()%>/kunei/22005.do";
				$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
				   if (showPromptRequestMsg(results)==true){
				   			$('#lingjsl span').html(results.result.parameter.lingjsl);
					    	$('#grid_user_${pageId}').grid('parseResult',results);
	 
				   }
				});	

				for(i=0;i<records.length;i++){
				    if(records[i].shiftcx == "Y") {
				         $(checkbox).attr('checked','checked'); 
					    // checked = 'checked="checked"';
				     }
				} 
			  }
			  	//$('#grid_user_${pageId}').grid('selected');
			  	//$('#grid_user_${pageId}').grid('focus');
			 //records[0].focus(); 
			}
	    
	   function save(checkbox){
	    	if ($(checkbox).attr('checked') != '') {
	    		$(checkbox).removeAttr('checked'); 
	    	} else {
	    		$(checkbox).attr('checked','checked'); 
	    	}
	    	
	    }
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
							<td>${i18n.tuicxsl}:</td>
							<td><div class="ui-field" id="lingjsl"></div></td>
							<td>${i18n.lingjsl}:</td>
							<td><div class="ui-field" id="lilkcsl"></div></td>
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