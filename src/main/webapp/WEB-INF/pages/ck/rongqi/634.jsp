<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","634");%>
<t:html i18n="i18n.ck">
<head>
<title>${i18n.title_634}</title>
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
                {fieldType:'fieldHidden',property:'usfhdh'},
                {fieldType:'fieldHidden',property:'danjlx'},
				{fieldType:'fieldText',property:'zaiy',dataType:'laiy',maxLength:'25',caption:'${i18n.laiy}',notNull:true},
				//0010495
				{fieldType:'fieldText',property:'tch',dataType:'text',maxLength:'7',caption:'${i18n.kach}',notNull:false},
				//{fieldType:'fieldText',property:'chengysmc',dataType:'laiy',maxLength:'35',caption:'${i18n.chengysmc}',notNull:false},
				{fieldType:'fieldText',property:'songhr',dataType:'laiy',maxLength:'10',caption:'${i18n.songhr}',notNull:true},
				{fieldType:'fieldText',property:'rongqxh',caption:'${i18n.rongqxh}',notNull:true,dataType:'letter_numeric',limitedLength:'5'},
				{fieldType:'fieldText',property:'rongqsl',dataType:'plusinteger',caption:'${i18n.jiessl}',notNull:true},
				{fieldType:'fieldText',property:'zhizs',dataType:'laiy',maxLength:'35',caption:'${i18n.zhizs}',notNull:false},
				{fieldType:'fieldText',property:'chengysdm',dataType:'shuzzm',maxLength:'10',caption:'${i18n.cysrqq}',notNull:true},
				{fieldType:'fieldText',property:'gongysdm',dataType:'shuzzm',maxLength:'10',caption:'${i18n.gongysdm}',notNull:false},
				{fieldType:'fieldSelect',property:'zhuangtsx',caption:'${i18n.danjlx}',notNull:true,internation:true,src:'<%=request.getContextPath()%>/common/danjuleix.do'}
				]
 		});
	$('#grid_user_${pageId}').grid({
		keyFields:['usfhdh','rongqxh','wuld','gongysdm','chengysdm','rongqsl','danjlx'],
		id:'grid_user_${pageId}',
		showCheckbox:true,
		//翻页查询交易
		src:'<%=request.getContextPath()%>/rongqi/63403.do',
		editSubmitSrc:'<%=request.getContextPath()%>/rongqi/63406.do?usercenter='+st_UserCenter,
		cols:[
		{property:'rongqxh',caption:'${i18n.rongqxh}'},
  		{property:'rongqsl',caption:'${i18n.jiessl}',editor:'fieldText',dataType:'plusinteger'},
  		//{property:'zhizs',caption:'${i18n.zhizs}'}
  		]
	});

	//F1确认
 	$('#btn_ok').bind('click',function(){
 		 //参数校验
 		if(!$('#form_user_${pageId}').form("validateParam")){
				return;	
 		}
 		if("2"==$('#zhuangtsx input').attr("realValue")){
 		
 		}else{
	 		if(!$('#tch').fieldText('validateNotNull')){
				return;
			} 
 		}
 		
		//单据类型赋值
		$('#danjlx input').val($('#zhuangtsx input').attr("realValue"));
 		//提交数据
 		var params = $('#form_user_${pageId}').form("getFormParam");
 		params.push("usercenter="+st_UserCenter); 		
 		$('#grid_user_${pageId}').grid("setQueryParams", params);
 		var url = "<%=request.getContextPath()%>/rongqi/63405.do";
		 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 if (showPromptRequestMsg(results)==true){
				//加载返回数据
				$('#grid_user_${pageId}').grid('parseResult',results)
				$('#usfhdh input').val(results.result.parameter.usfhdh);
			    $('#danjlx input').val(results.result.parameter.zhuangtsx);
				if (results.result.response == "0000"){
					$('#zaiy input').attr("disabled",true);
					$('#tch input').attr("disabled",true);
					$('#songhr input').attr("disabled",true);
					$('#chengysdm input').attr("disabled",true);
					$("#gongysdm input").attr("disabled",true);
					$('#zhuangtsx input').attr("disabled",true);
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
		params.push("usfhdh="+$('#usfhdh input').val());		
		var url = "<%=request.getContextPath()%>/rongqi/60102.do";
		 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 if (showPromptRequestMsg(results)==true){
				 $('#grid_user_${pageId}').grid('parseResult',results)
			 }
			 });
		}
		return false;
	}); 
 	//F4 选中
 	$('#getSelected').bind('click',function(){
 		$('#grid_user_${pageId}').grid('selected');
			return false;
 	});;
	//F5 打印 结束录入
	$('#btn_print').bind('click',function(){
		if($('#usfhdh input').val()==""){
			showPromptMsg('red','${i18n.jsfhdbbwk}')
			return;
			}
		var params = [];
			params.push("usercenter="+st_UserCenter);
			params.push("usfhdh="+$('#usfhdh input').val());
			params.push("zhuangtsx="+$('#zhuangtsx input').attr("realValue"));			
			var url = "<%=request.getContextPath()%>/rongqi/63404.do";
			 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
				 if (showPromptRequestMsg(results)==true){
					 $('#grid_user_${pageId}').grid('parseResult',results)
					   if (results.result.response == "0000"){
						   $('#zhuangtsx input').attr("readonly",false);
						  var params2 = [];
					 		params2.push("usercenter="+st_UserCenter);
					 		params2.push("jsfhdh="+$('#usfhdh input').val());
					 		params2.push("danjlx="+$('#danjlx input').val());
					 		window.location.href="<%=request.getContextPath()%>/rongqi/63401.do?usercenter="+st_UserCenter+"&jsfhdh="+$('#usfhdh input').val()+"&danjlx="+$('#danjlx input').val()+"&cangkbh="+st_Cangkbh+st_Params;
			         } 
			 
		       }
		 }); 		
 		return false;
	}); 
	$(document).keyboardsupport({});
	});
