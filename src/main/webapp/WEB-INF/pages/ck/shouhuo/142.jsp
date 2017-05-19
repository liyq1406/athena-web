<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","142");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_142 }</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
			$(function(){
				$('#grid_user_${pageId}').grid({
					keyFields:['uth','blh','chengysdm','chengysmc','xiehzt'],
					id:'grid_user_${pageId}',
					src:'<%=request.getContextPath()%>/shouhuo/14201.do',
					cols:[
						{property:'uth',caption:'${i18n.uth}'},
						{property:'blh',caption:'${i18n.blh}'},
						{property:'gongysdm',caption:'${i18n.gongysdm}'},
						{property:'gongysmc',caption:'${i18n.gongysmc}'},
						{property:'chengysdm',caption:'${i18n.chengysdm}'},
						{property:'chengysmc',caption:'${i18n.chengysmc}'},
						{property:'yanssj',caption:'${i18n.yanssj}'},
						{property:'cangkbh',caption:'${i18n.cangkbh}'},
						{properety:'xiehzt',cpation:'${i18n.xiehzt}'}
				    ],
				  buttons:[
			   	 	{name:'search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){	
			   	 	       $("#xuh input").val('');
			   	 	       $('#grid_user_${pageId}').grid('clearRecords');
			   	 	       //校验输入的参数 
			   	 	       	if(!$('#form_user_${pageId}').form("validateParam")){
 			                       return;
	 		                  }  
				             var starttime=new Date(($('#yanssj1 input').val()).replace(/-/g,"/"));
                             var endtime=new Date(($('#yanssj2 input').val()).replace(/-/g,"/"));
			                 if(endtime<starttime){
			                      showPromptMsg('red','${i18n.datetime_invalid}');
			                      return false;
			                    }	
				   	 		var params = $('#form_user_${pageId}').form("getFormParam");
				   	 		params.push("currentPage=1");
							//设置分页条件
							$('#grid_user_${pageId}').grid("setQueryParams", params);
				   	 		var url = "<%=request.getContextPath()%>/shouhuo/14201.do";
				 		    $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
					 			if (showPromptRequestMsg(results)==true){
					   	 		    if(results.result.response == '0000'){
	                                     $('#grid_user_${pageId}').grid('parseResult',results);
	                                      if (results.result.parameter.list.length > 0){
												$('#grid_user_${pageId}').grid('focus');
											}
										 $('#trxuh').show();
									  }
								}
							 });
				    		return false;
					}}
					,{name:'back',caption:'${i18n.back}[F11]'}
					,{name:'return',caption:'${i18n.return}[F12]'}
				]});
		
				$('#form_user_${pageId}').form({
				    onreload:true,
					fields:[
						{fieldType:'fieldText',property:'blh',dataType:'text',maxLength:'10'},
						{fieldType:'fieldText',property:'lingjbh',dataType:'letter_numeric',limitedLength:'10'},
						{fieldType:'fieldText',property:'uth',dataType:'daohdh'},
						{fieldType:'fieldText',property:'gongysdm',dataType:'letter_numeric',limitedLength:'10'},
						{fieldType:'fieldText',property:'chengysdm',dataType:'letter_numeric',limitedLength:'10'},
						{fieldType:'fieldText',property:'yanssj1',dataType:'date',maskOptions:{mask:'9999-99-99'}},
						{fieldType:'fieldText',property:'yanssj2',dataType:'date',maskOptions:{mask:'9999-99-99'}},
						{fieldType:'fieldText',property:'xuh',biaos:'enter',dataType:'positive',caption:'${i18n.xuh}'}
					]
				});
				
				 $('#xuh').bind('enter',function(){
					var rownum = $('#xuh .value').val();
		    		var params = $('#grid_user_${pageId}').grid('getSelectedByRowNum',rownum); 
    		        if (params.length < 1){
 			             showPromptMsg('red','${i18n.selectederror}');
			             return false;
 		               }
		 		     //去掉List[0];
				    for(i=0;i<params.length;i++){
						    params[i]=params[i].toString().replace("list[0].","");
				       }
		    	     //存放查询条件
				     var vQuery = $('#grid_user_${pageId}').grid('getQueryParams')
				     vQuery.push("currentPage=1");
				     $('#serachKey').val(vQuery);
                //页面数据提交并跳转，判断盘点方式，打开不同的查看页面
                    var  url = "<%=request.getContextPath()%>/shouhuo/14202.do";
						   $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
								 if (showPromptRequestMsg(results)==true){
									 if (results.result.response == "0000"){
											//加载返回数据
											var strJSON=JSON.stringify(results);
											$('#putvalue').val(strJSON);
											$("#putform").attr("action","<%=request.getContextPath()%>/shouhuo/P14201.do"+st_Params);
				    			    		document.putform.submit();
										 }
								 }
						 });
					});
		    		
			 	//加载时判断是否是回退
			$(document).ready(function(){
				if ( $('#serachKey').val()!=""){
					//为界面查询字段赋值
					var params = $('#serachKey').val().split(",");
					for(i=0;i<params.length;i++){
						var vParam = params[i].split("=");
						if (vParam[0].indexOf("blh") != -1){                   //bl号
							$('#blh input').val(vParam[1])
							continue;
						} else if (vParam[0].indexOf("uth") != -1){           //ut号
							$('#uth input').val(vParam[1])
							continue;
						} else if (vParam[0].indexOf("lingjbh") != -1){       //零件编号
							$('#lingjbh input').attr('realValue',vParam[1])
							continue;
						} else if (vParam[0].indexOf("gongysdm") != -1){        //供应商代码
							$('#gongysdm input').val(vParam[1])
							continue;
						}else if (vParam[0].indexOf("chengysdm") != -1){        //承运商代码
							$('#chengysdm input').val(vParam[1])
							continue;
						}else if (vParam[0].indexOf("yanssj1") != -1){        //验收时间1
							$('#yanssj1 input').val(vParam[1])
							continue;
						}else if (vParam[0].indexOf("yanssj2") != -1){        //验收时间2
							$('#yanssj2 input').val(vParam[1])
							continue;
						}
					}
				
					//加载列表数据
					$('#grid_user_${pageId}').grid("load",params);
					$('#trxuh').show();
					//设置分页条件
					$('#grid_user_${pageId}').grid("setQueryParams", params);
				}
			});
			
				$(document).keyboardsupport({});
			});
		</script>
		
	</head>
	<body>
    <input id="serachKey" name="serachKey" type="Hidden"></input>
			<form id="putform" method="post" name="putform">
				<input id="putvalue" name="putvalue" type="Hidden"></input>
			</form>  
		<div style="padding:20px;">
			<div id="title"></div>
			<div id="form_user_${pageId}" class="ui-fieldLayout">
				<table class="ui-grid" cellspacing="1" width="100%">
					<tbody>
						<tr>
							<td>${i18n.blh}</td>
							<td><div class="ui-field" id="blh"></div></td>
							<td>${i18n.gongysdm}</td>
							<td><div class="ui-field" id="gongysdm"></div></td>
							<td>${i18n.chengysdm}</td>
							<td><div class="ui-field" id="chengysdm"></div></td>
						</tr>
						<tr>
						    <td>${i18n.lingjbh}</td>
						    <td><div class="ui-field" id="lingjbh"></div></td>
							<td>${i18n.yanssj}</td>
							<td colspan="3"><div style="float: left;" class="ui-field" id="yanssj1"></div><div style="float: left;">-</div> <div class="ui-field" id="yanssj2"></div></td>	
						</tr>
						<tr id="trxuh" style="display:none;">
							<td colspan="2" align="right">${i18n.xuh}</td>
							<td colspan="4"><div class="ui-field" id="xuh"></div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div id="grid_user_${pageId}"></div>		
		<div id='prompt'>${i18n.prompt}</div>
	  </div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>