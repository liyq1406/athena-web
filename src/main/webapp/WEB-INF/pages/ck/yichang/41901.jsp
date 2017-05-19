<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","41901");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_41901}</title>
<jsp:include page="../../common/js.jsp" />
<script type="text/javascript">
var paramsQuery;
var currentPage = 1;
$(function(){
	$('#form_user_${pageId}').form({
 		fields:[
                {fieldType:'fieldLabel',property:'fanxdh'},
                {fieldType:'fieldLabel',property:'lingjbh'},
                {fieldType:'fieldLabel',property:'lingjmc'},
                {fieldType:'fieldText',property:'ruksl',dataType:'dbnumber',caption:'${i18n.ruksl}',notNull:true},
                {fieldType:'fieldText',biaos:'enter',property:'rongqsl',dataType:'dbnumber',caption:'${i18n.baozgs}',notNull:false},
                {fieldType:'fieldText',property:'pich',maxLength:'12',caption:'${i18n.pich}'},
                {fieldType:'fieldText',property:'shixq',dataType:'date',maskOptions:{mask:'9999-99-99'},caption:'${i18n.shixq}'},
                {fieldType:'fieldLabel',property:'gongysdm'},
                {fieldType:'fieldLabel',property:'gongysmc'},
                {fieldType:'fieldLabel',property:'danw'},
                {fieldType:'fieldLabel',property:'jinz'},
                {fieldType:'fieldLabel',property:'maoz'},
                {fieldType:'fieldSelect',property:'ckandzick',dataType:'letter_numeric',limitedLength:'3',limitedLength2:'6',caption:'${i18n.zickbh}',
                	notNull:true,src:'<%=request.getContextPath()%>/common/wareHouseLjck.do'+'?lingjbh=${result.result.parameter.lingjbh}'},
                {fieldType:'fieldLabel',property:'druksl'},
                {fieldType:'fieldText',property:'chengysdm',dataType:'letter_numeric',limitedLength:'10',caption:'${i18n.chengysdm}',notNull:true},
                {fieldType:'fieldText',property:'usxh',dataType:'letter_numeric',limitedLength:'5',caption:'${i18n.usxh}',notNull:true},
                {fieldType:'fieldText',property:'ucxh',dataType:'letter_numeric',limitedLength:'5',caption:'${i18n.ucxh}',notNull:true},
                {fieldType:'fieldHidden',property:'elh'}
	 			]
 		});
	//页面加载后，查询数据为界面赋值
	$(document).ready(function(){
		//加载返回数据
		$('#fanxdh span').html('${result.result.parameter.fanxdh}');
		$('#druksl span').html('${result.result.parameter.druksl}');
		$('#lingjbh span').html('${result.result.parameter.lingjbh}');
		$('#lingjmc span').html('${result.result.parameter.lingjmc}');
		$('#gongysdm span').html('${result.result.parameter.gongysdm}');
		$('#gongysbhhid').val('${result.result.parameter.gongysdm}');
		$('#gongysmc span').html('${result.result.parameter.gongysmc}');
		$('#chengysdm input').val('${result.result.parameter.chengysdm}');
		$('#danw span').html('${result.result.parameter.danw}');
		$('#lingjsl').val('${result.result.parameter.lingjsl}');
		$('#fanxrkdh').val('${result.result.parameter.fanxrkdh}');
		$('#zhijsj').val('${result.result.parameter.zhijsj}');
		$('#elh input').val('${result.result.parameter.elh}');
		var cangkbh = '${result.result.parameter.cangkbh}';
		var chengysdm = '${result.result.parameter.chengysdm}';
		var fanxsl = '${result.result.parameter.fanxsl}';
		
		if(fanxsl!="0"){//待入库数量
			//if (cangkbh != ""){
				$('#ckandzick input').val(cangkbh);
				$('#ckandzick input').attr("realValue",cangkbh);
				$('#ckandzick input').attr("readonly",true);
			//}
		}
		
		if (chengysdm != ""){
			$('#chengysdm input').attr("readonly",true);
		}
		//加载返回数据
		var params = $('#form_user_${pageId}').form("getFormParam");
		$('#grid_user_${pageId}').grid("setQueryParams", params);
	});
	//根据输入UC号带出 ,零件编号,零件名称，供应商编号，供应商名称，申报点，批次号，EL号
 	$('#rongqsl').bind('enter',function (){
 		if(!$('#rongqsl').fieldText('validateNotNull')){
 			return;
 		}
 		if(!$('#ruksl').fieldText('validateNotNull')){
 			return;
 		}
 		if(!$('#ckandzick').fieldSelect('validateNotNull')){
 			return;
 		}
/*  		if(!$('#chengysdm').fieldText('validateNotNull')){
 			return;
 		} */
 		var params = $('#form_user_${pageId}').form("getFormParam");
 		
			 var url = "<%=request.getContextPath()%>/yichang/41903.do";
			 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
				 if(results.result.response=="P41901_204"){
					 if($('#ckandzick input').val()==""){
						 showPromptMsg('red','${i18n.qxzckh}');
						 return;
					 }
				 }
				 if (showPromptRequestMsg(results)==true){
					 //赋值
					// $('#lingjbh input').val(results.result.parameter.lingjbh);
					 $('#grid_user_${pageId}').grid("parseResult",results)
					 $('#usxh input').val(results.result.parameter.usxh)
					 $('#ucxh input').val(results.result.parameter.ucxh)
				 }
				 });
 	});
	//F1确定
 	$('#btn_ok').bind('click',function(){
 	//0012427 rencong
 	if($('#btn_ok').attr("disabled")){
 		return;
 	}

 	//校验是否批次及失效期
 	var  params3=[];
 	params3.push("lingjbh="+$('#lingjbh span').html());
 	params3.push("gongysdm="+$('#gongysdm span').html());
 	 var url4 = "<%=request.getContextPath()%>/common/pcsxq.do";
 	 $('#form_user_${pageId}').form("submitUrl", params3, url4, function(results){
 		if (showPromptRequestMsg(results)==true){
 		         if("1" === results.result.parameter.shifsxgl){
 		            if(!$('#shixq').fieldText('validateNotNull')){
				 			return;
				 	  }
 		         
 		           }
	 		     if("1" === results.result.parameter.shifyzpch){
 		            if(!$('#pich').fieldText('validateNotNull')){
				 			return;
				 	 }
 		           }
		     }
		     //是否选中
				var records = $('#grid_user_${pageId}').grid('getRecordAll');
				if(records.length==0){
					if(!$('#rongqsl').fieldText('validateNotNull')){
			 			return;
			 		}
			 		if(!$('#ruksl').fieldText('validateNotNull')){
			 			return;
			 		}
			 		if(!$('#ckandzick').fieldSelect('validateNotNull')){
			 			return;
			 		}
			 		showPromptMsg('red','${i18n.baozhuic}')
			 		return false;
				}
				if(records.length < 1){
					showPromptMsg('red','${i18n.selecterror}')
					return false;
				}
		 		if(!$('#form_user_${pageId}').form("validateParam")){
					return;	
				}
				var cangkh=$('#ckandzick input').val();
			 		var cangkbh=cangkh.substr(0,3);
			 		var params2 = [];
					 var url2 = "<%=request.getContextPath()%>/common/wareHouse.do";
					 g_isSub=0;
					 $('#form_user_${pageId}').form("submitUrl", params2, url2, function(results){
						 showPromptMsg('blue','');
						 var size=results.result.parameter.list.length;
						 var id=0;
						 for(var i=0;i<size;i++){
							 if(cangkbh!=results.result.parameter.list[i].value){
								 	id=0;
							 }else{
								 id=1;
								 break;
							 }
						 }
						 if(id==0){
							 $('#grid_user_${pageId}').grid('clearRecords');
							 showPromptMsg('red','${i18n.C_C_cuowckh}')
							  return;
						 }else{
						 		$('#btn_ok').attr("disabled",true);
						 		 //提交数据
						 		
						 		var params = $('#grid_user_${pageId}').grid('getRecordAll');
						 		params.push("fanxdh="+$('#fanxdh span').html());
						 		params.push("lingjbh="+$('#lingjbh span').html());
						 		params.push("lingjmc="+$('#lingjmc span').html());
						 		params.push("ruksl="+$('#ruksl input').val());
						 		params.push("lingjsl="+$('#lingjsl').val());
						 		params.push("rongqsl="+$('#rongqsl input').val());
						 		params.push("druksl="+$('#druksl span').html());
						 		params.push("pich="+$('#pich input').val());
						 		params.push("shixq="+$('#shixq input').val());
						 		params.push("gongysdm="+$('#gongysbhhid').val());
						 		params.push("gongysmc="+$('#gongysmc span').html());
						 		params.push("danw="+$('#danw span').html());
						 		params.push("jinz="+$('#jinz span').html());
						 		params.push("ckandzick="+$('#ckandzick input').val());
						 		params.push("chengysdm="+$('#chengysdm input').val());
						 		params.push("maoz="+$('#maoz span').html());
						 		params.push("fanxrkdh="+$('#fanxrkdh').val());
						 		params.push("rongqxh="+$('#usxh input').val());
						 		params.push("zhijsj="+$('#zhijsj').val());
						 		params.push("elh="+$('#elh input').val());
						 		//params = params.concat(records);
						 		$('#grid_user_${pageId}').grid("setQueryParams", params);
						 		var url = "<%=request.getContextPath()%>/yichang/41902.do";
						 		g_isSub=0;
								 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
									 if (showPromptRequestMsg(results)==true){
										 if (results.result.response == "0000"){
										 		st_BackCount = 2;
												//加载返回数据
												var strJSON=JSON.stringify(results);
												$('#putvalue').val(strJSON);
												$("#putform").attr("action","<%=request.getContextPath()%>/yichang/4190202.do"+st_Params+"&st_backCount=2");
									    		document.putform.submit();
										 }
									 }
									 });
						 }
					 });
				 		return false;
		 	}); 
	   });
 		
	$('#grid_user_${pageId}').grid({
		keyFields:['usxh','usrl','lingjsl','ucxh','ucgs','ucrl'],
		id:'grid_user_${pageId}',
		showCheckbox:false,
		//翻页查询交易
		src:'<%=request.getContextPath()%>/yichang/41905.do',
		cols:[
		{property:'usxh',caption:'${i18n.usxh}',align:'center'},
		{property:'usrl',caption:'${i18n.usrl}',align:'center'},
		{property:'lingjsl',caption:'${i18n.lingjsl}',align:'center',editor:'fieldText',dataType:'lingjsl'},
		{property:'ucxh',caption:'${i18n.ucxh}',align:'center'},
		{property:'ucgs',caption:'${i18n.ucgs}',align:'center',editor:'fieldText',dataType:'ucgs'},
		{property:'ucrl',caption:'${i18n.ucrl}',align:'center'}
		
  		]
	});
 	$(document).keyboardsupport({});
});
</script>
</head>
<body>
<div style="padding:20px;">
<!--主体内容开始-->
<div id="title"></div>
<input id="lingjsl" name="lingjsl" type="Hidden"></input>
<input id="gongysbhhid" name="gongysbhhid" type="Hidden"></input>
<input id="fanxrkdh" name="fanxrkdh" type="Hidden"></input>
<input id="zhijsj" name="zhijsj" type="Hidden"></input>
<input id="serachKey" name="serachKey" type="Hidden"></input>
			<form id="putform" method="post" name="putform">
				<input id="putvalue" name="putvalue" type="Hidden"></input>
			</form> 
