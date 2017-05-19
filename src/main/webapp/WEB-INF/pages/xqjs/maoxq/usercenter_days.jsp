<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="毛需求查询与比较">
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<script type="text/javascript">
	$(function() {
		removeHidden();
	})
</script>
</head>
<t:page i18n="">

	<t:form id="form_maoxqDays" submit="NOT" reset="NOT">

		<t:grid id="grid_centerDays" caption="日毛需求" showCheckbox="true" src="/maoxq/queryMxP.ajax" idKeys="xuqbc,editor,edit_time" remove="NOT" showNum="true" edit="NOT" add="NOT" usePager="true" save="NOT"
			load="true" submit="NOT" reset="NOT" scrollHeight="180">
			<t:button caption="导出" name="expxls" active="3"></t:button>
			<t:fieldLayout id="layout" prefix="record" columns="3">
				<t:fieldSelect property="usercenter" caption="用户中心" convert="queryUserCenterMap" width="150" defaultValue="UW" notNull="true"></t:fieldSelect>
				<t:fieldSelect property="jihyz" caption="计划员组" width="150" convert="getJihz"></t:fieldSelect>
				<t:fieldText property="lingjbh" caption="零件号" expression='^[A-Z0-9]{10}$' expressionMessage='10位的字母和数字' width="150" maxLength="10"></t:fieldText>
				<t:fieldSelect property="zhizlx" caption="订货路线" convert="queryDinghlx" width="150"></t:fieldSelect>
				<t:fieldSelect property="xsfs" caption="显示方式" convert="pattern" defaultValue="1" notNull="true" width="150"></t:fieldSelect>
				<t:fieldHidden property="xuqbc"></t:fieldHidden>
				<t:fieldHidden property="mode"></t:fieldHidden>
				<t:fieldHidden property="xuqlx"></t:fieldHidden>
			</t:fieldLayout>
			<div>备注: 需求版次为：${xuqbc}</div>
			<div id='kaisrq'>日毛需求(J0-J8:${kaisrq})</div>
			<div class="grid-formButtons" align="right">
				<div class="youi-buttons" align="right">
					<table>
						<tbody>
							<tr>
								<td>
									<div class="youi-button active-0">
										<div class="right">
											<div class="center">
												<a href="#" onclick="query()"> 查 询 </a>
											</div>
										</div>
									</div>
								</td>
								<td>
									<div id="button_reset" class="youi-button active-0">
										<div class="right">
											<div class="center">
												<a href="#" onclick="cancle()"> 重 置 </a>
											</div>
										</div>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<t:gridCol property="usercenter" type="text" caption="用户中心"></t:gridCol>
			<t:gridCol property="lingjbh" type="text" caption="零件号"></t:gridCol>
			<t:gridCol property="shiycj" type="text" caption="使用车间"></t:gridCol>
			<t:gridCol property="chanx" type="text" caption="产线"></t:gridCol>
			<t:gridCol property="lingjmc" type="text" caption="零件名称"></t:gridCol>
			<t:gridCol property="danw" type="text" caption="零件单位"></t:gridCol>
			<t:gridCol property="jihyz" type="text" caption="计划员组"></t:gridCol>
			<t:gridCol property="zhizlx" type="text" caption="订货路线"></t:gridCol>
			<t:gridCol property="j0" type="text" caption="J0"></t:gridCol>
			<t:gridCol property="j1" type="text" caption="J1"></t:gridCol>
			<t:gridCol property="j2" type="text" caption="J2"></t:gridCol>
			<t:gridCol property="j3" type="text" caption="J3"></t:gridCol>
			<t:gridCol property="j4" type="text" caption="J4"></t:gridCol>
			<t:gridCol property="j5" type="text" caption="J5"></t:gridCol>
			<t:gridCol property="j6" type="text" caption="J6"></t:gridCol>
			<t:gridCol property="j7" type="text" caption="J7"></t:gridCol>
			<t:gridCol property="j8" type="text" caption="J8"></t:gridCol>
		</t:grid>

		<t:fieldLayout prefix="sa">
			<t:fieldArea property="beiz" caption="备注" width="600" maxLength="60"></t:fieldArea>

		</t:fieldLayout>
		<t:buttons id="btns1">
			<t:button caption="新增" name="add"></t:button>

			<t:button caption="删除" name="delete"></t:button>

			<t:button caption="修改" name="edit"></t:button>
			<t:button caption="另存为" name="saveAs"></t:button>
		</t:buttons>

	</t:form>
	<input id="removeId" value="${removeId}" type="hidden" />

	<form id="exp" name="exp" action="${ctx}/maoxq/downLoadFileDetail.do" method="post" style="background-color: white;" target="hiddenUp">
		<div style="display: none;">
			<t:fieldLayout prefix="dto">
				<t:fieldHidden property="usercenter"></t:fieldHidden>
				<t:fieldHidden property="jihyz"></t:fieldHidden>
				<t:fieldHidden property="lingjbh"></t:fieldHidden>
				<t:fieldHidden property="zhizlx"></t:fieldHidden>
				<t:fieldHidden property="xsfs"></t:fieldHidden>
				<t:fieldHidden property="xuqbc"></t:fieldHidden>
				<t:fieldHidden property="mode"></t:fieldHidden>
				<t:fieldHidden property="xuqlx"></t:fieldHidden>
			</t:fieldLayout>
		</div>
	</form>
	<iframe name="hiddenUp" id="hiddenUp" style="display: none;"></iframe>