/**
 *进入634页面后进行查询
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
   params.push("usercenter="+st_UserCenter);
   var url = "<%=request.getContextPath()%>/rongqi/63403.do";
   $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
	  if (showPromptRequestMsg(results)==true){
	        if(results.result.response != 'C_1403'){
			     //设置分页
				 params.push("currentPage=1");
				 params.push("usfhdh="+results.result.parameter.usfhdh);
				 $('#grid_user_${pageId}').grid("setQueryParams", params);
		         //加载返回数据
		         $("#usfhdh input").val(results.result.parameter.usfhdh);
		         $("#songhr input").val(results.result.parameter.songhr);
   	             $("#tch input").val(results.result.parameter.tch);
   	             $("#zaiy input").val(results.result.parameter.zaiy);
   	             $("#gongysdm input").val(results.result.parameter.gongysdm);
	             $("#chengysdm input").val(results.result.parameter.chengysdm);
	             $("#zhuangtsx input").attr('realValue',results.result.parameter.zhuangtsx);
	             //$("#zhuangtsx input").val(results.result.parameter.beihybh); 
	             if("1" ==results.result.parameter.zhuangtsx){
	                 $("#zhuangtsx input").val($.sdcui.resource.i18n['C_000001']); 
	             }else if("3" ==results.result.parameter.zhuangtsx){
	                 $("#zhuangtsx input").val($.sdcui.resource.i18n['C_000003']);
	             }
	             $('#danjlx input').val(results.result.parameter.zhuangtsx);
   	             $('#grid_user_${pageId}').grid('parseResult',results);
   	             if(
   	            		 $("#zaiy input").val()!="" &&
   	            		 $("#tch input").val()!="" &&
   	            		 $("#songhr input").val()!="" &&
   	            		 $("#chengysdm input").val()!="" &&
   	            		 $("#gongysdm input").val()!="" &&
   	            		 $("#zhuangtsx input").val()!=""   	            		 
   	            		 
   	            		 ){
			   	          	$('#zaiy input').attr("disabled",true);
							$('#tch input').attr("disabled",true);
							$('#songhr input').attr("disabled",true);
							$('#chengysdm input').attr("disabled",true);
							$("#gongysdm input").attr("disabled",true);
							$('#zhuangtsx input').attr("disabled",true);							
							$('#rongqxh input').val('').focus();						
   	            	 
   	             }
  	         }
        }
       msgClear();
       return false;
     });
		
});
</script>
</head>
<body>
<div id="title"></div>
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
		<!-- 
		<td class="field-label">${i18n.zhizs}：</td>
		<td class="field-container"><div class="ui-field" id="zhizs"></div></td>
		 -->
		<td class="field-label">${i18n.cysrqq}：</td>
		<td class="field-container"><div class="ui-field" id="chengysdm"></div></td>
		<td class="field-label">${i18n.gongysdm}：</td>
		<td class="field-container"><div class="ui-field" id="gongysdm"></div></td>		
	</tr>
	<tr>
	 	<td class="field-label">${i18n.danjlx}：</td>
		<td class="field-container"><div class="ui-field" id="zhuangtsx"></div></td>
		<td ><div class="ui-field" id="usfhdh"></div></td>
		<td ><div class="ui-field" id="danjlx"></div></td>
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
	<span id="getSelected"  class="ui-button">${i18n.checked}[F4]</span>
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