<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="${i18n.illtitle}">
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
</head>

<t:page i18n="i18n.xqjs.ilOrder">
	<script type="text/javascript">
	
		//生成选择radio
		function radioXuqbc() {
			return "<input name='selectXuqbcs' onclick='radioClick(this)' type='radio'/>";
		}
		//radio点击事件
		function radioClick(obj) {
			var rowElemt = $(obj).parent('td:first').parent('tr:first');
			var xuqbc = rowElemt.find('td:eq(1)').text();
			//选中的版次放到隐藏域
			$('#layout_xuqbc').fieldValue(xuqbc);
		}
		//需求来源change事件
		function layout_xuqly_change() {
			$('#maoxqGrid').grid('reload');
		}
		//计算类型change事件
		function layout_xuqlx_change() {
			if($('#layout_xuqlx').fieldValue() == "C1、CD、M1、MD") {
				$('#chooseMaoxqGrid').attr("style","display:none");
				//$("div a[class='qd']").attr("style","display:none");
				$('#button_qd').attr("style","display:none");
				$('#button_qx').attr("style","display:none");
				$('#button_csxy').attr("style","display:none");
				//$('#button_scdd').attr("style","display:none");
				//$('#button_scdd2').attr("style","display:");
				//$('#fieldLayout_sxsj').attr("style","display:none");
				
				$('#maoxqGrid').grid('reload');
			}
			else {
				$('#chooseMaoxqGrid').attr("style","display:");
				$('#button_qd').attr("style","display:");
				$('#button_qx').attr("style","display:");
				$('#button_csxy').attr("style","display:");
				//$('#fieldLayout_sxsj').attr("style","display:");
			}
		}
		//表单验证
		function vali() {
			//是否选中了版次
			var record = $('#maoxqGrid').grid('getSelectedRecords');
			if (record.length == 0) {
				//请选择版次
				alert("${i18n.message_null}");
				return false;
			}
			return true;
		}
		//取消表单验证
		function qxvali() {
			//是否选中了版次
			var record = $('#chooseMaoxqGrid').grid('getSelectedRecords');
			if (record.length == 0) {
				//请选择版次
				alert("${i18n.message_null}");
				return false;
			}
			return true;
		}
		//确定按妞事件
		function func_button_qd() {
			if (vali()) {
				//是否选中了版次
				var record = $('#maoxqGrid').grid('getSelectedRecords');
				//选中的版次放到隐藏域
				$('#layout_xuqbc').fieldValue(record[0].xuqbc);
				$('#layout_isDel').fieldValue("0");
				$('#chooseMaoxqGrid').grid('reload');
			}
		}
		//取消按妞事件
		function func_button_qx() {
			if (qxvali()) {
				//是否选中了版次
				var record = $('#chooseMaoxqGrid').grid('getSelectedRecords');
				//选中的版次放到隐藏域
				$('#layout_xuqbc').fieldValue(record[0].xuqbc);
				$('#layout_isDel').fieldValue("1");
				$('#chooseMaoxqGrid').grid('reload');
			}
		}
		//参数效验按妞事件
		function func_button_csxy() {
			//判断chooseMaoxqGrid是否有数据
			var flag = true;
			var grid = $('#chooseMaoxqGrid').grid('getRecords');
			if (grid.length < 1) {
				alert("${i18n.bancts}");
				flag = false;
			}
			var ziyhqrq = $('#layout_ziyhqrq').fieldValue();
			var xuqlx = $('#layout_xuqlx').fieldValue();
			if (ziyhqrq == '') {
				alert("${i18n.ziyhqrqts}");
				flag = false;
			}

		var param = [];
		for ( var i = 0; i < grid.length; i++) {
			param.push('edit[' + i + '].xuqbc=' + grid[i].xuqbc);
			param.push('edit[' + i + '].xuqcfsj=' + grid[i].xuqcfsj);
			param.push('edit[' + i + '].xuqly=' + grid[i].xuqly);
			param.push('edit[' + i + '].xuqlymc=' + grid[i].xuqlymc);
			param.push('edit[' + i + '].beiz=' + grid[i].beiz);
		}
		param.push('ziyhqrq=' + ziyhqrq);
		param.push('zhizlx=' + $('#layout_zhizlx').fieldValue());
		param.push('xuqlx=' + xuqlx);

		if (flag) {
			$.sdcui.ajaxUtil.ajax({
				url : "${ctx}/ilorder/checkValue.ajax",
				data : param.join('&'),
				success : function(result) {
					alert(result.result);
				}
			});

		}
		}
		//生成订单按钮事件
		function func_button_scdd() {
			if($('#layout_xuqlx').fieldValue() == "C1、CD、M1、MD") {
				alert("${i18n.jisks}");
				$.sdcui.ajaxUtil.ajax({
					url : "${ctx}/anxorder/anxOrderCDMD.ajax",
					data : "zhizlx=" + "97W",
					success : function(result) {
						alert(result.result);
					}
				});
			}else{
			//判断chooseMaoxqGrid是否有数据
			var flag = true;
			var grid = $('#chooseMaoxqGrid').grid('getRecords');
			if (grid.length < 1) {
				alert("${i18n.bancts}");
				flag = false;
			}
			var ziyhqrq = $('#layout_ziyhqrq').fieldValue();
			var xuqlx = $('#layout_xuqlx').fieldValue();
			if (ziyhqrq == '') {
				alert("${i18n.ziyhqrqts}");
				flag = false;
			}

		var param = [];
		for ( var i = 0; i < grid.length; i++) {
			param.push('edit[' + i + '].xuqbc=' + grid[i].xuqbc);
			param.push('edit[' + i + '].xuqcfsj=' + grid[i].xuqcfsj);
			param.push('edit[' + i + '].xuqly=' + grid[i].xuqly);
			param.push('edit[' + i + '].xuqlymc=' + grid[i].xuqlymc);
			param.push('edit[' + i + '].beiz=' + grid[i].beiz);
		}
		param.push('ziyhqrq=' + ziyhqrq);
		param.push('zhizlx=' + $('#layout_zhizlx').fieldValue());
		param.push('xuqlx=' + xuqlx);

		if (flag) {
			$.sdcui.ajaxUtil.ajax({
				url : "${ctx}/ilorder/ilCalculate.ajax",
				data : param.join('&'),
				success : function(result) {
					alert(result.result);
					if(xuqlx == 'PP'||xuqlx == 'PS'){
					if (confirm("${i18n.daocts}")) {
						
				        $.sdcui.pageUtils.goPage({
					url:'hzDownLoadFile.do?xuqlx='+xuqlx,//url,
					mode:'form',
					beforeSubmit:function(){
				        return true;
				        }
						});
						return false;
				}
					}
					
				}
			});
		
		
			}
			}
		}

		//按需计算
		function func_button_scdd2() {
			alert("${i18n.jisks}");
			$.sdcui.ajaxUtil.ajax({
				url : "${ctx}/anxorder/anxOrderCDMD.ajax",
				data : "zhizlx=" + "97W",
				success : function(result) {
					alert(result.result);
				}
			});
		}

		/** 
		 *链接点击事件
		 */
		function link_xuqbc(event) {
			var event = event || window.event;//原生态的事件处理 
			var element = event.srcElement || event.target;
			var rowDoc = $(element).parents('tr:first')[0];
			var record = $('#maoxqGrid').grid('getRecord', rowDoc);//获取当前行对应的记录
			var xuqbc = record.xuqbc;
			/**
			 * form跳转模式提交
			window.open ('${ctx}/zygzbj/mxqMx.do?removeId=layout-north,layout-west,layout-south','毛需求明细','height=768,width=1024,top=0,left=0,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
			return false;	 */
         winOpen= window.open ('${ctx}/kanbyhl/queryMX.do?removeId=layout-north,layout-west,layout-south&xuqbc='+xuqbc,
		'毛需求明细',
		'top=0,left=0,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no, status=no');
       	winOpen.resizeTo(screen.availWidth,screen.availHeight);
        return false;
		}
	</script>

