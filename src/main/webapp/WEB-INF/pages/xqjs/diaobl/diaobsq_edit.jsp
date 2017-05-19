<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="${i18n.lbjdbsqd}" >
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
<t:page i18n="i18n.xqjs.diaobl.diaoblquery">
 <t:panel id="panelsqedit">
 <t:form id="diaobl_edit"  reset="NOT" submit="NOT">
    <table align="center"  >
		 <tr >
		     <td  align="center"  colspan="2">${i18n.lbjdbsqd}${diaobsqdh}</td>
		 </tr>
		       
		 <tr>
		     <td  align="center" >${i18n.sj}:${diaobsqsj}</td>
		     <td  align="center" id="showbanc">${i18n.banc}:${banc}</td>
		 </tr>
		 
		 <tr>
			 <td  colspan="2">
				<t:grid id="grid_diaobsq" idKeys="usercenter,diaobsqdh,lux,lingjbh,editor,edit_time" caption="${i18n.diaoblsq}"  
				   showNum="true"  back="NOT"  multiple="true" selectRowEvent="xqjsRowSelect"
				  add="NOT"  edit="NOT"  remove="NOT"   scrollHeight="430" pageSize="20"
				  dataFormId="form_sqedit"   insertAlias="diaobsqmxs"  editAlias="diaobsqmxs" 
				  src="/diaobl/searchsqmx.ajax"   usePager="true"  >
					<t:fieldLayout  id="layout" prefix="dbsq">
						<t:fieldText property="lingjbh" caption="${i18n.lingjbh}" maxLength="20" width="150"></t:fieldText>
						<t:fieldSelect property="zhuangt" caption="${i18n.zhuangt1}" convert="queryDblShzt" width="150"></t:fieldSelect>
			            <t:fieldHidden property="usercenter" ></t:fieldHidden>
			            <t:fieldHidden property="diaobsqdh" ></t:fieldHidden>
			             </t:fieldLayout>
			        <t:gridCol property="chkbox"  renderer="createChkbox"  caption="${i18n.xuanzhe}"></t:gridCol>     
					<t:gridCol  property="lux" type="text" caption="${i18n.lux}"></t:gridCol>
					<t:gridCol  property="lingjbh" type="text" caption="${i18n.lingjbh}"></t:gridCol>
					<t:gridCol  property="lingjmc" type="text" caption="${i18n.lingjmc}"></t:gridCol>
					<t:gridCol  editor="fieldText"  property="shenbsl" type="text" caption="${i18n.shenbsl}"  editorOptions="{'notNull':true,'expression':'^[0-9]{1,10}(?:\\.[0-9]{1,6})?$|^0\\.[0-9]{1,6}$','expressionMessage':'整数部分最大位10位，小数部分最大位6位'}"></t:gridCol>
					<t:gridCol  property="shipsl" type="text" caption="${i18n.shipsl}" ></t:gridCol>
					<t:gridCol  editor="fieldCalendar" editorOptions="{'format':'yyyy-MM-dd'}" property="yaohsj" type="text" caption="${i18n.yaohsj}"></t:gridCol>
					<t:gridCol property="zhuangt" caption="${i18n.zhuangt}"  convert="tongy"></t:gridCol>
					<t:gridCol  property="jihy" type="text"  caption="${i18n.jihy}"></t:gridCol>
				</t:grid>
			</td>
		</tr>
	</table>
