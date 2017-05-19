<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="${i18n.cjdbd}">
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
</head>

<t:page i18n="i18n.xqjs.diaobl.diaobsq">
	<t:panel id="sqpanel">

		<t:form id="form_diaobsq" reset="NOT" submit="NOT">
			<div>
				<h4>
					<span>${i18n.cjdbd}</span>
				</h4>
			</div>
			<table align="center" width="100%">
				<tr>
					<td align="center" width="100%" colspan="2">${i18n.lbjdbsqd}</td>
				</tr>
				<tr>
					<td width="50%" id="time" align="center">${i18n.sj}：${result}</td>
					<td width="50%" align="center">${i18n.banc}:0001</td>
				</tr>
				<tr>
				   <td width="100%" colspan="2">
				    <t:fieldLayout id="dbsq" prefix="dbsq" columns="3">
							<t:fieldSelect property="center" width="100" caption="${i18n.usercenter}" convert="queryUserCenterMap" notNull="true"></t:fieldSelect>
							<!-- xss v4_017 -->
							<t:fieldText property="huijkm" caption="${i18n.huijkm}"  maxLength="20" width="160"></t:fieldText>
							<t:fieldText property="chengbzx" caption="${i18n.chengbzx}" notNull="true" maxLength="5"  expression="^[a-zA-Z0-9]{0,5}$"  expressionMessage="由数字和字母组成，最大5位"  width="150"></t:fieldText>
			        </t:fieldLayout>
			       </td>
				</tr>
				<tr>
					<td colspan="2"><t:grid id="grid_diaobsq"  editable="true" idKeys="lingjbh" usePager="false" submit="NOT" reset="NOT" save="NOT" insertAlias="diaobsqmxs" 
							scrollHeight="160" back="NOT"  showEditorAddName="editorAdd" showEditorRemoveName="editorRemove" showNum="true">
							<t:gridCol editor="fieldText" property="lingjbh" type="text" caption="${i18n.lingjbh}" editorOptions="{'notNull':true,'maxLength':'10','minLength':'10',closeEvent:func_set_lingjh}"></t:gridCol>
							<t:gridCol property="lingjmc" type="text" caption="${i18n.lingjmc}"></t:gridCol>
							<t:gridCol property="lux"  editor="fieldText" type="text"  caption="${i18n.lux}" editorOptions="{'notNull':true,closeEvent:func_set_lux,'expression':'^[A-Za-z0-9]{3}$','expressionMessage':'制造路线为2位数字1位字母或三位字母组成'}"  ></t:gridCol>
							<t:gridCol editor="fieldText" property="shenbsl" type="text" caption="${i18n.shenbsl}" editorOptions="{'notNull':true,'expression':'^[0-9]{1,10}(?:\\.[0-9]{1,3})?$|^0\\.[0-9]{1,3}$','expressionMessage':'整数部分最大位10位，小数部分最大位3位'}"></t:gridCol>
							<t:gridCol editor="fieldCalendar" editorOptions="{'format':'yyyy-MM-dd','notNull':true}" property="yaohsj" caption="${i18n.yaohsj}"></t:gridCol>
						</t:grid></td>
				</tr>
			</table>
			<table>
				<tr>
					<td><t:fieldLayout id="sq_insert" prefix="sq" >
							<t:fieldArea property="beiz" caption="${i18n.beiz}" maxLength="50" width="600" ></t:fieldArea>
						</t:fieldLayout></td>
				</tr>
				<tr>
					<td><t:buttons id="sq_submit">
							<t:button caption="${i18n.btn_tjbdy}" name="sqsubmit"></t:button>
						</t:buttons>
						
					</td>
				</tr>
			</table>
		</t:form>
		
		
		<form id="form_daorwj" name="form_daorwj"  enctype='multipart/form-data' method="post"  target="hiddenUp">
			<table>
					<tr>
					    <td style="text-align:right;">
					    	导入文件：
					    </td>
					    <td width="310px">
					        <t:fieldLayout columns="1" id="drdbsq" prefix="drdbsq"  showLabel="导入文件：">
					            <t:fieldFile property="file" caption="${i18n.drwj}"  >
					            </t:fieldFile>
				            </t:fieldLayout>
					    </td>
						<td>
							<t:buttons id="excel_submits">
								<t:button caption="导入" name="importExcel"></t:button>
								<t:button caption="重置" name="resetExcel"></t:button>
								<t:button caption="下载模板" name="expxls" ></t:button>
							</t:buttons>
						</td>
						
					</tr>
			</table>
     
	</form>
	<iframe name="hiddenUp" id="hiddenUp" style="display: none;"></iframe>
	</t:panel>
	<form id="printform" name="printform" method="post" style="display: none;">
		<div>
			<input type="text" id="justDoPrint" name="justDoPrint" value="" />
			<!-- 立即预览打印 -->
			<input type="text" id="billcode" name="billcode" value="" />
			<!-- 单据号（唯一标识单据，用作打印历史维护） -->
			<input type="text" id="jsondataprovider" name="jsondataprovider" value="" />
			<!-- 自定义封装的json字符串 -->
			<input type="text" id="selectedid" name="selectedid" value="" />
			<!-- 选择数据表格时的多选id -->
			<input type="text" id="clazzparams" name="clazzparams" value="" />
			<!-- 配置为clazz时传递的json形式参数 -->
			<input type="text" id="templatecode" name="templatecode" value="" />
			<!-- 直接预览（打印）不进行模板选择时使用 -->
		</div>
	</form>
	
	
	
