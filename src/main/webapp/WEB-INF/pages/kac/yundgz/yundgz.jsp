<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="${i18n.chelpd_title}" >
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
		<style type="text/css">
		 .youi-fieldLayout table td.contral.label-col {     width: 125px; } 
		</style>
	</head>
	<t:page i18n="i18n.kac.yund.i18n_yundgz">
		<t:grid id="grid_yundgz" caption="${i18n.yundgz_title}"  showNum="true" showCheckbox="true" 
		load="false" scrollHeight="332" src="/kac/queryYundgz.ajax"   dataFormId="form_yundgz" 
		idKeys="usercenter,yundh,zhuangt,zhunrsj,rucsj" remove="NOT" back="NOT" add="NOT" edit="NOT" pageSize="15">
			<t:fieldLayout id="yundgz" prefix="layout" columns="4">
				<t:fieldSelect property="quybh" caption="${i18n.quybh }" src="/kac/queryPostDengdqy.ajax" notNull="true" parents="usercenter" code="quybh"  defaultValue="${quybh }"  show="quybh"  width="120"  ></t:fieldSelect>
				<t:fieldSelect property="daztbh" caption="${i18n.daztbh}"  width="120" src="/kac/queryPostDazt.ajax" notNull="true" parents="usercenter,quybh" code="daztbh"  defaultValue="${daztbh }" show="daztbh"/>
				<t:fieldText property="yundh" caption="${i18n.yundh }" width="120"  ></t:fieldText>
				<!-- huxy_12941 -->
				<t:fieldText property="kach" caption="${i18n.kach }" maxLength="8" width="120"  ></t:fieldText>
				<t:fieldCalendar property="qssj" format="yyyy-MM-dd HH:mm:ss" caption="${i18n.yundscsj}" width="147"></t:fieldCalendar>
				<t:fieldCalendar property="jssj" format="yyyy-MM-dd HH:mm:ss" caption="至" width="147" column="1"></t:fieldCalendar>
				<t:fieldSelect property="zhuangt" caption="${i18n.zhuangt}" src="/kac/queryYundgzZhuangt.ajax" parents="usercenter,quybh,daztbh" code="liucbh" show="liucmc"   defaultValue="${zhuangt }" width="120"></t:fieldSelect>
				<t:fieldSelect property="jijbs" caption="${i18n.jijbs}"  convert="jijbs"  width="120"></t:fieldSelect>
				<t:fieldHidden property="usercenter" defaultValue="${usercenter}" caption="用户中心" />
				<t:fieldText property="chengysdm" caption="${i18n.chengysdm}" maxLength="10" width="120"  ></t:fieldText>
			</t:fieldLayout>
			<t:button caption="${i18n.btn_delete}" name="yddelete"></t:button>
			<t:button caption="${i18n.btn_tiqpd}" name="ydtiqpd"></t:button>
			<t:button caption="${i18n.btn_jijqr}" name="jijqr"></t:button>
			<t:button caption="${i18n.btn_ruc}" name="ruc"></t:button>
			<t:gridCol property="yundh" caption="${i18n.yundh}" type="link" width="170"></t:gridCol>
			<t:gridCol property="daztbh" caption="${i18n.daztbh}" width="100"></t:gridCol>
			<t:gridCol property="kach" caption="${i18n.kach}" width="70"></t:gridCol>
			<t:gridCol property="createTime" caption="${i18n.createTime}" width="130"></t:gridCol>
			<t:gridCol property="zhuangt" caption="${i18n.zhuangt}"  convert="zhuangt"   width="60"></t:gridCol>
			<t:gridCol property="jijbs" caption="${i18n.jijbs }" convert="jijbsg"  width="60"></t:gridCol>
			<t:gridCol property="chengysdm" caption="${i18n.chengysdm}" width="100"></t:gridCol>
			<t:gridCol property="gongsmc" caption="${i18n.gongsmc}" width="100"></t:gridCol>
			<t:gridCol property="zhunrsj" caption="${i18n.zhunrsj}" width="130"></t:gridCol>
			<t:gridCol property="rucsj" caption="${i18n.rucsj}" width="130"></t:gridCol>
			<t:gridCol property="chucsj" caption="${i18n.chucsj}" width="130"></t:gridCol>
			<t:gridCol property="tiqpdbs" caption="${i18n.tiqpdbs }" convert="tiqpdbs" width="60"></t:gridCol>
		</t:grid>
	
</t:page>
	
