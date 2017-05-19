<%@ page language="java" pageEncoding="UTF-8"%>
<%request.setAttribute("pageId","630");%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_630}</title>
		<jsp:include page="../../common/js.jsp" />
		<jsp:include page="../../common/print.jsp" />
		<script type="text/javascript">
	        var paramsQuery;
	        var currentPage = 1;
			$(function(){
				$('#grid_user_${pageId}').grid({
					keyFields:['beihdh','danjbh'],
					id:'grid_user_${pageId}',
					showCheckbox:false,
					//查询交易
					src:'<%=request.getContextPath()%>/rongqi/63001.do',
					cols:[
						{property:'danjbh',caption:'${i18n.baofdh}'},
						//{property:'gongysdm',caption:'${i18n.gongys}'},
						{property:'chengysdm',caption:'${i18n.wuls}'},
						{property:'wuld',caption:'${i18n.rongqiq}'},
						{property:'rongqxh',caption:'${i18n.rongqxh}'},
						{property:'rongqsl',caption:'${i18n.baofsl}'},
						{property:'baofsj',caption:'${i18n.baofsj}'},
						{property:'shengqr',caption:'${i18n.shenqr}'
						}
					],
					//records:{'result':{'total':2,'rows':[{'baozdykh':'123','qizlsh':'1234','peislx':'12345','shangxbz':'123','lingjh':'1234','lingjmc':'12345','ush':'123','gongysdm':'1234','kuw':'123','zhuangcsl':'123','zuizsxsj':'12345','chex':'12345','ceng':'123'}]}},
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
<%--                       //F8打印
						{name:'print',caption:'${i18n.print}[F8]',keyboard:'F8',action:function(){
							//是否选中
							var records = $('#grid_user_${pageId}').grid('getSelectedAll');
							if(records.length < 1){
								showPromptMsg('red','${i18n.selectoneerror}')
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
							params.push("danjbh='"+ strZhijqdh+"'" );
							var url = "<%=request.getContextPath()%>/rongqi/63002.do";
							doprint(st_PageId,params,url);
							return false;
						}}, --%>
                        {name:'back',caption:'${i18n.back}[F11]'},
                        //F12返回
                        {name:'return',caption:'${i18n.return}[F12]'}
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
	                	showPromptMsg('red',$.sdcui.resource.i18n['C_F_BAOFSJ']);
	                    return false;
	                }
	                return true;
				}
			 	$('#form_user_${pageId}').form({
			 		onreload:true,
			 		fields:[
						{fieldType:'fieldText',property:'danjbh',dataType:'baofdh'},
						{fieldType:'fieldLabel',property:'wuld',value:st_Rongqcbh},
						{fieldType:'fieldText',property:'shengqr',dataType:'laiy',maxLength:'10'},
                        {fieldType:'fieldText',property:'rongqxh',dataType:'letter_numeric',notNull:false,caption:'${i18n.cangk}',limitedLength:'5'},
                        //{fieldType:'fieldText',property:'gongysdm',dataType:'shuzzm',maxLength:'10',notNull:false,caption:'${i18n.zick}'},
                        //{fieldType:'fieldText',property:'chengysdm',dataType:'shuzzm',maxLength:'10',notNull:false,caption:'${i18n.zick}'},
						{fieldType:'fieldText',property:'diaobsj1',dataType:'date',maskOptions:{mask:'9999-99-99'}},
						{fieldType:'fieldText',property:'diaobsj2',dataType:'date',maskOptions:{mask:'9999-99-99'}},
						{fieldType:'fieldSelect',property:'zhuangt',internation:true,includeNull:true,src:'<%=request.getContextPath()%>/common/rongqbfdzt.do'}
			 		]
			 	});
			 	
			 
                
			 	$(document).keyboardsupport({});
			});
		</script>
	</head>
	<body>
		<div style="padding:20px;">
			<div id="title"></div>
			<div id="form_user_${pageId}" class="ui-fieldLayout">
			 	<table class="ui-grid" cellspacing="1" width="100%">
					<tbody>
						<tr>
							<td>${i18n.baofdh}:</td>
							<td><div class="ui-field" id="danjbh"></div></td>
							<td>${i18n.rongqiq}:</td>
							<td><div class="ui-field" id="wuld"></div></td>
							<td>${i18n.shenqr}:</td>
                            <td><div class="ui-field" id="shengqr"></div></td>
						</tr>
						<tr>
                            <td>${i18n.rongqxh}:</td>
                            <td><div class="ui-field" id="rongqxh"></div></td>
                            <td><%-- ${i18n.gongysdm}:--%>${i18n.baofsjd}:</td>
                            <td><%-- <div class="ui-field" id="gongysdm"></div>--%><div class="ui-field" id="diaobsj1"></div></td>
							<td><%-- ${i18n.wuls}:--%>${i18n.zhi}:</td>
							<td><%-- <div class="ui-field" id="chengysdm"></div>--%><div class="ui-field" id="diaobsj2"></div></td>
						</tr>
						<tr>
							<td>${i18n.zhuangt}:</td>
							<td><div class="ui-field" id="zhuangt"></div></td>
							<td></td>
							<td></td>
							<td></td>
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