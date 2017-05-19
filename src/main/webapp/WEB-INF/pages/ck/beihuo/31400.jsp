<%@ page language="java" pageEncoding="UTF-8"%>
<%request.setAttribute("pageId","31400");%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_31400}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
			$(function(){
				var parameter = ${result.result.parameter};
				$('#grid_user_${pageId}').grid({
					src:'<%=request.getContextPath()%>/beihuo/31404.do',
					showCheckbox:true,
					keyFields:['yaohl'],
					id:'grid_user_${pageId}',
					cols:[
						{property:'yaohlh',caption:'${i18n.yaohlh}',width:50},
						{property:'lingjbh',caption:'${i18n.lingjh}',width:50},
						{property:'lingjmc',caption:'${i18n.lingjmc}',width:50},
						{property:'gongysdm',caption:'${i18n.gongysdm}',width:50},
						{property:'lingjsl',caption:'${i18n.lingjsl}',width:50},
						{property:'danw',caption:'${i18n.lingjdw}',width:50},
						{property:'baozxh',caption:'${i18n.baozxh}',width:50},
						{property:'mudd',caption:'${i18n.xiaohd}',width:50},
						{property:'shangxsj',caption:'${i18n.shangxsj}',width:50},
						{property:'xiaohch',caption:'${i18n.huoch}',width:50},
						{property:'chex',caption:'${i18n.chex}',width:50},
						{property:'ceng',caption:'${i18n.ceng}',width:50},
						{property:'tangc',caption:'${i18n.tangc}',width:50},
						{property:'shifsl',caption:'${i18n.chuksl}',width:50}
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
                            params.push('currentPage = 1');
                            //设置分页条件
				   			$('#grid_user_${pageId}').grid("setQueryParams", params);
                            $('#grid_user_${pageId}').grid("load",params);
                            return false;
	                    }},
	                    //F3确定
				   	 	{name:'qued',caption:'${i18n.qued}[F3]',keyboard:'F3',action:function(){
                            var records = $('#grid_user_${pageId}').grid('getSelectedAll');
                            if(records.length < 1){
                                showPromptMsg('red','${i18n.selectoneerror}');
                                return false;
                            }
                            //先提交选中行，然后再重新加载
                            var params =$('#grid_user_${pageId}').grid('getQueryParams');
                            var yaohlList = [];
                            for(var i=0;i<records.length;i++){
                                var yaohl = records[i].split('=');
                                yaohlList.push('\''+yaohl[1]+'\'');
                            }
                            params.push('yaohlList='+ yaohlList.join(','));
                            var url="<%=request.getContextPath()%>/beihuo/31403.do";
                            $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
                            	if (showPromptRequestMsg(results)){
                            		$('#grid_user_${pageId}').grid('parseResult',results);
                                }
                            });
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
                        {name:'back',caption:'${i18n.back}[F11]',keyboard:'F11',action:function(){
                        	var params = [];
                            params.push('beihdh=' + parameter.beihdh);
                            params.push('beihybh=${userName}');
                            params.push('currentPage=1');
                            //修改备货单需设置备货单状态，查看不需要
                            params.push('beihdbs=0');
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
                                    }else{
                                    	//加载返回数据
                                    	results.result.parameter.zickbh=parameter.zickbh;
                                    	results.result.parameter.beihlx=parameter.beihlx;
                                    	results.result.parameter.gonghmsxx="C_GHMS_"+parameter.beihlx;
                                    	results.result.parameter.keh=parameter.keh;
                                        var strJSON=JSON.stringify(results);
                                        $('#beihlx').val(results.result.parameter.beihlx);
                                        $('#putvalue').val(strJSON);
                                        $("#putform").attr("action","<%=request.getContextPath()%>/beihuo/P31401.do"+st_Params);
                                        document.putform.submit();
                                    }
                                }
                            });
                        	return false; 
                        }},
                        //F12返回
                        {name:'return',caption:'${i18n.return}[F12]'}
					]
				});
				
			 	$('#form_user_${pageId}').form({
			 		url:'<%=request.getContextPath()%>/beihuo/31403.do',
			 		fields:[
                            {fieldType:'fieldHidden',property:'beihdh',value:parameter.beihdh},
                            {fieldType:'fieldHidden',property:'cangkbh',value:parameter.cangkbh},
                            {fieldType:'fieldHidden',property:'zickbh',value:parameter.zickbh},
                            {fieldType:'fieldHidden',property:'beihlx',value:parameter.beihlx},
                            {fieldType:'fieldHidden',property:'keh',value:parameter.keh},
							{fieldType:'fieldText',property:'lingjbh',dataType:'letter_numeric',caption:'${i18n.lingjh}',limitedLength:'10'},
							{fieldType:'fieldText',property:'yaohlh',dataType:'yaohlh'}
			 		]
			 	});
			 	
            	//加载时判断是否是回退
    			$(document).ready(function(){
    				//加载GRID
    				$('#grid_user_${pageId}').grid('parseResult',${result});
    				var params = $('#form_user_${pageId}').form("getFormParam");
    				params.push("beihybh="+st_UserName);
    				//修改备货单需设置备货单状态，查看不需要
                    params.push('beihdbs=0');
                    params.push('beihybh=${userName}');
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
			 	
                //var initparams = $('#form_user_${pageId}').form("getFormParam");
                //paramsQuery = jQuery.extend(true,[],initparams);
			 	$(document).keyboardsupport({});
			});
		</script>
	</head>
	<body>
		<div style="padding:20px;">
			<div id="title"></div>
			<form id="putform" method="post" name="putform" >
                <input id="beihlx" name="beihlx" type="Hidden"></input>
                <input id="putvalue" name="putvalue" type="Hidden"></input>
            </form>
			<div id="form_user_${pageId}" class="ui-fieldLayout">
			 	<table class="ui-grid" cellspacing="1" width="100%">
					<tbody>
						<tr>
							<td>${i18n.lingjh}:</td>
							<td><div class="ui-field" id="beihdh"></div></td>
							<td><div class="ui-field" id="cangkbh"></div></td>
							<td><div class="ui-field" id="zickbh"></div></td>
							<td><div class="ui-field" id="beihlx"></div></td>
							<td><div class="ui-field" id="keh"></div></td>
							<td><div class="ui-field" id="lingjbh"></div></td>
							<td>${i18n.yaohlh}:</td>
							<td><div class="ui-field" id="yaohlh"></div></td>
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