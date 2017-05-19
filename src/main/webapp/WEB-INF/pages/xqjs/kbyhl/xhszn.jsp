<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="${i18n.kbxhgl}" >
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
		<script type="text/javascript"></script> 
		
	</head>
	<t:page  i18n="i18n.xqjs.kanbyhl.kanbjs">
	<t:grid id="kbxh" caption="${i18n.search_condition}"  showNum="true" showCheckbox="true"  editAlias="kb" back="NOT" scrollHeight="262"
	src="/kanbyhl/searchKbsz.ajax" add="NOT" edit="NOT" remove="NOT" load="false" idKeys="xiaohd,uclx,ucrl,cangkdm,jihydm,lujdm">
	<t:fieldLayout id="kbxhgm" prefix="layout" columns="3"  >
				<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap" width="120"></t:fieldSelect>
				<t:fieldText  property="lingjbh"  maxLength="10"  caption="${i18n.lingjbh}"   width="120"></t:fieldText>
             	<t:fieldSelect property="chanx" caption="${i18n.cx}" src="/kanbyhl/selectChanx.ajax" code="shengcxbh" show="shengcxbh" parents="usercenter" parentsAlias="usercenter"  width="120"></t:fieldSelect>
				<t:fieldSelect  property="gonghms"  caption="${i18n.ghms}" convert="queryKBNBMS" notNull="true" width="120" defaultValue="RD"></t:fieldSelect>
				<t:fieldText  property="kehd"    caption="${i18n.ckfpxh}"   width="120"></t:fieldText>
	</t:fieldLayout>
			<t:gridCol  property="usercenter"  caption="${i18n.usercenter}" ></t:gridCol>
			<t:gridCol  property="lingjbh"  caption="${i18n.lingjbh}" width="168"></t:gridCol>
			<t:gridCol property="xianbck" caption="xbck" hidden="true" ></t:gridCol>
			<t:gridCol  property="lingjmc"  caption="${i18n.lingjmc}" width="168"></t:gridCol>
			<t:gridCol  property="chanx"  caption="${i18n.cx}"></t:gridCol>
			<t:gridCol  property="kehd"  caption="${i18n.kh}" width="168"></t:gridCol>
			<t:gridCol  property="gonghms"  caption="${i18n.ghms}"></t:gridCol>
			<t:gridCol  editor="fieldText" property="jisxhgm"  caption="${i18n.xhgm}"  editorOptions="{'notNull':'true','expression':'^([2-9]|[1-9][0-9]{1,2})$','expressionMessage':'${i18n.dydyTwozs}'}" ></t:gridCol>
			</t:grid>
	<t:buttons id="shengx"><t:button caption="${i18n.cj}" name="chuangj"></t:button></t:buttons>
  </t:page>
	<script type="text/javascript">
		//提交前对零件编号进行校验
		function kbxh_beforeSubmit(){	
			var lingjbh=$('#layout_lingjbh').fieldValue();
			if (lingjbh!= null && lingjbh!=""){
			var params = [];
			params.push('usercenter='+$('#layout_usercenter').fieldValue());//用户中心
			params.push('lingjbh='+lingjbh);//零件编号
			 $.sdcui.ajaxUtil.ajax({
	             url:"${ctx}/kanbyhl/selectLingj.ajax",//请求url
	             data:params.join('&'),//传递参数
	            	success:function (result){
	            	if(result.result){}
	            	else{
	            		alert("${i18n.ljjymsg}");  //弹出提示结果
	            		}
	            	}//回调函数
	     	   });
		    }
		}
	 /**
	*点击创建按钮
	*/
	function func_button_chuangj(){
          var kbxh= $('#kbxh').grid('getSelectedRecords');//获得选中行参数
          if(kbxh.length==0){
		             alert("${i18n.qxzytsj}");
	                 return  false;
		    }
		     var param = [];
		     for(var i=0;i<kbxh.length;i++){
		            var  a = kbxh[i].jisxhgm;
			            if(typeof(a)=='undefined'){
			              	alert("${i18n.qqrjsxhgm}");		
		               		return  false;
			            }
			        var error=$('#kbxh').find('td.validate-error');
					var errorMessage = [];
					if(error!=null&&error.length!=0){
						errorMessage.push($(error[0]).attr('title'));
						$.sdcui.messageUtil.showError(errorMessage.join('\n'));
					return ;
					}       
		            param.push('kb['+i+'].usercenter='+kbxh[i].usercenter);
		            param.push('kb['+i+'].lingjbh='+kbxh[i].lingjbh);
		            param.push('kb['+i+'].kehd='+kbxh[i].kehd);
		            //param.push('kb['+i+'].chanx='+kbxh[i].chanx);
		            var gonghms = kbxh[i].gonghms;
		            if(gonghms==='RD'){
		               param.push('kb['+i+'].xiaohd='+kbxh[i].kehd);
		               param.push('kb['+i+'].xianbck='+kbxh[i].xianbck);
		               param.push('kb['+i+'].chanx='+kbxh[i].chanx);
		            }else{
		               param.push('kb['+i+'].cangkdm='+kbxh[i].kehd);
		            } 
		            //param.push('kb['+i+'].xiaohd='+kbxh[i].xiaohd);
		            //param.push('kb['+i+'].umlx='+kbxh[i].umlx);
		            //param.push('kb['+i+'].cangkdm='+kbxh[i].cangkdm);
		            param.push('kb['+i+'].jihydm='+kbxh[i].jihydm);
		            param.push('kb['+i+'].jisxhgm='+kbxh[i].jisxhgm);
		            param.push('kb['+i+'].gonghms='+kbxh[i].gonghms);
		            param.push('kb['+i+'].lujdm='+kbxh[i].lujdm);
		            }
		         $.sdcui.ajaxUtil.ajax({
	 	 	                         url:"${ctx}/kanbyhl/chuangJKanbxhgm.ajax",
	 	 	                         data:param.join('&'),
	 	                             success:function (result){
	 	                             if(result.flag != null){
	 	        	                    alert(result.flag);
	 	                            }else{
		 	        	               alert(result.result);
		 	        	                $("#kbxh").grid('reload');
	 	 	                         }
	 	 	                        } 
	 	                      });
	
		}
   
   /* function layout_gonghms_change(){
        var ghms = $("#layout_gonghms").fieldValue();
        var xsValue = "";
           if(ghms=='RM'){
              xsValue = "${i18n.ck}：";
           }else{
              xsValue = "${i18n.fpxh}：";
           }
        var  td =  $("#kbxhgm.youi-fieldLayout table td.field-label")[4];
	    var lable = $(td).children()[0];   
        $(lable).text(xsValue); 
        var element = $("div#field-pop-layout_kehd");
        element.removeClass("loaded");
	    $("#layout_kehd").find('input.value').val("");
	    $("#layout_kehd").find('input.textInput').val("");
	    element.empty();  
    }
    
    $(function(){
        $("#layout_kehd").click(function(){
             initKh();
         });

    })
    
    function initKh(){
                var ghms = $("#layout_gonghms").fieldValue();
                var param = [];
                param.push("gonghms="+ghms);
		        var element = $("div#field-pop-layout_kehd");
		        element.removeClass("loaded");
			    $("#layout_kehd").find('input.value').val("");
			    $("#layout_kehd").find('input.textInput').val("");
			    element.empty();
		        $.sdcui.ajaxUtil.ajax({
		                  url:"${ctx}/kanbyhl/getWulzKehd.ajax",
		                       data:param.join('&'),
		                       success:function (result){
		                              var arry = result.result;
		       						  element.append('<div class="option-item"></div>');
		                              for(var i=0;i<arry.length;i++){
		                                   var keh = arry[i].KEH;
		                                   var html = '<div class="option-item" value="'+keh+'">'+keh+'</div>';
		                                   element.append(html);
		                              }
			 	 				      element.addClass("loaded");      
		                       }
		                       
			 	       });
    
    
    }*/
    
	
		</script>
	<style type="text/css">


#kbxhgm td.contral.label-col.col-2 {
	width: 90px;
}
</style>
</t:html>