</t:form>
</t:panel>
 <t:form dialog="true" id="form_sqedit" caption="${i18n.diaoblsq}"  submit="NOT"   >
			<t:fieldLayout prefix="sqedit"  id="add_sq">
					<t:fieldText   property="lingjbh"    caption="${i18n.lingjbh}"  notNull="true" width="150"></t:fieldText>
					<t:fieldText   property="lingjmc"    caption="${i18n.lingjmc}" readonly="true" width="150"></t:fieldText>
					<t:fieldText   property="lux"      caption="${i18n.lux}"  notNull="true" width="150" maxLength="3" minLength="3" expression='^[A-Za-z0-9]{3}$' expressionMessage='制造路线为2位数字1位字母或三位字母组成'></t:fieldText>
					<t:fieldText   property="shenbsl"    caption="${i18n.shenbsl}"  notNull="true" expression='^[0-9]{1,10}(?:\\.[0-9]{1,6})?$|^0\\.[0-9]{1,6}$' expressionMessage ='整数部分最大位10位，小数部分最大位6位' width="150" maxLength="13"></t:fieldText>
					<t:fieldCalendar  property="yaohsj"  format="yyyy-MM-dd" caption="${i18n.yaohsj}" notNull="true" width="150"></t:fieldCalendar>
					<t:button caption="${i18n.tijiao}" name="btnSubmit"></t:button>
			</t:fieldLayout>
		</t:form>
		
      
         <t:buttons  id="dbsq">
                  <t:button  name="add" caption="${i18n.add}" ></t:button>
                  <t:button  name="edit" caption="${i18n.update}" ></t:button>
                  <t:button  name="delete" caption="${i18n.delete}" ></t:button>
                  <t:button  name="print" caption="${i18n.print}" ></t:button>
         </t:buttons>
    
        <input id="usercenter" type="hidden" value="${usercenter}"> 
		<input id="diaobsqdh" type="hidden" value="${diaobsqdh }"> 
		<input id="diaobsqsj" type="hidden" value="${diaobsqsj }">
		<input id="banc" type="hidden" value="${banc}">
		<form id="printform" name="printform" method="post"  style="display: none;">
			<div>
				<input type="text"  id="justDoPrint" name="justDoPrint" value=""/><!-- 立即预览打印 -->
				<input type="text" id="billcode" name="billcode" value=""/><!-- 单据号（唯一标识单据，用作打印历史维护） -->
				<input type="text" id="jsondataprovider" name="jsondataprovider" value=""/><!-- 自定义封装的json字符串 -->		
				<input type="text" id="selectedid" name="selectedid" value=""/><!-- 选择数据表格时的多选id -->
				<input type="text" id="clazzparams" name="clazzparams" value=""/><!-- 配置为clazz时传递的json形式参数 -->	
				<input type="text" id="templatecode" name="templatecode" value=""/><!-- 直接预览（打印）不进行模板选择时使用 -->
			</div>
		</form>	
		<input id="removeId" value="${removeId}" type="hidden"/>  
		
