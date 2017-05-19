 <%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="${i18n.usercenter}">

<!-- 
	供应商份额 
 -->
 
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 90px; } </style>
</head>

<t:page i18n="i18n.ckx.xuqjs.i18n_gongysfe">
	<t:grid id="grid_gongysfe" caption="${i18n.title}" idKeys="gongysdm" load="" editable="false" 
	showNum="true" back="NOT"   exportXls="NOT"
		 src="/xuqjs/queryGongysfe.ajax"  add="NOT" edit="NOT" remove="NOT"
		  scrollHeight="290" pageSize="15">
		<t:fieldLayout id="layout" prefix="gongysfe" columns="3">
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" notNull="true" width="150" defaultValue="${usercenter}" convert="queryUserCenterMap"/>
			<t:fieldText property="lingjbh" caption="${i18n.lingjbh} " notNull="true" maxLength="20" width="150"/>
		</t:fieldLayout>
		
		<t:gridCol  property="usercenter" caption="${i18n.usercenter}"  />
		<t:gridCol  property="lingjbh" caption="${i18n.lingjbh}" width="100"  />
		<t:gridCol  property="gongysdm" caption="${i18n.gongysdm}" width="100"  />
		<t:gridCol  property="biaodsl" caption="${i18n.biaodsl}" width="100" />
		<t:gridCol property="" caption=""/>
	</t:grid>
	<t:fieldLayout id="sj" prefix="czsj" >
		<t:fieldCalendar property="feneczsj" caption="${i18n.feneczsj}" width="150" notNull="true" format="yyyy-MM-dd HH:mm"></t:fieldCalendar>
    </t:fieldLayout>
    <t:buttons id="verify"><t:button caption="${i18n.qued}" name="qued"></t:button></t:buttons>
	
</t:page>

<script type="text/javascript">

	
	//空格查询
	function grid_gongysfe_beforeSubmit() {
		$("#gongysfe_usercenter").fieldValue(trim($("#gongysfe_usercenter").fieldValue()));
		$("#gongysfe_lingjbh").fieldValue(trim($("#gongysfe_lingjbh").fieldValue()));
	}
	
	
	//重置供应商份额
	function func_button_qued() {
		var record = $('#grid_gongysfe').grid('getRecords');
		//验证是否查询了零件
		if(record.length == 0){
			alert("${i18n.weicxlj}");
			return false;
		}
		//验证是否为ab点供应商
		if(record.length == 1){
			alert("${i18n.feiabdgys}");
			return false;
		}
		//验证重置时间是否为空
		var feneczsj = $("input[name='feneczsj']").val();
		if(feneczsj == ''){
			alert("${i18n.chongzsjwk}");
			return false;
		}
		//验证时间格式
		var sj_validate = /^\d{4}\-\d{2}\-\d{2}\s+\d{2}:\d{2}$/;
		if (!sj_validate.test(feneczsj)) {
			alert("${i18n.shijgs}");
			return false;
		}
		//验证输入时间是否大于当前时间
		var date_diff = new Date()-new Date(feneczsj.replace(/-/g,"/"));
		if(date_diff < 0){
			alert("${i18n.daydqsj}");
			return false;
		}
		
		var params = [];
		params.push("usercenter="+record[0].usercenter);	//用户中心
		params.push("lingjbh="+record[0].lingjbh);	//零件编号
		params.push("feneczsj="+feneczsj);	//份额重置时间
		
		$.sdcui.ajaxUtil.ajax({
	 	 	   data:params.join('&'),
	 	 	   url:"../xuqjs/fenecz.ajax",
	 	       success:function (result){
	 	    	  $("#grid_gongysfe").grid("reload");
	 	       }
	     });
	}
	
</script>

</t:html>