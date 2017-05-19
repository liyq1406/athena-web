<%@ page language="java" pageEncoding="UTF-8"%>
<%request.setAttribute("pageId","629");%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_629}</title>
		<jsp:include page="../../common/js.jsp" />
		<jsp:include page="../../common/print.jsp" />
		<script type="text/javascript">
			//var demorecord = {"result":{"response":"0000","trans_bran_code":"abc","seqno":0,"parameter":{"jiesckbh":"D000000001",cangkbh:st_Cangkbh,"pageSize":"10","list":[{"jiaofsj":"","lingjmc":"5","weiwcsl":-10,"shipsl":30,"lingjbh":"a01","jihy":"5","lux":"123","danw":"m","zhixsl":40},{"jiaofsj":"","lingjmc":"5","weiwcsl":100,"shipsl":100,"lingjbh":"a04","jihy":"5","lux":"123","danw":"m","zhixsl":0}],"shij":"2012-3-27","cangkbh":"C01","beihybh":"ck"}}};
			var demorecord = {'result':{'total':1,cangkbh:st_Cangkbh,jiesckbh:'123','rows':[{yaohlh:'us1','shul':20,'lingjbh':123,'ush':'S00000001','gongysmc':345,'shangxbz':678,'shifsl':901,'danw':322,'kuw':012},{us:'us2','shul':20,'lingjbh':123,'ush':'S00000002','gongysmc':345,'shangxbz':678,'shifsl':901,'danw':322,'kuw':014}]}};
			var paramsQuery;
			var currentPage = 1;
			$(function(){
				$('#grid_user_${pageId}').grid({
					keyFields:['danjbh','wuld','gongysmc1','shengqr','zhongzsj'],
					id:'grid_user_${pageId}',
					showCheckbox:true,
					checkedOnlyOne:true, //是否单选
					//查询交易
					src:'<%=request.getContextPath()%>/rongqi/62901.do',
					cols:[
						{property:'danjbh',caption:'${i18n.weixdh}'},
						{property:'wuld',caption:'${i18n.rongqiq}'},
						{property:'gongysmc1',caption:'${i18n.weixs}'},
						{property:'shengqr',caption:'${i18n.shenqr}'},
						{property:'create_time',caption:'${i18n.ticsj}'},
						{property:'zhongzsj',caption:'${i18n.yujwcsj}'}
					],
					//records:demorecord,
					buttons:[
						//F1查询
						{name:'search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
							  //参数校验
                            if(!$('#form_user_${pageId}').form("validateParam")){
                            	$('#grid_user_${pageId}').grid('clearRecords');
                                return;
                            }
                            if (!validateform()){
                                return;
                            }
                            //范围校验
                            if(!validRangeData("date", $('#diaobsj1 input').val(), $('#diaobsj2 input').val())){
                                $('#diaobsj1 input').focus();
                                $('#diaobsj1 input').removeClass('validate-success').addClass('validate-error');
                                return;
                            } 
                            var params = $('#form_user_${pageId}').form("getFormParam");
                            currentPage = 1;
                            params.push('currentPage=1');
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
                            if(params.length != 5){
                                showPromptMsg('red','${i18n.selecterror}');
                                return false;
                            }
                          //存放查询条件
         					var vQuery = $('#grid_user_${pageId}').grid('getQueryParams')
         					vQuery.push("currentPage="+currentPage);
         					$('#serachKey').val(vQuery);
                            //加上要货令类型判断：同步/集配要货令可以查询明细
                            //去掉List[0];
                            for(i=0;i<params.length;i++){
                                params[i]=params[i].toString().replace("list[0].","");
                            }
                            var url="<%=request.getContextPath()%>/rongqi/62002.do";
                            $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
                            	if (showPromptRequestMsg(results)){
                                    if (results.result.response == "0000"){
                                       //加载返回数据
                                       var strJSON=JSON.stringify(results);
                                       $('#putvalue').val(strJSON);
                                       $("#putform").attr("action","<%=request.getContextPath()%>/rongqi/P62901.do"+st_Params);
                                       document.putform.submit();
                                    }
                                }
                            });
						}},
						//F8打印
						{name:'print',caption:'${i18n.print}[F8]',keyboard:'F8',action:function(){
							//是否选中
							var records = $('#grid_user_${pageId}').grid('getSelectedAll');
							if(records.length != 5){
								showPromptMsg('red','${i18n.selecterror}')
								return false;
							}
							var params = $('#grid_user_${pageId}').grid('getSelectedColumnValue','danjbh');
							var strZhijqdh;
							for(i=0;i<params.length;i++){
								if(i == 0){
									strZhijqdh=params[i];
								}else{
									strZhijqdh=strZhijqdh+"','" + params[i];
								}
							}
							params.push("usercenter="+st_UserCenter);
							params.push("weixdh="+ strZhijqdh);
							var url = "<%=request.getContextPath()%>/rongqi/62903.do";
							doprint(st_PageId,params,url);
							return false;
						}},
						{name:'back',caption:'${i18n.back}[F11]'}
						  //F12返回
                        ,{name:'return',caption:'${i18n.return}[F12]'}
					]				
				});
				
			 	$('#form_user_${pageId}').form({
			 		onreload:true,
			 		fields:[
                        {fieldType:'fieldText',property:'danjbh',caption:'${i18n.lingjh}',dataType:'weixdh'},
                        {fieldType:'fieldLabel',property:'wuld',value:st_Rongqcbh},
                        {fieldType:'fieldText',property:'gongysmc1',dataType:'laiy',maxLength:'35'},
                        {fieldType:'fieldText',property:'shengqr',dataType:'laiy',maxLength:'10'},
                        {fieldType:'fieldText',property:'diaobsj1',dataType:'date',maskOptions:{mask:'9999-99-99'}},
                        {fieldType:'fieldText',property:'diaobsj2',dataType:'date',maskOptions:{mask:'9999-99-99'}}
			 		]
			 	});
			 	function validateform(){
	                //参数校验
	                if(!$('#form_user_${pageId}').form("validateParam")){
	                    $('#grid_user_${pageId}').grid('clearRecords');
	                    return false;
	                }
	                
	                //范围校验
	                var saoksj1 = $('#diaobsj1 input').val();
	                var saoksj2 = $('#diaobsj2 input').val();
	                if(!validRangeData("datetime", saoksj1, saoksj2)){
	                    $('#diaobsj1 input').focus();
	                    $('#diaobsj1 input').removeClass('validate-success').addClass('validate-error');
	                    return false;
	                }
	                var date1 = new Date(saoksj1.replace(/-/g,"/"));
	                var date2 = new Date(saoksj2.replace(/-/g,"/"));
	                var date3=date2.getTime()-date1.getTime();
	                if (date3 > 7*24*3600*1000){
	                	showPromptMsg('red',$.sdcui.resource.i18n['C_F_SHIJIANDUAN']);
	                    return false;
	                }
	                return true;
				}
				
				//加载时判断是否是回退
				$(document).ready(function(){
					if ( $('#serachKey').val()!=""){
						//为界面查询字段赋值
						var params = $('#serachKey').val().split(",");
						for(i=0;i<params.length;i++){
							var vParam = params[i].split("=");
							if (vParam[0].indexOf("danjbh") != -1){                   //任务编号
								$('#danjbh input').val(vParam[1])
								continue;
							} else if (vParam[0].indexOf("wuld") != -1){           //状态信息
								$('#wuld input').val(vParam[1])
								continue;
							} else if (vParam[0].indexOf("gongysmc1") != -1){             //状态
								$('#gongysmc1 input').val(vParam[1])
								continue;
							} else if (vParam[0].indexOf("shengqr") != -1){        //生成库存时间
								$('#shengqr input').val(vParam[1])
								continue;
							} else if (vParam[0].indexOf("currentPage") != -1){       //页码
								currentPage = vParam[1];
								continue;
							}
						}
						//移除当前页码
						params.splice(params.length-1,1);
						//设置分页条件
						$('#grid_user_${pageId}').grid("setQueryParams", params);
						//加载列表数据
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
			<input id="serachKey" name="serachKey" type="Hidden"></input>
			<form id="putform" method="post" name="putform">
				<input id="putvalue" name="putvalue" type="Hidden"></input>
			</form> 
			<div id="form_user_${pageId}" class="ui-fieldLayout">
			 	<table class="ui-grid" cellspacing="1" width="100%">
					<tbody>
						<tr>
							<td>${i18n.weixdh}:</td>
							<td><div class="ui-field" id="danjbh"></div></td>
							<td>${i18n.rongqiq}:</td>
                            <td><div class="ui-field" id="wuld"></div></td>
                            <td>${i18n.weixs}:</td>
                            <td><div class="ui-field" id="gongysmc1"></div></td>
						</tr>
						<tr>
						    <td>${i18n.shenqr}:</td>
                            <td><div class="ui-field" id="shengqr"></div></td>
                            <td>${i18n.yujwcsj}:</td>
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