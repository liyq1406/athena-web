<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="${i18n.chelcfjg}">

<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
</head>

<t:page i18n="i18n.ckx.ddbh.i18n_chelcfjg">
	<t:grid id="grid_chelcfjg" caption="PDS装车信息查询" idKeys="id" load="false"  showNum="true"
		src="/ddbh/list_Chelcfjg.ajax" add="NOT" edit="NOT" remove="NOT" editable="false" scrollHeight="295">
		<t:fieldLayout id="fl_rongqc" prefix="rongqc">
			<t:fieldText property="ofh" caption="${i18n.ofh}" maxLength="8"  minLength="8" dataType="text" />
			<t:fieldText property="lj" caption="${i18n.lj}" maxLength="10" minLength="10" dataType="text"/>
			<t:fieldText property="xhd" caption="${i18n.xhd}" maxLength="9" minLength="9" dataType="text"/>
			<t:fieldCalendar property="rq" caption="商业化时间" format="yyyy-MM-dd" />
		</t:fieldLayout>
		<t:gridCol property="ofh" caption="${i18n.ofh}" width="80"></t:gridCol>
		<t:gridCol property="lj" caption="${i18n.lj}"  width="90" ></t:gridCol>
		<t:gridCol property="xhd" caption="${i18n.xhd}"  width="85" ></t:gridCol>
		<t:gridCol property="sl" caption="${i18n.sl}" width="80" ></t:gridCol>
		<t:gridCol property="rq" caption="商业化时间" width="90" ></t:gridCol>
	</t:grid>
	<br/>
	<t:buttons id="rewrite"><t:button caption="分总成重新拆分" name="rewrite"></t:button></t:buttons>
</t:page>

<script type="text/javascript">
	$(function(){
		// 调整按钮样式
		$("#rewrite").attr("align","right");
		$("#button_rewrite").find("a").css("color", "red");
	});
	
	// 分总成重新拆分
	function func_button_rewrite(){
		if(confirm("是否确认重新拆分分总成？")){
			$.sdcui.ajaxUtil.ajax({
				url : '../ddbh/rewrite.ajax',
				success : function(data) {
			    	if(data.success){
				    	alert("分总成重新拆分成功，替换分总成"+data.count+"个。");
			    	}else{
			    		alert("分总成重新拆分失败！");
			    	}
				}
			});
		}
	}
</script>
</t:html>