<div id="form_user_${pageId}" class="ui-fieldLayout">
<table class="ui-grid" cellspacing="1" width="100%">
<tr>
		<td class="field-label">${i18n.fanxdh}：</td>
		<td class="field-container"><div class="ui-field" id="fanxdh"></div></td>
		<td class="field-label">${i18n.lingjbh}：</td>
		<td class="field-container"><div class="ui-field" id="lingjbh"></div></td>
		<td class="field-label">${i18n.lingjmc}：</td>
		<td class="field-container"><div class="ui-field" id="lingjmc"></div></td>
      </tr>
      <tr>
		<td class="field-label">${i18n.ruksl}：</td>
		<td class="field-container"><div class="ui-field" id="ruksl"></div></td>
		<td class="field-label">${i18n.druksl}：</td>
		<td class="field-container"><div class="ui-field" id="druksl"></div></td>
		<td class="field-label">${i18n.pich}：</td>
		<td class="field-container"><div class="ui-field" id="pich"></div></td>
      </tr>
      <tr>
		<td class="field-label">${i18n.shixq}：</td>
		<td class="field-container"><div class="ui-field" id="shixq"></div></td>
		<td class="field-label">${i18n.gongysdm}：</td>
		<td class="field-container"><div class="ui-field" id="gongysdm"></div></td>
		<td class="field-label">${i18n.gongysmc}：</td>
		<td class="field-container"><div class="ui-field" id="gongysmc"></div></td>
	</tr>
	<tr>
		<td class="field-label">${i18n.danw}：</td>
		<td class="field-container"><div class="ui-field" id="danw"></div></td>
		<td class="field-label">${i18n.jingz}：</td>
		<td class="field-container"><div class="ui-field" id="jinz"></div></td>
		<td class="field-label">${i18n.maoz}：</td>
		<td class="field-container"><div class="ui-field" id="maoz"></div></td>
	</tr>
	<tr>
		<td class="field-label">${i18n.cangkh}：</td>
		<td class="field-container"><div class="ui-field" id="ckandzick"></div></td>
		<td class="field-label">${i18n.chengysdm}：</td>
		<td class="field-container"><div class="ui-field" id="chengysdm"></div></td>
		<td class="field-label">${i18n.usxh}：</td>
		<td class="field-container"><div class="ui-field" id="usxh"></div></td>
	</tr>
		<tr>
		<td class="field-label">${i18n.ucxh}：</td>
		<td class="field-container"><div class="ui-field" id="ucxh"></div></td>
		<td class="field-label">${i18n.baozgs}：</td>
		<td class="field-container"><div class="ui-field" id="rongqsl"></div></td>
		<td><div class="ui-field" id="elh"></div></td>
		<td></td>
	</tr>
   </table>	
</div>
<div align=right>
<span id="btn_ok"  class="ui-button">${i18n.ok}[F1]</span>	
<span id="btn_back"  class="ui-button">${i18n.back}[F11]</span>		
<span id="btn_return"  class="ui-button">${i18n.return}[F12]</span>	
</div>
<div id="grid_user_${pageId}" class='hidden-item'></div> 	    
<div id='prompt'>${i18n.prompt}</div>	  
</div>  		    		    	    
</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>