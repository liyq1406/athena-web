<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="${i18n.ygcxjfs}" >
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
	<t:page i18n="i18n.xqjs.ppl.pplbjjs">
	<t:grid id="grid_niandppl" caption="${i18n.niandpplyg}" showNum="true"   exportTitle="${i18n.niandygmx}"  scrollHeight="265"
	src="/ppl/searchNdPplMx.ajax"  idKeys="id,pplbc,editor,edit_time,p0xqzq"  back="NOT" multiple="true" selectRowEvent="xqjsRowSelect"
	remove="NOT"  edit="NOT"  dataFormId="add_niandppl" showEditorAddName="editorAdd" showEditorRemoveName="editorRemove">
	<t:button name="removeSelected" active="0" caption="${i18n.remove}" icon="removeRecord"></t:button>
	<t:button name="editSelected" active="0" caption="${i18n.update}" icon="editRecord"></t:button>
	
	<t:fieldLayout columns="3" prefix="search">
				<t:fieldSelect  property="usercenter" convert="queryUserCenterMap" caption="${i18n.yhzx}" width="150"></t:fieldSelect>
				<t:fieldSelect  property="jihydm" caption="${i18n.jhyz}" width="150" convert="getJihz"></t:fieldSelect>
				<t:fieldText  property="lingjbh" caption="${i18n.ljbh}" width="150"  maxLength="10"></t:fieldText>
				<t:fieldSelect  property="maoxqbc" caption="${i18n.xqbc}" src="/ppl/selectXuqbc.ajax" show="xuqbc" code="xuqbc" width="150"></t:fieldSelect>
				<t:fieldCalendar  property="xuqcfsj" caption="${i18n.cfsj}" format="yyyy-MM-dd" width="150"></t:fieldCalendar>
				<t:fieldSelect  property="zhizlx"  caption="${i18n.zzlx}" convert="queryZhizlx"  width="150"></t:fieldSelect>
				<t:fieldText property="gongysdm" caption="${i18n.gys}" width="150"></t:fieldText>
				<t:fieldHidden property="pplbc"></t:fieldHidden>
				<t:fieldHidden property="p0xqzq"></t:fieldHidden>
					
	</t:fieldLayout>
	<t:buttons id="exp">
					<t:button caption="${i18n.export}txt" name="exportTxt" />
					<t:button caption="${i18n.export}Xls" name="exportXls" />
	</t:buttons>
	<t:gridCol property="chkbox" align="center" renderer="createCheckbox" caption="${i18n.xuanz}" ></t:gridCol>
	<t:gridCol  property="usercenter" caption="${i18n.yhzx}" type="text" ></t:gridCol>
	<t:gridCol  editorOptions="{closeEvent:searchLjmc}" property="lingjbh" caption="${i18n.ljbh}"></t:gridCol>
	<t:gridCol  property="zhizlx" caption="${i18n.zzlx}" ></t:gridCol>
	<t:gridCol  property="lingjmc" caption="${i18n.ljmc}"></t:gridCol>
	<t:gridCol  property="fawmc" caption="${i18n.fawljmc}"></t:gridCol>
	<t:gridCol  property="gongysdm" caption="${i18n.gys}"></t:gridCol>
	<t:gridCol  property="lingjdw" caption="${i18n.ljdw}"></t:gridCol>
	<t:gridCol editor="fieldText" editorOptions="{'expression':'^[0-9]{1,7}(?:\\.[0-9]{1,3})?$|^0\\.[0-9]{1,3}$','expressionMessage':'整数部分最大位7位，小数部分最大位3位'}" property="p0sl" caption="${i18n.yy}"></t:gridCol>
	<t:gridCol editor="fieldText" editorOptions="{'expression':'^[0-9]{1,7}(?:\\.[0-9]{1,3})?$|^0\\.[0-9]{1,3}$','expressionMessage':'整数部分最大位7位，小数部分最大位3位'}"  property="p1sl" caption="${i18n.ey}"></t:gridCol>
	<t:gridCol editor="fieldText" editorOptions="{'expression':'^[0-9]{1,7}(?:\\.[0-9]{1,3})?$|^0\\.[0-9]{1,3}$','expressionMessage':'整数部分最大位7位，小数部分最大位3位'}"  property="p2sl" caption="${i18n.sy}"></t:gridCol>
	<t:gridCol editor="fieldText" editorOptions="{'expression':'^[0-9]{1,7}(?:\\.[0-9]{1,3})?$|^0\\.[0-9]{1,3}$','expressionMessage':'整数部分最大位7位，小数部分最大位3位'}"  property="p3sl" caption="${i18n.siy}"></t:gridCol>
	<t:gridCol editor="fieldText" editorOptions="{'expression':'^[0-9]{1,7}(?:\\.[0-9]{1,3})?$|^0\\.[0-9]{1,3}$','expressionMessage':'整数部分最大位7位，小数部分最大位3位'}"  property="p4sl" caption="${i18n.wuy}"></t:gridCol>
	<t:gridCol editor="fieldText" editorOptions="{'expression':'^[0-9]{1,7}(?:\\.[0-9]{1,3})?$|^0\\.[0-9]{1,3}$','expressionMessage':'整数部分最大位7位，小数部分最大位3位'}"  property="p5sl" caption="${i18n.liuy}"></t:gridCol>
	<t:gridCol editor="fieldText" editorOptions="{'expression':'^[0-9]{1,7}(?:\\.[0-9]{1,3})?$|^0\\.[0-9]{1,3}$','expressionMessage':'整数部分最大位7位，小数部分最大位3位'}"  property="p6sl" caption="${i18n.qiy}"></t:gridCol>
	<t:gridCol editor="fieldText" editorOptions="{'expression':'^[0-9]{1,7}(?:\\.[0-9]{1,3})?$|^0\\.[0-9]{1,3}$','expressionMessage':'整数部分最大位7位，小数部分最大位3位'}"  property="p7sl" caption="${i18n.bay}"></t:gridCol>
	<t:gridCol editor="fieldText" editorOptions="{'expression':'^[0-9]{1,7}(?:\\.[0-9]{1,3})?$|^0\\.[0-9]{1,3}$','expressionMessage':'整数部分最大位7位，小数部分最大位3位'}"  property="p8sl" caption="${i18n.jiuy}"></t:gridCol>
	<t:gridCol editor="fieldText" editorOptions="{'expression':'^[0-9]{1,7}(?:\\.[0-9]{1,3})?$|^0\\.[0-9]{1,3}$','expressionMessage':'整数部分最大位7位，小数部分最大位3位'}"  property="p9sl" caption="${i18n.shiy}"></t:gridCol>
	<t:gridCol editor="fieldText" editorOptions="{'expression':'^[0-9]{1,7}(?:\\.[0-9]{1,3})?$|^0\\.[0-9]{1,3}$','expressionMessage':'整数部分最大位7位，小数部分最大位3位'}"  property="p10sl" caption="${i18n.shiyy}"></t:gridCol>
	<t:gridCol editor="fieldText" editorOptions="{'expression':'^[0-9]{1,7}(?:\\.[0-9]{1,3})?$|^0\\.[0-9]{1,3}$','expressionMessage':'整数部分最大位7位，小数部分最大位3位'}"  property="p11sl" caption="${i18n.shiey}"></t:gridCol>
	<t:gridCol property="zhuangt" convert="zhuangt" caption="${i18n.zhuangt}"></t:gridCol>
	</t:grid>
    
    <t:form id="add_niandppl"   dialog="true"  submit="NOT">
            <t:fieldLayout  prefix="ppl">
                       <t:fieldSelect property="usercenter" caption="${i18n.yhzx}" convert="queryUserCenterMap" notNull="true" width="150"></t:fieldSelect>
                       <t:fieldText property="lingjbh" caption="${i18n.ljbh}" notNull="true" maxLength="10"></t:fieldText>
                       <t:fieldText property="zhizlx" caption="${i18n.zzlx}"  readonly="true"></t:fieldText>
                       <t:fieldText property="lingjmc" caption="${i18n.ljmc}" readonly="true"></t:fieldText>
                       <t:fieldSelect property="gongysdm" caption="${i18n.gys}"  notNull="true"></t:fieldSelect>
                       <t:fieldText property="lingjdw" caption="${i18n.ljdw}" readonly="true"></t:fieldText>
                       <t:fieldText property="p0sl" caption="${i18n.yy}"  expression='^[0-9]{1,7}(?:\\.[0-9]{1,3})?$|^0\\.[0-9]{1,3}$' expressionMessage='整数部分最大位7位，小数部分最大位3位' ></t:fieldText>
                       <t:fieldText property="p1sl" caption="${i18n.ey}"  expression='^[0-9]{1,7}(?:\\.[0-9]{1,3})?$|^0\\.[0-9]{1,3}$' expressionMessage='整数部分最大位7位，小数部分最大位3位' ></t:fieldText>
                       <t:fieldText property="p2sl" caption="${i18n.sy}"  expression='^[0-9]{1,7}(?:\\.[0-9]{1,3})?$|^0\\.[0-9]{1,3}$' expressionMessage='整数部分最大位7位，小数部分最大位3位' ></t:fieldText>
                       <t:fieldText property="p3sl" caption="${i18n.siy}" expression='^[0-9]{1,7}(?:\\.[0-9]{1,3})?$|^0\\.[0-9]{1,3}$' expressionMessage='整数部分最大位7位，小数部分最大位3位' ></t:fieldText>
                       <t:fieldText property="p4sl" caption="${i18n.wuy}" expression='^[0-9]{1,7}(?:\\.[0-9]{1,3})?$|^0\\.[0-9]{1,3}$' expressionMessage='整数部分最大位7位，小数部分最大位3位' ></t:fieldText>
                       <t:fieldText property="p5sl" caption="${i18n.liuy}" expression='^[0-9]{1,7}(?:\\.[0-9]{1,3})?$|^0\\.[0-9]{1,3}$' expressionMessage='整数部分最大位7位，小数部分最大位3位' ></t:fieldText>
                       <t:fieldText property="p6sl" caption="${i18n.qiy}" expression='^[0-9]{1,7}(?:\\.[0-9]{1,3})?$|^0\\.[0-9]{1,3}$' expressionMessage='整数部分最大位7位，小数部分最大位3位' ></t:fieldText>
                       <t:fieldText property="p7sl" caption="${i18n.bay}" expression='^[0-9]{1,7}(?:\\.[0-9]{1,3})?$|^0\\.[0-9]{1,3}$' expressionMessage='整数部分最大位7位，小数部分最大位3位' ></t:fieldText>
                       <t:fieldText property="p8sl" caption="${i18n.jiuy}" expression='^[0-9]{1,7}(?:\\.[0-9]{1,3})?$|^0\\.[0-9]{1,3}$' expressionMessage='整数部分最大位7位，小数部分最大位3位' ></t:fieldText>
                       <t:fieldText property="p9sl" caption="${i18n.shiy}" expression='^[0-9]{1,7}(?:\\.[0-9]{1,3})?$|^0\\.[0-9]{1,3}$' expressionMessage='整数部分最大位7位，小数部分最大位3位' ></t:fieldText>
                       <t:fieldText property="p10sl" caption="${i18n.shiyy}" expression='^[0-9]{1,7}(?:\\.[0-9]{1,3})?$|^0\\.[0-9]{1,3}$' expressionMessage='整数部分最大位7位，小数部分最大位3位' ></t:fieldText>
                       <t:fieldText property="p11sl" caption="${i18n.shiey}" expression='^[0-9]{1,7}(?:\\.[0-9]{1,3})?$|^0\\.[0-9]{1,3}$' expressionMessage='整数部分最大位7位，小数部分最大位3位' ></t:fieldText>
                       <t:button caption="${i18n.submit}" name="subAdd"></t:button>
            </t:fieldLayout>
    
    </t:form>
    <input id="removeId" value="${removeId}" type="hidden"/>  
    
	<input type="hidden" id="zhuangt" name="zhuangt" value="${zhuangt}"/>
	<input type="hidden" id="pplbc" name="pplbc" value="${pplbc}"/>
	<input type="hidden" id="p0xqzq" name="p0xqzq" value="${p0xqzq}"/>
	</t:page>
	<script type="text/javascript">
	/*
	*导出文本
	*/
	function func_button_exportTxt(){
		var params = [];
		params.push('usercenter='+$('#search_usercenter').fieldValue());
		params.push('jihydm='+$('#search_jihydm').fieldValue());
		params.push('lingjbh='+$('#search_lingjbh').fieldValue());
		params.push('maoxqbc='+$('#search_maoxqbc').fieldValue());
		params.push('xuqcfsj='+$('#search_xuqcfsj').fieldValue());
		params.push('zhizlx='+$('#search_zhizlx').fieldValue());
		params.push('gongysdm='+$('#search_gongysdm').fieldValue());
		params.push('pplbc='+$('#pplbc').val());
		
						var time = new Date();
		 $.sdcui.ajaxUtil.ajax({
             url:"exportTxt.ajax",//请求url
             data:params.join('&'),
            	success:function (result){
            	var fn = result.result;
            	    //回调函数后续操作
            	    window.location = "${ctx}/ppl/downLoadTxt.ajax?fileName="+fn+"&num="+time;
						//document.getElementById("bytesRead").textContent = file.size;
						// 构造 XMLHttpRequest 对象，发送文件 Binary 数据
					
				}
           });
		 	 
	}
	
	function createReqeust() {
		var req;
		if (window.ActiveXObject) {

			req = new ActiveXObject("Microsoft.XMLHTTP");
		} else {

			req = new XMLHttpRequest();
		}
		return req;
	}
	
	 
	 
	//$.sdcui.serverConfig.convertArray['zhizlx'] = {'97W':'97W','97D':'97D','97X':'97X'};  //给fieldselect添加值
	$.sdcui.serverConfig.convertArray['zhuangt'] = {'1':'${i18n.yfs}','0':'${i18n.wfs}'};
   /* $(function() {
		$('#ppl_gongysdm').bind('click', function() {
			var usercenter = $('#ppl_usercenter').fieldValue();
			var gongysdm = $('#ppl_gongysdm').fieldValue();
			if (gongysdm == '') {
				alert('供应商代码不能为空！');
				return false;
			}
			$.sdcui.ajaxUtil.ajax({
				url : "${ctx}/ilorder/ifExistGys.ajax",
				data : 'usercenter=' + usercenter + '&gongysdm=' + gongysdm,
				success : function(result) {
				    var msg = result.result;
				    if(typeof(msg)!='undefined') alert(msg);
				}
			});
		})
	})  */
	  /**
	*列渲染事件,创建checkbox	
	*/
	function createCheckbox(){
		return "<input  name='chkbox'  type='checkbox' value='1'/>";
	}
   
	//数量不填，自动置为零
  /* function func_setsl(text){
        var  cell = this.col.cell;
        if(text===''){
           $(cell).text("0");
        }

   }*/
   
   
		//返回
		function func_button_back() {
			history.back();
			//window.history.go(-1);
			//window.history.forward();

		}
   
   function func_button_exportXls(){
				var usercenter = $('#search_usercenter').fieldValue();
				var jihydm =  $('#search_jihydm').fieldValue();
				var lingjbh = $('#search_lingjbh').fieldValue();
				var maoxqbc = $('#search_maoxqbc').fieldValue();
				var xuqcfsj = $('#search_xuqcfsj').fieldValue();
				var zhizlx = $('#search_zhizlx').fieldValue(); 
				var gongysdm = $('#search_gongysdm').fieldValue(); 
				var pplbc = $('#search_pplbc').fieldValue(); 
				var record = {};
				record.usercenter=usercenter;
				record.jihydm=jihydm;
				record.lingjbh=lingjbh;
				record.zhizlx=zhizlx;
				record.maoxqbc=maoxqbc;
				record.xuqcfsj=xuqcfsj;
				record.gongysdm=gongysdm;
				record.pplbc=pplbc;
				$.sdcui.pageUtils.goPage({
					url:'/ppl/downLoadFilePpl.do',//url
					record : record,//
					mode:'form',
					beforeSubmit:function(){
						//
						return true;
					}
				});
			}
	
   
   
   function trimStr(str){
       return str.replace(/(^\s*)|(\s*$)/g, "");
   }
   
   
   //12个月必填一项
   function pslValidate(vsl){
     var obj = {};
     var j=0;
     for(var i=0;i<vsl.length;i++){
         var sl= trimStr(vsl[i]);
         if(sl===''){
            j++;
         }
     }
     obj.p0sl=vsl[0];
     obj.p1sl=vsl[1];
     obj.p2sl=vsl[2];
     obj.p3sl=vsl[3];
     obj.p4sl=vsl[4];
     obj.p5sl=vsl[5];
     obj.p6sl=vsl[6];
     obj.p7sl=vsl[7];
     obj.p8sl=vsl[8];
     obj.p9sl=vsl[9];
     obj.p10sl=vsl[10];
     obj.p11sl=vsl[11];
     if(j===12){
        alert("${i18n.ygslbnwk}");
        obj.falg = 'false';
     }else{
        obj.falg = 'true';
     }
     return obj;
   }

   function setIns(params,obj,alias){
          
            if(obj.p0sl!==''){
               params.push(alias+'p0sl='+obj.p0sl);
            }
        
            if(obj.p1sl!==''){
            params.push(alias+'p1sl='+obj.p1sl);
            }
            
            if(obj.p2sl!==''){
            params.push(alias+'p2sl='+obj.p2sl);
            }
            
            if(obj.p3sl!==''){
            params.push(alias+'p3sl='+obj.p3sl);
            }
            
            if(obj.p4sl!==''){
            params.push(alias+'p4sl='+obj.p4sl);
            }
            
            if(obj.p5sl!==''){
            params.push(alias+'p5sl='+obj.p5sl);
            }
            
            if(obj.p6sl!==''){
            params.push(alias+'p6sl='+obj.p6sl);
            }
            
            if(obj.p7sl!==''){
            params.push(alias+'p7sl='+obj.p7sl);
            }
            
            if(obj.p8sl!==''){
            params.push(alias+'p8sl='+obj.p8sl);
            }
            
            if(obj.p9sl!==''){
            params.push(alias+'p9sl='+obj.p9sl);
            }
            
            if(obj.p10sl!==''){
            params.push(alias+'p10sl='+obj.p10sl);
            }
            
            if(obj.p11sl!==''){
            params.push(alias+'p11sl='+obj.p11sl);
            }
            return params;
   }


   $(function() {
		$('#ppl_lingjbh').bind('focusout', function() {
			var usercenter = $('#ppl_usercenter').fieldValue();
			var lingjbh = $('#ppl_lingjbh').fieldValue();
			if (lingjbh == '') {
				alert('${i18n.lingjbhNotNull}');
				return false;
			}
		//拼接数据
		var params = [];
		params.push('lingjbh='+lingjbh);
		params.push('usercenter='+usercenter);
		var element = $("div#field-pop-ppl_gongysdm");
	    element.removeClass("loaded");
	    $("#ppl_gongysdm").find('input.value').val("");
	    $("#ppl_gongysdm").find('input.textInput').val("");
	    element.empty();
		//请求后台
		$.sdcui.ajaxUtil.ajax({ 
             url:"${ctx}/diaobl/getlingjmc.ajax",//请求url
             data:params.join('&'),
            	success:function (result){
            	    if(result.flag != null){
			 	       alert(result.flag);
			 	       $('#ppl_lingjbh').attr("error","${i18n.lingjbhInputError}");
			 	       $('#ppl_zhizlx').fieldValue("");
	 	        	   $('#ppl_lingjmc').fieldValue("");
	 	        	   $('#ppl_lingjdw').fieldValue("");
			 	       return false;
			 	    }else{
			 	    $('#ppl_lingjbh').removeAttr("error");
            	    var  obj = result.lingj;
	 	        	$('#ppl_zhizlx').fieldValue(obj.lux);
	 	        	$('#ppl_lingjmc').fieldValue(obj.lingjmc);
	 	        	$('#ppl_lingjdw').fieldValue(obj.danw);
		 	        	    $.sdcui.ajaxUtil.ajax({
							url : "${ctx}/ilorder/queryLjgys.ajax",
							data : params.join('&'),
							success : function(result) {
									var msg = result.result;
									if(msg.length==0){
									   alert("${i18n.gongysbhIsNull}");
									}else{
										    for(var i=0;i<msg.length;i++){
										         element.append('<div class="option-item" value="'+msg[i].gongysbh+'">'+msg[i].gongysbh+'</div>');
										    }
										    element.addClass("loaded");
									
									}
								}	
								    
						    });
	 	        	
	 	        	}
             }
     	});
		})
	})
    //增加
    function func_button_subAdd(){
             //平台验证
			var errorMessage = [];
			if (!$('#add_niandppl').form('validate')) {
			$('#add_niandppl').find('.youi-field.validating,.youi-field.validate-error').each(
					function() {
						if (this.title)
							errorMessage.push(this.title);
					});
			}	
				
		    if($('#ppl_lingjbh[error]').length!=0){
			   var msg = $('#ppl_lingjbh').attr("error");
			   $('#ppl_lingjbh').attr("class","youi-field fieldText validate-error");
			   errorMessage.push(msg);
			}
			
			if(errorMessage.length!=0){
			   	alert(errorMessage.join('\n'));
			    return ;
			}	
        
            var usercenter = $('#ppl_usercenter').fieldValue();
            var lingjbh = $('#ppl_lingjbh').fieldValue();
            var zhizlx = $('#ppl_zhizlx').fieldValue();
            var lingjmc = $('#ppl_lingjmc').fieldValue();
            var gongysdm = $('#ppl_gongysdm').fieldValue();
            var lingjdw = $('#ppl_lingjdw').fieldValue();
            
            var p0sl = $('#ppl_p0sl').fieldValue();
            var p1sl = $('#ppl_p1sl').fieldValue();
            var p2sl = $('#ppl_p2sl').fieldValue();
            var p3sl = $('#ppl_p3sl').fieldValue();
            var p4sl = $('#ppl_p4sl').fieldValue();
            var p5sl = $('#ppl_p5sl').fieldValue();
            var p6sl = $('#ppl_p6sl').fieldValue();
            var p7sl = $('#ppl_p7sl').fieldValue();
            var p8sl = $('#ppl_p8sl').fieldValue();
            var p9sl = $('#ppl_p9sl').fieldValue();
            var p10sl = $('#ppl_p10sl').fieldValue();
            var p11sl = $('#ppl_p11sl').fieldValue();
            var vsl = [];
            vsl.push(p0sl);
            vsl.push(p1sl);
            vsl.push(p2sl);
            vsl.push(p3sl);
            vsl.push(p4sl);
            vsl.push(p5sl);
            vsl.push(p6sl);
            vsl.push(p7sl);
            vsl.push(p8sl);
            vsl.push(p9sl);
            vsl.push(p10sl);
            vsl.push(p11sl);
            var obj = pslValidate(vsl);
            if(obj.falg==='false'){
               return false;
            }else{
                      	var params = [];
			            var alias='insert[0].';
			            params=setIns(params,obj,alias);
			            params.push('insert[0].pplbc='+$("#pplbc").val());
			            params.push('insert[0].usercenter='+usercenter);
			            params.push('insert[0].lingjbh='+lingjbh);
			            params.push('insert[0].zhizlx='+zhizlx);
			            params.push('insert[0].lingjmc='+lingjmc);
			            params.push('insert[0].gongysdm='+gongysdm);
			            params.push('insert[0].lingjdw='+lingjdw);
			            params.push('p0xqzq='+$('#search_p0xqzq').fieldValue());
			            
			            params.push('pplbc='+$("#pplbc").val());
			            $.sdcui.ajaxUtil.ajax({
							url : "${ctx}/ppl/saveNdPplMx.ajax",
							data : params.join('&'),
							success : function(result) {
							       alert(result.result);
							       if(result.result==='${i18n.operatesuccess}'){
							           $('#add_niandppl').form('close');
								       $('#grid_niandppl').grid('reload');
							       }
							}
						});

            }
        
    }
    
    
    //删除
    function func_grid_removeSelected(){
           var deleteppl = $("#grid_niandppl").grid('getSelectedRecords');
           if(deleteppl.length==0){
            alert("${i18n.selectOneRow}");
            return ;
         }
           var params = [];
		if (deleteppl.length!=0&&confirm("${i18n.verifyRemove}?")) {
			for ( var i = 0, len = deleteppl.length; i < len; i++) {
				    var usercenter = deleteppl[i].usercenter;
		            var lingjbh = deleteppl[i].lingjbh;
		            var zhizlx = deleteppl[i].zhizlx;
		            var lingjmc = deleteppl[i].lingjmc;
		            var gongysdm = deleteppl[i].gongysdm;
		            params.push('delete['+i+'].usercenter='+usercenter);
		            params.push('delete['+i+'].lingjbh='+lingjbh);
		            params.push('delete['+i+'].zhizlx='+zhizlx);
		            params.push('delete['+i+'].lingjmc='+lingjmc);
		            params.push('delete['+i+'].gongysdm='+gongysdm);
		            params.push('delete['+i+'].editor='+deleteppl[i].editor);
		            params.push('delete['+i+'].edit_time='+deleteppl[i].edit_time);
		            params.push('delete['+i+'].pplbc='+$("#pplbc").val());
			}
             params.push('pplbc='+$("#pplbc").val());
			$.sdcui.ajaxUtil.ajax({
				url : 'saveNdPplMx.ajax',
				data : params.join('&'),
				success : function(result) {
					alert(result.result);
					$('#grid_niandppl').grid('reload');
				}
			});
		}
    
    }
    //修改
     function func_grid_editSelected(){
         var editppl = $("#grid_niandppl").grid('getSelectedRecords');
         if(editppl.length==0){
            alert("${i18n.selectOneRow}");
            return ;
         }
         
         var params = [];
          var error = $('#grid_niandppl').find('td.validate-error');
		var errorMessage = [];
		if (error != null && error.length != 0) {
			errorMessage.push($(error[0]).attr('title'));
			$.sdcui.messageUtil.showError(errorMessage.join('\n'));
			return;
		}
         for ( var i = 0, len = editppl.length; i < len; i++) {
		            var vsl = [];
		            vsl.push(editppl[i].p0sl===undefined?'':editppl[i].p0sl);
		            vsl.push(editppl[i].p1sl===undefined?'':editppl[i].p1sl);
		            vsl.push(editppl[i].p2sl===undefined?'':editppl[i].p2sl);
		            vsl.push(editppl[i].p3sl===undefined?'':editppl[i].p3sl);
		            vsl.push(editppl[i].p4sl===undefined?'':editppl[i].p4sl);
		            vsl.push(editppl[i].p5sl===undefined?'':editppl[i].p5sl);
		            vsl.push(editppl[i].p6sl===undefined?'':editppl[i].p6sl);
		            vsl.push(editppl[i].p7sl===undefined?'':editppl[i].p7sl);
		            vsl.push(editppl[i].p8sl===undefined?'':editppl[i].p8sl);
		            vsl.push(editppl[i].p9sl===undefined?'':editppl[i].p9sl);
		            vsl.push(editppl[i].p10sl===undefined?'':editppl[i].p10sl);
		            vsl.push(editppl[i].p11sl===undefined?'':editppl[i].p11sl);
		            var obj = pslValidate(vsl);
		            if(obj.falg==='false'){
		               return false;
		            }
		            var alias='edit['+i+'].';
		            params=setIns(params,obj,alias);
				    params.push('edit['+i+'].usercenter='+editppl[i].usercenter);
		            params.push('edit['+i+'].lingjbh='+editppl[i].lingjbh);
		            params.push('edit['+i+'].zhizlx='+editppl[i].zhizlx);
		            params.push('edit['+i+'].lingjmc='+editppl[i].lingjmc);
		            params.push('edit['+i+'].gongysdm='+editppl[i].gongysdm);
		            params.push('edit['+i+'].lingjdw='+editppl[i].lingjdw);
		            /*params.push('edit['+i+'].p0sl='+obj.p0sl);
		            params.push('edit['+i+'].p1sl='+obj.p1sl);
		            params.push('edit['+i+'].p2sl='+obj.p2sl);
		            params.push('edit['+i+'].p3sl='+obj.p3sl);
		            params.push('edit['+i+'].p4sl='+obj.p4sl);
		            params.push('edit['+i+'].p5sl='+obj.p5sl);
		            params.push('edit['+i+'].p6sl='+obj.p6sl);
		            params.push('edit['+i+'].p7sl='+obj.p7sl);
		            params.push('edit['+i+'].p8sl='+obj.p8sl);
		            params.push('edit['+i+'].p9sl='+obj.p9sl);
		            params.push('edit['+i+'].p10sl='+obj.p10sl);
		            params.push('edit['+i+'].p11sl='+obj.p11sl);*/
		            params.push('edit['+i+'].editor='+editppl[i].editor);
		            params.push('edit['+i+'].edit_time='+editppl[i].edit_time);
		            params.push('edit['+i+'].pplbc='+$("#pplbc").val());
			}
             params.push('pplbc='+$("#pplbc").val());
			$.sdcui.ajaxUtil.ajax({
				url : 'saveNdPplMx.ajax',
				data : params.join('&'),
				success : function(result) {
					alert(result.result);
					$('#grid_niandppl').grid('reload');
				}
			});
    }


	/*
	*查询零件名称
	*/
	function searchLjmc(){
		var  cell = this.col.cell;//获取当前列
		var rowElement = cell.parent('tr:first');
		var usercenterIndex = $('td.usercenter:first').prevAll().length;//遍历用户中心下标
		var luxIndex = $('td.zhizlx:first').prevAll().length;//遍历路线下标
		var lingjbhIndex = $('td.lingjbh:first').prevAll().length;//遍历零件编号下标
		var lingjmcIndex = $('td.lingjmc:first').prevAll().length;//遍历零件名称下标
		
		var lux = rowElement.find('td:eq('+luxIndex+')').text();//获取制造路线输入值
		var lingjbh = rowElement.find('td:eq('+lingjbhIndex+')').text();//获取零件编号输入值
		var usercenter = rowElement.find('td:eq('+usercenterIndex+')').val();//获取用户中心输入值
		//拼接数据
		var params = [];
		//params.push('lux='+lux);
		params.push('lingjbh='+lingjbh);
		params.push('usercenter='+usercenter);
		//请求后台
		$.sdcui.ajaxUtil.ajax({ 
             url:"${ctx}/diaobl/getlingjmc.ajax",//请求url
             data:params.join('&'),
            	success:function (result){
            	    var  obj = result.lingj;
	 	        	rowElement.find('td:eq('+luxIndex+')').text(obj.lux);
	 	        	rowElement.find('td:eq('+lingjmcIndex+')').text(obj.lingjmc);
            		rowElement.find('td:eq('+lingjmcIndex+')').text(result.lingjmc);//为零件名称赋值
            		
             }
     	});
	}
	</script>
	<style type="text/css"></style>
</t:html>