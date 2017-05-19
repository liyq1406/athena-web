<%@ page language="java" pageEncoding="UTF-8"%>
<%request.setAttribute("pageId","312");%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<t:html i18n="i18n.ck">
    <head>
        <title>${i18n.title_312}</title>
        <jsp:include page="../../common/js.jsp" />
        <script type="text/javascript">
            //返回界面初始值
            var searchKey = {};
            $(function(){
                $('#grid_user_${pageId}').grid({
                    keyFields:['cangkbh','beihdh'],
                    id:'grid_user_${pageId}',
                    showCheckbox:true,
                    //查询交易
                    src:'<%=request.getContextPath()%>/beihuo/31201.do',
                    cols:[
                        {property:'beihdh',caption:'${i18n.beihdh}'},
                        {property:'beihdlxxx',caption:'${i18n.beihdlx}',internation:true},
                        {property:'ckzck',caption:'${i18n.cangkbh}'},
                        {property:'keh',caption:'${i18n.keh}'},
                        {property:'huoch',caption:'${i18n.xiaohch}'},
                        {property:'bhsj',caption:'${i18n.beihsj}'},
                        {property:'sxsj',caption:'${i18n.fahsj}'},
                        {property:'beihdztxx',caption:'${i18n.beihzt}',internation:true}
                    ],
                    //records:{'result':{'total':2,'rows':[{'baozdykh':'123','qizlsh':'1234','peislx':'12345','shangxbz':'123','lingjh':'1234','lingjmc':'12345','ush':'123','gongysdm':'1234','kuw':'123','zhuangcsl':'123','zuizsxsj':'12345','chex':'12345','ceng':'123'}]}},
                    buttons:[
                        //F1查询
                        {name:'search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
                            //参数校验
                              $('#grid_user_${pageId}').grid('clearRecords');
                            if(!$('#form_user_${pageId}').form("validateParam")){
                                return;
                            }
                            
                            //范围校验
                            if(!validRangeData("datetime", $('#shangxsj1 input').val(), $('#shangxsj2 input').val())){
                                $('#shangxsj1 input').focus();
                                $('#shangxsj1 input').removeClass('validate-success').addClass('validate-error');
                                return;
                            }
                            var start=new Date(($('#shangxsj1 input').val()).replace(/-/g,"/"));
				              var end=new Date(($('#shangxsj2 input').val()).replace(/-/g,"/"));
				              if(end<start){
					                  showPromptMsg('red','${i18n.datetime_invalid}');
					                   return false;
				                    }
                            
                            //范围校验
                            if(!validRangeData("datetime", $('#bhsj1 input').val(), $('#bhsj2 input').val())){
                                $('#bhsj1 input').focus();
                                $('#bhsj1 input').removeClass('validate-success').addClass('validate-error');
                                return;
                            }
                              var starttime=new Date(($('#bhsj1 input').val()).replace(/-/g,"/"));
				              var endtime=new Date(($('#bhsj2 input').val()).replace(/-/g,"/"));
				              if(endtime<starttime){
					                  showPromptMsg('red','${i18n.datetime_invalid}');
					                   return false;
				                    }
                            var params = $('#form_user_${pageId}').form("getFormParam");
                            
                            params.push('dayzt1='+ $('#dayzt input').attr('realValue'));
                            params.push('beihdzt1=' + $('#beihdzt input').attr('realValue'));
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
                        //全选
                        {name:'selectall',caption:'${i18n.selectall}[F5]',keyboard:'F5',action:function(){
				   	 		$('#grid_user_${pageId}').grid('selectedAll');
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
                                            beihdh:$('#beihdh input').val(),
                                            keh:$('#keh input').val(),
                                            huoch:$('#huoch input').val(),
                                            cangkbh:$('#cangkbh input').val(),
                                            zickbh:$('#zickbh input').val(),
                                            beihdztxx:$('#beihdzt input').val(),
                                            beihdzt:$('#beihdzt input').attr('realValue'),
                                            dayztxx:$('#dayzt input').val(),
                                            dayzt:$('#dayzt input').attr('realValue'),
                                            shangxfs:$('#shangxfs input').val(),
                                            shangxsj1:$('#shangxsj1 input').val(),
                                            shangxsj2:$('#shangxsj2 input').val(),
                                            bhsj1:$('#bhsj1 input').val(),
                                            bhsj2:$('#bhsj2 input').val(),
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
                        {name:'print',caption:'${i18n.print}[F8]',keyboard:'F8',action:function(){
							var params = $('#grid_user_${pageId}').grid('getSelectedAll');
							if(params.length < 1){
						       showPromptMsg('red','${i18n.selectoneerror}')
						       return false;
						       }
							var url = "<%=request.getContextPath()%>/beihuo/31203.do";
							$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
					 		    if (showPromptRequestMsg(results)==true){
										//加载返回数据
					 		    }	 
					          });
			    		 return false;
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
                        {fieldType:'fieldText',property:'beihdh',dataType:'beihdh',maxLength:'9'},
                        {fieldType:'fieldText',property:'keh',maxLength:'5'},
                        {fieldType:'fieldText',property:'huoch',maxLength:'5'},
                        {fieldType:'fieldSelect',property:'cangkbh',caption:'${i18n.cangk}',notNull:true,src:'<%=request.getContextPath()%>/common/wareHouse.do'},
                        {fieldType:'fieldText',property:'zickbh',dataType:'letter_numeric',caption:'${i18n.zick}',limitedLength:'3'},
                        {fieldType:'fieldSelect',property:'beihdzt',includeNull:true,internation:true,src:'<%=request.getContextPath()%>/common/beihdzt.do'},
                        {fieldType:'fieldSelect',property:'dayzt',includeNull:true,internation:true,src:'<%=request.getContextPath()%>/common/dayzt.do'},
                        {fieldType:'fieldSelect',property:'shangxfs',includeNull:true,src:'<%=request.getContextPath()%>/common/shangxfs.do'},
                        {fieldType:'fieldText',property:'shangxsj1',dataType:'datetime',maskOptions:{mask:'9999-99-99 99:99:99'}}, 
                        {fieldType:'fieldText',property:'shangxsj2',dataType:'datetime',maskOptions:{mask:'9999-99-99 99:99:99'}},
                        {fieldType:'fieldText',property:'bhsj1',dataType:'datetime',maskOptions:{mask:'9999-99-99 99:99:99'}},
                        {fieldType:'fieldText',property:'bhsj2',dataType:'datetime',maskOptions:{mask:'9999-99-99 99:99:99'}},
                        {fieldType:'fieldSelect',property:'beihdlx',includeNull:true,internation:true,src:'<%=request.getContextPath()%>/common/beihdlx.do'},
                        {fieldType:'fieldSelect',property:'gonghms',includeNull:true,src:'<%=request.getContextPath()%>/common/waibandneibghms.do?zhuangt=2'}
                    ]
                });
                
                //从跳转页面返回
                $(document).ready(function(){
                    var searchKeyValue = $('#searchKey').val();
                    //判断是否页面返回
                    if (searchKeyValue){
                        searchKey = JSON.parse(searchKeyValue);
                        //返回form参数
                        $('#beihdh input').val(searchKey.beihdh);
                        $('#keh input').val(searchKey.keh);
                        $('#huoch input').val(searchKey.huoch);
                        $('#cangkbh input').val(searchKey.cangkbh);
                        $('#cangkbh input').attr('realValue',searchKey.cangkbh);
                        $('#zickbh input').val(searchKey.zickbh);
                        $('#beihdzt input').val(searchKey.beihdztxx);
                        $('#beihdzt input').attr('realValue',searchKey.beihdzt);
                        $('#dayzt input').val(searchKey.dayztxx);
                        $('#dayzt input').attr('realValue',searchKey.dayzt);
                        $('#shangxfs input').val(searchKey.shangxfs);
                        $('#shangxsj1 input').val(searchKey.shangxsj1);
                        $('#shangxsj2 input').val(searchKey.shangxsj2);
                        $('#bhsj1 input').val(searchKey.bhsj1);
                        $('#bhsj2 input').val(searchKey.bhsj2);
                        
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
                            <td>${i18n.gonghms}:</td>
                            <td><div class="ui-field" id="gonghms"></div></td>
                            <td>${i18n.beihzt}:</td>
                            <td><div class="ui-field" id="beihdzt"></div></td>
                            <td>${i18n.beihdlx}:</td>
                            <td><div class="ui-field" id="beihdlx"></div></td>
                         </tr>
                         <tr>
                            <td>${i18n.cangk}:</td>
                            <td><div class="ui-field" id="cangkbh"></div></td>
                            <td>${i18n.shangxms}:</td>
                            <td><div class="ui-field" id="shangxfs"></div></td>
                            <td>${i18n.dayzt}:</td>
                            <td><div class="ui-field" id="dayzt"></div></td>
                        </tr>
                        <tr>
                            <td>${i18n.beihdh}:</td>
                            <td><div class="ui-field" id="beihdh"></div></td>
                            <td>${i18n.zick}:</td>
                            <td><div class="ui-field" id="zickbh"></div></td>
                            <td>${i18n.fahsj}:</td>
                            <td> <div class="ui-field" style="float:left" id="shangxsj1"></div><div style="float:left" >至</div><div style="float:left" class="ui-field"  id="shangxsj2" ></div></td>
                        </tr>
                        <tr>
                            <td>${i18n.keh}:</td>
                            <td><div class="ui-field" id="keh"></div></td>
                            <td>${i18n.xiaohch}:</td>
                            <td><div class="ui-field" id="huoch"></div></td>                 
                            <td>${i18n.beihsj}:</td>
                            <td><div class="ui-field" style="float:left" id="bhsj1"></div><div style="float:left" >至</div><div style="float:left" class="ui-field"  id="bhsj2" ></div></td>
                           
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