<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="订单明细修改">
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
		<t:grid id="ilorderEe" idKeys="id,dingdh,gongysdm,usercenter,edit_time,editor" caption="" showNum="true"  editAlias="DingdUpdate" 
		src="/ilorder/queryDdmx.ajax" usePager="true" scrollHeight="468" remove="NOT"  add="NOT" multiple="true" selectRowEvent="xqjsRowSelect"
			edit="NOT" load="true" pageSize="20">
			<t:fieldLayout id="ilselect" prefix="il" columns="4">
				<t:fieldText property="lingjbh" caption="零件号" width="120" maxLength="10"></t:fieldText>
				<t:fieldCalendar property="jiaofrqF" caption="交付日期" width="120" format="yyyy-MM-dd"></t:fieldCalendar>
				<t:fieldCalendar property="jiaofrqT" caption="至" width="120" format="yyyy-MM-dd"></t:fieldCalendar>
				<t:fieldHidden property="usercenter"></t:fieldHidden>
				<t:fieldHidden property="dingdh"></t:fieldHidden>
				<t:fieldHidden property="gongysdm"></t:fieldHidden>
				<t:fieldHidden property="cangkdm"></t:fieldHidden>
				<t:fieldHidden property="gonghms"></t:fieldHidden>
				<t:fieldHidden property="ljid"></t:fieldHidden>
				<t:fieldHidden property="lingjh"></t:fieldHidden>
				<t:fieldHidden property="dingdzt"></t:fieldHidden>
				<t:fieldHidden property="prqfw"></t:fieldHidden>
				<t:fieldHidden property="pn"></t:fieldHidden>
			</t:fieldLayout>
			<t:gridCol property="chkbox" align="center" renderer="createCheckbox" caption="选择" ></t:gridCol>
			<t:gridCol property="dingdh" type="text" caption="订单号"></t:gridCol>
			<t:gridCol property="gongysdm" type="text" caption="供应商代码"></t:gridCol>
			<t:gridCol property="lingjbh" type="text" caption="零件号"></t:gridCol>
			<t:gridCol property="cangkdm" type="text" caption="仓库"></t:gridCol>
			<t:gridCol property="uabzucrl" type="text" caption="包装容量"></t:gridCol>
			<t:gridCol property="uabzuclx" type="text" caption="包装类型"></t:gridCol>
			<t:gridCol property="uabzucsl" type="text" caption="包装数量"></t:gridCol>
			<t:gridCol property="danw" type="text" caption="零件单位"></t:gridCol>
			<t:gridCol property="shul" type="text" caption="零件数量" editorOptions="{'notNull':true,closeEvent:editJiaoy,'expression':'^[0-9]{1,10}(?:\\.[0-9]{1,3})?$|^0\\.[0-9]{1,3}$','expressionMessage':'整数部分最大位10位，小数部分最大位3位'}"
				editor="fieldText"></t:gridCol>
			<t:gridCol property="jiaofrq" type="text" caption="交付日期" editorOptions="{'notNull':true,'format':'yyyy-MM-dd'}" editor="fieldCalendar"></t:gridCol>

		</t:grid>
	<t:fieldLayout columns="1">
		<t:buttons id="btn">
			<t:button caption="增加" name="addmx"   />
			<t:button caption="修改" name="edit"    />
			<t:button caption="删除" name="delete"  />
		</t:buttons>
	</t:fieldLayout>
	</t:form>

	<t:form id="ilAddDdmx" dialog="true"  caption="新增" submit="NOT" reset="NOT">
		<t:fieldLayout prefix="add" >
		    <t:fieldHidden property="usercenter"></t:fieldHidden>
			<t:fieldText property="dingdh" caption="订单号" width="150" readonly="true" ></t:fieldText>
			<t:fieldText property="gongysdm" caption="供应商代码" width="150" readonly="true"></t:fieldText>
			<t:fieldText property="lingjbh" caption="零件号" width="150" readonly="true" maxLength="10"></t:fieldText>
			<t:fieldText property="cangkdm" caption="仓库" width="150" ></t:fieldText>
			<t:fieldText property="uabzucrl" caption="包装容量" width="150" readonly="true" notNull="true" ></t:fieldText>
			<t:fieldText property="uabzuclx" caption="包装类型" width="150" readonly="true"></t:fieldText>
			<t:fieldText property="uabzucsl" caption="包装数量" width="150" readonly="true" notNull="true"></t:fieldText>
			<t:fieldText property="danw" caption="零件单位" width="150" readonly="true"></t:fieldText>
			<t:fieldText property="shul" caption="零件数量" width="150" notNull="true" expression='^[0-9]{1,10}(?:\\.[0-9]{1,3})?$|^0\\.[0-9]{1,3}$' expressionMessage='整数部分最大位10位，小数部分最大位3位'></t:fieldText>
			
			<t:fieldCalendar property="jiaofrq" caption="交付时间" width="150" format="yyyy-MM-dd" notNull="true"></t:fieldCalendar>
			<t:button caption="提交" name="subAdd"></t:button>
			<t:button caption="重置" name="subReset"></t:button>
		</t:fieldLayout>
	</t:form>

