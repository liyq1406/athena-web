<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","351");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_351}</title>
<jsp:include page="../../common/js.jsp" />
<script type="text/javascript">
var paramsQuery;
var currentPage = 1;
$(function(){
	$('#form_user_${pageId}').form({
	    onreload:true,
 		fields:[
                {fieldType:'fieldSelect',property:'nwbflag',value:$.sdcui.resource.i18n['C_GONGYSYH'],realValue:'2',caption:'${i18n.yaohllx}',internation:true,notNull:true,onselect:'flagchange()',src:'<%=request.getContextPath()%>/beihuo/yaohllx.do'},
                {fieldType:'fieldSelect',property:'gonghms',caption:'${i18n.gonghms}'},
                {fieldType:'fieldSelect',property:'shiffsgys',value:'${i18n.fou}',realValue:'0',caption:'${i18n.shiffsgys}',internation:true,notNull:false,src:'<%=request.getContextPath()%>/beihuo/shiffsgys.do'},
                {fieldType:'fieldText',property:'lingjbh',dataType:'letter_numeric',limitedLength:'10',caption:'${i18n.lingjbh}',notNull:true},
                {fieldType:'fieldText',biaos:'enter',property:'gongysdm',caption:'${i18n.gongysdm}',dataType:'letter_numeric',limitedLength:'10',notNull:false},
                {fieldType:'fieldLabel',property:'gongysmc'},
                {fieldType:'fieldText',biaos:'enter',property:'mudd',caption:'${i18n.mudd}',dataType:'lsmdd',caption:'${i18n.diaobsj1}',notNull:true},
                {fieldType:'fieldText',property:'yaohlgs',biaos:'enter',dataType:'plusinteger',maxLength:'2',caption:'${i18n.yaohlsl}',notNull:true},
                {fieldType:'fieldText',property:'yaohsl',biaos:'enter',dataType:'plusinteger',maxLength:'10',caption:'${i18n.yaohsl}',notNull:true},
                {fieldType:'fieldText',property:'xunhbm',biaos:'enter',dataType:'letter_numeric',limitedLength:'8',caption:'${i18n.diaobsj1}',notNull:false},
                {fieldType:'fieldLabel',property:'usrl'},
                {fieldType:'fieldText',property:'shangxsj1',caption:'${i18n.zuiwjfsj}',dataType:'datetime',maskOptions:{mask:'9999-99-99 99:99:99'},notNull:false}
	 			]
 		});
 		var par=[];
 		girdload();
	function girdload(){
		$('#grid_user_${pageId}').grid({
			keyFields:['yaohlh','gonghms','xunhbm','lingjbh','yaohsl'],
			id:'grid_user_${pageId}',
			params:par,
			showCheckbox:true,
			//翻页查询交易
			src:'<%=request.getContextPath()%>/beihuo/35101.do',
			cols:[
			{property:'yaohlh',caption:'${i18n.yaohlh}'},
			{property:'gonghms',caption:'${i18n.gonghms}'},
	  		{property:'xunhbm',caption:'${i18n.kanbxhbm}'},
	  		{property:'lingjbh',caption:'${i18n.lingjbh}'},
	  		{property:'mudd',caption:'${i18n.mudd}'},
	  		{property:'yaohsl',caption:'${i18n.yaohsl}'},
	  		//{property:'shangxsj1',caption:'${i18n.zuiwjfsj}'},
	  		{property:'gongysdm',caption:'${i18n.gongysdm}'},
	  		{property:'gongysmc',caption:'${i18n.gongysmc}'}
	  		
	  		],
	  		buttons:[
	 				//单选
	 				{name:'getSelected',caption:'${i18n.checked}[F7]',keyboard:'F7',action:function(){
	 					$('#grid_user_${pageId}').grid('selected');
	 					return false;
	 				}}
	 				//全选
 				,{name:'selectedAll',caption:'${i18n.selectall}[F6]',keyboard:'F6',action:function(){
 					$('#grid_user_${pageId}').grid('selectedAll');
 					return false;
 				}}
	   	   ]
		});
	}
	//F1新增
 	$('#btn_insert').bind('click',function(){
	if($("#shangxsj1 input").val()!=""){
				 var shangxsj1 = $('#shangxsj1 input').val();
				  var date1 = new Date(shangxsj1.replace(/-/g,"/"));
				  var myDate=new Date();
				  if(date1<myDate){
						 showPromptMsg('red','${i18n.bunxydqtime}')
						 return;
				  }
				 
			}
			
			//0011332			
			/*
			if($("#yaohsl input").val()>10000){
				 showPromptMsg('red','${i18n.yaohslxy}');
				 return;
			}
			*/
 		//参数校验
		  if(!$('#form_user_${pageId}').form("validateParam")){
				return;	
		  }
 		 //提交数据
 		var params = $('#form_user_${pageId}').form("getFormParam");
 		params.push("flag=1");
		params.push("currentPage="+currentPage);
 		var url = "<%=request.getContextPath()%>/beihuo/35101.do";
		 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 if (showPromptRequestMsg(results)==true){
				//加载grid
					$('#grid_user_${pageId}').grid("parseResult",results)
					girdload();
					par.push("flag=4");
					par.push("nwbflag="+$('#nwbflag input').attr('realvalue'));
			 }
			 });
 	});
 	
 		//F2删除
 	$('#btn_delete').bind('click',function(){
 	//是否选中
 		var records = $('#grid_user_${pageId}').grid('getSelectedAll');
 		if(records.length < 1){
 			showPromptMsg('red','${i18n.selectoneerror}')
 			return false;
 		}
 		//打开提示框是否删除
		if(confirm($.sdcui.resource.i18n['C_remove'])){
 		 //提交数据
 		var params = $('#grid_user_${pageId}').grid('getSelectedAll');
 		params.push("flag=2");
 		params.push("nwbflag="+$("#nwbflag input").attr('realvalue'));
 		var url = "<%=request.getContextPath()%>/beihuo/35102.do";
		 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 if (showPromptRequestMsg(results)==true){
							 $('#grid_user_${pageId}').grid('clearRecords');
							 $('#grid_user_${pageId}').grid("parseResult",results)
							 girdload();
							par.push("flag=4");
							par.push("nwbflag="+$('#nwbflag input').attr('realvalue'));
						 }else{
							 if (results.result.response == "0000"){
								 $('#grid_user_${pageId}').grid('clearRecords');
							 }
		
  						 }
  						 
			 });
			 }
 	});
 	//F3全部删除
 	$('#btn_qbdelete').bind('click',function(){
 		//打开提示框是否删除
		if(confirm($.sdcui.resource.i18n['C_remove2'])){
 		 //提交数据
 		var params = $('#grid_user_${pageId}').grid('getSelectedAll');
 		params.push("flag=6");
 		params.push("nwbflag="+$("#nwbflag input").attr('realvalue'));
 		var url = "<%=request.getContextPath()%>/beihuo/35101.do";
		 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 if (showPromptRequestMsg(results)==true){
				//加载grid
					$('#grid_user_${pageId}').grid('clearRecords');
					$('#grid_user_${pageId}').grid("parseResult",results)
					girdload();
					par.push("flag=4");
					par.push("nwbflag="+$('#nwbflag input').attr('realvalue'));
			 }else{
							 if (results.result.response == "0001"){
								 $('#grid_user_${pageId}').grid('clearRecords');
							 }
							 }
			 });
			 }
 	});
 	//F2发送
 	$('#btn_wancbfs').bind('click',function(){
 		//是否选中
 		var params = $('#grid_user_${pageId}').grid('getSelectedAll');
 		if(params.length < 1){
 			showPromptMsg('red','${i18n.selectoneerror}')
 			return false;
 		}
 		 //提交数据
 		// var params=[];
 		//params.push("yaohlh="+roecde);
 		params.push("flag=3");
 		params.push("nwbflag="+$("#nwbflag input").attr('realvalue'));
 		var url = "<%=request.getContextPath()%>/beihuo/35102.do";
		 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 if (showPromptRequestMsg(results)==true){
				//加载grid
				$('#grid_user_${pageId}').grid('clearRecords');
					$('#grid_user_${pageId}').grid("parseResult",results)
			 }
			 });
 	});
 	//根据输入供应商要货带出 包装容量
 	$('#gongysdm input').bind('blur',function (){
 		if($('#lingjbh input').val()==""){
			return;
		}
 		if($('#nwbflag input').val()==$.sdcui.resource.i18n['C_GONGYSYH']&&$('#lingjbh input').val()!=""&&$('#gongysdm input').val()!=""){
 			var params = [];
 			params.push("lingjbh="+$("#lingjbh input").val());
 			params.push("gongysbh="+$("#gongysdm input").val());
 			params.push("cangkbh="+st_Cangkbh);
			 var url = "<%=request.getContextPath()%>/common/35104.do";
			 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
				 if (results.result.response == "0001"){
					 $('#usrl span').html(results.result.parameter.baozrl)
				 }else{
					 $('#usrl span').html("")
				 }				 
				 });
 		}
 	});
 	//根据输入供应商要货带出 包装容量
 	$('#gongysdm').bind('enter',function (){
 		if($('#gongysdm input').val()==""){
			return;
		}
		var params = [];
		params.push("gongysdm="+$('#gongysdm input').val());		
		var url = "<%=request.getContextPath()%>/common/40105.do";
		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 if (results.result.response == "0001"){
				 $('#gongysmc span').html(results.result.parameter.gongysmc)
			 }else{
				 $('#gongysmc span').html("")
			 }			 
		});
 	});
 	 	//根据输入供应商要货带出 包装容量
 <%-- 	$('#lingjbh input').bind('blur',function (){
 		if($('#lingjbh input')==""){
			return;
		}
 		if($('#nwbflag input').val()==$.sdcui.resource.i18n['C_CANGKYH']&&$('#lingjbh input').val()!=""){
 			var params = [];
 			params.push("lingjbh="+$("#lingjbh input").val());
 			params.push("cangkbh="+st_Cangkbh);
			 var url = "<%=request.getContextPath()%>/common/35103.do";
			 $('#form_user_${pageId}').form("submitUrl", params, url, function(resu lts){
				 if (results.result.response == "0001"){
					 $('#usrl span').html(results.result.parameter.baozrl)
				 }else{
					 $('#usrl span').html("")
				 }
				 
				 });
 		}
 	}); --%>
 	 	//根据输入看板循环带出相关数据
 	$('#xunhbm').bind('enter',function (){
 		if(!$('#xunhbm').fieldText('validate')){
 			return;
 		}
 			var params = [];
 			params.push("xunhbm="+$("#xunhbm input").val());
 			params.push("flag=5");
 			params.push("nwbflag="+$("#nwbflag input").attr('realvalue'));
			 var url = "<%=request.getContextPath()%>/beihuo/35101.do";
			 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
				 if (results.result.response == "0001"){
					 $('#lingjbh input').val(results.result.parameter.lingjbh)
					 $('#gongysdm input').val(results.result.parameter.gongysdm)
					 $('#gongysmc span').html(results.result.parameter.gongysmc)
					 $('#mudd input').val(results.result.parameter.mudd)
					 $('#usrl span').html(results.result.parameter.usrl)
					 $('#gonghms input').val(results.result.parameter.gonghms)
					 $('#gonghms input').attr('realValue',results.result.parameter.gonghms)
				     $('#lingjbh input').attr("readonly","readonly");
			 		 $('#mudd input').attr("readonly","readonly");
			 		 $('#gonghms input').attr("readonly","readonly");
				 }else{
				 	$('#lingjbh input').val("")
					 $('#gongysdm input').val("")
					 $('#gongysmc span').html("")
					 $('#mudd input').val("")
					 $('#usrl span').html("")
				     $('#lingjbh input').attr("readonly",false);
			 		 $('#mudd input').attr("readonly",false);
			 		 $('#gonghms input').attr("readonly",false);
				 }
				 
				 });
 	});
	 	//根据输入看板循环带出相关数据
 	$('#mudd').bind('enter',function (){
 		if(!$('#mudd').fieldText('validate')){
 			return;
 		}
 		if(!$('#lingjbh').fieldText('validate')){
 			return;
 		}
 			var params = [];
 			params.push("mudd="+$("#mudd input").val());
 			params.push("lingjbh="+$("#lingjbh input").val());
 			params.push("gonghms="+$("#gonghms input").attr("realValue"));
 			params.push("flag=7");
 			params.push("nwbflag="+$("#nwbflag input").attr('realvalue'));
			 var url = "<%=request.getContextPath()%>/beihuo/35101.do";
			 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
				 if (results.result.response == "0001"){
					 $('#gongysdm input').val(results.result.parameter.gongysdm)
					 $('#gongysmc span').html(results.result.parameter.gongysmc)
					 $('#usrl span').html(results.result.parameter.usrl)
					 $('#xunhbm input').val(results.result.parameter.xunhbm)
				 }else{
					 $('#gongysdm input').val("")
					 $('#gongysmc span').html("")
					 $('#usrl span').html("")
					 $('#xunhbm input').val("")
				 }
				 
				 });
 	});
 	//看板循环判断
 	$('#xunhbm input').bind('blur',function (){
 	    if($('#xunhbm input').val()!=""){
 			$('#lingjbh input').attr("readonly","readonly");
 			$('#mudd input').attr("readonly","readonly");
 			$('#gonghms input').attr("readonly","readonly");
 		}else{
 			$('#lingjbh input').attr("readonly",false);
 			$('#mudd input').attr("readonly",false);
 			$('#gonghms input').attr("readonly",false);
 		}
 	});
 	//根据选择的要货令类型带出供货模式
 	$('#yaohsl').bind('enter',function (){
 		if($('#yaohsl input').val()!=""){
 			if($('#yaohsl input').val()!="0"){
 				//验证是不是数字
 	 	 		if(!$('#yaohsl').fieldText('validate')){
 	 	 			//return;
 	 	 		}else{
 	 	 			showPromptMsg('blue','');
 	 	 		}
 	 	 		var yaohsl=$('#yaohsl input').val();
 	 	 		var yaohlgs=$('#usrl span').html();
 	 	 		if(yaohlgs!=""&&parseInt(yaohlgs)>0){
 	 	 			var num = yaohsl/yaohlgs;
 	 		        var arrat = num.toString().split(".");
 	 		        if (arrat.length>1 && parseInt(arrat[1])>0){
 	 		       		 num = parseInt(arrat[0]) + 1;
 	 		        } else {
 	 		        	num = parseInt(arrat[0]);
 	 		        }
 	 		        if(num<=0){
 	 		        	$('#yaohlgs input').val("1");	
 	 		        }else if(num<=99){
 	 		        	$('#yaohlgs input').val(num);
 	 		        }else{//0011332	 		        
 	 		       	 	showPromptMsg('red','${i18n.yaohlsl_99}');
 	 		        }
 	 	 		}
 			}else{
 				showPromptMsg('red','${i18n.yaohslbnw}');
 			}
 		}
 	});
 	//根据选择的要货令类型带出供货模式
 	$('#yaohlgs').bind('enter',function (){
 		if($('#yaohlgs input').val()!=""){
 			if($('#yaohlgs input').val()!="0"){
 				//验证是不是数字
 	 	 		if(!$('#yaohlgs').fieldText('validate')){
 	 	 			//return;
 	 	 		}else{
 	 	 			showPromptMsg('blue','');
 	 	 		}
 	 	 		var yaohlgs=$('#yaohlgs input').val();
 	 	 		var usrl=$('#usrl span').html();
 	 	 		if(usrl!=""&&parseInt(usrl)>0){
 	 	 			var num = usrl*yaohlgs;
 	 		        var arrat = num.toString().split(".");
 	 		        if (arrat.length>1 && parseInt(arrat[1])>0){
 	 		       		 num = parseInt(arrat[0]) + 1;
 	 		        } else {
 	 		        	num = parseInt(arrat[0]);
 	 		        }
 	 		        if(num<=0){
 	 		        	$('#yaohsl input').val("1");
 	 		        }else{
 	 		        	$('#yaohsl input').val(num);
 	 		        }
 	 		 	 		
 	 	 		}
 			}else{
 				showPromptMsg('red','${i18n.yaohlslbnw}');
 			}
 		}
 	});
 	$(document).ready(function(){
		//加载返回数据
			var params = [];
			params.push("flag=4");
			params.push("nwbflag=2");
			var url = "<%=request.getContextPath()%>/beihuo/35101.do";
			$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 if (showPromptRequestMsg(results)==true){
				//加载grid
					$('#grid_user_${pageId}').grid("parseResult",results)
					girdload();
					par.push("flag=4");
					par.push("nwbflag="+$('#nwbflag input').attr('realvalue'));
					$('#gonghms').fieldSelect('resetUrl','<%=request.getContextPath()%>/beihuo/waibugonghms.do');
			 }
			 });
	});
	
	
	$(document).keyboardsupport({});
});

