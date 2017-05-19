<%@ page language="java" pageEncoding="UTF-8"%>
<%request.setAttribute("pageId","333");%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_333}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
           //返回界面初始值
            var searchKey = {};
           
			$(function(){
				//var demorecords = {'result':{'total':1,'rows':[{'jiesckbh':'us1','beihdh':20,'daysj':123,'ush':'S00000001','gongysmc':345,'shangxbz':678,'shifsl':901,'danw':322,'kuw':012},{'jiesckbh':'us1','beihdh':20,'daysj':123,'ush':'S00000002','gongysmc':345,'shangxbz':678,'shifsl':901,'danw':322,'kuw':014}]}};
				//var demorecord = {'result':{'total':1,cangkbh:st_Cangkbh,jiesckbh:'123','rows':[{us:'us1','shul':20,'lingjbh':123,'ush':'S00000001','gongysmc':345,'shangxbz':678,'shifsl':901,'danw':322,'kuw':012},{us:'us2','shul':20,'lingjbh':123,'ush':'S00000002','gongysmc':345,'shangxbz':678,'shifsl':901,'danw':322,'kuw':014}]}};
				$('#grid_user_${pageId}').grid({
					keyFields:['beihd','jiesckbh'],
					id:'grid_user_${pageId}',
					showCheckbox : true,
					//查询交易
					src:'<%=request.getContextPath()%>/beihuo/33301.do',
					cols:[
						{property:'beihdh',caption:'${i18n.beihdh}'},
						{property:'jiesckbh',caption:'${i18n.jiesck}'},
						{property:'daysj',caption:'${i18n.daysj}'},
						{property:'caozy',caption:'${i18n.caozy}'},
						{property:'caozsj',caption:'${i18n.caozsj}'}
					],
					//records:demorecords,
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
			            	var records = $('#grid_user_${pageId}').grid('getSelectedColumnValue','beihd');
							if(records.length < 1){
								showPromptMsg('red','${i18n.selectoneerror}')
								return false;
							}
							//打开提示框是否删除
							if(confirm($.sdcui.resource.i18n['C_remove'])){
								//先提交选中行，然后再重新加载
								var params = $('#grid_user_${pageId}').grid('getQueryParams');
								var beihdList = [];
                                for(var i=0;i<records.length;i++){
                                    beihdList.push('\''+records[i]+'\'');
                                }
								params.push("beihdList="+ beihdList.join(','));
								//params.push("currentPage=1");
	                            var url="<%=request.getContextPath()%>/beihuo/33302.do";
	                            $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
	                            	if (showPromptRequestMsg(results)){
                                        $('#grid_user_${pageId}').grid('parseResult',results);
                                    }
	                            });
							}
							return false;
			            }},
                        //F7查看
                        {name:'info',caption:'${i18n.info}[F7]',keyboard:'F7',action:function(){
                            var records = $('#grid_user_${pageId}').grid('getSelectedColumnValue','jiesckbh');
                            if(records.length != 1){
                                showPromptMsg('red','${i18n.selecterror}')
                                return false;
                            }
                            var params = [];
                            params.push('jiesckbh=' + records[0]);
                            params.push('cangkbh=' + st_Cangkbh);
                            var url="<%=request.getContextPath()%>/beihuo/32903.do";
                            $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
                            	if (showPromptRequestMsg(results)){
                                    if (results.result.response == "0000"){
                                        //保存界面值
                                        searchKey = {
                                        	cangkbh:$('#cangkbh input').val(),
                                            params:$('#grid_user_${pageId}').grid('getQueryParams')
                                        };
                                        var strSearchKey=JSON.stringify(searchKey);
                                        $('#searchKey').val(strSearchKey);
                                    	
                                        //加载返回数据
                                        var strJSON=JSON.stringify(results);
                                        $('#putvalue').val(strJSON);
                                        $("#putform").attr("action","<%=request.getContextPath()%>/beihuo/P32901.do"+st_Params);
                                        document.putform.submit();
                                    }
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
                        {fieldType:'fieldLabel',property:'cangkbh',caption:'${i18n.cangkbh}',value:st_Cangkbh},    
			 		]
			 	});
			 	
               
			 	
			 	//页面初始化查询
                var params = $('#form_user_${pageId}').form("getFormParam");
                params.push('currentPage=1');
                //设置分页条件
				$('#grid_user_${pageId}').grid("setQueryParams", params);
                $('#grid_user_${pageId}').grid("load",params);
                
                //从跳转页面返回
                $(document).ready(function(){
                    var searchKeyValue = $('#searchKey').val();
                    //判断是否页面返回
                    if (searchKeyValue){
                        searchKey = JSON.parse(searchKeyValue);
                        //返回form参数
                        $('#jiesckbh input').val(searchKey.jiesckbh);
                        $('#lingjbh input').val(searchKey.lingjbh);
                        //返回gird查询
                        var params = searchKey.params;
                        //设置分页条件
						$('#grid_user_${pageId}').grid("setQueryParams", params);
                        $('#grid_user_${pageId}').grid("load",params);
                    }
                });
                
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