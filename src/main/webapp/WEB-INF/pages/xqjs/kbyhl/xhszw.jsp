<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="${i18n.kbxhgl}">
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<script type="text/javascript">
		
		</script>
</head>
<t:page i18n="i18n.xqjs.kanbyhl.kanbjs">
	<t:grid id="kbxh" caption="${i18n.search_condition}" showNum="true" showCheckbox="true" editAlias="kb" scrollHeight="278" src="/kanbyhl/searchKbsz.ajax" add="NOT" edit="NOT" remove="NOT" load="false"
		idKeys="usercenter,lingjbh,xiaohd,jihydm,lujdm"  >
		<t:fieldLayout id="kbxhgm" prefix="layout" columns="3">
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap" width="120"></t:fieldSelect>
			<t:fieldSelect property="jihydm" caption="${i18n.jihyz}" width="120" convert="getJihz"></t:fieldSelect>
			<t:fieldText property="lingjbh" maxLength="10" caption="${i18n.lingjbh}" width="120"></t:fieldText>
			<t:fieldSelect property="chanx" caption="${i18n.cx}" src="/kanbyhl/selectChanx.ajax" code="shengcxbh" show="shengcxbh" parents="usercenter" parentsAlias="usercenter" width="120"></t:fieldSelect>
			<t:fieldText property="kehd" maxLength="9" caption="${i18n.kh}" width="120"></t:fieldText>
			<t:fieldSelect property="gonghms" caption="${i18n.ghms}" convert="queryKBWBMS" notNull="true" width="120" defaultValue="R2"></t:fieldSelect>
		</t:fieldLayout>
		<t:gridCol  property="usercenter" caption="${i18n.usercenter}"></t:gridCol>
		<t:gridCol  property="lingjbh" caption="${i18n.lingjbh}"></t:gridCol>
		<t:gridCol  property="lingjmc" caption="${i18n.lingjmc}"></t:gridCol>
		<t:gridCol  property="chanx" caption="${i18n.cx}"></t:gridCol>
		<t:gridCol  property="kehd" caption="${i18n.kh}"></t:gridCol>
		<t:gridCol  property="gonghms" caption="${i18n.ghms}"></t:gridCol>
		<t:gridCol  editor="fieldText" property="jisxhgm" caption="${i18n.xhgm}" editorOptions="{'notNull':'true','expression':'^([2-9]|[1-9][0-9]{1,2})$','expressionMessage':'${i18n.dydyTwozs}'}"></t:gridCol>
	</t:grid>

	<t:buttons id="shengx">
		<t:button caption="${i18n.cj}" name="chuangj"></t:button>
	</t:buttons>

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
					return false;
				}
				var error = $('#kbxh').find('td.validate-error');
				var errorMessage = [];
				if (error != null && error.length != 0) {
					errorMessage.push($(error[0]).attr('title'));
					$.sdcui.messageUtil.showError(errorMessage.join('\n'));
					return;
				}
				param.push('kb[' + i + '].usercenter=' + kbxh[i].usercenter);
				param.push('kb[' + i + '].lingjbh=' + kbxh[i].lingjbh);
				param.push('kb[' + i + '].kehd=' + kbxh[i].kehd);
				var gonghms = kbxh[i].gonghms;
				if (gonghms === 'R1') {
					param.push('kb[' + i + '].xiaohd=' + kbxh[i].kehd);
					param.push('kb[' + i + '].chanx=' + kbxh[i].chanx);
				} else {
					param.push('kb[' + i + '].cangkdm=' + kbxh[i].kehd);
				}
				//param.push('kb['+i+'].umlx='+kbxh[i].umlx);
				//param.push('kb['+i+'].uclx='+kbxh[i].uclx);
				//param.push('kb['+i+'].umljsl='+kbxh[i].umljsl==""?null:kbxh[i].umljsl);
				//param.push('kb['+i+'].umzucgs='+kbxh[i].umzucgs==""?null:kbxh[i].umzucgs);
				//param.push('kb['+i+'].ucrl='+kbxh[i].ucrl==""?null:kbxh[i].ucrl);
				//param.push('kb['+i+'].cangkdm='+kbxh[i].cangkdm);
				param.push('kb[' + i + '].jihydm=' + kbxh[i].jihydm);
				param.push('kb[' + i + '].jisxhgm=' + kbxh[i].jisxhgm);
				param.push('kb[' + i + '].gonghms=' + kbxh[i].gonghms);
				param.push('kb['+i+'].lujdm='+kbxh[i].lujdm);
			}
			$.sdcui.ajaxUtil.ajax({
				url : "${ctx}/kanbyhl/chuangJKanbxhgm.ajax",
				data : param.join('&'),
				success : function(result) {
					if (result.flag != null) {
						alert(result.flag);
						return false;
					} else {
						alert(result.result);
						$("#kbxh").grid('reload');
					}
				}
			});

		}
	</script>

</t:html>
