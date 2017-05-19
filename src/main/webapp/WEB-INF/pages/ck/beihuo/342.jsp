<%@ page language="java" pageEncoding="UTF-8"%>
<%request.setAttribute("pageId","342");%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_342}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
			$(function(){
				$('#grid_user_${pageId}').grid({
					keyFields:['cangkbh','ush','ucgs','gongysdm','kuwbh','zickbh','lingjsl','danw','elh','pich','rukrq','shixrq','baozztxx','keyljsl','zhuangtsx'],
					id:'grid_user_${pageId}',
					//查询交易
					src:'<%=request.getContextPath()%>/beihuo/34201.do',
					cols:[
						{property:'cangkbh',caption:'${i18n.cangkbh}',width:'40'},
						{property:'ush',caption:'${i18n.ush}',width:'40'},
						{property:'ucgs',caption:'${i18n.ucgs}',width:'40'},
						{property:'gongysdm',caption:'${i18n.gongysdm}',width:'40'},
						{property:'kuwbh',caption:'${i18n.kuw}',width:'40'},
						{property:'zickbh',caption:'${i18n.zickh}',width:'40'},
						{property:'lingjsl',caption:'${i18n.shul}',width:'40'},
						{property:'danw',caption:'${i18n.lingjdw}',width:'40'},
						{property:'elh',caption:'${i18n.elh}',width:'40'},
						{property:'pich',caption:'${i18n.pich}',width:'40'},
						//{property:'ruklx',caption:'${i18n.ruklx}',internation:true,width:'40'},
						{property:'rukrq',caption:'${i18n.ruksj}',width:'40'},
						{property:'shixrq',caption:'${i18n.shixrq}',width:'40'},
						{property:'baozztxx',caption:'${i18n.baozzt}',internation:true,width:'40'},
						{property:'keyljsl',caption:'${i18n.keykcsl}',width:'40'},
						{property:'zhuangtsx',caption:'${i18n.zhuangtsx}',internation:true,width:'40'}

					],
					buttons:[
						//F1查询
				   	 	{name:'search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
				   	 	    //参数校验
                            if(!$('#form_user_${pageId}').form("validateParam")){
                            	$('#grid_user_${pageId}').grid('clearRecords');
                                return;
                            }
				   	 	    
                            //范围校验
                            if(!validRangeData("date", $('#rukrq1 input').val(), $('#rukrq2 input').val())){
                                $('#rukrq1 input').focus();
                                $('#rukrq1 input').removeClass('validate-success').addClass('validate-error');
                                return;
                            }
                            
                            var params = $('#form_user_${pageId}').form("getFormParam");                          
                            params.push('currentPage=1');
                            //设置分页条件
				           $('#grid_user_${pageId}').grid("setQueryParams", params);
                           $('#grid_user_${pageId}').grid("load",params);
                           $('#btn_export').show();
                            
						}},
						 //huxy_11459
					 	  {name:'print',caption:'${i18n.print}[F2]',keyboard:'F2',action:function(){
							var params = $('#form_user_${pageId}').form("getFormParam");
							//huxy_11522
                            var cangkbh = $('#cangkbh').val();
                            if(""==cangkbh)
                            {
                            	params.splice(0,1);
                            	params.push("cangkbh="+st_Cangkbh);
                            }
							var records = $('#grid_user_${pageId}').grid("getRecordAll");
							params=params.concat(records);
					 		var url = "<%=request.getContextPath()%>/beihuo/34203.do";
					 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
					 		if (showPromptRequestMsg(results)==true){
									  
							}});
				    		return false;
				     	}},
						//F8导出
				   	 	{name:'export',caption:'${i18n.export}[F8]',keyboard:'F8',action:function(){
				   	 	    if(!$('#cangkbh').fieldSelect("validateNotNull")){
						 			return;
						    }
						    msgClear();
				   	 	    $('#btn_export').hide();
				   	 	    $('#baozzt1 input').val($("#baozzt input").attr("realValue"));
				   	 	    $('#zhuangtsx1 input').val($("#zhuangtsx input").attr("realValue"));
	                        if(!$('#form_user_${pageId}').form("validateParam")){
	                                return;
	                        }
	                        var dclx = $("#daoclx input").val();
					   	 	$("#daoclx input").val($("#daoclx input").attr("realValue"));
                            $("#putform").attr("action","<%=request.getContextPath()%>/beihuo/34202.do");
                            document.putform.submit();
                            $("#daoclx input").val(dclx);
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
			 	 onemoredemand:true,
			 		fields:[
						{fieldType:'fieldText',property:'lingjbh',caption:'${i18n.lingjh}',dataType:'letter_numeric',limitedLength:'10'},
                        {fieldType:'fieldText',property:'gongysdm',dataType:'letter_numeric',limitedLength:'10'},
                        {fieldType:'fieldSelect',property:'cangkbh',caption:'${i18n.cangk}',src:'<%=request.getContextPath()%>/common/wareHouse.do',includeNull:true},
                        {fieldType:'fieldText',property:'zickbh',dataType:'letter_numeric',caption:'${i18n.zick}',limitedLength:'3'},
                        {fieldType:'fieldSelect' , property:'paixfs',caption:'${i18n.paixfs}',includeNull:true,internation:true,src:'<%=request.getContextPath()%>/common/paixfs2.do'},
						{fieldType:'fieldText',property:'rukrq1',dataType:'date',maskOptions:{mask:'9999-99-99'}},
						{fieldType:'fieldText',property:'rukrq2',dataType:'date',maskOptions:{mask:'9999-99-99'}},
						{fieldType:'fieldSelect',property:'baozzt',caption:'${i18n.baozzt}',includeNull:true,internation:true,src:'<%=request.getContextPath()%>/common/baozzt.do'},
						{fieldType:'fieldSelect',property:'zhuangtsx',caption:'${i18n.zhuangtsx}',includeNull:true,internation:true,src:'<%=request.getContextPath()%>/common/zhuangtsx.do'},
						{fieldType:'fieldSelect',property:'daoclx',caption:'${i18n.daoclx}',notNull:true,value:'Text',realValue:'0',src:'<%=request.getContextPath()%>/common/daoclx.do'},
						{fieldType:'fieldHidden',property:'zhuangtsx1'},
						{fieldType:'fieldHidden',property:'baozzt1'},
			 		]
			 	});
			 	$('#btn_export').hide();
			 	$(document).keyboardsupport({});
			});
		</script>
	</head>
	<body>
		<div style="padding:20px;">
			<div id="title"></div>
			<form id="putform" method="post" name="putform" >
			<div id="form_user_${pageId}" class="ui-fieldLayout">
			 	<table class="ui-grid" cellspacing="1" width="100%">
					<tbody>
						<tr>
						   	<td>${i18n.cangk}:</td>
							<td><div class="ui-field" id="cangkbh"></div></td>
							<td>${i18n.zick}:</td>
							<td><div class="ui-field" id="zickbh"></div></td>
							<td>${i18n.lingjh}:</td>
							<td><div class="ui-field" id="lingjbh"></div></td>
							<td>${i18n.gongysdm}:</td>
							<td><div class="ui-field" id="gongysdm"></div></td>
						</tr>
						<tr>
							<td>${i18n.ruksj}:</td>
							<td><div class="ui-field" id="rukrq1"></div></td>
							<td>${i18n.zhi}:</td>
							<td><div class="ui-field" id="rukrq2"></div></td>
							<td>${i18n.baozzt}:</td>
							<td><div class="ui-field" id="baozzt"></div></td>
							<td>${i18n.zhuangtsx}:</td>
							<td><div class="ui-field" id="zhuangtsx"></div></td>
					    </tr>
					    <tr>
					        <td>${i18n.paixfs}:</td>
							<td><div class="ui-field" id="paixfs"></div></td>
							<td>${i18n.daoclx}:</td>
							<td><div class="ui-field" id="daoclx"></div></td>
							<td><div class="ui-field" id="baozzt1"></div></td>
							<td><div class="ui-field" id="zhuangtsx1"></div></td>
						</tr>
					</tbody>
				</table> 
			</div>
			</form>
			<br></br>
			<div id="grid_user_${pageId}"></div>
			<br></br>
			<div id='prompt'>${i18n.prompt}</div> 
		</div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>