<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","601");%>
<t:html i18n="i18n.ck">
<head>
<title>${i18n.title_601}</title>
<jsp:include page="../../common/js.jsp" />
<jsp:include page="../../common/print.jsp" />
<script type="text/javascript">
//0010495
var paramsQuery;
var zhuangtsx = 1;
$(function(){
	$('#form_user_${pageId}').form({
		onreload:true,
 		fields:[
                {fieldType:'fieldLabel',property:'wuld',value:st_Rongqcbh},
				{fieldType:'fieldText',property:'zaiy',dataType:'laiy',maxLength:'25',caption:'${i18n.laiy}',notNull:true},
				//0010495
				{fieldType:'fieldText',property:'tch',dataType:'text',maxLength:'8',caption:'${i18n.kach}',notNull:true},			
				{fieldType:'fieldText',property:'songhr',dataType:'laiy',maxLength:'10',caption:'${i18n.songhr}',notNull:true},
				{fieldType:'fieldText',property:'rongqxh',caption:'${i18n.rongqxh}',notNull:true,dataType:'letter_numeric',limitedLength:'5'},
				{fieldType:'fieldText',property:'rongqsl',dataType:'plusinteger',caption:'${i18n.jiessl}',notNull:true}			
	 			]
 		});
	$('#grid_user_${pageId}').grid({
		keyFields:['rongqxh','rongqsl','wuld','chengysmc','usfhdh'],
		id:'grid_user_${pageId}',
		showCheckbox:true,		
		src:'<%=request.getContextPath()%>/rongqi/60101.do',
		editSubmitSrc:'<%=request.getContextPath()%>/rongqi/60101.do?zhuangtsx=2',
		cols:[
		{property:'rongqxh',caption:'${i18n.rongqxh}'},
  		{property:'rongqsl',caption:'${i18n.jiessl}',editor:'fieldText',dataType:'plusinteger'}
  		]
	});

	//F1确认
 	$('#btn_ok').bind('click',function(){
 		 //参数校验
 		if(!$('#form_user_${pageId}').form("validateParam")){
				return;	
 		}
 		 //提交数据
 		var params = $('#form_user_${pageId}').form("getFormParam");
 		params.push("usfhdh="+$('#usfhdh').val());
 		params.push("zhuangtsx=1");
 		params.push("zhuangt=1");	
 		//设置分页条件
		$('#grid_user_${pageId}').grid("setQueryParams", params);
 		var url = "<%=request.getContextPath()%>/rongqi/60101.do";
		 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 if (showPromptRequestMsg(results)==true){
				//加载返回数据
					$('#grid_user_${pageId}').grid('parseResult',results)
					$('#usfhdh').val(results.result.parameter.usfhdh);
					if (results.result.response == "0000"){
						$('#zaiy input').attr('disabled',true);
						$('#tch input').attr('disabled',true);
						$('#songhr input').attr('disabled',true);
						$('#rongqxh input').val('').focus();
						$('#rongqsl input').val('');
					}					
			 }
			 });
 	}); 

 	//F2删除
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
			params.push("usfhdh="+$('#usfhdh ').val());
			$('#grid_user_${pageId}').grid("getQueryParams");
			var url = "<%=request.getContextPath()%>/rongqi/60102.do";
			 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
				 if (showPromptRequestMsg(results)==true){
					 $('#grid_user_${pageId}').grid('parseResult',results);
				 }
			 });
			}
		return false;
	});  
	//F4  选中
 	$('#btn_selected').bind('click',function(){
 		$('#grid_user_${pageId}').grid('selected');
        msgClear();
        return false;
 	}); 
	//F5打印 结束录入
	$('#btn_print').bind('click',function(){
		if($('#usfhdh').val()==""){
			showPromptMsg('red','${i18n.jsfhdbbwk}')
			return;
			}
		var params = [];
			params.push("usercenter="+st_UserCenter);
			params.push("usfhdh="+$('#usfhdh').val());
		var url = "<%=request.getContextPath()%>/rongqi/60106.do";
		 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 if (showPromptRequestMsg(results)==true){
				 $('#grid_user_${pageId}').grid('parseResult',results)
				   if (results.result.response == "0000"){
					  var params2 = [];
				 		params2.push("usercenter="+st_UserCenter);
				 		params2.push("jsfhdh="+$('#usfhdh').val());
				 		params2.push("danjlx=1");		 		
				 		var url2 = "<%=request.getContextPath()%>/rongqi/60104.do";
				 		g_isSub=0;
				 		doprint(st_PageId,params2,url2);
				 		$('#form_user_${pageId}').form("resetFields");
				 		$('#grid_user_${pageId}').grid('clearRecords');
				 		$('#wuld span').html(st_Rongqcbh);
				 		$('#usfhdh').val("");
						$('#zaiy input').attr('disabled',false);
						$('#tch input').attr('disabled',false);
						$('#songhr input').attr('disabled',false);
				  }			 
			   }
			 }); 		
	 		return false;
	}); 	
	$(document).keyboardsupport({});
});
/**
  *进入601页面后进行查询
  */
 $(document).ready(function(){
    var params =[] ;
    params.push("wuld="+st_Rongqcbh);	
    params.push("zhuangt=1");	
       var url = "<%=request.getContextPath()%>/rongqi/60103.do";
    $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
	  if (showPromptRequestMsg(results)==true){
	        if(results.result.response != 'C_1403'){
			     //设置分页
				 params.push("currentPage=1");
				 params.push("usfhdh="+results.result.parameter.usfhdh);
				 $('#grid_user_${pageId}').grid("setQueryParams", params);
		         //加载返回数据
		         $("#usfhdh").val(results.result.parameter.usfhdh);
		         $("#songhr input").val(results.result.parameter.songhr);
    	         $("#tch input").val(results.result.parameter.tch);
    	         $('#zaiy input').val(results.result.parameter.zaiy);
    	         $('#grid_user_${pageId}').grid('parseResult',results);
    	         if(
    	        	  $('#zaiy input').val()!="" &&
    	        	  $('#tch input').val()!="" &&
    	        	  $("#songhr input").val()!=""
    	        		 ){
	    	        	  $('#zaiy input').attr("disabled",true);
		   	        	  $('#tch input').attr("disabled",true);
		   	        	  $("#songhr input").attr("disabled",true);
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
	 <input id="usfhdh" type="Hidden"></input>
	 <input id="serachKey" name="serachKey" type="Hidden"></input>
<div id="form_user_${pageId}" class="ui-fieldLayout" >
<table class="ui-grid" cellspacing="1" width="100%" >
<tbody>
		  <tr>
		<td class="field-label">${i18n.rongqiq}：</td>
		<td class="field-container"><div class="ui-field" id="wuld" ></div></td>	
		<td class="field-label">${i18n.laiy}：</td>
		<td><div class="ui-field" id="zaiy"></div></td>
		<td class="field-label">${i18n.kach}：</td>
		<td class="field-container"><div class="ui-field" id="tch"></div></td>
		<td class="field-label">${i18n.rongqxh}：</td>
		<td class="field-container"><div class="ui-field" id="rongqxh"></div></td>
		 </tr>
		 <tr>
	 	<td class="field-label">${i18n.songhr}：</td>
		<td class="field-container"><div class="ui-field" id="songhr"></div></td>
		<td class="field-label">${i18n.jiessl}：</td>
		<td class="field-container"><div class="ui-field" id="rongqsl"></div></td>
		<td class="field-label"></td>
		<td class="field-container"></td>	
		<td class="field-label"></td>
		<td class="field-container"></td>	
		</tr>
		</tbody>
		</table>
		<br/>
		<div align="right">		
		<span id="btn_ok"  class="ui-button">${i18n.ok}[F1]</span>
		<span id="btn_delete"  class="ui-button">${i18n.delete}[F2]</span>
		<span id="btn_selected"  class="ui-button">${i18n.checked}[F4]</span>
		<span id="btn_print"  class="ui-button">${i18n.jieslr}[F5]</span>
		<span id="btn_back"  class="ui-button">${i18n.back}[F11]</span>	
		<span id="btn_return"  class="ui-button">${i18n.return}[F12]</span>
	  </div>
	  <br/>
      <div id="grid_user_${pageId}" class='hidden-item'></div>
</div>
      <div id='prompt'>${i18n.prompt}</div>
</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>