</t:page>

<script type="text/javascript">

       /**
	*列渲染事件,创建checkbox	
	*/
	function createCheckbox(){
		return "<input  name='chkbox'  type='checkbox' value='1'/>";
	}
	
	$(function(){
	      var gonghms = $("#il_gonghms").fieldValue();
	      var td = $("label#fieldText-add_cangkdm").parent("td:first");
	      if(gonghms.indexOf("N")!=-1){
	         $(td).removeClass("notNull");
	      }else{
	         $(td).addClass("notNull");
	        // $("div#add_cangkdm").apendChild('<div class="field-invalid"></div>');
	      }
	})

        function func_button_addmx() {
              
				 initIlAddDdmx();
                 $("#ilAddDdmx").form('open');
        }
  
	 function func_button_subReset() {
         
         $("#ilAddDdmx").form('reset');
		 initIlAddDdmx();
	}
	
	
	function initIlAddDdmx()
	{
		 var dingdzt = $('#il_dingdzt').fieldValue();
         if(dingdzt>3){
           alert("只能对已定义、制作中、待生效、拒绝的订单进行操作！");
           return false;
         }
          $("#ilAddDdmx").form('clear');
          var usercenter = $('#il_usercenter').fieldValue();
          var dingdh = $('#il_dingdh').fieldValue();
          var gongysdm = $('#il_gongysdm').fieldValue();
          var lingjh = $('#il_lingjh').fieldValue();
           var lingjbh = $('#il_lingjh').fieldValue();
          $('#add_gongysdm').fieldValue(gongysdm);
          $('#add_dingdh').fieldValue(dingdh);
          $('#add_lingjbh').fieldValue(lingjh);
          $('#add_usercenter').fieldValue(usercenter);
              var danw = "";
		         var records = $("#ilorderEe").grid('getRecords');
		         if(records.length!=0){
		            danw = records[0].danw;
		             $('#add_danw').fieldValue(danw);
		         }else{
		              var params = [];
		              params.push('lingjbh='+lingjbh);
				      params.push('usercenter='+usercenter);
				      var date = params.join('&');
				    	  $.sdcui.ajaxUtil.ajax({
					 	 	   url:"${ctx}/diaobl/getlingjmc.ajax",
					 	 	   data:params.join('&'),
					 	       success:function (result){
					 	        if(result.flag != null){
					 	        }else{
					 	        	var  obj = result.lingj;
					 	        	danw=obj.danw;
					 	        	 $('#add_danw').fieldValue(danw);
					 	               }
					 	 	      }
					           });
		         
		         }

	          if(records.length!=0){
	            uabzucrl = records[0].uabzucrl;
	            uabzuclx = records[0].uabzuclx;
	            uabzucsl = records[0].uabzucsl;
	             $('#add_uabzucrl').fieldValue(uabzucrl);
              $('#add_uabzuclx').fieldValue(uabzuclx);
              $('#add_uabzucsl').fieldValue(uabzucsl);
	         }else{
	              var params = [];
	              params.push('lingjbh='+lingjbh);
			      params.push('usercenter='+usercenter);
			      params.push('gongysbh='+gongysdm);
			      if(usercenter!=''&&gongysdm!=''&&lingjbh!=''){
							$.sdcui.ajaxUtil.ajax({
							url : "${ctx}/ilorder/queryLjgys.ajax",
							data : params.join('&'),
							success : function(result) {
							        var gys = result.result;
							        uabzucrl = gys[0].ucrl;
						            uabzuclx = gys[0].ucbzlx;
						            uabzucsl = gys[0].uaucgs;
						             $('#add_uabzucrl').fieldValue(uabzucrl);
					                 $('#add_uabzuclx').fieldValue(uabzuclx);
					                 $('#add_uabzucsl').fieldValue(uabzucsl);
							}
						});
	
				  }
	         
	         }
	}
	
  
   function editJiaoy(value){
  	    var  cell = this.col.cell;
		var rowElement = cell.parent('tr:first');
		var bzrlIndex = $('td.uabzucrl:first').prevAll().length;
		var bzslIndex = $('td.uabzucsl:first').prevAll().length;
		var bzrlStr = rowElement.find('td:eq('+bzrlIndex+')').text();
		var bzslStr = rowElement.find('td:eq('+bzslIndex+')').text();
		if(bzrlStr!=""&&bzslStr!=""){
		    var uabzrl = bzrlStr*bzslStr;
		    var yu = value%uabzrl;
			if(yu>0){
			    $(cell).attr("title","请按包装取整").addClass("validate-error");
			}
		}
		
   }
  
  function getUarl(obj){
         var obj ={};
         var usercenter = $('#il_usercenter').fieldValue();
         var lingjbh = $('#il_lingjh').fieldValue();
         var gongysdm = $('#il_gongysdm').fieldValue();
         var uabzucrl = "";
         var uabzuclx = "";
         var uabzucsl = "";
         var records = $("#ilorderEe").grid('getRecords');
         if(records.length!=0){
            uabzucrl = records[0].uabzucrl;
            uabzuclx = records[0].uabzuclx;
            uabzucsl = records[0].uabzucsl;
             obj.uabzucrl = uabzucrl;
	         obj.uabzuclx = uabzuclx;
	         obj.uabzucsl = uabzucsl;
         }else{
              var params = [];
              params.push('lingjbh='+lingjbh);
		      params.push('usercenter='+usercenter);
		      params.push('gongysbh='+gongysdm);
		      if(usercenter!=''&&gongysdm!=''&&lingjbh!=''){
						$.sdcui.ajaxUtil.ajax({
						url : "${ctx}/kdorder/getrl.ajax",
						data : params.join('&'),
						success : function(result) {
						        uabzucrl = result.uabzucrl;
					            uabzuclx = result.uabzuclx;
					            uabzucsl = result.uabzucsl;
					             obj.uabzucrl = uabzucrl;
						         obj.uabzuclx = uabzuclx;
						         obj.uabzucsl = uabzucsl;
						}
					});

			  }
         
         }
  }    
  
   function getDanw(){
         var usercenter = $('#il_usercenter').fieldValue();
         var lingjbh = $('#il_lingjh').fieldValue();
         var danw = "";
         var records = $("#ilorderEe").grid('getRecords');
         if(records.length!=0){
            danw = records[0].danw;
         }else{
              var params = [];
              params.push('lingjbh='+lingjbh);
		      params.push('usercenter='+usercenter);
		      var date = params.join('&');
		    	  $.sdcui.ajaxUtil.ajax({
			 	 	   url:"${ctx}/diaobl/getlingjmc.ajax",
			 	 	   data:params.join('&'),
			 	       success:function (result){
			 	        if(result.flag != null){
			 	        }else{
			 	        	var  obj = result.lingj;
			 	        	danw=obj.danw;
			 	               }
			 	 	      }
			           });
         
         }
  
         return danw;
  }    
  
    // 仓库编号
  $(function (){
          $("#add_cangkdm").bind("focusout",function(){
		            var params = [];
		            var usercenter = $('#add_usercenter').fieldValue();
		            var lingjbh = $('#add_lingjbh').fieldValue();
		            var cangkbh = $('#add_cangkdm').fieldValue();
		            params.push('usercenter=' + usercenter);
					params.push('lingjbh=' + lingjbh);
					params.push('cangkbh=' + cangkbh);
		            $.sdcui.ajaxUtil.ajax({
					url : "${ctx}/ilorder/queryLingjck.ajax",
					data : params.join('&'),
					success : function(result) {
		                  if(result.total!=1){
		                     alert("请输入正确的仓库编号");
		                     $('div#add_cangkdm').addClass("editing edited validate-error").attr("error","【仓库编号】有误");
		                  }else{
								if( $('div#add_cangkdm editing edited validate-error')){
									$('div#add_cangkdm').removeAttr("error"); 
								}
							  /*  var obj = result.result;
								$('#add_uabzucrl').fieldValue(obj[0].ucrl);
								$('#add_uabzuclx').fieldValue(obj[0].uclx);
								var shul=$('#add_shul').fieldValue();
								if(obj[0].ucrl!=""&&shul!=""){
								   var uabzucsl = ceil(shul/obj[0].ucrl);
								   $('#add_uabzucsl').fieldValue(uabzucsl);
								}*/
							}
					}
				});
          });
          
         /* $("#add_shul").bind("focusout",function(){
             var shul=$('#add_shul').fieldValue();
             var uabzucrl=$('#add_uabzucrl').fieldValue();
			 if(uabzucrl!=""&&shul!=""){
			   var uabzucsl = Math.ceil(shul/uabzucrl);
			   $('#add_uabzucsl').fieldValue(uabzucsl);
			 }
          })*/
      
    }) 

   
   
      
 /*  function add_cangkdm_change(){
            var params = [];
            var usercenter = $('#add_usercenter').fieldValue();
            var gongysdm = $('#add_gongysdm').fieldValue();
            var lingjbh = $('#add_lingjbh').fieldValue();
            params.push('usercenter=' + usercenter);
			params.push('gongysbh=' + gongysdm);
			params.push('lingjbh=' + lingjbh);
			if(usercenter!=''&&gongysdm!=''&&lingjbh!=''){
						$.sdcui.ajaxUtil.ajax({
						url : "${ctx}/kdorder/getrl.ajax",
						data : params.join('&'),
						success : function(result) {
			                  $('#add_uabzucrl').fieldValue(result.uabzucrl);
			                  $('#add_uabzuclx').fieldValue(result.uabzuclx);
			                  $('#add_uabzucsl').fieldValue(result.uabzucsl);
			                  $('#add_danw').fieldValue(result.danw);
						}
					});

			}
            
    
    }  */
    
      
	/**
	 *新增订单行
	
	 */
	function func_button_subAdd() {
		var params = [];
		var ghms =  $('#il_gonghms').fieldValue();
		 var dingdzt = $('#il_dingdzt').fieldValue();
		var dingdh = $('#add_dingdh').fieldValue();
		var usercenter = $('#il_usercenter').fieldValue();
		var gongysdm = $('#add_gongysdm').fieldValue();
		var lingjbh = $('#add_lingjbh').fieldValue();
		var cangkdm = $('#add_cangkdm').fieldValue();
		var uabzucrl = $('#add_uabzucrl').fieldValue();
		var uabzuclx = $('#add_uabzuclx').fieldValue();
		var uabzucsl = $('#add_uabzucsl').fieldValue();
		var danw = $('#add_danw').fieldValue();
		var shul = $('#add_shul').fieldValue();
		var jiaofrq = $('#add_jiaofrq').fieldValue();
		
		var errorMessage = [];
		if (!$('#ilAddDdmx').form('validate')) {
			$('#ilAddDdmx').find(
					'.youi-field.validating,.youi-field.validate-error').each(
					function() {
						if (this.title)
							errorMessage.push(this.title);
					});
			//$.sdcui.messageUtil.showError(errorMessage.join('\n'));
			// return;
		}
		var td = $("label#fieldText-add_cangkdm").parent("td:first");
		if($(td).hasClass("notNull")&&$("#add_cangkdm").fieldValue()==""){
	        $('#add_cangkdm').attr("class","youi-field fieldText validate-error");
			errorMessage.push("【仓库代码】不能为空");
	   }else if($('div#add_cangkdm[error]').length!=0){
		    errorMessage.push($('div#add_cangkdm').attr("error"));
		}
		if(errorMessage.length!=0){
		   alert(errorMessage.join('\n'));
		   return;
		}
		var uabzrl = uabzucrl*uabzucsl;
	    var yu = shul%uabzrl;
		if(yu>0){
		    alert("请按包装取整");
		    return ;
		}
		var pn = $('#il_pn').fieldValue();
		var prqfw = $('#il_prqfw').fieldValue();
		var gong
		if(ghms != 'PJ' && ghms != 'NJ' && ghms != 'VJ')
		{
			var time = prqfw.split("_");
	        var arr1=time[0].split("-");
	        var arr2=time[1].split("-");
	        var firsttime=new Date(arr1[0],arr1[1],arr1[2]);
	        var secondtime=new Date(arr2[0],arr2[1],arr2[2]);
	        var jrq = jiaofrq.split("-");
	        var jrqtime=new Date(jrq[0],jrq[1],jrq[2]);
			if(jrqtime<firsttime||secondtime<jrqtime){
			   var rqmsg = "交付时间不在"+pn+"开始时间"+time[0]+"结束时间"+time[1]+"之间";
			   alert(rqmsg);
			   return ;
			}
		}
		//params.push('ljid=' + $('#il_ljid').fieldValue());
		params.push('pn=' + pn);
		
		params.push('usercenter=' + usercenter);
		params.push('gongysdm=' + gongysdm);
		params.push('dingdh=' + dingdh);
		params.push('lingjbh=' + lingjbh);
		params.push('cangkdm=' + cangkdm);
		params.push('uabzucrl=' + uabzucrl);
		params.push('uabzuclx=' + uabzuclx);
		params.push('uabzucsl=' + uabzucsl);
		params.push('danw=' + danw);
		params.push('shul=' + shul);
		params.push('leix=9');
		params.push('jiaofrq=' + jiaofrq);
		params.push('dingdzt=' + dingdzt);
		params.push('gonghms=' +$('#il_gonghms').fieldValue() );
		params.push('gonghlx=' +$('#il_gonghms').fieldValue() );
		$.sdcui.ajaxUtil.ajax({
			url : "${ctx}/ilorder/addDdMx.ajax",
			data : params.join('&'),
			success : function(result) {
			    if (result.res != null) {
				    alert(result.res);
				    $("#ilAddDdmx").form('close');
				    $("#ilorderEe").grid('reload');
				    window.opener.gridReload();
				}else{
				    alert(result.result); 
				}
			}
		});

	}

	/**
	 *修改订单行
	 */
	function func_button_edit() {
		//修改选中的记录
		var param = $("#ilorderEe").grid('getSelectedRecords');
		if (param.length == 0) {
			alert("请选择一条记录！");
			return false;
		}
        var dingdzt = $('#il_dingdzt').fieldValue();
        if(dingdzt>3){
          alert("只能对已定义、制作中、待生效的订单进行操作！");
          return false;
        }
		var error = $('#ilorderEe').find('td.validate-error');
		var errorMessage = [];
		if (error != null && error.length != 0) {
			errorMessage.push($(error[0]).attr('title'));
			$.sdcui.messageUtil.showError(errorMessage.join('\n'));
			return;
		}
		var params = [];
		for ( var i = 0; i < param.length; i++) {
			params.push('ddmx[' + i + '].usercenter=' + param[i].usercenter);
			params.push('ddmx[' + i + '].id=' + param[i].id);
			params.push('ddmx[' + i + '].shul=' + param[i].shul);
			params.push('ddmx[' + i + '].jiaofrq=' + param[i].jiaofrq);
			params.push('ddmx[' + i + '].edit_time=' + param[i].edit_time);
			params.push('ddmx[' + i + '].editor=' + param[i].editor);
		}
		params.push('usercenter=' + $('#il_usercenter').fieldValue());
		params.push('ljid=' + $('#il_ljid').fieldValue());
		params.push('dingdh=' + $('#il_dingdh').fieldValue());
		params.push('lingjbh=' + param[0].lingjbh);
		params.push('pn=' + $('#il_pn').fieldValue());
		params.push('cangkdm=' +$('#il_cangkdm').fieldValue() );
		params.push('gonghms=' +$('#il_gonghms').fieldValue() );
		params.push('gonghlx=' +$('#il_gonghms').fieldValue() );
		params.push('prq=' +$('#il_prqfw').fieldValue());
		params.push('dingdzt='+dingdzt);
		$.sdcui.ajaxUtil.ajax({
			url : "${ctx}/ilorder/updateMxSl.ajax",
			data : params.join('&'),
			success : function(result) {
				alert(result.result);
				$("#ilorderEe").grid('reload');
				window.opener.gridReload();
			}
		});

	}

	/**
	 *删除订单行
	 */
	function func_button_delete() {
		//修改选中的记录
		var param = $("#ilorderEe").grid('getSelectedRecords');
		if (param.length == 0) {
			alert("请选择一条记录！");
			return false;
		}
	    var dingdzt = $('#il_dingdzt').fieldValue();
        if(dingdzt>3){
          alert("只能对已定义、制作中、待生效，拒绝的订单进行操作！");
          return false;
        }
		var params = [];
		for ( var i = 0; i < param.length; i++) {
			params.push('ddmx[' + i + '].usercenter=' + param[i].usercenter);
			params.push('ddmx[' + i + '].dingdh=' + param[i].dingdh);
			params.push('ddmx[' + i + '].lingjbh=' + param[i].lingjbh);
			params.push('ddmx[' + i + '].gongysdm=' + param[i].gongysdm);
			params.push('ddmx[' + i + '].cangkdm=' + typeof param[i].cangkdm == 'undefined'?"":param[i].cangkdm);
			params.push('ddmx[' + i + '].jiaofrq=' + param[i].jiaofrq);
			params.push('ddmx[' + i + '].edit_time=' + param[i].edit_time);
			params.push('ddmx[' + i + '].editor=' + param[i].editor);
		}
		params.push('usercenter=' + $('#il_usercenter').fieldValue());
		params.push('ljid=' + $('#il_ljid').fieldValue());
		params.push('dingdh=' + $('#il_dingdh').fieldValue());
		params.push('lingjbh=' + param[0].lingjbh);
		params.push('dingdzt=' + dingdzt);
		params.push('pn=' + $('#il_pn').fieldValue());
		params.push('gonghms=' +$('#il_gonghms').fieldValue() );
		params.push('gonghlx=' +$('#il_gonghms').fieldValue() );
		params.push('cangkdm=' +$('#il_cangkdm').fieldValue());
		params.push('prq=' +$('#il_prqfw').fieldValue());
		$.sdcui.ajaxUtil.ajax({
			url : "${ctx}/ilorder/deleteDdMx.ajax",
			data : params.join('&'),
			success : function(result) {
				alert(result.result);
				$("#ilorderEe").grid('reload');
				window.opener.gridReload();
			}
		});

	}
</script>

<style type="text/css">

</style>
</t:html>