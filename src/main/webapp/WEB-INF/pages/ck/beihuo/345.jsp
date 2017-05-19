<%@ page language="java" pageEncoding="UTF-8"%>
<%request.setAttribute("pageId","345");%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_345}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
			$(function(){
				$('#grid_user_${pageId}').grid({
					keyFields:['xiaohd'],
					id:'grid_user_${pageId}',
					//查询交易
					src:'<%=request.getContextPath()%>/beihuo/34501.do',
					showCheckbox:true,
					cols:[
						{property:'shengbdh',caption:'${i18n.yicsbdh}'},
						{property:'lingjbh',caption:'${i18n.lingjh}'},
						{property:'lingjmc',caption:'${i18n.lingjmc}'},
				  		{property:'gongysdm',caption:'${i18n.gongys}'},
				  		{property:'shenbsl',caption:'${i18n.shenbsl}'},
				  		{property:'danw',caption:'${i18n.lingjdw}'},
				  		{property:'shengbr',caption:'${i18n.shenbrxm}'}
					],
					//records:{'result':{'total':2,'rows':[{'yicsbdh':'0000000','lingjh':123,'shenbrxm':234,'gongys':345,'lingjmc':12345,'shenbsl':901,'lingjdw':322,'yuanbzdj':'N'},{'yicsbdh':'0000001','lingjh':123,'shenbrxm':234,'gongys':345,'lingjmc':12345,'shenbsl':901,'lingjdw':322,'yuanbzdj':'N'}]}},
					buttons:[
                        //F1查询
                        {name:'search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
                        	search();
                        }},
                        //F2新建
				   	 	{name:'create',caption:'${i18n.create}[F2]',keyboard:'F2',action:function(){
	                        var records = $('#grid_user_${pageId}').grid('getSelectedAll');
                            if(records.length == 0){
                                showMsg("${i18n.selectoneerror}");
                                return false;
                            }
			 		       var xiaohdList = [];
                           for(var i=0;i<records.length;i++){
                                var  xiaohd = records[i].split('=');
                                xiaohdList.push('\''+ xiaohd[1]+'\'');
                             }
                            var params = $('#grid_user_${pageId}').grid('getQueryParams');
                            params.push('xiaohdList=' + xiaohdList.join(','));
 			 		     if(''==$('#gongysdm input').val()){
                            $('#form_user_${pageId}').form('submit',params,function(results){
                            	if(showPromptRequestMsg(results)){
				   	 		        $('#grid_user_${pageId}').grid('parseResult',results);
                            	}
	                        });
 			 		     }else{
						     var param=[];
							 param.push("gongysdm="+$('#gongysdm input').val());
							 var url = "<%=request.getContextPath()%>/shouhuo/10309.do";
							 $('#form_user_${pageId}').form("submitUrl", param, url, function(results){
									if(results.result.response == '0001'){
			                            params.push("gongysdm="+$('#gongysdm input').val());
			                            params.push("gongysmc="+results.result.parameter.gongysmc);
			                            g_isSub = 0 ;
			                            $('#form_user_${pageId}').form('submit',params,function(results){
			                            	if(showPromptRequestMsg(results)){
							   	 		        $('#grid_user_${pageId}').grid('parseResult',results);
			                            	}
				                        });
									  }else{
										  showPromptMsg('red','${i18n.wucgys}');
								      }
							 });
							}
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
                        //重新加载
                        {name:'back',caption:'${i18n.back}[F11]'},
                        //F12返回
                        {name:'return',caption:'${i18n.return}[F12]'}
					]
				});
				
			 	$('#form_user_${pageId}').form({
			 		onreload:true,
			 		url:'<%=request.getContextPath()%>/beihuo/34502.do',
			 		fields:[
						{fieldType:'fieldText',property:'keh',dataType:'letter_numeric',limitedLength:'5',notNull:true,caption:'${i18n.keh}'},
						{fieldType:'fieldText',property:'gongysdm',dataType:'letter_numeric',limitedLength:'10',caption:'${i18n.gongysdm}'},
						{fieldType:'fieldLabel',property:'cangkbh',value:st_Cangkbh},
						{fieldType:'fieldLabel',property:'shij',value:CurrentTime()}
			 		]
			 	});
			 	
                $(document).keyboardsupport({});
            });
            
            function search(){
                //参数校验
               /*  if(!$('#form_user_${pageId}').form("validateParam")){
                    $('#grid_user_${pageId}').grid('clearRecords');
                    return;
                } */
                $('#grid_user_${pageId}').grid('clearRecords');
                if(!$('#keh').fieldText('validate')){
                	return ;
                }
                var params = $('#form_user_${pageId}').form("getFormParam");
                params.push('beihybh=${userName}');
                params.push('currentPage=1');
                //设置分页条件
	            $('#grid_user_${pageId}').grid("setQueryParams", params);
                $('#grid_user_${pageId}').grid("load",params);
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
							<td>${i18n.keh}:</td>
							<td><div class="ui-field" id="keh"></div></td>
							<td>${i18n.gongysdm}:</td>
							<td><div class="ui-field" id="gongysdm"></div></td>
							<td>${i18n.cangkbh}:</td>
                            <td><div class="ui-field" id="cangkbh"></div></td>
							<td>${i18n.shij}:</td>
							<td><div class="ui-field" id="shij"></div></td>

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