<%@ page language="java" pageEncoding="UTF-8"%>
<%request.setAttribute("pageId","347");%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_347}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
			$(function(){
				$('#grid_user_${pageId}').grid({
					keyFields:['uch','baozxh','shifsl','zickbh','kuwbh','lingjsl'],
					id:'grid_user_${pageId}',
					src:'<%=request.getContextPath()%>/beihuo/34703.do',
					showCheckbox:true,
					cols:[
						{property:'uch',caption:'${i18n.uch}'},
						{property:'baozxh',caption:'${i18n.baozxh}',editor:'fieldText',dataType:'letter_numeric',limitedLength:'5',notNull:true},
						{property:'shifsl',caption:'${i18n.shissl}',editor:'fieldText',dataType:'dbnumber',notNull:true,onenter:'validateDate()',biaos:'enter'},
						{property:'danw',caption:'${i18n.lingjdw}'},
						{property:'lingjbh',caption:'${i18n.lingjbh}'},
				  		{property:'gongysdm',caption:'${i18n.gongys}'},
				  		{property:'zickbh',caption:'${i18n.zick}',editor:'fieldText',dataType:'letter_numeric',limitedLength:'3'},
				  		{property:'kuwbh',caption:'${i18n.kuw}',editor:'fieldText',dataType:'letter_numeric',limitedLength:'6'}
					],
					buttons:[
						//F3确认
				   	 	{name:'add',caption:'${i18n.add}[F3]',keyboard:'F3',action:function(){
			                
				   	 	//验证Grid的输入格式
					 		if (!$('#grid_user_${pageId}').grid("validate")){
					 			return;
					 		}
						    var params = $('#form_user_${pageId}').form("getFormParam");
						    var record = $('#grid_user_${pageId}').grid('getSelectedAll');
						    if(record.length < 1){
							       showPromptMsg('red','${i18n.selectoneerror}')
							       return false;
							       }
						    params=params.concat(record);
			                params.push('beihybh=${userName}');
			                params.push('cangkbh=' + st_Cangkbh);
			                params.push("currentPage=1");
			                var url="<%=request.getContextPath()%>/beihuo/34701.do";
			                $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			                	$('#grid_user_${pageId}').grid('clearRecords');  
			                	if(showPromptRequestMsg(results)){
			                        //刷新列表数据
			                        $('#grid_user_${pageId}').grid('parseResult',results);
			                       }
			                 });	
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
						//结束录入F4
						,{name:'jieslr',caption:'${i18n.jieslr}[F8]',keyboard:'F8',action:function(){
							//验证备货单号是否改变
					 		if(checkBeihdhChange()){
					 			return;
					 		}
                            var records = $('#grid_user_${pageId}').grid('getRecordAll');
                            if(records.length > 1){
                            	   if(confirm($.sdcui.resource.i18n['P347_099'])){
                            	   
                                     }else{
                                     return false;
                                     }
                            }
					 		var beihdh = $('#beihdh input').val();
					 		var params = [];
					 		params.push('beihdh=' + beihdh);
					 		params.push('cangkbh=' + st_Cangkbh);
                            var url="<%=request.getContextPath()%>/beihuo/34702.do";
                            $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
                            	if(showPromptRequestMsg(results)){
                                    $('#form_user_${pageId}').form('clearValue');
                                    $('#grid_user_${pageId}').grid('clearRecords');                                    
                                   // $('#xg_beihdh').val('');
                                }
                            });
						}},
						//重新加载
                        {name:'back',caption:'${i18n.back}[F11]'},
                        //F12返回
                        {name:'return',caption:'${i18n.return}[F12]'}
					]				
				});
				
			 	$('#form_user_${pageId}').form({
			 		onreload:true,
			 		url:'<%=request.getContextPath()%>/beihuo/34701.do',
			 		fields:[
							{fieldType:'fieldText',biaos:'enter',property:'beihdh',notNull:true,caption:'${i18n.beihdh}',dataType:'beihdh'},
							{fieldType:'fieldLabel',property:'ckandzick',caption:'${i18n.cangkh}'},
							{fieldType:'fieldLabel',property:'keh',caption:'${i18n.keh}'}
			 		]
			 	});
			 	
	               //备货单查询
                $('#beihdh').bind('enter',function(){
                    //参数校验 
                    if(!$('#beihdh').fieldText('validate')){
                        $('#grid_user_${pageId}').grid('clearRecords');
                        return;
                    }
                    var params = [];
                    var beihdh = $('#beihdh input').val();
                    params.push('beihdh=' + beihdh);
                    params.push('cangkbh=' + st_Cangkbh);
                    params.push('beihybh=${userName}');
                    params.push('currentPage=1');
                    //设置分页条件
				    $('#grid_user_${pageId}').grid("setQueryParams", params);
                    $('#grid_user_${pageId}').grid("load",params,function(results){
                        if(showPromptRequestMsg(results)){
                            $('#xg_beihdh').val(beihdh);
                            $('#ckandzick span').html(results.result.parameter.ckandzick);
                            $('#keh span').html(results.result.parameter.keh)
                        }
                    });
                });
			 	
			 	$(document).keyboardsupport({});
			 	
			});
	        
			
			//验证备货单号是否改变
			function checkBeihdhChange(){
				var newValue = $('#beihdh input').val();
				var oldValue = $('#xg_beihdh').val()
				if (oldValue !='' && newValue != oldValue){
					showPromptMsg('red',$.sdcui.resource.i18n['C_F_BEIHDHYGB']);
					$('#grid_user_${pageId}').grid('clearRecords');
					return true;
				}else{
					return false;
				}
			}
			//验证实发数量
			function validateDate(){
				
				var srcTr = $(document).find(".ed");

				var lingjsl = srcTr[0].id.split(',')[5]
				var  shifsl= $(srcTr).find('.shifsl input').val();
				if (shifsl == "" || parseFloat(shifsl)>parseFloat(lingjsl)){
					$($(srcTr).find('.shifsl input')).addClass('validate-error');
					showPromptMsg('red','${i18n.errshsl}');
					return false;
				}
				return true;
			}
		</script>
	</head>
	<body>
		<div style="padding:20px;">
			<div id="title"></div>
			<form id="putform" method="post" name="putform" >
			<input id="xg_beihdh" name="xg_beihdh" type="Hidden"></input>
			</form>
			<div id="form_user_${pageId}" class="ui-fieldLayout">
			 	<table class="ui-grid" cellspacing="1" width="100%">
					<tbody>
						<tr>
							<td>${i18n.beihdh}:</td>
							<td><div class="ui-field" id="beihdh"></div></td>
							<td>${i18n.cangkh}</td>
							<td><div class="ui-field" id="ckandzick"></div></td>
							<td>${i18n.keh}</td>
							<td><div class="ui-field" id="keh"></div></td> 
						</tr>
					</tbody>
				</table> 
			</div>
			<br></br>
			<div id="grid_user_${pageId}"></div>
			<br></br>
			<div id='prompt'>${i18n.prompt}</div> 
		</div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>