<script type="text/javascript">
	var winOpen;
	//排队状态
	$.sdcui.serverConfig.convertArray['jijbs'] = {
		'0' : '非急件',
		'1' : '急件'
	};

	$.sdcui.serverConfig.convertArray['jijbsg'] = {
		'0' : ' ',
		'1' : '急件'
	};

	$.sdcui.serverConfig.convertArray['tiqpdbs'] = {
		'0' : ' ',
		'1' : '提前',
		'2' : '紧急'
	};
	
	//排队属性
	$.sdcui.serverConfig.convertArray['zhuangt'] = {
		'1' : '申报',
		'2' : '排队',
		'3' : '准入',
		'4' : '开始卸货',
		'5' : '结束卸货',
		'6' : '开始返空',
		'7' : '结束返空',
		'8' : '放空',
		'9' : '出厂',
		'80': '删除',
		'90': '撤销'
	};
	/**
	*链接点击事件
	*/
	function link_yundh(event){
		var event = event||window.event;//原生态的事件处理 
		var element = event.srcElement || event.target;
		var rowDoc = $(element).parents('tr:first')[0];
		var record = $('#grid_yundgz').grid('getRecord',rowDoc);//获取当前行对应的记录
		var usercenter = record.usercenter;
		var yundh = record.yundh;
		var kach = record.kach;

		winOpen = window.open ('${ctx}/kac/initYundMx.do?&usercenter='+usercenter+'&yundh='+yundh+'&kach='+kach,
		'${i18n.yundmx_title}',
		'top=0,left=0,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no, status=no');
		winOpen.resizeTo(screen.availWidth,screen.availHeight);

	}
	
	function func_button_ydtiqpd(){
		var records = $('#grid_yundgz').grid('getSelectedRecords');
	    if(records.length == 0){
	   	 	alert("选择的数据为空!");
	   	 	return false;
	    }
	    var params = [];
	    for(var i=0;i<records.length;i++){
	        params.push($.sdcui.parameterUtils.propertyParameter("yd["+i+"].yundh",records[i].yundh));
	        params.push($.sdcui.parameterUtils.propertyParameter("yd["+i+"].usercenter",records[i].usercenter));
	    }
	    params.push('type=T');
	    $.sdcui.ajaxUtil.ajax({
			url:"../kac/yundtiqpd.ajax",
			data:params.join('&'),
			success:function(result){
				$('#grid_yundgz').grid('reload');//刷新grid

			}
		});
	}
	
	function func_button_jijqr(){
		var records = $('#grid_yundgz').grid('getSelectedRecords');
	    if(records.length == 0){
	   	 	alert("选择的数据为空!");
	   	 	return false;
	    }
	    var params = [];
	    for(var i=0;i<records.length;i++){
	        params.push($.sdcui.parameterUtils.propertyParameter("yd["+i+"].yundh",records[i].yundh));
	        params.push($.sdcui.parameterUtils.propertyParameter("yd["+i+"].usercenter",records[i].usercenter));
	    }
	    params.push('type=J');
	    $.sdcui.ajaxUtil.ajax({
			url:"../kac/yundtiqpd.ajax",
			data:params.join('&'),
			success:function(result){
				$('#grid_yundgz').grid('reload');//刷新grid
			}
		});
	}

	function func_button_shanc(){
		var records = $('#grid_yundgz').grid('getSelectedRecords');
	    if(records.length == 0){
	   	 	alert("选择的数据为空!");
	   	 	return false;
	    }
	    var params = [];
	    for(var i=0;i<records.length;i++){
	        params.push($.sdcui.parameterUtils.propertyParameter("yd["+i+"].yundh",records[i].yundh));
	        params.push($.sdcui.parameterUtils.propertyParameter("yd["+i+"].usercenter",records[i].usercenter));
	    }
	    $.sdcui.ajaxUtil.ajax({
			url:"../kac/yundDelete.ajax",
			data:params.join('&'),
			success:function(result){
				$('#grid_yundgz').grid('reload');//刷新grid
			}
		});
	}
	
	function func_button_yddelete(){
		var records = $('#grid_yundgz').grid('getSelectedRecords');
	    if(records.length == 0){
	   	 	alert("选择的数据为空!");
	   	 	return false;
	    }
	    var params = [];
	    for(var i=0;i<records.length;i++){
	        params.push($.sdcui.parameterUtils.propertyParameter("yd["+i+"].yundh",records[i].yundh));
	        params.push($.sdcui.parameterUtils.propertyParameter("yd["+i+"].usercenter",records[i].usercenter));
	        params.push($.sdcui.parameterUtils.propertyParameter("yd["+i+"].kach",records[i].kach));
	        params.push($.sdcui.parameterUtils.propertyParameter("yd["+i+"].zhuangt","80"));
	        params.push($.sdcui.parameterUtils.propertyParameter("yd["+i+"].zhuangtmc","删除"));
	    }
	    $.sdcui.ajaxUtil.ajax({
			url:"../kac/yundDelete.ajax",
			data:params.join('&'),
			success:function(result){
			 $('#grid_yundgz').grid('reload');//刷新grid
			}
		});
	}
	function func_button_ruc(){
		var records = $('#grid_yundgz').grid('getSelectedRecords');
	    if(records.length == 0){
	   	 	alert("选择的数据为空!");
	   	 	return false;
	    }
	    var params = [];
	    for(var i=0;i<records.length;i++){
	        if(records[i].zhuangt !='3'){
	       		 alert("运单不为准入状态,不能做入厂操作!");
	       		 return ;
	        }else{
	         	if(records[i].zhunrsj !=records[i].rucsj){
	         	alert("运单不能重复的进行入厂操作!");
	         	return;
	         	}
	       }
	        params.push($.sdcui.parameterUtils.propertyParameter("yd["+i+"].yundh",records[i].yundh));
	        params.push($.sdcui.parameterUtils.propertyParameter("yd["+i+"].usercenter",records[i].usercenter));
	        params.push($.sdcui.parameterUtils.propertyParameter("yd["+i+"].kach",records[i].kach));
	    }
	    $.sdcui.ajaxUtil.ajax({
			url:"../kac/yundRuc.ajax",
			data:params.join('&'),
			success:function(result){
			 $('#grid_yundgz').grid('reload');//刷新grid
			}
		});
	}
</script>
<style type="text/css">
#yundgz td.contral.label-col.col-6 {
	width: 60px;
}

#yundgz td.contral.label-col.col-0 {
	width: 80px;
}

#yundgz td.contral.label-col.col-2 {
	width: 70px;
}

#yundgz td.contral.label-col.col-4 {
	width: 60px;
}
</style>
</t:html>