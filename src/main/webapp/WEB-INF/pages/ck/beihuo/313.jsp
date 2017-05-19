<%@ page language="java" pageEncoding="UTF-8"%>
<%request.setAttribute("pageId","313");%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_313}</title>
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
					src:'<%=request.getContextPath()%>/beihuo/31301.do',
					cols:[
						{property:'beihdh',caption:'${i18n.beihdh}'},
						{property:'cangkbh',caption:'${i18n.cangkbh}'},
						{property:'peizdh',caption:'${i18n.diaobdh}'},
						{property:'keh',caption:'${i18n.keh}'},
						{property:'chuksj',caption:'${i18n.diaobsj}'},
						{property:'beihdztxx',caption:'${i18n.beihzt}',internation:true}
					],
					buttons:[
						//F1查询
                        {name:'search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
                            $('#grid_user_${pageId}').grid('clearRecords');         
                            //参数校验
                            if(!$('#form_user_${pageId}').form("validateParam")){
                                return;
                            }
                            
                            //范围校验
                            if(!validRangeData("datetime", $('#diaobsj1 input').val(), $('#diaobsj2 input').val())){
                                $('#diaobsj1 input').focus();
                                $('#diaobsj1 input').removeClass('validate-success').addClass('validate-error');
                                return;
                            }
                            var start=new Date(($('#diaobsj1 input').val()).replace(/-/g,"/"));
				            var end=new Date(($('#diaobsj2 input').val()).replace(/-/g,"/"));
				              if(end<start){
					                  showPromptMsg('red','${i18n.datetime_invalid}');
					                   return false;
				                    }
                            
                            var params = $('#form_user_${pageId}').form("getFormParam");
                            params.push("beihdzt1="+$('#beihdzt input').attr("realValue"));
                            params.push('currentPage=1');
                            //设置分页条件
					        $('#grid_user_${pageId}').grid("setQueryParams", params);
                            $('#grid_user_${pageId}').grid("load",params);
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
                            params.push('yaohlh=');
                            params.push('beihybh=${userName}');
                            params.push('currentPage=1');
                            var url="<%=request.getContextPath()%>/beihuo/31401.do";
                            $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
                                if (showPromptRequestMsg(results)){
                                    if (results.result.response == "0001"){
                                        //保存界面值
                                        searchKey = {
                                            cangkbh:$('#cangkbh input').val(),
                                            zickbh:$('#zickbh input').val(),
                                            diaobdh:$('#diaobdh input').val(),
                                            keh:$('#keh input').val(),
                                            beihdztxx:$('#beihdzt input').val(),
                                            beihdzt:$('#beihdzt input').attr('realValue'),
                                            diaobsj1:$('#diaobsj1 input').val(),
                                            diaobsj2:$('#diaobsj2 input').val(),
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
                        //重新加载
                        {name:'back',caption:'${i18n.back}[F11]',keyboard:'F11'},
                        //F12返回
                        {name:'return',caption:'${i18n.return}[F12]'}
                    ]
				});
				
			 	$('#form_user_${pageId}').form({
			 	   onreload:true,
			 		fields:[
						{fieldType:'fieldSelect',property:'cangkbh',caption:'${i18n.cangk}',notNull:true,src:'<%=request.getContextPath()%>/common/wareHouse.do'},
                        {fieldType:'fieldText',property:'zickbh',dataType:'letter_numeric',caption:'${i18n.zick}',limitedLength:'3'},
                        {fieldType:'fieldText',property:'diaobdh',dataType:'diaobdh'},
                        {fieldType:'fieldText',property:'keh',dataType:'keh'},
						{fieldType:'fieldSelect',property:'beihdzt',includeNull:true,internation:true,src:'<%=request.getContextPath()%>/common/beihdzt.do'},
						{fieldType:'fieldText',property:'diaobsj1',dataType:'datetime',maskOptions:{mask:'9999-99-99 99:99:99'}},
						{fieldType:'fieldText',property:'diaobsj2',dataType:'datetime',maskOptions:{mask:'9999-99-99 99:99:99'}}
			 		]
			 	});
 			 	
                
 			 	
                //从跳转页面返回
                $(document).ready(function(){
                    var searchKeyValue = $('#searchKey').val();
                    //判断是否页面返回
                    if (searchKeyValue){
                        searchKey = JSON.parse(searchKeyValue);
                        //返回form参数
                        $('#cangkbh input').val(searchKey.cangkbh);
                        $('#cangkbh input').attr('realValue',searchKey.cangkbh);
                        $('#zickbh input').val(searchKey.zickbh);
                        $('#diaobdh input').val(searchKey.diaobdh);
                        $('#keh input').val(searchKey.keh);
                        $('#beihdzt input').val(searchKey.beihdztxx);
                        $('#beihdzt input').attr('realValue',searchKey.beihdzt);
                        $('#diaobsj1 input').val(searchKey.diaobsj1);
                        $('#diaobsj2 input').val(searchKey.diaobsj2);
                        
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
			<input id="searchKey" name="searchKey" type="Hidden"></input>
            <form id="putform" method="post" name="putform" >
                <input id="beihlx" name="beihlx" type="Hidden"></input>
                <input id="putvalue" name="putvalue" type="Hidden"></input>
            </form>
			<div id="form_user_${pageId}" class="ui-fieldLayout">
			 	<table class="ui-grid" cellspacing="1" width="100%">
					<tbody>
						<tr>
							<td>${i18n.cangk}:</td>
							<td><div class="ui-field" id="cangkbh"></div></td>
							<td>${i18n.zick}:</td>
							<td><div class="ui-field" id="zickbh"></div></td>
							<td>${i18n.diaobdh}:</td>
							<td><div class="ui-field" id="diaobdh"></div></td>
							<td>${i18n.keh}:</td>
							<td><div class="ui-field" id="keh"></div></td>
						</tr>
						<tr>
						    <td>${i18n.zhuangt}:</td>
                            <td><div class="ui-field" id="beihdzt"></div></td>
							<td>${i18n.diaobsj}:</td>
							<td><div class="ui-field" id="diaobsj1"></div></td>
							<td>${i18n.zhi}:</td>
							<td><div class="ui-field" id="diaobsj2"></div></td>
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