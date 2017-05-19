<%@ page language="java" pageEncoding="UTF-8"%>
<%request.setAttribute("pageId","31404");%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<t:html i18n="i18n.ck">
	<head>
		<title></title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
	        var flag ;
			<% if (request.getParameter("flag") != null){ %>
			    flag= '<%=request.getParameter("flag")%>';
			<%	} %>
			if ("314" ==flag){
				$(document).attr("title", '${i18n.title_31404B}');
			} else {
				$(document).attr("title", '${i18n.title_31404A}');
			}
			$(function(){
                var parameter = ${result.result.parameter};
                /*var searchParam = [];
                searchParam.push('beihdh=' + parameter.beihdh);
                searchParam.push('yaohlh=' + parameter.yaohlh);
                searchParam.push('beihybh=' + parameter.beihybh);
                  if(flag !=null){
			     searchParam.push("biaos=0" );
			    }
   				//设置分页条件
			    $('#grid_user_${pageId}').grid("setQueryParams", searchParam);*/
                //是否按要货令查询(是:屏蔽F2新增，F6取消备货单;否:不做处理)
                var yaohlFlag = true;
                //是否是备货单查询相关页面点查看进入(是:屏蔽F3取消，F4单选，F5全选;否:不做处理)
                var infoFlag = true;
                if (parameter.yaohlh && parameter.yaohlh !=''){
                    yaohlFlag = true;
                } else {
                	yaohlFlag = false;
                }
                if (parameter.beihdbs && parameter.beihdbs=='0'){
                    infoFlag = false;
                } else{
                	yaohlFlag = true;
                    infoFlag = true;
                }
                
				$('#grid_user_${pageId}').grid({
					src:'<%=request.getContextPath()%>/beihuo/31401.do',
					showCheckbox:!infoFlag,//查看不显示勾选框
					keyFields:['liush'],
					id:'grid_user_${pageId}',
					cols:[
						{property:'dingdh',caption:'${i18n.yicsbdh}',width:50},
						{property:'lingjbh',caption:'${i18n.lingjh}',width:50},
						{property:'ush',caption:'${i18n.ush}',width:50},
						{property:'usljsl',caption:'${i18n.ussl}',width:50},
						{property:'kuwbh',caption:'${i18n.diz}',width:50},
						{property:'usucxh',caption:'${i18n.usxh}',width:50},
						{property:'yaohsl',caption:'${i18n.yaohsl}',width:50},
				  		{property:'danw',caption:'${i18n.lingjdw}',width:50},
				  		{property:'shifsl',caption:'${i18n.chuksl}',width:50}
					],
					//records:{'result':{'total':2,'rows':[{'baozdykh':'123','qizlsh':'1234','peislx':'12345','shangxbz':'123','lingjh':'1234','lingjmc':'12345','ush':'123','gongysdm':'1234','kuw':'123','zhuangcsl':'123','zuizsxsj':'12345','chex':'12345','ceng':'123'}]}},
                    buttons:[
                        //F2新增
                        {name:'new',caption:'${i18n.new}[F2]',keyboard:'F2',hidden:yaohlFlag,action:function(){
                            var params = [];
                            params.push('beihdh=' + parameter.beihdh);
                            params.push('cangkbh=' + parameter.cangkbh);
                            params.push('zickbh=' + parameter.zickbh);
                            params.push('beihlx=' + parameter.beihlx);
                            params.push('keh=' + parameter.keh);
                            params.push('currentPage=1');
                            var url="<%=request.getContextPath()%>/beihuo/31402.do";
                            $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
                                if (showPromptRequestMsg(results)){
                                    if (results.result.response == "0000"){
                                       //加载返回数据
                                       var strJSON=JSON.stringify(results);
                                       $('#putvalue').val(strJSON);
                                       $("#putform").attr("action","<%=request.getContextPath()%>/beihuo/31400.do"+st_Params);
                                       document.putform.submit();
                                    }
                                }
                            });
                        }},
                        //F3取消
                        {name:'cancel',caption:'${i18n.cancel}[F3]',keyboard:'F3',hidden:infoFlag,action:function(){
                            var records = $('#grid_user_${pageId}').grid('getSelectedAll');
                            if(records.length < 1){
                                showPromptMsg('red','${i18n.selectoneerror}');
                                return false;
                            }
                            //打开提示框是否删除
                            if(confirm($.sdcui.resource.i18n['C_remove'])){
                                //先提交选中行，然后再重新加载
                                var params = $('#grid_user_${pageId}').grid('getQueryParams');
                                var liushList = [];
                                for(var i=0;i<records.length;i++){
                                    var liush = records[i].split('=');
                                    liushList.push('\''+liush[1]+'\'');
                                }
                                params.push("cangkbh=" + parameter.cangkbh);
                                params.push("liushList="+ liushList.join(','));
                                params.push("currentPage="+$('#grid_user_${pageId}').grid('getCurrentPage'));
                                var url="<%=request.getContextPath()%>/beihuo/31405.do";
                                $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
                                    if (showPromptRequestMsg(results)==true){
                                        $('#grid_user_${pageId}').grid('parseResult',results);
                                         if(results.result.parameter.list.length == 0){
                                           window.location.href="<%=request.getContextPath()%>/beihuo/314.do"+st_Params;
                                        
                                        }
                                    }
                                });
                            }
                           // return false;
                        }},
                        //F4单选
                        {name:'checked',caption:'${i18n.checked}[F4]',keyboard:'F4',hidden:infoFlag,action:function(){
                                $('#grid_user_${pageId}').grid('selected');
                                msgClear();
                                return false;
                        }},
                        //F5全选
                        {name:'selectall',caption:'${i18n.selectall}[F5]',keyboard:'F5',hidden:infoFlag,action:function(){
                                $('#grid_user_${pageId}').grid('selectedAll');
                                msgClear();
                                return false;
                        }},
                        //F6取消备货单
                        {name:'quxbhd',caption:'${i18n.quxbhd}[F6]',keyboard:'F6',hidden:yaohlFlag,action:function(){
                            //打开提示框是否取消
                            if(confirm($.sdcui.resource.i18n['C_cancel'])){
                                var params = [];
                                params.push("beihdh=" + parameter.beihdh);
                                params.push("cangkbh=" + parameter.cangkbh);
                                $('#form_user_${pageId}').form('submit',params,function(results){
                                    if(showPromptRequestMsg(results)){
                                        $('#grid_user_${pageId}').grid('clearRecords');
                                        window.location.href="<%=request.getContextPath()%>/beihuo/314.do"+st_Params;
                                    }
                                });
                            }
                        }},
                      //F5打印
				   	 	{name:'print',caption:'${i18n.print}[F7]',keyboard:'F7',hidden:yaohlFlag,action:function(){
				   	 	 var params=[];
				   	 	 params.push("beihdh="+parameter.beihdh);
                         var url="<%=request.getContextPath()%>/beihuo/31407.do";
                         $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
                             if (showPromptRequestMsg(results)==true){
                             }
                         });
				   	 	}},
				   		 {name:'back',caption:'${i18n.back}[F11]',keyboard:'F11',action:function(){
				   			 //如果是查看返回原页面,否则返回修改备货单页面
	                            if(infoFlag){
	                            	history.back();                                
	                            } else {
	                                window.location.href="<%=request.getContextPath()%>/beihuo/314.do"+st_Params;
	                            }
	                            return false;
				   		 }},
                        //F12返回
                        {name:'return',caption:'${i18n.return}[F12]'}
                    ]
                });
				
			 	$('#form_user_${pageId}').form({
			 		url:'<%=request.getContextPath()%>/beihuo/31406.do',
			 		fields:[
		                {fieldType:'fieldLabel',property:'beihdh',value:parameter.beihdh},
	                    {fieldType:'fieldLabel',property:'zickbh',value:parameter.cangkbh +"&nbsp;   &nbsp;"+ parameter.zickbh},
	                    {fieldType:'fieldLabel',property:'cangkbh',value:parameter.cangkbh},
	                    {fieldType:'fieldLabel',property:'sxsj',value:parameter.sxsj},
	                    {fieldType:'fieldLabel',property:'keh',value:parameter.keh},
	                    {fieldType:'fieldLabel',property:'beihybh',value:parameter.beihybh},
	                    {fieldType:'fieldLabel',property:'dayuc',value:$.sdcui.resource.i18n[parameter.dayuc]}
			 		]
			 	});
			 	//加载时判断是否是回退
    			$(document).ready(function(){
    				//加载GRID
    				$('#grid_user_${pageId}').grid('parseResult',${result})
    				var params = $('#form_user_${pageId}').form("getFormParam");
	                params.push('yaohlh=' + parameter.yaohlh);
	                params.push('beihybh=' + parameter.beihybh);
	                if(flag !=null){
				     params.push("biaos=0" );
				    }
    				$('#grid_user_${pageId}').grid("setQueryParams", params);
    				
    				
    				<%-- if($("#putvalue").val()!=""){
    					var url="<%=request.getContextPath()%>/beihuo/31401.do";
   			 		 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
                           if (showPromptRequestMsg(results)){
                               if (results.result.response == "0000"){
                                  //加载返回数据
                                  var strJSON=JSON.stringify(results);
                                  $('#beihlx').val(results.result.parameter.beihlx);
                                  $('#putvalue').val(strJSON);
                                  $("#putform").attr("action","<%=request.getContextPath()%>/beihuo/P31401.do"+st_Params);
                                  document.putform.submit();
                               }
                           }
                       });
    				}
    				 --%>
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
							<td>${i18n.beihdh}:</td>
                            <td><div class="ui-field" id="beihdh"></div></td>
                            <td>${i18n.cangkbh}:</td>
                            <td><div class="ui-field" id="zickbh"></div></td>
                            <td>${i18n.fahsj}:</td>
                            <td><div class="ui-field" id="sxsj"></div></td>
						</tr>
						<tr>
							<td>${i18n.keh}:</td>
							<td><div class="ui-field" id="keh"></div></td>
							<td>${i18n.shengbr}:</td>
							<td><div class="ui-field" id="beihybh"></div></td>
							<td>${i18n.shifydyuc}:</td>
							<td><div class="ui-field" id="dayuc"> </div></td>
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