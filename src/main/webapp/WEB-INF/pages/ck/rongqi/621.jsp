<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","621");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_621}</title>
<jsp:include page="../../common/js.jsp" />
<script type="text/javascript">
//0010495
var paramsQuery;
var currentPage = 1;
$(function(){
	$('#form_user_${pageId}').form({
		onreload:true,
 		fields:[
                {fieldType:'fieldLabel',property:'wuld',value:st_Rongqcbh},
                {fieldType:'fieldHidden',property:'danjbh'},
				{fieldType:'fieldText',property:'chengysdm',dataType:'shuzzm',maxLength:'10',caption:'${i18n.chengysdm}',notNull:true},
				{fieldType:'fieldText',property:'gongysdm',dataType:'shuzzm',maxLength:'10',caption:'${i18n.gongysdm}',notNull:true},
				{fieldType:'fieldText',property:'rongqxh',dataType:'letter_numeric',limitedLength:'5',caption:'${i18n.rongqxh}',notNull:true},
				{fieldType:'fieldText',property:'rongqsl',dataType:'plusinteger',caption:'${i18n.tuifsl}',notNull:true},
				//0010495
				{fieldType:'fieldText',property:'tch',maxLength:'8', dataType:'text',caption:'${i18n.kach}',notNull:true},
				{fieldType:'fieldText',property:'beiz',dataType:'caozy',caption:'${i18n.beizh}',notNull:true}
				
	 			]
 		});
	$('#grid_user_${pageId}').grid({
		keyFields:['rongqxh','rongqsl','rongqye','gongysdm','gongysmc','chengysdm','chengysmc'],
		id:'grid_user_${pageId}',
		showCheckbox:true,
		//翻页查询交易
		src:'<%=request.getContextPath()%>/rongqi/62104.do',
		cols:[
		{property:'rongqxh',caption:'${i18n.rongqxh}'},
  		{property:'rongqsl',caption:'${i18n.tuifsl}'},
  		{property:'rongqye',caption:'${i18n.syrqsl}'},
  		//{property:'gongysdm',caption:'${i18n.gongysdm}'},
  		//{property:'gongysmc',caption:'${i18n.gongysmc}'},
  		{property:'chengysdm',caption:'${i18n.chengysdm}'},
  		{property:'chengysmc',caption:'${i18n.chengysmc}'},
  		{property:'beiz',caption:'${i18n.beiz}'}
  		
  		]
	});
	//F1确认
 	$('#btn_ok').bind('click',function(){
 		 //参数校验
 		if(!$('#form_user_${pageId}').form("validateParam")){
				return;	
 		}
 		if($('#chengysdm input').val()=="DPCA"){
			showPromptMsg('red','${i18n.dpcacw}')
			return;
		}
 		if($('#chengysdm input').val()=="dpca"){
			showPromptMsg('red','${i18n.dpcacw}')
			return;
		}
 		 //提交数据
 		var params = $('#form_user_${pageId}').form("getFormParam");
 		$('#grid_user_${pageId}').grid("setQueryParams", params);
 		var url = "<%=request.getContextPath()%>/rongqi/62101.do";
		 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 if (showPromptRequestMsg(results)==true){
				//加载返回数据
					$('#grid_user_${pageId}').grid('parseResult',results)
					$('#danjbh input').val(results.result.parameter.danjbh);
					if (results.result.response == "0000"){
						$('#chengysdm input').attr("disabled",true);
						$('#gongysdm input').attr("disabled",true);
						$('#tch input').attr("disabled",true);
						$('#rongqxh input').val('').focus();
						$('#rongqsl input').val('');
					}
			 }
			 });
 	}); 
 	//F3删除
	$('#btn_delete').bind('click',function(){

		//获取选择行
 		var params = $('#grid_user_${pageId}').grid('getSelectedAll');
		if(params.length < 1){
			showPromptMsg('red','${i18n.selectoneerror}')
			return false;
		}
		//打开提示框是否删除
		if(confirm($.sdcui.resource.i18n['C_remove'])){
		//先提交选中行，然后再重新加载
		var params = $('#grid_user_${pageId}').grid('getSelectedAll');	
		params.push("currentPage="+$('#grid_user_${pageId}').grid('getCurrentPage'));
		params.push("danjbh="+$('#danjbh input').val());
		var url = "<%=request.getContextPath()%>/rongqi/62102.do";
		 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 if (showPromptRequestMsg(results)==true){
				 $('#grid_user_${pageId}').grid('parseResult',results);
			 }
			 });
		}
		return false;
	});
 	//F4 选中
	$('#getSelected').bind('click',function(){
		$('#grid_user_${pageId}').grid('selected');
		return false;
	});
	//F2 结束录入
 	$('#btn_okgys').bind('click',function(){
		 if($('#danjbh input').val()=="")
			{
			showPromptMsg('red','${i18n.danjbhbnwk}')
			return;
			}
 		 //提交数据
 		var params = $('#form_user_${pageId}').form("getFormParam");
 		params.push("danjbh="+$('#danjbh input').val());
 		//打开提示框是否删除
		if(confirm($.sdcui.resource.i18n['C_sfqrjs'])){
 		var url = "<%=request.getContextPath()%>/rongqi/62103.do";
		 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 if (showPromptRequestMsg(results)==true){
				//加载返回数据
				 if (results.result.response == "0000"){
			 		 window.location.href="<%=request.getContextPath()%>/rongqi/62106.do?usercenter="+st_UserCenter+"&danjbh="+$('#danjbh input').val()+"&cangkbh="+st_Cangkbh+st_Params;
			        }					 
			    }
			 });
		}
 	}); 
	$(document).keyboardsupport({});
	});