</t:page>
<script type="text/javascript">
	 //$.sdcui.serverConfig.convertArray['codeCenter']={'UW':'${i18n.uw}','UH':'${i18n.uh}','UX':'${i18n.ux}'};
	//1024*768 输入框宽度设定150
	$(function (){
	  $("div#dbsq_huijkm  input[name='huijkm']").attr("style","width：150px");	
	  $("div#dbsq_chengbzx  input[name='chengbzx']").attr("style","width：150px");
	})
	 //模板下载
	function func_button_expxls() {
		$.sdcui.pageUtils.goPage({
			url : '../diaobl/mubanxiazai.do',
			mode : 'form',
			beforeSubmit : function(){
				return true;
			}
	   });
	}
	function func_set_lingjh() {
		var  cell = this.col.cell;
		var rowElement = cell.parent('tr:first');
		
		var luxIndex = $('td.lux:first').prevAll().length;
		var lingjbhIndex = $('td.lingjbh:first').prevAll().length;
		var lingjmcIndex = $('td.lingjmc:first').prevAll().length;
		var shenbslIndex = $('td.shenbsl:first').prevAll().length;
		var yaohsjIndex = $('td.yaohsj:first').prevAll().length;
		
		//var luxStr = rowElement.find('td:eq('+luxIndex+')').text();
		var lingjbhStr = rowElement.find('td:eq('+lingjbhIndex+')').text();
		var shenbslStr = rowElement.find('td:eq('+shenbslIndex+')').text();
		var yaohsjStr = rowElement.find('td:eq('+yaohsjIndex+')').text();
		//获取用户中心
        var usercenter = $('#dbsq_center').fieldValue();
		  
		      //去掉所有空格
		      //var lux = func_trim(luxStr);
		   
		      //var lingjbh = func_trim(lingjbhStr);
		      var params = [];
		     // params.push('lux='+lux);
		      params.push('lingjbh='+lingjbhStr);
		      params.push('usercenter='+usercenter);
		      var date = params.join('&');
		      
		    	  $.sdcui.ajaxUtil.ajax({
			 	 	   url:"${ctx}/maoxq/validateMxqLj.ajax?"+date,
			 	 	   //data:params.join('&'),
			 	       success:function (result){
			 	        if(result.flag != null){
			 	        	alert(result.flag);
			 	        	$(cell).attr("title",result.flag).addClass("validate-error");
			 	           }else{
			 	            $(cell).removeAttr("title",result.flag).removeClass("validate-error");
			 	        	var  obj = result.lingj;
			 	        	//rowElement.find('td:eq('+luxIndex+')').text(obj.zhizlx);
			 	        	rowElement.find('td:eq('+lingjmcIndex+')').text(obj.lingjmc);
			 	        	//rowElement.find('td:eq('+luxIndex+')').text(obj.lux);
			 	               }
			 	 	      }
			           });
		
		     
		
	}
	function func_set_lux() {
		var  cell = this.col.cell;
		var rowElement = cell.parent('tr:first');
		var lingjbhIndex = $('td.lingjbh:first').prevAll().length;
		var luxIndex = $('td.lux:first').prevAll().length;
		var lingjbhStr = rowElement.find('td:eq('+lingjbhIndex+')').text();
		var luxStr = rowElement.find('td:eq('+luxIndex+')').text();
		//获取用户中心
        var usercenter = $('#dbsq_center').fieldValue();
		      var params = [];
		      params.push('lux='+luxStr);
		      params.push('lingjbh='+lingjbhStr);
		      params.push('usercenter='+usercenter);
		      var date = params.join('&');
		    	  $.sdcui.ajaxUtil.ajax({
			 	 	   url:"../diaobl/querylucz.ajax?"+date,
			 	       success:function (result){
			 	        if(result.flag != null){
			 	        	alert(result.flag);
			 	        	$(cell).attr("title",result.flag).addClass("validate-error");
			 	           }
			 	 	      }
			           });
	    }
    
            function func_trim(str){
              if(null ==str||str ==""){
            	  return  str;
              }
              var arr = str.split(" ");
   		      var str ="";
   		      for(var i=0;i<arr.length;i++){
   		              str =str+arr[i];
   		      }
   		      return str;
            }
       
         function  func_set_yaohsj(){
        	  //提示消息
             var message = "";   
        	var  cell = this.col.cell;
     		var rowElement = cell.parent('tr:first');
     		
     		var luxIndex = $('td.lux:first').prevAll().length;
     		var lingjbhIndex = $('td.lingjbh:first').prevAll().length;
     		var lingjmcIndex = $('td.lingjmc:first').prevAll().length;
     		var shenbslIndex = $('td.shenbsl:first').prevAll().length;
     		var yaohsjIndex = $('td.yaohsj:first').prevAll().length;
     		
     		var luxStr = rowElement.find('td:eq('+luxIndex+')').text();
     		var lingjbhStr = rowElement.find('td:eq('+lingjbhIndex+')').text();
     		var shenbslStr = rowElement.find('td:eq('+shenbslIndex+')').text();
     		var yaohsjStr = rowElement.find('td:eq('+yaohsjIndex+')').text();
     		
     	
		    //行编辑验证,路线
		   
		   /*   var lr =/^\d{2}[A-Z]$/;
		      if(!lr.test(luxStr) || luxStr.length != 3){
               //alert("路线输入有误，请输入正确的数据格式！");	
               message += luxStr+"${i18n.js_lux}！\n";
               //return  false;
		      } */
		      
			  //行编辑验证,零件号
		      var bhr =/^\d+[A-Z0-9]+$/;
		
		      
		      //行编辑验证,申报数量
		         var slr =/^[1-9]\d{0,3}(?:\.\d{1,6})?$|0\.\d*[1-9]\d*$/;
				      if(!slr.test(shenbslStr) || shenbslStr.length > 11){
				    	  message += shenbslStr+"${i18n.js_shenbsl}！\n";		
		               //return  false;
				      }
				      
				//行编辑验证,要货时间
				 var sjr =/^\d{4}\-\d{2}\-\d{2}$/;
				      if(!sjr.test(yaohsjStr) || yaohsjStr.length != 10){
				    	  message += yaohsjStr+"${i18n.js_yaohsj}！\n";		 
			     }  
				if(message!=""){
                  	alert(message);
				}      
        }
         
     //提交验证
      function validate(lingjbh,shenbsl,yaohsj){
    	     //行编辑验证,路线
             var lr =/^\d{2}[A-Z]$/;
   			  //行编辑验证,零件号
   		      var bhr =/^[A-Z0-9]+$/;
   		      //行编辑验证,申报数量
   		      var slr =/^[1-9]\d{0,3}(?:\.\d{1,6})?$|0\.\d*[1-9]\d*$/;
   			  //行编辑验证,申报时间
   			  var sjr =/^\d{4}\-\d{2}\-\d{2}$/;
   		      if(!slr.test(shenbsl) || shenbsl.length > 11){
   				    	return   false;
   			  }else if(!sjr.test(yaohsj) || yaohsj.length != 10){
   				    	
   		    	return    false;
   			  }    
       }
            //填写验证
            function  before_submit(){
            	    var  sqmxRow = $("#grid_diaobsq").find('div.grid-scroll tr[id^="row_"]');
            	    var  flag = true;
            	    $.each(sqmxRow,function(i,n){
            	    	   var lingjbh = $(n).find('td:eq(0)').text();
            	    	   var lux = $(n).find('td:eq(2)').text();
            	    	   var shenbsl = $(n).find('td:eq(3)').text();
            	    	   var yaohsj = $(n).find('td:eq(4)').text();
                           var row = parseInt(i)+1;
            	    	   if(lingjbh==""){
            	    		   alert("${i18n.di}"+row+"${i18n.lingjNull}");
            	    		   flag = false;
		                    }else if(lux==""){
		                       alert("${i18n.di}"+row+"${i18n.zhizlxNull}");
            	    		   flag = false;
		                    }else if(shenbsl==""){
		                       alert("${i18n.di}"+row+"${i18n.shengbslNull}");
            	    		   flag = false;
		                    }else if(yaohsj==""){
		                       alert("${i18n.di}"+row+"${i18n.yaohsjNull}");
            	    		   flag = false;
		                    } 
            	    })
            	    return flag;
            }
          //提交打印后，刷新页面
          function after_submit(obj){
          	$.sdcui.pageUtils.goPage({
      			url:'/diaobl/sqprint.do',//url
      			record:obj,//
      			mode:'form',
      			beforeSubmit:function(){
      				//
      				return true;
      			}
      		});
          }
   

		               
		              
		        function func_button_sqsubmit(){
		        
				        	 var  sqmxRows = $("#grid_diaobsq").find('div.grid-fixed tr[id^="row_"]');
		            	    $.each(sqmxRows,function(i,n){
		            	    	var zz = i+1;
		            	    	$(n).find('td').html(zz);
		            	    });
		            	    
		                    var params = $('#grid_diaobsq').grid('getBatchRecords');
		                    if(params==null||params.length==0){
		                    	alert("${i18n.qingTxsqmx}");
		                    	return false;
		                    }
		                    //获取用户中心
		                    var usercenter = $('#dbsq_center').fieldValue();
		                    params.push('usercenter='+usercenter);
		                    //获取成本中心
		                    var chengbzx = $('#dbsq_chengbzx').fieldValue();
		                    //chengbzx = trim(chengbzx);
		                    params.push('chengbzx='+chengbzx);
		                    //会计科目
		                    var huijkm = $('#dbsq_huijkm').fieldValue();
		                    //huijkm = func_trim(huijkm);
		                    //xss-0012856
		                    var huijkm_len = 0;		                    
		                    for (var i=0;i<huijkm.length;i++) 
						    { 
						        if ((huijkm.charCodeAt(i) < 0) || (huijkm.charCodeAt(i) > 255)){ 
						            	huijkm_len=huijkm_len+2;
						            }else{ 
						            	huijkm_len=huijkm_len+1;
						            }   
						    } 
						    if(huijkm_len>20){						    	
						   		alert("英文数字汉字长度之和不能大于20位! 目前长度:"+huijkm_len);
		                    	return false;
						    }
		                    
		                     params.push('huijkm='+huijkm);
		                     //备注
		                    var beiz = $('#sq_beiz').fieldValue();
		                   //  beiz= func_trim(beiz);
		                     params.push('beiz='+beiz);
		                     
	         	     var errorMessage = [];
                     if(!$('#form_diaobsq').form('validate')){
	         				$('#form_diaobsq').find('.youi-field.validating,.youi-field.validate-error').each(function(){
	         					if(this.title)errorMessage.push(this.title);
	         				});
	         				
	         			}
		                var error = $('#form_diaobsq').find('td.validate-error');
		   				if (error != null && error.length != 0) {
		   					errorMessage.push($(error[0]).attr('title'));
		   				}
		   				if(errorMessage.length!=0){
		   					$.sdcui.messageUtil.showError(errorMessage.join('\n'));
		   					return;
		   				}
		                 if(!before_submit())
		                 {
		                	         return false;
		                  }
		                 if("" != $.trim(beiz) && $.trim(beiz).length > 50)
	                	{
		                 	alert("备注信息字符数量不能大于50!");
		                 	return false;
	                	}
		                 
		                 
		                	  $.sdcui.ajaxUtil.ajax({
	 	 	                         url:"${ctx}/diaobl/insert.ajax",
	 	 	                         data:params.join('&'),
	 	                             success:function (result){
	 	                                    if(result.errorMessage != null ){
	 	                                    	alert(result.errorMessage);
	 	                                    	return false;
	 	                                    }
	 	                                   alert(result.Message);
	 	                                   $('#form_diaobsq').form('clear');
	 	                                   $('#grid_diaobsq').find('>.grid-content tr.row').remove();
	 	                                   var  obj = {};
	 	                                   obj = result.diaobsq;
	 	                                   var param = [];
	 	                                   for(var i=0;i<obj.length;i++){
	 	                                       param.push('sq['+i+'].usercenter='+obj[i].usercenter);
		 	                                   param.push('sq['+i+'].diaobsqdh='+obj[i].diaobsqdh);
		 	                                   param.push('sq['+i+'].diaobsqsj='+obj[i].diaobsqsj);
		 	                                   param.push('sq['+i+'].chengbzx='+obj[i].chengbzx);
		 	                                   param.push('sq['+i+'].banc='+obj[i].banc);
		 	                                   param.push('sq['+i+'].beiz='+obj[i].beiz);
		 	                                   param.push('sq['+i+'].creator='+obj[i].creator);
		 	                                   param.push('sq['+i+'].huijkm='+obj[i].huijkm);
	 	                                   }
	 	                                   
	 	                                   var data = param.join('&');
	 	                                 $.sdcui.ajaxUtil.ajax({
	 		 	 	                         url:"${ctx}/diaobl/print.ajax?"+data,
	 		 	 	                         //data:param.join('&'),
	 		 	                             success:function (result){
	 		 	                            	  var jsondata = result.json;
	 		 	                                  print(jsondata);
	 		 	                                    }
	 		 	                             });
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
		    
		    
		//导入excel
		function func_button_importExcel()
		{
			var form = document.forms["form_daorwj"];
			var file = form["file"];
			var fvalue = file.value;
			if (fvalue.length > 0) 
			{
				// 寻找表单域中的 <input type="file" ... /> 标签
				if (fvalue.lastIndexOf('xls')!= (fvalue.length - 3)) 
				{
					alert("只能导入excel文件,后缀名为:xls!");
					return false;
				}
			  	var usercenter = $('#dbsq_center').fieldValue();
                if("" == $.trim(usercenter))
               	{
                	alert("请选择用户中心!");
                	return false;
               	}
                var chengbzx = $('#dbsq_chengbzx').fieldValue();
                if("" == $.trim(chengbzx))
               	{
                	alert("请填写成本中心!");
                	return false;
               	}
                var beiz = $('#sq_beiz').fieldValue();
                if("" != $.trim(beiz) && $.trim(beiz).length > 50)
               	{
                	alert("备注信息字符数量不能大于50!");
                	return false;
               	}
                //会计科目
                var huijkm = $('#dbsq_huijkm').fieldValue();
                form.action = '${ctx}/diaobl/upload.do?usercenter='+ usercenter + "&chengbzx=" + chengbzx + "&huijkm=" + huijkm+"&beiz=" + beiz;
				form.submit();
	            $("#button_importExcel").addClass("disabled");
			} 
			else 
			{
				alert("请选择导入文件!");
				return false;
			}
		}
		
		 
		//重置    
		function func_button_resetExcel()
		{
			var objFile=document.getElementsByName('file')[0]; 
			objFile.outerHTML=objFile.outerHTML.replace(/(value=\").+\"/i,"$1\"");
		} 
		
		//提示语句
		function callback(msg) 
		{
			alert(msg);
			$("#button_importExcel").removeClass("disabled");
		}
		
				//提示语句
		function callbackdow(msg,name) 
		{
			alert(msg);
			$.sdcui.pageUtils.goPage({
				url : '../diaobl/errdownLoad.do?name='+name,
				mode : 'form',
				beforeSubmit : function(){
					return true;
				}
		   });
		}
	</script>
<style type="text/css">
#div#dbsq_huijkm input.textInput{width:120px}
</style>
</t:html>