<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="订单零件修改">
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<script type="text/javascript">
$(function(){ 

	           $('body div.layout-panel.panel-north').remove();
	
	           $('body td.td-west').remove();
	
	           $('body div.layout-panel.panel-south').remove(); 
	       });
</script>
</head>

<t:page>

	<t:form id="ilquery" reset="NOT" submit="NOT">
		<t:grid id="ilorderEe" idKeys="id,dingdh,gongysdm,usercenter,edit_time,editor,p0fyzqxh" caption="" editAlias="DingdUpdate" src="/ilorder/queryDdLj.ajax" usePager="true" edit="NOT"
			load="true"  add="NOT" remove="NOT" scrollHeight="468" multiple="true" selectRowEvent="xqjsRowSelect" pageSize="20">
			<t:fieldLayout id="ilselect" prefix="il" columns="4">
				<t:fieldText property="lingjbh" caption="零件号" width="120" maxLength="10" minLength="10"></t:fieldText>
				<t:fieldText property="jihyz" caption="计划员组" width="120" maxLength="3" minLength="3"></t:fieldText>
				<t:fieldHidden property="usercenter"></t:fieldHidden>
				<t:fieldHidden property="dingdh"></t:fieldHidden>
				<t:fieldHidden property="gongysdm"></t:fieldHidden>
				<t:fieldHidden property="chullx"></t:fieldHidden>
				<t:fieldHidden property="dingdzt"></t:fieldHidden>
				<t:fieldHidden property="dingdnr"></t:fieldHidden>
			</t:fieldLayout>
			<div style=" font-size: 15px; ">
				<div align="left" >订单下零件列表P0:${p0fyzqxh}</div>
			</div>
			<t:gridCol property="chkbox" align="center" renderer="createCheckbox" caption="选择" ></t:gridCol>
			<t:gridCol property="dingdh" caption="订单号"></t:gridCol>
			<t:gridCol property="gongysdm" type="text" caption="供应商代码"></t:gridCol>
			<t:gridCol property="lingjbh" type="text" caption="零件号"></t:gridCol>
			<t:gridCol property="uabzlx" type="text" caption="UA包装类型"></t:gridCol>
			<t:gridCol property="uabzucrl" type="text" caption="UA包装容量"></t:gridCol>
			<t:gridCol property="uabzuclx" type="text" caption="UC包装类型"></t:gridCol>
			<t:gridCol property="uabzucsl" type="text" caption="UC包装容量"></t:gridCol>
			<t:gridCol property="gonghms" type="text" caption="供货模式"></t:gridCol>
			<t:gridCol property="p0sl" type="link" editorOptions="{openEvent:editAble,closeEvent:editJiaoy,'expression':'^[0-9]{1,10}(?:\\.[0-9]{1,3})?$|^0\\.[0-9]{1,3}$','expressionMessage':'整数部分最大位10位，小数部分最大位3位'}" editor="fieldText" caption="P0" ></t:gridCol>
			<t:gridCol property="p1sl" editorOptions="{openEvent:editAble,closeEvent:editJiaoy,'expression':'^[0-9]{1,10}(?:\\.[0-9]{1,3})?$|^0\\.[0-9]{1,3}$','expressionMessage':'整数部分最大位10位，小数部分最大位3位'}" editor="fieldText" caption="P1" ></t:gridCol>
			<t:gridCol property="p2sl" editorOptions="{openEvent:editAble,closeEvent:editJiaoy,'expression':'^[0-9]{1,10}(?:\\.[0-9]{1,3})?$|^0\\.[0-9]{1,3}$','expressionMessage':'整数部分最大位10位，小数部分最大位3位'}" editor="fieldText" caption="P2"  ></t:gridCol>
			<t:gridCol property="p3sl" editorOptions="{openEvent:editAble,closeEvent:editJiaoy,'expression':'^[0-9]{1,10}(?:\\.[0-9]{1,3})?$|^0\\.[0-9]{1,3}$','expressionMessage':'整数部分最大位10位，小数部分最大位3位'}" editor="fieldText" caption="P3" ></t:gridCol>
			<t:gridCol property="jihyz" type="text" caption="计划员组"></t:gridCol>
			<t:gridCol property="dingdzt"  type="text" caption="状态" convert="ddzt"></t:gridCol>

		</t:grid>
	</t:form>
	<t:fieldLayout columns="1">
		<t:buttons id="btn">
			<t:button caption="添加新零件" name="addLj" />
			<t:button caption="修改" name="edit" />
		</t:buttons>
	</t:fieldLayout>

	<t:form id="ilAddDdlj" dialog="true"  caption="新增" submit="NOT">
		<t:fieldLayout prefix="add">
		    <t:fieldHidden property="usercenter"></t:fieldHidden>
		    <t:fieldHidden property="danw"></t:fieldHidden>
		    <t:fieldHidden property="p0fyzqxh"></t:fieldHidden>
			<t:fieldText property="dingdh" caption="订单号" width="150" readonly="true"></t:fieldText>
			<t:fieldText property="gongysdm" caption="供应商代码" width="150" readonly="true"></t:fieldText>
			<t:fieldText property="lingjbh" caption="零件号" width="150" notNull="true" maxLength="10"></t:fieldText>
			<t:fieldText property="heth"    caption="合同号" width="150" readonly="true"></t:fieldText>
			<t:fieldSelect property="cangkdm" caption="仓库" width="150"  notNull="true"  parents="usercenter,lingjbh" show="cangkbh" code="cangkbh" src="/ilorder/queryLingjck.ajax"></t:fieldSelect>
			<t:fieldText property="uabzuclx" caption="包装类型" width="150" notNull="true"      readonly="true"></t:fieldText>
			<t:fieldText property="uabzucrl" caption="包装容量"   width="150" notNull="true"      readonly="true"></t:fieldText>
			<t:fieldText property="p0sl" caption="P0" width="150" defaultValue="0"  expression='^[0-9]{1,10}(?:\\.[0-9]{1,3})?$|^0\\.[0-9]{1,3}$'  expressionMessage='整数部分最大位10位，小数部分最大位3位'></t:fieldText>
			<t:fieldText property="p1sl" caption="P1" width="150" defaultValue="0" ></t:fieldText>
			<t:fieldText property="p2sl" caption="P2" width="150" defaultValue="0" ></t:fieldText>
			<t:fieldText property="p3sl" caption="P3" width="150" defaultValue="0" ></t:fieldText>
			<t:fieldText property="jihyz" caption="计划员组" width="150" readonly="true"></t:fieldText>
			<t:button caption="提交" name="subAdd"></t:button>
		</t:fieldLayout>
	</t:form>

