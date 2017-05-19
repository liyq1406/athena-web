<%@ page language="java" pageEncoding="UTF-8"%>
<%request.setAttribute("pageId","320");%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_320}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
		var ush_state = 0;//是否输入了ush
		var kehlist = "";
		$(function(){
			 	$('#form_user_${pageId}').form({
			 		onreload:true,
			 		url:'<%=request.getContextPath()%>/beihuo/32003.do',
			 		fields:[
		 		        {fieldType:'fieldText',biaos:'enter',property:'beihybh',dataType:'beihybh',value:st_UserName},
		 		        //huxy_11463 多个消耗点时不显示客户
		 			    {fieldType:'fieldSelect',property:'keh',isExistCheck:false,dataType:'cekeh',notNull:true,caption:'${i18n.keh}'},
						{fieldType:'fieldText',biaos:'enter',property:'ush',dataType:'ush',notNull:true,caption:'${i18n.ush}'},
						{fieldType:'fieldText',property:'uclx',dataType:'letter_numeric',limitedLength:'5',notNull:true,caption:'${i18n.kehbz}'},
						{fieldType:'fieldText',property:'shifsl',dataType:'dbnumber',notNull:true,caption:'${i18n.shifsl}'},
						{fieldType:'fieldLabel',property:'lingjbh'},
						{fieldType:'fieldLabel',property:'lingjmc'},
						{fieldType:'fieldLabel',property:'gongysdm'},
						{fieldType:'fieldLabel',property:'gongysmc'}
			 		]
			 	});
			 	
			 	//按备货员编号查询客户
 			 	$('#beihybh').bind('enter',function(){
 			 		//参数校验 
 			 		if(!$('#beihybh').fieldText('validate')){
 			 			$("#keh").fieldSelect("setValue","");
 			 			return;
 			 		}
 			 		var params = [];
 			 		var beihybh = $('#beihybh input').val();
			 		if(beihybh){
			 			params.push('beihybh='+ beihybh);
			 		}else{
			 			params.push('beihybh=${userName}');
			 		}
			 		
                    var url="<%=request.getContextPath()%>/beihuo/32001.do";
                    $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
                    	 if (showPromptRequestMsg(results)){
                             $("#keh").fieldSelect("setValue",results.result.parameter.keh);
                         }else{
                             $("#keh").fieldSelect("setValue","");
                         }
                    });
			    });
			 	
 			 	//按US查询
 			 	$('#ush').bind('enter',function(){
		 			//参数校验
			 		if(!$('#beihybh').fieldText('validate')||!$('#ush').fieldText('validate')){
                        $("#lingjbh").fieldLabel("setValue","");
                        $("#uclx").fieldText("setValue","");
                        $("#gongysdm").fieldLabel("setValue","");
                        $("#gongysmc").fieldLabel("setValue","");
                        $("#lingjmc").fieldLabel("setValue","");
			 			return;
		 			}
			 		var params = [];
			 		var beihybh = $('#beihybh input').val();
			 		var keh = $('#keh input').val();
			 		var ush = $('#ush input').val();
			 		if(beihybh){
			 			params.push('beihybh='+ beihybh);
			 		}else{
			 			params.push('beihybh=${userName}');
			 		}
			 		params.push("keh=" + keh);
			 		params.push("ush=" + ush);
                    var url="<%=request.getContextPath()%>/beihuo/32002.do";
                    $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
                    	if (showPromptRequestMsg(results)){
                            $("#lingjbh").fieldLabel("setValue",results.result.parameter.lingjbh);
                            $("#uclx").fieldText("setValue",results.result.parameter.uclx);
                            $("#gongysdm").fieldLabel("setValue",results.result.parameter.gongysdm);
                            $("#gongysmc").fieldLabel("setValue",results.result.parameter.gongysmc);
                            $("#lingjmc").fieldLabel("setValue",results.result.parameter.lingjmc);
                            $("#shifsl").fieldText("setValue",results.result.parameter.shifsl);
                            //huxy_11463 多个消耗点时不显示客户
                            if(1 == results.result.parameter.yaohlgs){ 
                            //rencong_11463
                            	$('#keh').fieldSelect('clearSelect');    
                            	$("#keh input").val(results.result.parameter.keh);
                            	$('#keh input').attr('realValue',results.result.parameter.keh);
                            	  
                            }else{
                                kehlist = results.result.parameter.xiaohdList;
								//客户为空，表示有多消耗点
								$('#keh').fieldSelect('resetUrl','<%=request.getContextPath()%>/common/getKeh.do?kehlist='+kehlist);
                            }      
                        }else{
                            $("#lingjbh").fieldLabel("setValue","");
                            $("#uclx").fieldText("setValue","");
                            $("#shifsl").fieldText("setValue","");
                            $("#gongysdm").fieldLabel("setValue","");
                            $("#gongysmc").fieldLabel("setValue","");
                            $("#lingjmc").fieldLabel("setValue","");
                        }
                    });
			    });
 			 	
			 	//F3确认出库
			 	$('#btn_submit').bind('click',function(){
			 		//验证整个表单
			 		if(!$('#form_user_${pageId}').form("validateParam")){
			 			return;
			 		}
			 		var params = $('#form_user_${pageId}').form("getFormParam");
			 		var beihybh = $('#beihybh input').val();
			 		if(!beihybh){
			 			params[0] = 'beihybh=${userName}';
			 		}
			 		$('#form_user_${pageId}').form('submit',params,function(results){
			 			if (showPromptRequestMsg(results)){
			 			   //$('#form_user_${pageId}').form('clearValue');
			 			   $("#lingjbh").fieldLabel("setValue","");
                            $("#uclx").fieldText("setValue","");
                            $("#shifsl").fieldText("setValue","");
                            $("#gongysdm").fieldLabel("setValue","");
                            $("#gongysmc").fieldLabel("setValue","");
                            $("#lingjmc").fieldLabel("setValue","");
                            $("#ush").fieldText("setValue","");
                        }
			 		});
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
							<td>${i18n.beihybh}:</td>
							<td><div class="ui-field" id="beihybh"></div></td>
							<td>${i18n.chuklx}:</td>
							<td>E</td>
							<td>${i18n.ush}:</td>
							<td><div class="ui-field" id="ush"></div></td>
						</tr>
						<tr>
							<td>${i18n.keh}:</td>
							<td><div class="ui-field" id="keh"></div></td>
							<td>${i18n.kehbz}:</td>
							<td><div class="ui-field" id="uclx"></div></td>
							<td>${i18n.shifsl}:</td>
							<td><div class="ui-field" id="shifsl"></div></td>
						</tr>
						<tr>
							<td>${i18n.lingjh}:</td>
							<td><div class="ui-field" id="lingjbh"></div></td>
							<td>${i18n.lingjmc}:</td>
							<td><div class="ui-field" id="lingjmc"></div></td>
						</tr>
						<tr>
							<td>${i18n.gongysdm}:</td>
							<td><div class="ui-field" id="gongysdm"></div></td>
							<td>${i18n.gongysmc}:</td>
							<td><div class="ui-field" id="gongysmc"></div></td>
							<td></td>
							<td align="right"><div><span id="btn_submit" class="ui-button">${i18n.querck}[F3]</span>
							<span id="btn_back"  class="ui-button">${i18n.back}[F11]</span>	
							<span id="btn_return" class="ui-button">${i18n.return}[F12]</span></div></td>
						</tr>
					</tbody>
				</table> 
			</div>
			<br/>
			<div id='prompt'>${i18n.prompt}</div>
		</div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>