/**
  *进入621页面后进行查询
  */
 $(document).ready(function(){
	//设置供应商编号不可输入
	$("#gongysdm input").attr('disabled',true);
	//供应商编号赋值
	$('#chengysdm input').change(function(){
		$("#gongysdm input").val($('#chengysdm input').val());
	});
	//供应商编号赋值
	$('#chengysdm input').bind('input propertychange',function(){
		$("#gongysdm input").val($('#chengysdm input').val());
	});
    var params =[] ;
    params.push("wuld="+st_Rongqcbh);	
    //params.push("zhuang=1");	
    var url = "<%=request.getContextPath()%>/rongqi/62104.do";
    $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
	  if (showPromptRequestMsg(results)==true){
	        if(results.result.response != 'C_1403'){
			     //设置分页
				 params.push("currentPage=1");
				 params.push("danjbh="+results.result.parameter.danjbh);
				 $('#grid_user_${pageId}').grid("setQueryParams", params);
		         //加载返回数据
		         $("#danjbh input").val(results.result.parameter.danjbh);
    	         $("#gongysdm input").val(results.result.parameter.gongysdm);
    	         $('#chengysdm input').val(results.result.parameter.chengysdm);
    	         $('#tch input').val(results.result.parameter.tch);
    	         $('#grid_user_${pageId}').grid('parseResult',results);
    	         if(
    	        		 $('#chengysdm input').val()!="" &&
    	        		 $('#gongysdm input').val()!="" &&
    	        		 $('#tch input').val()!=""
    	        		 ){
		    	        	 $('#chengysdm input').attr("disabled",true);
							 $('#gongysdm input').attr("disabled",true);
							 $('#tch input').attr("disabled",true);
							 $('#rongqxh input').val('').focus();
    	         }
   	         }
         }
        msgClear();
      });
 		return false;
 });
</script>
	</head>
	<body>
<div id="title"></div>
<!--  <input id="danjbh" type="Hidden"></input>-->
<form id="putform" method="post" name="putform" >
			<input id="putvalue"   name="putvalue" type="hidden"></input>
			</form> 
<div id="form_user_${pageId}" class="ui-fieldLayout" >
<table class="ui-grid" cellspacing="1" width="100%" >
<tr>
		<td class="field-label">${i18n.rongqiq}：</td>
		<td class="field-container"><div class="ui-field" id="wuld"></div></td>
		<td class="field-label">${i18n.chengysdm}：</td>
		<td class="field-container"><div class="ui-field" id="chengysdm"></div></td>
	    <td class="field-label">${i18n.gongysdm}：</td>
		<td class="field-container"><div class="ui-field" id="gongysdm"></div></td>
		<td class="field-container"><div class="ui-field" id="danjbh"></div></td>
	 </tr>
      <tr>
		<td class="field-label">${i18n.rongqxh}：</td>
		<td class="field-container"><div class="ui-field" id="rongqxh"></div></td>
	    <td class="field-label">${i18n.tuifsl}：</td>
		<td class="field-container"><div class="ui-field" id="rongqsl"></div></td>
		<td class="field-label">${i18n.kach}：</td>
		<td class="field-container"><div class="ui-field" id="tch"></div></td>
	 </tr>
	 <tr>
		<td class="field-label">${i18n.beiz}：</td>
		<td class="field-container"><div class="ui-field" id="beiz"></div></td>
	 </tr>
	 	
  </table>
  	<br>
	<div align=right>
	    <span id="btn_ok"  class="ui-button">${i18n.ok}[F1]</span>
	    <span id="btn_okgys"  class="ui-button">${i18n.jieslr}[F2]</span>
	    <span id="btn_delete"  class="ui-button">${i18n.delete} [F3]</span>
	    <span id="getSelected"  class="ui-button">${i18n.checked} [F4]</span>		
		<span id="btn_back"  class="ui-button">${i18n.back}[F11]</span>	
		<span id="btn_return"  class="ui-button">${i18n.return}[F12]</span>
	</div><br/>
<div id="grid_user_${pageId}" class='hidden-item'></div>
  </div>	
 <div id='prompt'>${i18n.prompt}</div>
</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>