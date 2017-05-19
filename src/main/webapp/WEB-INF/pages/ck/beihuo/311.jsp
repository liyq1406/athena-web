<%@ page language="java" pageEncoding="UTF-8"%>
<%request.setAttribute("pageId","311");%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_311}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
	        //返回界面初始值
            var searchKey = {};
	        
			$(function(){
				$('#grid_user_${pageId}').grid({
					keyFields:['cangkbh','beihdh'],
					id:'grid_user_${pageId}',
					showCheckbox:true,
					checkedOnlyOne:true,
					//查询交易
					src:'<%=request.getContextPath()%>/beihuo/31101.do',
					cols:[
						{property:'beihdh',caption:'${i18n.beihdh}',width:'50'},
						{property:'beihdlxxx',caption:'${i18n.beihdlx}',internation:true,width:'50'},
						{property:'ush',caption:'${i18n.ush}',width:'50'},
						{property:'lingjbh',caption:'${i18n.lingjh}',width:'50'},
						{property:'yaohlh',caption:'${i18n.yaohlh}',width:'50'},
						{property:'sxsj',caption:'${i18n.shangxsj}',width:'50'},
						{property:'usljsl',caption:'${i18n.shul}',width:'50'},
						{property:'shifsl',caption:'${i18n.shifsl}',width:'50'},
						{property:'danw',caption:'${i18n.danw}',width:'50'},
						{property:'cangkbh',caption:'${i18n.cangkbh}',width:'50'},
						{property:'zickbh',caption:'${i18n.zickbh}',width:'50'},
						{property:'keh',caption:'${i18n.keh}',width:'50'},
						{property:'xiaohd',caption:'${i18n.xiaohd}',width:'50'},
						{property:'beihdztxx',caption:'${i18n.beihzt}',internation:true,width:'50'}
					],
					buttons:[
		                //F1查询
		                {name:'search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
		                    //参数校验
		                    if(!$('#form_user_${pageId}').form("validateParam")){
		                    	$('#grid_user_${pageId}').grid('clearRecords');
		                        return;
		                    }
		                    var params = $('#form_user_${pageId}').form("getFormParam");
                            params.push('currentPage=1');
                            //设置分页条件
					        $('#grid_user_${pageId}').grid("setQueryParams", params);
                             var url="<%=request.getContextPath()%>/beihuo/31101.do";
                            $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
                                if (showPromptRequestMsg(results)){
                                     $('#zickbh input').val(results.result.parameter.zickbh);
                                     $('#grid_user_${pageId}').grid('parseResult',results);
                                     if (results.result.parameter.list.length > 0){
											$('#grid_user_${pageId}').grid('focus');
										}
                                     
                                    }
                                 });
			    		return false;
                        }},
                        //F4单选
                        {name:'checked',caption:'${i18n.checked}[F4]',keyboard:'F4',action:function(){
                            $('#grid_user_${pageId}').grid('selected');
                            msgClear();
                            return false;
                        }},
						//F7查看
				   	 	{name:'info',caption:'${i18n.info}[F7]',keyboard:'F7',action:function(){
					   	 	var params = $('#grid_user_${pageId}').grid('getSelectedAll');
					   	 	//params应为表格的keyFields个数
	                        if(params.length != 2){
	                            showPromptMsg('red','${i18n.selecterror}');
	                            return false;
	                        }
	                        //去掉List[0];
	                        for(i=0;i<params.length;i++){
	                            params[i]=params[i].toString().replace("list[0].","");
	                        }
	                        params.push('beihdh=');
		                    params.push('beihybh=${userName}');
		                    params.push('currentPage=1');
                            var url="<%=request.getContextPath()%>/beihuo/31401.do";
                            $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
                                if (showPromptRequestMsg(results)){
                                    if (results.result.response == "0000" ||  results.result.response == "0001"){
                                        //保存界面值
                                        searchKey = {
                                        	lingjbh:$('#lingjbh input').val(),
                                        	cangkbh:$('#cangkbh input').attr('realValue'),
                                        	cangkbhxx:$('#cangkbh input').val(),
                                        	zickbh:$('#zickbh input').val(),
                                        	keh:$('#keh input').val(),
                                        	shangxfs:$('#shangxfs input').attr('realValue'),
                                        	shangxfsxx:$('#shangxfs input').val(),
                                        	beihdlx:$('#shangxfs input').attr('realValue'),
                                        	beihdlxxx:$('#beihdlx input').val(),
                                        	ush:$('#ush input').val(),
                                            params:$('#grid_user_${pageId}').grid('getQueryParams')
                                        };
                                        var strSearchKey=JSON.stringify(searchKey);
                                        $('#searchKey').val(strSearchKey);
                                    	
                                       //加载返回数据
                                       var strJSON=JSON.stringify(results);
                                       $('#beihlx').val(results.result.parameter.beihlx);
                                       $('#putvalue').val(strJSON);
                                       $("#putform").attr("action","<%=request.getContextPath()%>/beihuo/P31401.do"+st_Params);
                                       document.putform.submit();
                                    }
                                }
                            });
						}},
                        //F12返回
                        {name:'back',caption:'${i18n.back}[F11]'},
                        {name:'return',caption:'${i18n.return}[F12]'}
					]
				});
				
			 	$('#form_user_${pageId}').form({
			 	    onreload:true,
			 		fields:[
						{fieldType:'fieldText',property:'lingjbh',caption:'${i18n.lingjh}',notNull:true,dataType:'letter_numeric',limitedLength:'10'},
						{fieldType:'fieldSelect',property:'cangkbh',caption:'${i18n.cangk}',includeNull:true,src:'<%=request.getContextPath()%>/common/wareHouse.do'},
						{fieldType:'fieldText',property:'zickbh',dataType:'letter_numeric',caption:'${i18n.zick}',limitedLength:'3'},
						{fieldType:'fieldText',property:'keh',dataType:'keh'},
						{fieldType:'fieldText',property:'ush',dataType:'ush',caption:'${i18n.ush}'},
						{fieldType:'fieldSelect',property:'beihdlx',includeNull:true,internation:true,src:'<%=request.getContextPath()%>/common/beihdlx.do'},
						{fieldType:'fieldSelect',property:'shangxfs',includeNull:true,src:'<%=request.getContextPath()%>/common/shangxfs.do'}
			 		]
			 	});
                
                //从跳转页面返回
                $(document).ready(function(){
                    var searchKeyValue = $('#searchKey').val();
                    //判断是否页面返回
                    if (searchKeyValue){
                        searchKey = JSON.parse(searchKeyValue);
                        //返回form参数
                        $('#lingjbh input').val(searchKey.lingjbh);
                        $('#cangkbh input').attr('realValue',searchKey.cangkbh);
                        $('#cangkbh input').val(searchKey.cangkbhxx);
                        $('#zickbh input').val(searchKey.zickbh);
                        $('#keh input').val(searchKey.keh);
                        $('#shangxfs input').attr('realValue',searchKey.shangxfs);
                        $('#shangxfsxx input').val(searchKey.shangxfsxx);
                        $('#beihdlx input').attr('realValue',searchKey.beihdlx);
                        $('#beihdlx input').val(searchKey.beihdlxxx);
                        $('#ush input').val(searchKey.ush);
                        //返回gird查询
                         var  params = searchKey.params;
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
			<input id="searchKey" name="searchKey" type="Hidden"></input>
			<form id="putform" method="post" name="putform" >
			    <input id="beihlx" name="beihlx" type="Hidden"></input>
                <input id="putvalue" name="putvalue" type="Hidden"></input>
            </form>
			<div id="form_user_${pageId}" class="ui-fieldLayout">
			 	<table class="ui-grid" cellspacing="1" width="100%">
					<tbody>
						<tr>
							<td>${i18n.lingjh}:</td>
							<td><div class="ui-field" id="lingjbh"></div></td>
							<td>${i18n.cangk}:</td>
							<td><div class="ui-field" id="cangkbh"></div></td>
							<td>${i18n.zick}:</td>
							<td><div class="ui-field" id="zickbh"></div></td>
							<td>${i18n.ush}:</td>
							<td><div class="ui-field" id="ush"></div></td>
						</tr>
						<tr>
						    <td>${i18n.beihdlx}:</td>
							<td><div class="ui-field" id="beihdlx"></div></td>
							<td>${i18n.keh}:</td>
							<td><div class="ui-field" id="keh"></div></td>
							<td>${i18n.shangxms}:</td>
							<td><div class="ui-field" id="shangxfs"></div></td>
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