</t:page>
<script type="text/javascript">
	$.sdcui.serverConfig.convertArray['pattern'] = {
		'0' : '按用户中心',
		'1' : '按产线'
	};
	var winOpen;
	var timer;
	function IfWindowClosed() {
		if (winOpen == null) {
			window.clearInterval(timer);
			reloadDate();
		}
	}

	function reloadDate() {
		$.sdcui.ajaxUtil.ajax({
			url : "${ctx}/maoxq/showDate.ajax",
			data : "xuqbc=" + $("#record_xuqbc").fieldValue()+"&xuqlx=Days",
			success : function(result) {
				var rq = '日毛需求(J0:' + result.result + ')';
				$('#kaisrq').text(rq);
				$('#grid_centerDays').grid('reload');// 刷新当前页
			}
		});

	}

	//查询按钮
	function query() {
		var xsfs = $("#record_xsfs").fieldValue();
		var usercenter = $("#record_usercenter").fieldValue();
		var jihyz = $("#record_jihyz").fieldValue();
		var lingjbh = $("#record_lingjbh").fieldValue();
		var zhizlx = $("#record_zhizlx").fieldValue();
		var xuqbc = $("#record_xuqbc").fieldValue();
		var mode = $("#record_mode").fieldValue();
		var record = {};
		record.xuqbc = xuqbc;
		record.xsfs = xsfs;
		record.usercenter = usercenter;
		record.jihyz = jihyz;
		record.lingjbh = lingjbh;
		record.zhizlx = zhizlx;
		record.xuqlx = 'Days';

		var params = [];
		params.push("xuqbc=" + xuqbc);
		params.push("xsfs=" + xsfs);
		params.push("usercenter=" + usercenter);
		params.push("jihyz=" + jihyz);
		params.push("lingjbh=" + lingjbh);
		params.push("zhizlx=" + zhizlx);
		params.push("xuqlx=" + 'Days');
		var data = params.join('&');
		if (xsfs === '1' && mode === 'chanx') {
			window
					.open(
							'${ctx}/maoxq/initCwD.do?removeId=layout-north,layout-west,layout-south&'
									+ data,
							'毛需求明细',
							'height=500,width=800,top=100,left=100,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no, status=no');
			return false;
			/**
			 * form跳转模式提交
			$.sdcui.pageUtils.goPage({
				url:'/maoxq/initCwD.do',//url
				record:record,//
				mode:'form',
				beforeSubmit:function(){
					//
					return true;
				}
			});			 */
		} else {
			//刷新列表
			$('#grid_centerDays').grid('reload');
		}

	}

	//重置按钮
	function cancle() {
		$("#record_usercenter").fieldValue("");
		$("#record_jihyz").fieldValue("");
		$("#record_lingjbh").fieldValue("");
		$("#record_zhizlx").fieldValue("");
	}

	/**
	 *修改零件数量
	 */
	function func_button_edit() {
		var param = $("#grid_centerDays").grid('getSelectedRecords');
		if (param.length != 1) {
			alert("请选择一条记录！");
			return false;
		}
		var record = {};//获取当前行对应的记录
		record.xuqbc = $("#record_xuqbc").fieldValue();
		record.usercenter = param[0].usercenter;
		record.zhizlx = param[0].zhizlx;
		record.id = param[0].id;
		record.lingjbh = param[0].lingjbh;

		var params = [];
		params.push("xuqbc=" + $("#record_xuqbc").fieldValue());
		params.push("usercenter=" + param[0].usercenter);
		params.push("zhizlx=" + param[0].zhizlx);
		params.push("id=" + param[0].id);
		//params.push("chanx="+param[0].chanx);
		params.push("lingjbh=" + param[0].lingjbh);
		var data = params.join('&');
		winOpen = window
				.showModalDialog(
						'${ctx}/maoxq/editPage.do?removeId=layout-north,layout-west,layout-south&'
								+ data,
						window,
						"dialogHeight=420px;dialogWidth=750px;dialogTop=100px;dialogLeft=100px;center:yes;scroll:no;status:no;resizable:yes;location:no");
		timer = window.setInterval("IfWindowClosed()", 500);
		/**
		 * form跳转模式提交
		$.sdcui.pageUtils.goPage({
			url:'/maoxq/editPage.do',//url
			record:record,//
			mode:'form',
			beforeSubmit:function(){
				//
				return true;
			}
		});
		event.stopPropagation();//阻止事件冒泡
		return false;	 */

	}
	//新增
	function func_button_add() {
		var record = {};//获取当前行对应的记录
		record.xuqbc = $("#record_xuqbc").fieldValue();
		record.mode = $("#record_mode").fieldValue();

		var params = [];
		params.push("xuqbc=" + $("#record_xuqbc").fieldValue());
		params.push("mode=" + $("#record_mode").fieldValue());
		var data = params.join('&');

		winOpen = window
				.showModalDialog(
						'${ctx}/maoxq/initAdd.do?removeId=layout-north,layout-west,layout-south&'
								+ data,
						window,
						"dialogHeight=420px;dialogWidth=750px;dialogTop=100px;dialogLeft=100px;center:yes;scroll:no;status:no;resizable:yes;location:no");
		timer = window.setInterval("IfWindowClosed()", 500);
		/**
		 * form跳转模式提交
		$.sdcui.pageUtils.goPage({
			url:'/maoxq/initAdd.do',//url
			record:record,//
			mode:'form',
			beforeSubmit:function(){
				//
				return true;
			}
		});
		event.stopPropagation();//阻止事件冒泡
		return false;	 */
	}

	//删除
	function func_button_delete() {
		var mx = $("#grid_centerDays").grid('getSelectedRecords');
		if (mx.length < 1) {
			alert("请选择一条记录！");
			return false;
		}
		if (!confirm("您确认要进行删除？")) {
			return false;
		}
		var params = [];
		for ( var i = 0; i < mx.length; i++) {
			params.push('delete[' + i + '].xuqbc=' + mx[i].xuqbc);
			params.push('delete[' + i + '].usercenter=' + mx[i].usercenter);
			params.push('delete[' + i + '].editor=' + mx[i].editor);
			params.push('delete[' + i + '].edit_time=' + mx[i].edit_time);
			params.push('delete[' + i + '].zhizlx=' + mx[i].zhizlx);
			params.push('delete[' + i + '].lingjbh=' + mx[i].lingjbh);
		}

		//修改ajax请求       
		$.sdcui.ajaxUtil.ajax({
			url : "${ctx}/maoxq/delectMxP.ajax",
			data : params.join('&'),
			success : function(result) {
				alert(result.result);
				reloadDate();
			}
		});
	}

	/**
	 *另存为
	 */
	function func_button_saveAs() {
		var xuqbc = $("#record_xuqbc").fieldValue();
		var beiz = $("#sa_beiz").fieldValue();

		$.sdcui.ajaxUtil.ajax({
			url : "${ctx}/maoxq/saveAs.ajax",
			data : "xuqbc=" + xuqbc + "&beiz=" + beiz,
			success : function(result) {
				alert(result.result);
			}
		});
	}

	//返回
	/*	function func_button_back() {
			history.back();
			//window.history.go(-1);
			//window.history.forward();

		} */
	function func_grid_expxls() {
		var red = $("#grid_centerDays").grid("getRecords");
		if (red.length == 0) {
			alert("导出的数据源不能为空.");
			return false;
		}
		var usercenter = $('#record_usercenter').fieldValue();
		var jihyz = $('#record_jihyz').fieldValue();
		var lingjbh = $('#record_lingjbh').fieldValue();
		var zhizlx = $('#record_zhizlx').fieldValue();
		var xuqbc = $('#record_xuqbc').fieldValue();
		var xuqlx = $('#record_xuqlx').fieldValue();
		var xsfs = $('#record_xsfs').fieldValue();
		var mode = $('#record_mode').fieldValue();
		$('#dto_usercenter').fieldValue(usercenter);
		$('#dto_jihyz').fieldValue(jihyz);
		$('#dto_lingjbh').fieldValue(lingjbh);
		$('#dto_zhizlx').fieldValue(zhizlx);
		$('#dto_xuqbc').fieldValue(xuqbc);
		$('#dto_xuqlx').fieldValue(xuqlx);
		$('#dto_xsfs').fieldValue(xsfs);
		$('#dto_mode').fieldValue(mode);
		var fm = document.getElementById("exp");
		fm.submit();

		/*var param=[];
		param.push("usercenter="+usercenter);
		param.push("jihyz="+jihyz);
		param.push("lingjbh="+lingjbh);
		param.push("zhizlx="+zhizlx);
		param.push("xuqbc="+xuqbc);
		param.push("xuqlx="+xuqlx);
		param.push("xsfs="+xsfs);
		param.push("mode="+mode);*/
		var record = {};
		record.usercenter = usercenter;
		record.jihyz = jihyz;
		record.lingjbh = lingjbh;
		record.zhizlx = zhizlx;
		record.xuqbc = xuqbc;
		record.xuqlx = xuqlx;
		record.xsfs = xsfs;
		record.mode = mode;

		/*$.sdcui.pageUtils.goPage({
			url : '/maoxq/downLoadFileDetail.do',//url
			record : record,//
			mode : 'form',
			beforeSubmit : function() {
				//
				return true;
			}
		});*/
	}
</script>
<style type="text/css">
</style>
</t:html>