function flagchange(){
 	 var  nwbflag = $('#nwbflag input').attr('realValue');
 			if(nwbflag!=""){
 				if(nwbflag=='2'){
 						$('#gonghms').fieldSelect('resetUrl','<%=request.getContextPath()%>/beihuo/waibugonghms.do');
 				}else{
 						$('#gonghms').fieldSelect('resetUrl','<%=request.getContextPath()%>/beihuo/neibugonghms.do');
 				}
 			}
 			
 			if($('#nwbflag input').val()==$.sdcui.resource.i18n['C_GONGYSYH']){
 			$('#shiffsgys input').attr('disabled', false);
 			$('#shiffsgys input').attr('realValue','0')
 	   		 $('#shiffsgys input').val('${i18n.fou}');
 	    	var params = [];
			params.push("flag=4");
			params.push("nwbflag=2");
			$('#grid_user_${pageId}').grid("setQueryParams", params);
			var url = "<%=request.getContextPath()%>/beihuo/35101.do";
			$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 if (showPromptRequestMsg(results)==true){
				//加载grid
					$('#grid_user_${pageId}').grid("parseResult",results)
					$('#lingjbh input').val("")
					 $('#gongysdm input').val("")
					 $('#gongysmc span').html("")
					 $('#mudd input').val("")
					 $('#xunhbm input').val("")
					 $('#shangxsj1 input').val("")
				     $('#yaohsl input').val("")
					 $('#yaohlgs input').val("")
					 $('#usrl span').html("")
				     $('#lingjbh input').attr("readonly",false);
			 		 $('#mudd input').attr("readonly",false);
			 		 $('#gonghms input').attr("readonly",false);
			 }
			 });
 	    }else{
 	   		 $('#shiffsgys input').attr('disabled', true);
 	   		 $('#shiffsgys input').attr('realValue','')
 	   		 $('#shiffsgys input').val('');
 	    	var params = [];
			params.push("flag=4");
			params.push("nwbflag=1");
			$('#grid_user_${pageId}').grid("setQueryParams", params);
			var url = "<%=request.getContextPath()%>/beihuo/35101.do";
			$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 if (showPromptRequestMsg(results)==true){
				//加载grid
					$('#grid_user_${pageId}').grid("parseResult",results)
					$('#lingjbh input').val("")
					 $('#gongysdm input').val("")
					 $('#gongysmc span').html("")
					 $('#mudd input').val("")
					 $('#xunhbm input').val("")
					 $('#shangxsj1 input').val("")
				     $('#yaohsl input').val("")
					 $('#yaohlgs input').val("")
					 $('#usrl span').html("")
				     $('#lingjbh input').attr("readonly",false);
			 		 $('#gongysdm input').attr("readonly",false);
			 		 $('#mudd input').attr("readonly",false);
			 		 $('#gonghms input').attr("readonly",false);
			 }
			 });
 	    }
 	}
 	