</t:page>

 
<script type="text/javascript">
  	$.sdcui.serverConfig.convertArray['ddzt'] = {
		'0' : '已定义',
		'1' : '制作中',
		'2' : '待生效',
		'3' : '拒绝',
		'4' : '已生效',
		'5' : '已发送'
	};
	/**
	*列渲染事件,创建checkbox	
	*/
	function createCheckbox(){
		return "<input  name='chkbox'  type='checkbox' value='1'/>";
	}
  //填写零件号失去焦点事件
  $(function() {
		$('#add_lingjbh').bind('focusout', function() {
			var usercenter = $('#add_usercenter').fieldValue();
			var lingjbh = $('#add_lingjbh').fieldValue();
			var gongysdm = $('#add_gongysdm').fieldValue();
			if(lingjbh==''){
			   alert("零件编号不能为空！");
			   return false;
			}
			$.sdcui.ajaxUtil.ajax({
					url : "${ctx}/kdorder/getrl.ajax",
					data : "lingjbh="+ lingjbh+"&usercenter="+usercenter+"&gongysbh="+gongysdm,
					success : function(result) {
						if (result.flag != null&&(result.msg=='ljgongys'||result.msg=='jihy')) {
						    $('#add_lingjbh').attr("error","【零件号】输入有误");
							alert(result.flag);
						} else {
						    $('#add_lingjbh').removeAttr("error"); 
							$("#add_uabzuclx").fieldValue(result.uabzuclx);
							$("#add_uabzucrl").fieldValue(result.uabzucrl);
							$("#add_jihyz").fieldValue(result.jhy);
							$("#add_danw").fieldValue(result.danw);
							$("#add_heth").fieldValue(result.heth);
						}
					}
				});
		})
	})
  
  
  $.sdcui.serverConfig.convertArray['gonghms'] = {'C1':'C1','CD':'CD','M1':'M1','MD':'MD'};
  
   function gridReload(){
         $('#ilorderEe').grid('reload');
   }

   function  func_button_addLj(){
                var dingdzt = $('#il_dingdzt').fieldValue();
                if(dingdzt>3){
                  alert("只能对已定义、制作中、待生效、拒绝的订单进行操作！");
                  return false;
                }
                $("#ilAddDdlj").form("clear");
			     var dingdh = $('#il_dingdh').fieldValue();
			     var gongysdm = $('#il_gongysdm').fieldValue(); 
			     var usercenter = $('#il_usercenter').fieldValue(); 
			     $('#add_usercenter').fieldValue(usercenter);
			     $('#add_dingdh').fieldValue(dingdh);
			     $('#add_gongysdm').fieldValue(gongysdm);
			     $('#add_p0sl').fieldValue("0");
			     $('#add_p1sl').fieldValue("0");
			     $('#add_p2sl').fieldValue("0");
			     $('#add_p3sl').fieldValue("0");
		         $("#ilAddDdlj").form("open");
   }
   
   /*
   window.onload=function(){
        if(document.readyState=="complete"){
        window.setTimeout("alink()",1600); 
       }
   
   }
	   
   function alink(){
       var dingdnr = $("#il_dingdnr").fieldValue();
	   var row = $("#ilorderEe").find('div.grid-scroll table.grid-table tr[id].row');
       $.each(row,function(i,n){
                           for(var j=0;j<4;j++){
                               var a = j;
                               var b = j+1;
                               var nrStr = dingdnr.substring(a,b);
                               if(nrStr==='9'){
                                   var m = j+9;
	                               var pTd = $(n).find('td:eq('+m+')');
		            	    	   var pn = pTd.text();
		            	    	   pTd.text('');
		            	    	   var htmlPn = "<a href='#' onclick='link(this)' name='P"+j+"'>"+pn+"</a>";
		            	    	   $(pTd).append(htmlPn  );
                               }
                           
                           
                           }
                            var p0Td = $(n).find('td:eq(6)');
            	    	   var p0 = p0Td.text();
            	    	   p0Td.text('');
            	    	   var htmlP0 = "<a href='#' onclick='link(this)' name='P0'>"+p0+"</a>";
            	    	   $(p0Td).append(htmlP0);
            	    	   
            	    	   var p1Td = $(n).find('td:eq(7)');
            	    	   var p1 = p1Td.text();
            	    	   p1Td.text('');
            	    	   var htmlP1 = "<a href='#' onclick='link(this)' name='P1'>"+p1+"</a>";
            	    	   $(p1Td).append(htmlP1);
            	    	   
            	    	   var p2Td = $(n).find('td:eq(8)');
            	    	   var p2 = p0Td.text();
            	    	   p2Td.text('');
            	    	   var htmlP2 = "<a href='#' onclick='link(this)' name='P2'>"+p2+"</a>";
            	    	   $(p2Td).append(htmlP2);
            	    	   
            	    	   var p3Td = $(n).find('td:eq(9)');
                           var p3 = p0Td.text();
            	    	   p3Td.text('');
            	    	   var htmlP3 = "<a href='#' onclick='link(this)' name='P3'>"+p3+"</a>";
            	    	   $(p3Td).append(htmlP3);
            	    })
   
   }
   */

   
   function editAble(){
           var flag = false;
           var dingdnr = $("#il_dingdnr").fieldValue();
           var event = window.event||arguments.callee.caller.arguments[2];
           var td = event.srcElement || event;
           var tdIndex=0;
           var pnr="";
           if(event.srcElement){
              tdIndex = parseInt(td.cellIndex)-9;
              pnr = dingdnr.substring(tdIndex,parseInt(tdIndex)+1);
		      //alert(tdIndex);
           }else{
               tdIndex = (td.caption).substring(1,2);
               pnr = dingdnr.substring(tdIndex,parseInt(tdIndex)+1);
     		   //alert(tdIndex);
           }
           if(pnr==='8') flag=true;
           return flag;
   
   }
   
   function editJiaoy(value){
  	    var  cell = this.col.cell;
		var rowElement = cell.parent('tr:first');
		var bzrlIndex = $('td.uabzucrl:first').prevAll().length;
		var bzrlStr = rowElement.find('td:eq('+bzrlIndex+')').text();
	    var uabzuclx = rowElement.find('td:eq('+(bzrlIndex + 1)+')').text();
	    if(uabzuclx == 'PP')
    	{
			var yu = value%bzrlStr;
			if(yu>0){
			    $(cell).attr("title","请按包装取整").addClass("validate-error");
			}
    	}
   }
   
   function link_p0sl(event){
	   var event = event||window.event;
		var element = event.srcElement || event.target;
		var pn = 'p0';
		var rowDoc = $(element).parents('tr:first')[0];
		var record = $('#ilorderEe').grid('getRecord',rowDoc);//获取当前行对应的记录
        record.pn=pn;
        
       	var ljid = record.id;
       	var dingdh = record.dingdh;
       	var usercenter = record.usercenter;
       	var gongysdm = record.gongysdm;
       	var lingjh = record.lingjbh;
       	var cangkdm = typeof record.cangkdm == 'undefined'?"":record.cangkdm;
       	var dingdzt = record.dingdzt;
       	var gonghms = record.gonghms;
       	var p0fyzqxh = record.p0fyzqxh;
        var url = 'initAnxMxDingd.do?id='+ljid+'&dingdh='+dingdh+'&usercenter='+usercenter+'&gongysdm='+gongysdm+'&lingjh='+lingjh+'&cangkdm='+cangkdm+'&dingdzt='+dingdzt+'&gonghms='+gonghms+'&pn='+pn+'&p0fyzqxh='+p0fyzqxh;
        window.open (url,'订单信息','height=450,width=900,top=200,left=200,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
		return false;
        
        /**
		 * form跳转模式提交
		 */
		/**$.sdcui.pageUtils.goPage({
			url:'/ilorder/initAnxMxDingd.do',//url
			record:record,//
			mode:'form',
			beforeSubmit:function(){
				//
				return true;
			}
		});*/
   }
   
	//订单新增后，刷新表格
	function  func_button_subAdd(){
      //平台验证
			var errorMessage = [];
			if (!$('#ilAddDdlj').form('validate')) {
			$('#ilAddDdlj').find('.youi-field.validating,.youi-field.validate-error').each(
					function() {
						if (this.title)
							errorMessage.push(this.title);
					});
			}	
	   if($('#add_lingjbh[error]').length!=0){
			   var msg = $('#add_lingjbh').attr("error");
			   $('#add_lingjbh').attr("class","youi-field fieldText validate-error");
			   errorMessage.push(msg);
			}		
	  if(errorMessage.length!=0){
			   	alert(errorMessage.join('\n'));
			    return ;
	 }	
      var params = [];
      var usercenter = $('#il_usercenter').fieldValue();
      var dingdh = $('#add_dingdh').fieldValue();
      var gongysdm = $('#add_gongysdm').fieldValue();
      var heth = $('#add_heth').fieldValue();
      var lingjbh = $('#add_lingjbh').fieldValue();
      var cangkdm = $('#add_cangkdm').fieldValue();
      var uabzucrl = $('#add_uabzucrl').fieldValue();
      var gonghms = $('#il_chullx').fieldValue();
      var dingdnr = $('#il_dingdnr').fieldValue();
      var danw = $('#add_danw').fieldValue();
      var p0sl = $('#add_p0sl').fieldValue();
      var p1sl = $('#add_p1sl').fieldValue();
      var p2sl = $('#add_p2sl').fieldValue();
      var p3sl = $('#add_p3sl').fieldValue();
      var jihyz = $('#add_jihyz').fieldValue();
      if(p0sl%uabzucrl>0||p1sl%uabzucrl>0||p2sl%uabzucrl>0||p3sl%uabzucrl>0){
         alert("请按包装取整");
         return ;
      }
      params.push('dd[0].usercenter='+usercenter);
      params.push('chullx='+$('#il_chullx').fieldValue());
      params.push('dd[0].dingdnr='+dingdnr);
      params.push('dd[0].danw='+danw);
      params.push('dd[0].dingdh='+dingdh);
      params.push('dd[0].gongysdm='+gongysdm);
      params.push('dd[0].lingjbh='+lingjbh);
      params.push('dd[0].cangkdm='+cangkdm);
      var p0fyzqxh = $('#add_p0fyzqxh').fieldValue();
      params.push('dd[0].p0fyzqxh='+p0fyzqxh);
      //params.push('dd[0].dingdwhr='+dingdwhr);
      params.push('dd[0].uabzucrl='+uabzucrl);
      params.push('dd[0].gonghms='+gonghms);
      params.push('dd[0].p0sl='+p0sl);
      params.push('dd[0].p1sl='+p1sl);
      params.push('dd[0].p2sl='+p2sl);
      params.push('dd[0].p3sl='+p3sl);
      params.push('dd[0].jihyz='+jihyz);
      params.push('dd[0].heth='+heth);
      params.push('anx=anx');
	  $.sdcui.ajaxUtil.ajax({
			url : "${ctx}/ilorder/insertIlDdlj.ajax",
			data : params.join('&'),
			success : function(result) {
                   alert(result.result);
                    $('#ilAddDdlj').form('close');
                    $('#ilorderEe').grid('reload');
                    //window.setTimeout("alink()",1500); 
                   
			}
		});
	}
		
		
		function  func_button_edit(){
		      //修改选中的记录
		       var param = $("#ilorderEe").grid('getSelectedRecords');
		       if(param.length==0){
		          alert("请选择一条记录！");
		          return false;
		       }
		       var dingdzt = $('#il_dingdzt').fieldValue();
               if(dingdzt>3){
                  alert("只能对已定义、制作中、待生效、拒绝的订单进行操作！");
                  return false;
                }
		        var params = [];
		        var error = $('#ilorderEe').find('td.validate-error');
				var errorMessage = [];
				if (error != null && error.length != 0) {
					errorMessage.push($(error[0]).attr('title'));
					$.sdcui.messageUtil.showError(errorMessage.join('\n'));
					return;
				}
		       for(var i=0;i<param.length;i++){
		           params.push('dd['+i+'].dingdh='+param[i].dingdh);
		           params.push('dd['+i+'].id='+param[i].id);
		             var p0sl = param[i].p0sl;
					 var p1sl = param[i].p1sl;
					 var p2sl = param[i].p2sl;
					 var p3sl = param[i].p3sl;
					 //var msg = "整数部分最大位10位，小数部分最大位3位";
					 /*if(!validateP(p0sl)){
					     alert("【P0】"+msg);
					     return false;
					 }
					 if(!validateP(p1sl)){
					     alert("【P1】"+msg);
					     return false;
					 }
					 if(!validateP(p2sl)){
					     alert("【P2】"+msg);
					     return false;
					 }
					 if(!validateP(p3sl)){
					     alert("【P3】"+msg);
					     return false;
					 }
					 if(!validateP(p4sl)){
					     alert("【P4】"+msg);
					     return false;
					 }*/
		           params.push('dd['+i+'].p0sl='+p0sl);
		           params.push('dd['+i+'].p1sl='+p1sl);
		           params.push('dd['+i+'].p2sl='+p2sl);
		           params.push('dd['+i+'].p3sl='+p3sl);
		           params.push('dd['+i+'].edit_time='+param[i].edit_time);
		           params.push('dd['+i+'].editor='+param[i].editor);
		       }
		       $.sdcui.ajaxUtil.ajax({
					url : "${ctx}/ilorder/updateDdLj.ajax",
					data : params.join('&'),
					success : function(result) {
		                 alert(result.result);
		                 $('#ilorderEe').grid('reload');
		                 //window.setTimeout("alink()",1500); 
				}
			});
		
		}
		
		//数量验证
	function validateP(value){
	     var patten = /^[0-9]{1,10}(?:\.[0-9]{1,3})?$|^0\.[0-9]{1,3}$/;
         var flag = patten.test(value);
         return flag;
	}
	
		
		
		
	/**
	 *订单号链接点击事件
	 */
	function link_lingjbh(event) {
		var url = '/ilorder/initAnxMxDingd.do' ;
		var event = event || window.event;//原生态的事件处理 
		var element = event.srcElement || event.target;
		var rowDoc = $(element).parents('tr:first')[0];
		var record = $('#ilorderEe').grid('getRecord', rowDoc);//获取当前行对应的记录
		/**
		 * form跳转模式提交
		 url='/ilorder/initDdlj.do'
		 */
		$.sdcui.pageUtils.goPage({
			url : url,//url
			record : record,//
			mode : 'form',
			beforeSubmit : function() {
				//
				return true;
			}
		});

	}
		
		
		
		
		
		
		
		
		
		
	</script>

<style type="text/css">
.but {
	width: 100px;
	float: left;
	text-align: center;
	margin: 0 0 0 5px;
}
td.editing
</style>
</t:html>