</t:page>
	<script type="text/javascript">
	 		
	 
	$.sdcui.serverConfig.convertArray['tongy'] = {
		'00' : '${i18n.notVerify}',
		'20' : '${i18n.ysh}'
	};

	 //用户中心
      //var  usercenter = $("#dbsq_usercenter").fieldValue();    
	//var usercenter = $("#usercenter").val();
	
	//调拨申请单号
	// var  diaobsqdh = $("#record_diaobsqdh").fieldValue();  
	// var   diaobsqdh = $("#diaobsqdh").val(); 
	 
	 //调拨申请时间
	// var  diaobsqsj = $("#diaobsqsj").val();
	 
	 //版次
	// var   banc = $("#banc").val(); 
	 
	//路线
	// var lux ="";
	 
	 //零件号
	 // var lingjbh ="";
	  /**
	*列渲染事件,创建checkbox	
	*/
	function createChkbox(){
		return "<input  name='chkbox'   type='checkbox'  />";
	}
	 
	function  func_validate_sl(){
		var value = this.col.cell.text(); 
		//行编辑验证,申报数量
        var slr =/^([1-9]\d{0,3}(?:\.\d{1,6})?|0\.\d*[1-9]\d*)$/;
		      if(!slr.test(value) || value.length > 11){
		    	 alert('${i18n.js_shenbsl}');		
                 return  false;
		 }
	}
	 
	$(document).ready(function(){
		$("#sqedit_lingjbh").bind("focusout",function(){
			  var  param =[];
			  var usercenter = $("#usercenter").val();
			  lingjbh = $("#sqedit_lingjbh").fieldValue(); 
			  param.push('lingjbh='+lingjbh);
		      param.push('usercenter='+usercenter);
		      var date = param.join('&');
		      if(lingjbh!=""){
		           $.sdcui.ajaxUtil.ajax({
		 	 	   url:"${ctx}/diaobl/getlingjmc.ajax?"+date,
		 	 	   //data:{"lux":lux,"lingjbh":lingjbh,"usercenter":usercenter},
		 	       success:function (result){
				 	        if(result.flag != null){
				 	        	//alert(result.flag);2012/10/29 前台页面重复提示零件编号为空,验证提交表单时做
				 	        	$("#sqedit_lingjbh").attr("error","【零件号】输入有误,未查到为生效的该零件号");
				 	        }else{
				 	                $("#sqedit_lingjbh").removeAttr("error");
				 	        	    var  obj = result.lingj;
						            lux = obj.lux; 
				 	        	    // $("#sqedit_lux").fieldValue(obj.lux);
				 	        	    $("#sqedit_lingjmc").fieldValue(obj.lingjmc);
				 	        	   
				 	         }
		 	 	        }
		           });
		      }
	          
	    
		});
		

		            

	});
	
	

	function luxInit(){
			var LeixElement = $('#sqedit_lux');
			if(!LeixElement.hasClass('loaded')){
				$('#sqedit_lux').html('<select id="lux" style="width:141px;">'+parseLeixOfOptions()+'</select>');
				$('#sqedit_lux').addClass('loaded').fieldCustom({
					property:'lux',
					setValue:function(value){
					},
					getValue:function(){
						var value = this.element.find('select').val()+this.element.find('input').val();
						return value;
					},
					clear:function(){
						this.element.find('select,input').val('');
					}
				});

			}
		}
		function parseLeixOfOptions(){
			var lux = {};
			 var red = $('#grid_diaobsq').grid('getRecords')[0];
 	        	    var redLux = red.lux;
 	        	    if(redLux=='97W'||redLux=='UGB'){
 	        	       lux.key1='97W';
 	        	       lux.key2='UGB';
 	        	       lux.value1='97W';
 	        	       lux.value2='UGB';
 	        	       //lux.value1='${i18n.ILdingh}';
 	        	       //lux.value2='${i18n.gangjuan}';
 	        	    }else{
 	        	       lux.key1='97X';
 	        	       lux.key2='97D';
 	        	       lux.value1='97X';
 	        	       lux.value2='97D';
 	        	       //lux.value1='${i18n.KDdingh}';
 	        	       //lux.value2='${i18n.AXdingh}';
 	        	    }   	    
			var htmls = [];
			var s1 = '<option value="'+lux.key1+'" selected>'+lux.value1+'</option>';
			htmls.push(s1);
			var s2 = '<option value="'+lux.key2+'">'+lux.value2+'</option>';
			htmls.push(s2);
			return htmls.join('');
		}
	
	
	
	
	
	//自定义按钮
	
	function  func_button_btnSubmit(){
		var  param =[];
		var  usercenter = $("#usercenter").val();
		var  diaobsqdh = $("#diaobsqdh").val(); 
		var  diaobsqsj = $("#diaobsqsj").val(); 
		var   banc = $("#banc").val(); 
        var  yaohsj = $("#sqedit_yaohsj").fieldValue(); 
	    var  shenbsl = $("#sqedit_shenbsl").fieldValue();   
	    var  lingjbh = $("#sqedit_lingjbh").fieldValue();   
	    var  lux = $("#sqedit_lux").fieldValue();
		var errorMessage = [];
		if (!$('#form_sqedit').form('validate')) {
			$('#form_sqedit').find(
					'.youi-field.validating,.youi-field.validate-error').each(
					function() {
						if (this.title)
							errorMessage.push(this.title);
					});
		}
	    if($('#sqedit_lingjbh[error]').length != 0){
	       errorMessage.push($("#sqedit_lingjbh").attr("error"));
	       $('#sqedit_lingjbh').attr("class","youi-field fieldText validate-error");
	    }
		if(errorMessage.length!=0){
		   alert(errorMessage.join('\n'));
		   return;
		}
	     param.push('usercenter='+usercenter);
	     param.push('diaobsqdh='+diaobsqdh);
	     param.push('lux='+lux);
	     param.push('lingjbh='+lingjbh);
	     param.push('yaohsj='+yaohsj);
	     param.push('shenbsl='+shenbsl);
	     param.push('banc='+banc);
	       $.sdcui.ajaxUtil.ajax({
	         url:"${ctx}/diaobl/add.ajax",
	 	 	   data:param.join('&'),
	 	       success:function (result){
	 	        if(result.flag != null){
	 	        	alert(result.flag);
	 	        	$("#grid_diaobsq").grid('reload');
	 	           }else{
	 	        	   alert(result.result);
	 	        	   //alert(result.banc);
		 	        	   var bancstr = result.banc;
		 	        	   var zhuangt =result.zhuangt;
		 	                $("#grid_diaobsq").grid('reload');
		 	        	   //func_reload(bancstr,zhuangt);
		 	        	  
	 	               }
	 	 	      }
	           });
	     
	}
	
	//增加、删除、修改后刷新页面
	function  func_reload(bancstr,zhuangt){
			var  usercenter = $("#usercenter").val();
			var  diaobsqdh = $("#diaobsqdh").val(); 
			var  diaobsqsj = $("#diaobsqsj").val(); 
			var  banc = $("#banc").val(); 
	        var  obj ={};
	        obj.usercenter = usercenter;
	        obj.diaobsqdh = diaobsqdh;
	        obj.diaobsqsj = diaobsqsj;
	        obj.banc = bancstr;
	        obj.zhuangt = zhuangt;
            /**
		 * form跳转模式提交
		 */
		 window.showModalDialog ("${ctx}/diaobl/initEdit.do?removeId=layout-north,layout-west,layout-south&usercenter="+usercenter+"&diaobsqdh="+diaobsqdh+"&diaobsqsj="+diaobsqsj+"&banc="+bancstr+"&zhuangt="+zhuangt,
		window,
		"dialogHeight=490px;dialogWidth=700px;dialogTop=100px;dialogLeft=100px;center:yes;scroll:no;status:no;resizable:yes;location:no");
		/*$.sdcui.pageUtils.goPage({
			url:'/diaobl/initEdit.do',//url
			record:obj,//
			mode:'form',
			beforeSubmit:function(){
				//
				return true;
			}
		});*/
	    window.close();
		/* event.stopPropagation();//阻止事件冒泡
		return false;	 */
	}
	
	function  func_button_add(){
	          $("#sqedit_yaohsj").fieldValue("");
	          $("#sqedit_lingjbh").fieldValue("");
	          $("#sqedit_lingjmc").fieldValue("");
	          $("#sqedit_shenbsl").fieldValue("");
	          $("#sqedit_lingjbh").removeClass("validate-error");
	          $("#sqedit_shenbsl").removeClass("validate-error");
	           $("#sqedit_yaohsj").removeClass("validate-error");
	          $('#form_sqedit').form('open');
	          //luxInit(); //制造路线手工输入
	       
	     
	         
	         
				 
	        
	} 
	
	
	
		//返回
		function func_button_back() {
			history.back();
			// window.history.go(-1);
			//window.history.forward();

		}
	
	
	function  func_button_edit(){
	          $('#grid_diaobsq').grid('triggerCloseEdited'); 
			  var  usercenter = $("#usercenter").val();
			  var  diaobsqdh = $("#diaobsqdh").val(); 
			  var  diaobsqsj = $("#diaobsqsj").val(); 
			  var  banc = $("#banc").val(); 
	          //获得选中行参数
	           var diaobsq= $('#grid_diaobsq').grid('getSelectedRecords');
	              //判断是否有选中一条数据
	            if(diaobsq.length == 0){
	               alert("${i18n.js_selected}");
	               return  false;
	            }
	            var error = $('#grid_diaobsq').find('td.validate-error');
				var errorMessage = [];
				if (error != null && error.length != 0) {
					errorMessage.push($(error[0]).attr('title'));
					$.sdcui.messageUtil.showError(errorMessage.join('\n'));
					return;
				}  
	          var  param = [];
		      for(var i=0;i<diaobsq.length;i++){
		            param.push('edit['+i+'].usercenter='+diaobsq[i].usercenter);
		            param.push('edit['+i+'].diaobsqdh='+diaobsq[i].diaobsqdh);
		            param.push('edit['+i+'].editor='+diaobsq[i].editor);
		            param.push('edit['+i+'].edit_time='+diaobsq[i].edit_time);
		            var  value = diaobsq[i].shenbsl;
		            param.push('edit['+i+'].shenbsl='+value);
		            param.push('edit['+i+'].lux='+diaobsq[i].lux);
		            param.push('edit['+i+'].lingjbh='+diaobsq[i].lingjbh);
		           }
		           param.push("usercenter="+usercenter);
		           param.push("diaobsqdh="+diaobsqdh);
		           param.push("banc="+banc); 
		   //修改ajax请求       
		   $.sdcui.ajaxUtil.ajax({
	         url:"${ctx}/diaobl/update.ajax",
	 	 	   data:param.join('&'),
	 	       success:function (result){
	 	        if(result.flag != null){
	 	        	alert(result.flag);
	 	           }else{
	 	        	   alert(result.result);
	 	        	 // var  bancstr = '版次:'+result.banc;
	 	        	   var bancstr =result.banc;
	 	        	    var zhuangt =result.zhuangt;
	 	        	    $("#grid_diaobsq").grid('reload');
	 	        	   //func_reload(bancstr,zhuangt);
	 	               }
	 	 	      }
	           });
	     
	
	} 
	
	function  func_button_delete(){
				var   usercenter = $("#usercenter").val();
				var   diaobsqdh = $("#diaobsqdh").val(); 
				var   diaobsqsj = $("#diaobsqsj").val(); 
				var   banc = $("#banc").val(); 
	            //获得选中行参数
	            var diaobsq= $('#grid_diaobsq').grid('getSelectedRecords');
	            //判断是否有选中一条数据
	            if(diaobsq.length == 0){
	               alert("${i18n.js_selected}");
	                 return  false;
	            }
	           // window.confirm("${i18n.js_delete}！");
	            if(!confirm("${i18n.js_delete}！")){
	            	return  false;
	            }
		        var param = [];
		        for(var i=0;i<diaobsq.length;i++){
		            param.push('edit['+i+'].usercenter='+diaobsq[i].usercenter);
		            param.push('edit['+i+'].diaobsqdh='+diaobsq[i].diaobsqdh);
		            param.push('edit['+i+'].editor='+diaobsq[i].editor);
		            param.push('edit['+i+'].edit_time='+diaobsq[i].edit_time);
		            param.push('edit['+i+'].lux='+diaobsq[i].lux);
		            param.push('edit['+i+'].lingjbh='+diaobsq[i].lingjbh);
		           }
		           param.push("usercenter="+usercenter);
		           param.push("diaobsqdh="+diaobsqdh);
		           param.push("banc="+banc); 
		   //修改ajax请求       
		   $.sdcui.ajaxUtil.ajax({
	         url:"${ctx}/diaobl/delete.ajax",
	 	 	   data:param.join('&'),
	 	       success:function (result){
	 	    		if(result.flag != null){
		 	        	alert(result.flag);
		 	        	$("#grid_diaobsq").grid('reload');
		 	           }else{
		 	        	   alert(result.result);
		 	        	   var bancstr =result.banc;
		 	        	    var zhuangt =result.zhuangt;
		 	        	 
		 	        	   $("#grid_diaobsq").grid('reload');
		 	        	   var red = $('#grid_diaobsq').grid('getRecords');
		 	        	   var  select=$('#grid_diaobsq').grid('getSelectedRecords');
		 	      			if(red.length==select.length){//如果删除全部数据，则关闭此窗口
		 		 	    		alert("该调拨单下已无明细，请重新申请调拨单,该窗口将关闭！！");
		 		 	    		
		 		 	    		//父窗口刷新  window.dialogArguments.location.reload()无法使用
		 		 	    		 window.dialogArguments.location.href='${ctx}/diaobl/initSq.do?dirName=调拨令查询-调拨令-准备层';
		 		 		         window.close();
		 	 	    	       }
		 	               }
	 	    	}
	 	        
	           });
		     
	} 
		 
    function  func_button_print(){
		/* var obj ={};
		obj.usercenter = usercenter;
		obj.diaobsqdh  = diaobsqdh;
		obj.diaobsqsj = diaobsqsj; */
		var  usercenter = $("#usercenter").val();
		var  diaobsqdh = $("#diaobsqdh").val(); 
		var  diaobsqsj = $("#diaobsqsj").val(); 
		var param = [];

        param.push('sq[0].usercenter='+usercenter);
        param.push('sq[0].diaobsqdh='+diaobsqdh);
        param.push('sq[0].diaobsqsj='+diaobsqsj);

         //a1=111&a2=999
		$.sdcui.ajaxUtil.ajax({
			url:"print.ajax",
	 		data:param.join('&'),
			success:function (result){
				var jsondata = result.json;
				print(jsondata);
			}
		});
	 
	}  
	
		function  print(jsondata){
			    var templatecode = "DIAOBSQ";
				var jsondata = jsondata;
				var selectedid = null;
				var clazzparams = null;
				var billcode = "BILLKEY";
				doprint_view(templatecode,jsondata,selectedid,clazzparams,billcode);
			
		    }
		
		    function doprint_view(templatecode,jsondata,selectedid,clazzparams,billcode){
				document.getElementsByName("jsondataprovider")[0].value = jsondata;
				document.getElementsByName("selectedid")[0].value=selectedid;
				document.getElementsByName("clazzparams")[0].value=clazzparams;
				document.getElementsByName("billcode")[0].value = billcode;
				document.getElementsByName("templatecode")[0].value = templatecode;
				document.getElementsByName("justDoPrint")[0].value = "false";
				var fm = document.getElementById("printform");
				fm.action = "${ctx}/webprint/print_doit.jsp";
				fm.target = "_blank";
				fm.submit();	
		    }
	</script>
	<style type="text/css"></style>
</t:html>