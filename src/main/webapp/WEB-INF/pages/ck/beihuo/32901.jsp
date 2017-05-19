<%@ page language="java" pageEncoding="UTF-8"%>
<%request.setAttribute("pageId","32901");%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_32901}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
			//var demorecord = {'result':{'total':1,'rows':[{'shul':20,'lingjbh':123,'ush':'S00000001','gongysmc':345,'shangxbz':678,'shifsl':901,'danw':322,'kuw':012},{'shul':20,'lingjbh':123,'ush':'S00000002','gongysmc':345,'shangxbz':678,'shifsl':901,'danw':322,'kuw':014}]}};
			$(function(){
				$('#grid_user_${pageId}').grid({
					keyFields:['us'],
					id:'grid_user_${pageId}',
					showCheckbox:true,
					//查询交易
					src:'<%=request.getContextPath()%>/beihuo/32903.do',
					cols:[
						{property:'ush',caption:'${i18n.ush}'},
						{property:'lingjsl',caption:'${i18n.shul}'},
						{property:'danw',caption:'${i18n.lingjdw}'},
						{property:'lingjbh',caption:'${i18n.lingjbh}'},
				  		{property:'gongysdm',caption:'${i18n.gongys}'},
				  		{property:'kuwbh',caption:'${i18n.kuw}'},
				  		{property:'elh',caption:'${i18n.elh}'}
					],
					buttons:[
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
						//F6删除
						{name:'delete',caption:'${i18n.delete}[F6]',keyboard:'F6',action:function(){
							var records = $('#grid_user_${pageId}').grid('getSelectedAll');
							if(records.length < 1){
								showPromptMsg('red','${i18n.selectoneerror}')
								return false;
							}
							//打开提示框是否删除
							if(confirm($.sdcui.resource.i18n['C_remove'])){
								//先提交选中行，然后再重新加载
								var params = $('#form_user_${pageId}').form("getFormParam");
								var usList = [];
								for(var i=0;i<records.length;i++){
									var us = records[i].split('=');
									usList.push('\''+us[1]+'\'');
								}
								params.push("usList="+ usList.join(','));
								params.push("currentPage=1");
	                            var url="<%=request.getContextPath()%>/beihuo/32904.do";
	                            $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
	                            	if (showPromptRequestMsg(results)){
	                            		$('#grid_user_${pageId}').grid('parseResult',results);
                                    }
	                            });
							}
							return false;
						}},
						//F8打印
						{name:'print',caption:'${i18n.print}[F8]',keyboard:'F8',action:function(){
							//参数校验
					 		if(!$('#form_user_${pageId}').form("validateParam")){
					 			return;
					 		}
					 		var params = $('#form_user_${pageId}').form("getFormParam");
					 	    var url="<%=request.getContextPath()%>/beihuo/32905.do";
					 		$('#form_user_${pageId}').form('submitUrl',params,url,function(results){
					 			if (showPromptRequestMsg(results)){
					 			  $('#grid_user_${pageId}').grid('clearRecords');
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
			 		fields:[
							{fieldType:'fieldLabel',property:'cangkbh',value:st_Cangkbh},
							{fieldType:'fieldLabel',property:'jiesckbh',value:'${result.result.parameter.jiesckbh}'},
							{fieldType:'fieldLabel',property:'caozy',value:'${result.result.parameter.caozy}'},
							{fieldType:'fieldLabel',property:'caozsj',value:'${result.result.parameter.caozsj}'},
							{fieldType:'fieldHidden',property:'beihdh',value:'${result.result.parameter.beihdh}'}
			 		]
			 	});
			 	
			 	var searchParams = $('#form_user_${pageId}').form("getFormParam");
				  $('#grid_user_${pageId}').grid("setQueryParams", searchParams); 
    			$(document).ready(function(){
    				//加载GRID
    				$('#grid_user_${pageId}').grid('parseResult',${result})
    			})
              
			 	$(document).keyboardsupport({});
			});
			
		</script>
	</head>
	<body>
		<div style="padding:20px;">
			<div id="title"></div>
			<form id="putform" method="post" name="putform" >
			<input id="putvalue" name="putvalue" type="Hidden"></input>
			</form>
			<div id="form_user_${pageId}" class="ui-fieldLayout">
			 	<table class="ui-grid" cellspacing="1" width="100%">
					<tbody>
						<tr>
							<td>${i18n.cangkbh}:</td>
							<td><div class="ui-field" id="cangkbh"></div></td>
							<td>${i18n.jiesck}:</td>
							<td><div class="ui-field" id="jiesckbh"></div></td>
							<td><div class="ui-field" id="beihdh"></div></td>
						</tr>
						<tr>
							<td>${i18n.caozy}:</td>
							<td><div class="ui-field" id="caozy"></div></td>
							<td>${i18n.caozsj}:</td>
							<td><div class="ui-field" id="caozsj"></div></td>
							<td></td>
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