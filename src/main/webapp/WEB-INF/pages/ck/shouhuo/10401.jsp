<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","10401");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_10401 }</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
		var temp = [];
		temp.push("elh="+'<%=request.getParameter("elh")%>');
		temp.push("cangkbh="+st_Cangkbh);
			$(function(){
				$('#form_user_${pageId}').form({
					fields:[
						{fieldType:'fieldHidden',property:'uth'},
						{fieldType:'fieldHidden',property:'uah'},
						{fieldType:'fieldLabelInput',property:'yaohlh'},
						{fieldType:'fieldLabelInput',property:'lingjbh'},
						{fieldType:'fieldLabelInput',property:'lingjmc'},
						{fieldType:'fieldText',property:'lingjsl',dataType:'dbnumber'},
						{fieldType:'fieldLabelInput',property:'gongysdm'},
						{fieldType:'fieldLabelInput',property:'gongysmc'},
						{fieldType:'fieldText',property:'uaxh',dataType:'letter_numeric',limitedLength:'5',notNull:true,caption:'${i18n.uaxh}'},
						{fieldType:'fieldText',property:'ucxh',dataType:'text',maxLength:'5',caption:'${i18n.ucxh}'},
						{fieldType:'fieldText',property:'uchl',dataType:'dbnumber',caption:'${i18n.uchl}'},
						{fieldType:'fieldText',property:'ucgs',dataType:'positive',maxLength:'5',caption:'${i18n.ucgs}'},
						{fieldType:'fieldText',property:'shixrq',dataType:'date',maskOptions:{mask:'9999-99-99'},caption:'${i18n.shixrq}'},
						{fieldType:'fieldLabelInput',property:'pich',dataType:'text',maxLength:'12',notNull:true,caption:'${i18n.pich}'},
						<%-- {fieldType:'fieldSelect',property:'guz',caption:'${i18n.guzlx}',src:'<%=request.getContextPath()%>/common/guzlx.do'},
						{fieldType:'fieldLabelInput',property:'wulgz',dataType:'text',maxLength:'200',notNull:true,caption:'${i18n.guzlx}'}, --%>
						{fieldType:'fieldLabelInput',property:'caozy',defaultValue:'${userName}',dataType:'laiy',maxLength:'10'},
						{fieldType:'fieldText',property:'yansy',dataType:'laiy',maxLength:'10',caption:'${i18n.yansy}'},
						{fieldType:'fieldText',biaos:'enter',property:'shijljbh',dataType:'letter_numeric',caption:'${i18n.shijljbh}',limitedLength:'10'},
						{fieldType:'fieldText',property:'suifljmc',caption:'${i18n.lingjmc}',limitedLength:'40'},							
						{fieldType:'fieldHidden',property:'baozzt'}
					]
				});
	            /*  //将下拉框中选中的故障类型显示在文本框中便于提交
         	     var display=[];
				 $("#guz .value").bind("keydown",function(event){
			 		if(event.keyCode == 13){
			 			var v =  $("#guz input").attr("realValue");
			 			if(v != ""){
			 				var flag = true;
				 			for(var i = 0 ; i < display.length ; i++){
				 				if(display[i] == v){
				 					display.splice(i,1);				 					
				 					flag = false;
				 					break;
				 				}
				 			}
			 			if(flag) display.push(v);
			 			$('#wulgz span').html(display.join(','));
			 			$('#wulgz input').val(display.join(','));
			 		   }
			 	    }
			 	}); */
			 	
			 	
			 	//按零件编号查询
			 	$('#shijljbh').bind('enter',function (){
			 		if(!$('#shijljbh').fieldText('validateNotNull')){
			 			return;
			 		}	 		
			 		var params = [];
			 		params.push("lingjbh="+$('#shijljbh input').val());
			 		
					var url = "<%=request.getContextPath()%>/common/querySjljmc.do";
						 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
                                     if (showPromptRequestMsg(results)==true){
						 			       if(results.result.response=="0001"){
							 			          $('#suifljmc input').val(results.result.parameter.suifljmc);
							                 }
							            }	
							 });
			 	});
			 	
			 $('#btn_submit').bind('click',function(){
				if(!$('#form_user_${pageId}').form("validateParam")){
					return;
				   }
				var params = $('#form_user_${pageId}').form("getFormParam");
				params.push("elh="+'<%=request.getParameter("elh")%>');
	       	    var url = "<%=request.getContextPath()%>/shouhuo/10305.do";
		        $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			     if (showPromptRequestMsg(results)==true){

					$("#putform").attr("action","<%=request.getContextPath()%>/shouhuo/104.do"+st_Params+'&'+temp.join('&'));
					document.putform.submit();  

			        }
			        return false;
			     });	
			});		

			
			$('#btn_refuse').bind('click',function(){
				if(!$('#form_user_${pageId}').form("validateParam")){
		     		return;
		     	}
		     	if(3==$('#baozzt input').val()){
			     	showPromptMsg('red','${i18n.uayjs}');
			     	return;
		     	}
	     	    var params=[];
	    		params.push("uah="+$('#uah input').val());
	    		params.push("uth="+$('#uth input').val());
	    		params.push("elh="+'<%=request.getParameter("elh")%>');
	    		var url = "<%=request.getContextPath()%>/shouhuo/10303.do";
				 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
				 			if (showPromptRequestMsg(results)==true){
				 		          if(results.result.response != 'C_1403'){	
									//加载返回数据
									var strJSON=JSON.stringify(results);
									$('#putvalue').val(strJSON);
									$("#putform").attr("action","<%=request.getContextPath()%>/shouhuo/P10402.do"+st_Params+'&'+ params.join('&')+'&'+temp.join('&'));
		    			    		document.putform.submit();
		    			    	 }
							 }
				 	});

			});
			$('#btn_back').bind('click',function(){
				$("#putform").attr("action","<%=request.getContextPath()%>/shouhuo/104.do"+st_Params+'&'+temp.join('&'));
				document.putform.submit();
		
		   });
			
		$(document).keyboardsupport({});
		  //页面加载后，查询数据为界面赋值
	    $(document).ready(function(){
	    	var parameter = ${result.result.parameter};
				//加载返回数据
                $('#uth input').val(parameter.uth);
                $('#uah input').val(parameter.uah);
                $('#uaxh input').val(parameter.uaxh);
                $('#ucxh input').val(parameter.ucxh);
                $('#uchl input').val(parameter.uchl);
                $('#ucgs input').val(parameter.ucgs);
                $('#lingjsl input').val(parameter.lingjsl);
                $('#yaohlh input').val(parameter.yaohlh);
                $('#yaohlh span').html(parameter.yaohlh);
                $('#pich input').val(parameter.pich);
                $('#pich span').html(parameter.pich); 
                $('#lingjbh input').val(parameter.lingjbh);
                $('#lingjbh span').html(parameter.lingjbh);
                $('#lingjmc input').val(parameter.lingjmc);
                $('#lingjmc span').html(parameter.lingjmc);
                $('#gongysdm input').val(parameter.gongysdm);
                $('#gongysdm span').html(parameter.gongysdm);
                $('#gongysmc input').val(parameter.gongysmc);
                $('#gongysmc span').html(parameter.gongysmc);
                $('#baozzt input').val(parameter.baozzt);
                $('#yansy input').val(parameter.yansy);
             /*   	$('#wulgz input').val(parameter.wulgz);
                $('#wulgz span').html(parameter.wulgz);
			    $('#shixrq input').val(parameter.shixrq);
			    var aa=parameter.wulgz;
			    if("" != aa){
				    var bb=aa.split(',');
					for(var i=0;i<bb.length;i++){
						display.push(bb[i])
					}
			    } */

			});
		});
     </script>
	</head>
	<body>
		<div style="padding:20px;">
			<div id="title"></div>
			<form id="putform" method="post" name="putform">
				<input id="putvalue" name="putvalue" type="Hidden"></input>
			</form> 
			<form name="myForm" action="" method="post">
			<div id="form_user_${pageId}" class="ui-fieldLayout">
				<table class="ui-grid" cellspacing="1" width="100%">
					<tbody>
						<tr>
							<td>${i18n.lingjbh}</td>
							<td><div class="ui-field" id="lingjbh"></div></td>
							<td>${i18n.lingjmc}</td>
							<td><div class="ui-field" id="lingjmc"></div></td>
							<td>${i18n.gongysdm}</td>
							<td><div class="ui-field" id="gongysdm"></div></td>		
							<td>${i18n.gongysmc}</td>
							<td><div class="ui-field" id="gongysmc"></div></td>
						</tr>
						<tr>
							<td>${i18n.yaohlh}</td>
							<td><div class="ui-field" id="yaohlh"></div></td>
							<td>${i18n.caozy}</td>
							<td><div class="ui-field" id="caozy"></div></td>
							<td>${i18n.pich}</td>
							<td><div class="ui-field" id="pich"></div></td>	
							<td>${i18n.shixq}</td>
							<td><div class="ui-field" id="shixrq"></div></td>	
									
						</tr>
						<tr>
							<td>${i18n.yanssl}</td>
							<td><div class="ui-field" id="lingjsl"></div></td>
							<td>${i18n.uaxh}</td>
							<td><div class="ui-field" id="uaxh"></div></td>	
							<td>${i18n.yansy}</td>
							<td><div class="ui-field" id="yansy"></div></td>
							<td>${i18n.ucgs}</td>
							<td><div class="ui-field" id="ucgs"></div></td>					
						</tr>
						<tr>
						   	<td>${i18n.ucxh}</td>
							<td><div class="ui-field" id="ucxh"></div></td>
							<td>${i18n.uchl}</td>
							<td><div class="ui-field" id="uchl"></div></td>		
							
							<td>${i18n.shijljbh}</td>
							<td><div class="ui-field" id="shijljbh"></div></td> 
							
							
							<td>${i18n.lingjmc}</td>
							<td><div class="ui-field" id="suifljmc"></div></td> 	
							
							<%-- <td>${i18n.guzlx}</td>
							<td colspan="2"><div class="ui-field" style="float: left;" id="guz"></div> <div id="wulgz" style="float: left" class="ui-field"></div></td>		 --%>
					    </tr>
					</tbody>
				</table>
			<div class="ui-field" id="uth"></div>
			<div class="ui-field" id="uah"></div>
			<div class="ui-field" id="baozzt"></div>
			<div>
			<table class="ui-grid" cellspacing="1" width="100%">
				<tbody>
					<tr>
						<td align="right">
						<div>
							<span id="btn_submit" class="ui-button">${i18n.ok }[F3]</span>
							<span id="btn_refuse" class="ui-button">${i18n.refuse }[F6]</span>
							<span id="btn_back" class="ui-button">${i18n.back }[F11]</span>
							<span id="btn_return" class="ui-button">${i18n.return }[F12]</span>
						</div>
						<td>
					</tr>
					</tbody>
				</table> 
			</div>
			</div>
			
		</form>
		<div id='prompt'>${i18n.prompt}</div>
	</div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>