</script>
</head>
<body>
<!--主体内容开始-->
<div id="title"></div>
<div id="form_user_${pageId}" class="ui-fieldLayout">
<table class="ui-grid" cellspacing="1" width="100%" >
			<tr>	      
		<td class="field-label">${i18n.yaohllx}：</td>
		<td class="field-container"><div class="ui-field" id="nwbflag"></div></td>
		<td class="field-label">${i18n.gonghms}：</td>
		<td class="field-container"><div class="ui-field" id="gonghms"></div></td>
		<td class="field-label">${i18n.kanbxhbm}：</td>
		<td class="field-container"><div class="ui-field" id="xunhbm"></div></td>
		<td class="field-label">${i18n.shiffsgys}：</td>
		<td class="field-container"><div class="ui-field" id="shiffsgys"></div></td>
      </tr>	 
	  	<tr>	 
	  	<td class="field-label">${i18n.lingjbh}：</td>
		<td class="field-container"><div class="ui-field" id="lingjbh"></div></td>	
	    <td class="field-label">${i18n.gongysdm}：</td>
		<td class="field-container"><div class="ui-field" id="gongysdm"></div></td>   
		<td class="field-label">${i18n.gongysmc}：</td>
		<td class="field-container"><div class="ui-field" id="gongysmc"></div></td>   
		<td class="field-label">${i18n.mudd}：</td>
		<td class="field-container"><div class="ui-field" id="mudd"></div></td>
		
	</tr>
	<tr>
	<td class="field-label">${i18n.yaohsl}：</td>
		<td class="field-container"><div class="ui-field" id="yaohsl"></div></td>
		<td class="field-label">${i18n.baozrl}：</td>
		<td class="field-container"><div class="ui-field" id="usrl"></div></td>
	 	<td class="field-label">${i18n.yaohlsl}：</td>
		<td class="field-container"><div class="ui-field" id="yaohlgs"></div></td>
		<td class="field-label">${i18n.zuiwjfsj}：</td>
		<td class="field-container"><div class="ui-field" id="shangxsj1"></div></td>
      </tr>	 
	  <tr>
		<td colspan="10" align="right">
		<span id="btn_insert"  class="ui-button">${i18n.add}[F2]</span>
		<span id="btn_qbdelete"  class="ui-button">${i18n.qbdelete}[F3]</span>
		<span id="btn_delete"  class="ui-button">${i18n.delete}[F4]</span>
		<span id="btn_wancbfs"  class="ui-button">${i18n.wancbfs}[F5]</span>
		<span id="btn_back"  class="ui-button">${i18n.back}[F11]</span>
		<span id="btn_return"  class="ui-button">${i18n.return}[F12]</span>
		</td>
      </tr>	 

  </table>

  <div id="grid_user_${pageId}" class='hidden-item'></div>
      </div>
		<br>
		
		
<div id='prompt'>${i18n.prompt}</div>

</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>