<style>
#maoxqGrid .youi-fieldLayout table td.contral.label-col.col-0 {
	width: 120px;
}
#maoxqForm td.contral.label-col.col-0{width:100px;}

</style>
<!--主体内容开始-->
<t:form id="maoxqForm" submit="NOT" reset="NOT">
  <!--查询列表开始-->
  <t:grid id="maoxqGrid" caption="${i18n.zqdljs}" showNum="true" idKeys="xuqbc" 
	src="/ilorder/queryMaoxp.ajax" add="NOT" submit="NOT" edit="NOT" remove="NOT"  reset="NOT" load="false" scrollHeight="104">
	<t:fieldLayout prefix="layout" columns="3">
		<t:fieldSelect property="xuqlx" caption="${i18n.xzjslx}" width="150" >
			<t:fieldOption value="PP" text="周期"></t:fieldOption>
			<t:fieldOption value="PS" text="周"></t:fieldOption>
			
		<%-- 	7791按需和日不使用手工计算，使用批量   kong  2013-07-18
			<t:fieldOption value="PJ" text="日"></t:fieldOption>
			<t:fieldOption value="C1、CD、M1、MD" text="按需"></t:fieldOption>  --%>
		</t:fieldSelect>
		<t:fieldHidden property="zhizlxForXuqly" defaultValue="97W"></t:fieldHidden>
		<t:fieldSelect property="xuqly" caption="${i18n.xuqly}" parents="xuqlx,zhizlxForXuqly" src="/ilorder/executeMaoxqXqly.ajax" show="gonghms" code="xuqly" width="150"></t:fieldSelect>
		<t:fieldSelect property="ziyhqrq" caption="${i18n.zyhqrq}" src="/ilorder/executeZiykzb.ajax" code="ziyhqrq" show="ziyhqrq" width="150" ></t:fieldSelect>
		<t:fieldHidden property="selectXuqbc"></t:fieldHidden>
	</t:fieldLayout >
	<t:gridCol property="xuqbc" type="link" caption="${i18n.xuqbc}" width="100"></t:gridCol>
	<t:gridCol property="xuqcfsj"  caption="${i18n.xuqcfsj}" width="150"></t:gridCol>
	<t:gridCol property="xuqly"  caption="${i18n.xuqly}" width="100"></t:gridCol>
	<t:gridCol property="xuqlymc"  caption="${i18n.xuqlymc}" width="100"></t:gridCol>
	<t:gridCol  property="beiz" caption="${i18n.beiz}" width="100"></t:gridCol>
	</t:grid>
	<t:buttons id="button_form1">
	<t:button name="qd" caption="${i18n.qued}"></t:button>
	</t:buttons>
	
	<t:grid id="chooseMaoxqGrid" showNum="true" idKeys="xuqbc"
	src="/ilorder/querySessionMaoxq.ajax" add="NOT" submit="NOT" edit="NOT" remove="NOT"  reset="NOT" load="true"  scrollHeight="80">
	<t:fieldLayout prefix="layout">
		<t:fieldHidden property="xuqbc"></t:fieldHidden>
		<t:fieldHidden property="isDel"></t:fieldHidden>
		<t:fieldHidden property="zhizlx" defaultValue="97W"></t:fieldHidden>
	</t:fieldLayout>
	<t:gridCol property="xuqbc" type="link" caption="${i18n.xuqbc}" width="100"></t:gridCol>
	<t:gridCol property="xuqcfsj"  caption="${i18n.xuqcfsj}" width="150"></t:gridCol>
	<t:gridCol property="xuqly"  caption="${i18n.xuqly}" width="100"></t:gridCol>
	<t:gridCol property="xuqlymc"  caption="${i18n.xuqlymc}" width="100"></t:gridCol>
	<t:gridCol property="beiz" caption="${i18n.beiz}"></t:gridCol>
	</t:grid>
	<t:buttons id="button_form2">
	<t:button name="qx" caption="${i18n.qux}"></t:button>
	</t:buttons>
	
	<t:fieldLayout prefix="fieldLayout">
	<t:fieldCalendar property="sxsj" caption="${i18n.sxsj}" format="yyyy-MM-dd HH:mm:ss" width="105"></t:fieldCalendar>
	</t:fieldLayout>
	<t:buttons id="button_form">
	  <t:button name="csxy" caption="${i18n.csxy}"></t:button>
	  <t:button name="scdd" caption="${i18n.scdd}"></t:button>
	</t:buttons>
</t:form>
</t:page>
</t:html>